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
 
#include <BlueMatter/bmtstat.hpp>

///////////////////////////////
///////  Working global arrays

ValList < int > ResGroup1;
ValList < int > ResGroup2;

ValList < int > IList1;
ValList < int > IList2;
ValList < int > IList3;
ValList < int > IList4;
ValList < int > IList5;
ValList < int > AllAtoms;
ValList < int > AllLipid;
ValList < int > AllWater;
ValList < int > AllIons;
ValList < int > AllDHA;
ValList < int > AllSTEA;
ValList < int > AllCHOL;
ValList < int > AllPEGL;
ValList < int > AllPCGL;
ValList < int > AllProtein;

ValList < int > Ret;
ValList < int > RetC12;
ValList < int > RetC14;
ValList < int > RetC15;
ValList < int > RetN16;
ValList < int > RetC19;
ValList < int > RetC20;

ValList < int > Glu113;
ValList < int > Glu181;


ValList < int > Tyr178CZ;
ValList < int > Tyr191CZ;
ValList < int > Tyr268CZ;

ValList < int > Gly188CA;
ValList < int > Gly114CA;
ValList < int > Gly121CA;

ValList < int > Thr118C;
ValList < int > Ser186CB;



ValList < double > DList1;
ValList < double > DList2;
ValList < double > DList3;
ValList < double > DList4;
ValList < double > DList5;

double HMin, HMax,HSpac;

int res1G,res2G;

FrameHandler framG;
ValList < double > MassesG;
PDB pdbG;
 
FILE *outfileG;

void InitStuff(PDB &pdb, XYZ &min, XYZ &max)
{
  int na = pdb.mNAtoms;
  AllAtoms.Init(na);
  for(int i=0;i< na; i++)
    AllAtoms.Set(i,i);
 
  SelectResName(pdb,"TIP3",AllWater,AllAtoms);
  SelectResName(pdb,"SOD",IList2,AllAtoms);
  SelectResName(pdb,"CLA",IList1,AllAtoms);
  AllIons.Or(IList1,IList2); 

  SelectResName(pdb,"DHA",AllDHA,AllAtoms);
  SelectResName(pdb,"STEA",AllSTEA,AllAtoms);
  SelectResName(pdb,"CHOL",AllCHOL,AllAtoms);
  SelectResName(pdb,"PEGL",AllPEGL,AllAtoms);
  SelectResName(pdb,"PCGL",AllPCGL,AllAtoms);


  // Ops for AllLipid
  IList1.Or(AllDHA,AllSTEA);
  IList2.Or(IList1,AllCHOL);
  IList1.Or(AllPCGL,AllPEGL);
  AllLipid.Or(IList1,IList2);

  // Ops for AllProtein : note, protein is everything else
  IList1.And(AllWater,AllAtoms);
  IList2.Or(IList1,AllLipid);
  IList1.Or(IList2,AllIons);
  AllProtein.XOr(AllAtoms,IList1);

  SelectResId(pdb,296,Ret,AllProtein);
  SelectAType(pdb,"C20",RetC20,Ret);
  SelectAType(pdb,"C19",RetC19,Ret);
  SelectAType(pdb,"C15",RetC15,Ret);
  SelectAType(pdb,"C14",RetC14,Ret);
  SelectAType(pdb,"C12",RetC12,Ret);
  SelectAType(pdb,"N16",RetN16,Ret);

  SelectResId(pdb,113,Glu113,AllProtein);
  SelectResId(pdb,181,Glu181,AllProtein);

  SelectResId(pdb,178,IList1,AllProtein);
  SelectAType(pdb,"CZ",Tyr178CZ,IList1);

  SelectResId(pdb,191,IList1,AllProtein);
  SelectAType(pdb,"CZ",Tyr191CZ,IList1);

  SelectResId(pdb,268,IList1,AllProtein);
  SelectAType(pdb,"CZ",Tyr268CZ,IList1);


  SelectResId(pdb,188,IList1,AllProtein);
  SelectAType(pdb,"CA",Gly188CA,IList1);

  SelectResId(pdb,114,IList1,AllProtein);
  SelectAType(pdb,"CA",Gly114CA,IList1);

  SelectResId(pdb,121,IList1,AllProtein);
  SelectAType(pdb,"CA",Gly121CA,IList1);

  SelectResId(pdb,118,IList1,AllProtein);
  SelectAType(pdb,"C",Thr118C,IList1);

  SelectResId(pdb,186,IList1,AllProtein);
  SelectAType(pdb,"CB",Ser186CB,IList1);

  outfileG = stdout;

  fprintf(outfileG, "# min: [ %f %f %f ] max [ %f %f %f ]\n", min.mX, min.mY, min.mZ, max.mX, max.mY, max.mZ);
}

void DoStuff(FrameHandler & fram, PDB &pdb, XYZ &min, XYZ &max, int nframe, double NetTimeStepInPs)
{
  static int first = 1;
#define MIN_VAL 1e-6
  //  Get res 1 and res 2 into ilist 1 and 2

  //  GetWaterZProfile( fram, pdb, AllWater, HSpac , HMin, HMax, DList1);
  double count;
  GetWaterBoxCount( fram, pdb, AllWater, min, max, count);
  //  for(int i=0;i<DList1.Size();i++)
  //    fprintf(outfileG,"%f ",DList1[i]);
  double dt = nframe;

  fprintf(outfileG,"%f %f\n", dt, count);

  //////////////////
  //                              PREVIOUS EXAMPLES
  //   SelectResId(pdb,res1,IList2,AllProtein);
  //   SelectResId(pdb,res2,IList3,AllProtein);

  //   Calc1r6Sum(fram, IList2, IList3,Sr1r2);
  //   CalcDistMat(fram, IList2, IList3,DList1 );
  //   FindMinVal(DList1,min);
  //  CalcDistMat(fram, RetC20, Tyr268CZ,DList1 );
  //  for(int i=0;i< RetC20.Size(); i++)
  //    pdb.WriteRecord(fram,RetC20[i],stdout);
  //  for(int i=0;i< Tyr268CZ.Size(); i++)
  //    pdb.WriteRecord(fram,Tyr268CZ[i],stdout);
  // GetWaterZProfile( fram, pdb, AllWater,DList1);
  // for(int i=0;i<DList1.Size();i++)
  //   fprintf(outfileG,"%f ",DList1[i]);
  // fprintf(outfileG,"\n");

}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////
////////                                      Blunt Main Loop Over Frames, calling InitStuff and DoStuff
////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////


int
main(int argc, char **argv, char **envp)
{
    vector<XYZ> coors;


    if (argc < 12) {
        cout << "ResPairDists BMTFileName PDBFileName <minx> <miny> <minz> <maxx> <maxy> <maxz> <start> <stop> <skip>"
             << endl;
	cout << "Prints out :   time watercount" << endl;
        return 1;
    }

    char *bmtname = argv[1];
    char *pdbname = argv[2];
    char massname[256];
    XYZ min, max;

    min.mX = atof(argv[3]);
    min.mY = atof(argv[4]);
    min.mZ = atof(argv[5]);
    max.mX = atof(argv[6]);
    max.mY = atof(argv[7]);
    max.mZ = atof(argv[8]);
    int start = atoi(argv[9]);
    int stop = atoi(argv[10]);
    int skip = atoi(argv[11]);

    // Values used for water story data and images
    double xmin = -9;
    double ymin = -15;
    double zmin = -15;
    double xmax = 15;
    double ymax = 12;
    double zmax = 15;


    XYZ *coor;

    BMTReader bmt(bmtname);
    int natom = bmt.getNAtoms();

    XYZ box;
    BoundingBox myInitBox=bmt.getInitialBox();
    box = myInitBox.GetDimensionVector(); 
    double NetTimeStepInPs = bmt.getNetTimeStepInPicoSeconds();
    double InitTimeStepInNs = bmt.getInitialSimulationTimeInNanoSeconds();

    pdbG.Read(pdbname,natom);
    //    MassesG.Init(massname);
    InitStuff(pdbG,min,max);

    int readerr = bmt.ReadFrame();
    int nframe = -1;

    int WritePDB = 0;

    while (!readerr)
      {
        int ignore_frame = (nframe-start) % skip;
	
        if ( (nframe >= start) && (nframe <= stop) && (!ignore_frame) )
	  {
	    
	    coor = bmt.getPositions();
	    framG.SetPositions(coor);

	    DoStuff(framG, pdbG, min, max, nframe, NetTimeStepInPs);
	  }

	readerr = bmt.ReadFrame();
	nframe++;
	    
      }
}

void mapIntoLine(double x, double &v, double a, double l)
    {
    double dx = x-a;
    int k = fabs(dx/l);
    v = k*l;
    if (dx < 0)
        v = -v - l;
    }
