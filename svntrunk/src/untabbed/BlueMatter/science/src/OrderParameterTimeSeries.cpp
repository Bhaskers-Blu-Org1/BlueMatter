/* Copyright 2001, 2019 IBM Corporation
 *
 * Redistribution and use in source and binary forms, with or without modification, are permitted provided that the 
 * following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice, this list of conditions and the 
 * following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the 
 * following disclaimer in the documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, 
 * INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE 
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, 
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR 
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, 
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE 
 * USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
 
#include <math.h>
#include <assert.h>
#include <fcntl.h>
//#include <sys/stat.h>
//#include <errno.h>
//#include <string.h>
#include <iostream>
#include <fstream>
#include <cstdio>
#include <string>
#include <vector>
#include <BlueMatter/BMT.hpp>
#include <BlueMatter/Imaging.hpp>
#include <BlueMatter/XYZ.hpp>
#include <BlueMatter/DXHistogram.hpp>
#include <BlueMatter/SimpleTrajectory.hpp>
#include <BlueMatter/Bonds.hpp>

#define MAX_LIPID 10000

using namespace std ;

void Usage(char **argv)
{
    cerr << argv[0] << " FName.bmt fragmentFile massFile segmentName " 
                    << "BondFile skip outputdir" << endl;
    exit(-1);
}

int main(int argc, char **argv)
{
    SimpleTrajectory st;

    //fXYZ box;
    //box.mX = 27.5*2;
    //box.mY = 38.5*2;
    //box.mZ = 51.3225*2;

    int nleaflets = 1;


    if (argc != 8)
  Usage(argv);

    char *bmtname = argv[1];

    BMTReader bmt(argv[1]);

    st.m_StartTime = bmt.getInitialSimulationTimeInNanoSeconds();
    st.m_TimeStep = bmt.getNetTimeStepInPicoSeconds()/1000.0;


    char *fragmentFileName = argv[2];
    char *massFileName = argv[3];
    char *segmentName = argv[4];
    char *bondFileName = argv[5];
    int nskip = atoi(argv[6]);
    char *outputdir = argv[7];



    cout << "# ";
    for (int i = 0; i<argc; i++)
        {
        cout << argv[i] << " ";
        }
    cout << endl;

    float actualstart = st.m_StartTime+nskip*st.m_TimeStep;

    for (int i = 0; i< nskip; i++)
        {
        if (bmt.ReadFrame())
            {
            cerr << "Error reading frame " << i << "during skip" << endl;
            exit(-1);
            }
        }

    if (bmt.ReadFrame()) {
  cerr << "Error reading first bmt frame after skip of " << nskip << " frames" << endl;
  exit(-1);
    }

    fFragmentListTable flt(fragmentFileName);
    fAtomValues m(massFileName);

    fFragmentList selected = flt.GetFragmentList(segmentName);

    flt.AssignPositions(bmt.getPositions());
    flt.AssignMasses(m);

    selected.AssignPositions(bmt.getPositions());
    selected.AssignMasses(m);


    flt.FindCenterOfMasses();
    selected.FindCenterOfMasses();

    // read the bondFile containing the carbons and hydrogens we want to
    // use for the order parameter calculation
    OrderBondList obl(bondFileName, &selected);


    // try to make the directory for the output files
    // don't complain if the directory exists
    if (mkdir(outputdir, 0777) != 0)
        {
        if (errno != EEXIST)
            {
            cerr << "Error making directory " << outputdir << ": " << 
                    strerror(errno) << endl;
            }
        }

    int readerr = 0;
    int nframe = 0;
    int i = 0;
    fXYZ c, h, v;
    int c_index, h_index;

    // initialize the storage for the bond time series
    int num_bonds_per_frag = 0;
    vector< vector<double> > bond_series;
    for (vector<OrderBond>::iterator bond  = obl.m_bonds.begin();
                                             bond != obl.m_bonds.end(); bond++)
        {

        while (bond->SetIndices(&c_index, &h_index))
            {
            num_bonds_per_frag++;
            }
        }
    
    for (int i = 0; i < num_bonds_per_frag; i++)
        {
        for (int j = 0; j < obl.m_Fragments->m_Fragments.size(); j++)
            {
            vector <double> v;
            bond_series.push_back(v);
            }
        }
    

    //cout << "got here first" << endl;

    int cur_bond = 0;
    while (!readerr && nframe < 100000000) 
        {
        cur_bond = 0;
        for (vector<fFragment>::iterator 
            f =  obl.m_Fragments->m_Fragments.begin();
            f != obl.m_Fragments->m_Fragments.end(); f++)
            {
            for (vector<OrderBond>::iterator bond  = obl.m_bonds.begin();
                                             bond != obl.m_bonds.end(); bond++)
                {
                while (bond->SetIndices(&c_index, &h_index))
                    {
                    c = f->m_Positions[f->m_Start + c_index];
                    h = f->m_Positions[f->m_Start + h_index];
                    v = c - h;
                    v *= v.ReciprocalLength();
                    bond_series[cur_bond].push_back(0.5 - 1.5*v[2]*v[2]);
                    cur_bond++;
                    }
                }
            }
        readerr = bmt.ReadFrame(); 
        nframe++;
        if (nframe % 2 == 0)
            {
            //cout << nframe << endl;
            }
        }

    //cout << "got here" << endl;

    // dump out all of the time series
    for (int i =0; i < cur_bond; i++)
        {
        // open the output file
        char filename[1024];
        int frag_num = i / (num_bonds_per_frag+1);
        int bond_num = i % (num_bonds_per_frag+1);
        sprintf(filename,"%s/%d_%d.dat",outputdir,frag_num, bond_num);
        ofstream outFile(filename);
        
        double cur_time = actualstart;
        //for (vector<double>::iterator val  = bond_series[i]->begin();
        //                              val != bond_series[i]->end();
        //                              val++)
        for (int j = 0; j < bond_series[i].size(); j++)
                {
                double val = bond_series[i][j];
                outFile << cur_time << "\t" << val << endl;;
                cur_time += st.m_TimeStep;
                }
        outFile.close();
        }

    return 0;
}
