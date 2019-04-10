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
 // *************************************************************************
// File: trcmetadata.cpp
// Author: RSG
// Date: January 14, 2005
// Description: Class encapsulating metadata extracted from trace
//              stream and methods to parse trace stream to extract
//              that data.
// Namespace: trc
// *************************************************************************

#include <pktools/trcmetadata.hpp>
#include <cstdlib>
#include <cstring>

namespace trc
{
  int TraceMetaData::parse(const char* buffer)
  {
    // For Blue Matter, we enter this routine with the start of the buffer just after the
    // '>' character in the following line
    // stdout[0]:      1.697941064 0 0 >SourceId: 46037 ProcMeshDim: { 32 , 32 , 16 } FFTMeshDim: { 128 , 128 , 128 } VoxMeshDim: { 64 , 64 , 64 }<    /include/BlueMatter/DynamicVariableManager_phase4.hpp 5388

    // For the FFT benchmark we enter this routine with the start of
    // the buffer just after the '>' character in the following line:
    // stdout[0]:      0.011943584     0 0 > myPx myPy myPz 0  0 0 Px Py Pz 16 16 16 stepPx stepPy stepPz 1 1 1 Nx Ny Nz 64 64 64<    /../include/PrivateFFT.hpp 306
    // Is it what we want?
    if ((!d_seenOne) && 
        (std::strncmp(buffer,
                      " myPx myPy myPz ",
                      std::strlen(" myPx myPy myPz ")) == 0))
        {
#if defined(PRINT_STUFF)
          std::cout << "Matched FFT info row" << std::endl;
#endif
          int xj, yj, zj;
          int rc = 
            std::sscanf(buffer,
                        " myPx myPy myPz %d  %d %d Px Py Pz %d %d %d stepPx stepPy stepPz %d %d %d Nx Ny Nz %d %d %d",
                        &xj,
                        &yj,
                        &zj,
                        &d_p_x,
                        &d_p_y,
                        &d_p_z,
                        &d_fft_step_x,
                        &d_fft_step_y,
                        &d_fft_step_z,
                        &d_fft_x,
                        &d_fft_y,
                        &d_fft_z);
          d_seenOne = true;
#if defined(PRINT_STUFF)
          std::cout << "rc from sscanf = " << rc << std::endl;
#endif
          if (rc != 12)
            {
              d_p_x = -1;
              d_p_y = -1;
              d_p_z = -1;
              d_fft_step_x = -1;
              d_fft_step_y = -1;
              d_fft_step_z = -1;
              d_fft_x = -1;
              d_fft_y = -1;
              d_fft_z = -1;
              return(-2);
            }
          
          return(0);
        } 
    
    else if (std::strncmp(buffer,
                          "SourceId",
                          std::strlen("SourceId")) == 0)
      {
        int rc = 
          std::sscanf(buffer, 
                      "SourceId: %d ProcMeshDim: { %d , %d , %d } FFTMeshDim: { %d , %d , %d } VoxMeshDim: { %d , %d , %d",
                      &d_sourceId,
                      &d_p_x,
                      &d_p_y,
                      &d_p_z,
                      &d_fft_x,
                      &d_fft_y,
                      &d_fft_z,
                      &d_vox_x,
                      &d_vox_y,
                      &d_vox_z);
        if (rc != 10)
          {
            d_sourceId = -1;
            d_p_x = -1;
            d_p_y = -1;
            d_p_z = -1;
            d_fft_x = -1;
            d_fft_y = -1;
            d_fft_z = -1;
            d_vox_x = -1;
            d_vox_y = -1;
            d_vox_z = -1;
            return(-2);
          }
        return(0);
      }
    else
      {
        return(-1);
      }
  }

  TraceMetaData::TraceMetaData() : 
    d_sourceId(-1),
    d_p_x(-1),
    d_p_y(-1),
    d_p_z(-1),
    d_fft_x(-1),
    d_fft_y(-1),
    d_fft_z(-1),
    d_fft_step_x(-1),
    d_fft_step_y(-1),
    d_fft_step_z(-1),
    d_vox_x(-1),
    d_vox_y(-1),
    d_vox_z(-1),
    d_seenOne(false)
  {}

}


std::ostream& ::operator<<(std::ostream& os, const trc::TraceMetaData& t)
{
  os << "source_id:" << t.d_sourceId << "\n"
     << "p_x:" << t.d_p_x << "\n"
     << "p_y:" << t.d_p_y << "\n"
     << "p_z:" << t.d_p_z << "\n"
     << "fft_x:" << t.d_fft_x << "\n"
     << "fft_y:" << t.d_fft_y << "\n"
     << "fft_z:" << t.d_fft_z << "\n"
     << "fft_step_x:" << t.d_fft_step_x << "\n"
     << "fft_step_y:" << t.d_fft_step_y << "\n"
     << "fft_step_z:" << t.d_fft_step_z << "\n"
     << "vox_x:" << t.d_vox_x << "\n"
     << "vox_y:" << t.d_vox_y << "\n"
     << "vox_z:" << t.d_vox_z;
  return(os);
}
