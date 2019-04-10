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
 /*#####################################################################
#                        I.B.M. CONFIDENTIAL                        #
#      (c) COPYRIGHT IBM CORP. 2001, 2003 ALL RIGHTS RESERVED.      #
#                                                                   #
#                LICENSED MATERIALS-PROPERTY OF IBM.                #
#                                                                   #
#####################################################################
*/
//  
//  IBM T.J.W  R.C.
//  Date : 24/01/2003
//  Name : Maria Eleftheriou
//  Last Modified: 
//  fft_one_dim_MPI.hpp
//


#ifndef __FFTONED_H_
#define __FFTONED_H_

//#include <math.h>
//#include <assert.h>
#ifdef FFT_STANDALONE
#include "complex_MPI.hpp"
#endif

//#include "/bgl/local/fftw-2.1.5/include/fftw.h"
#include <fftw.h>

template <class T> 
class FFTOneD {
private:
  unsigned int _vectorSz;  // size of the 1D-FFT
  unsigned int _numOfFFTs; // how many 1D-FFTs
  fftw_plan _plan;
  fftw_direction _fftw_direction;
short int _fftDir;
public:
  inline FFTOneD(unsigned int vectorSz,
	  short int fftDir,
    unsigned int numOfFFTs = 1);

  inline ~FFTOneD();

  inline void fftInternal(complexTemplate<T> *globalIn, complexTemplate<T> *globalOut);

  inline void printFFT(complexTemplate<T> *in);  
};

template <class T> 
FFTOneD<T>::~FFTOneD() {
  fftw_destroy_plan(_plan);
}

template <class T> 
void  FFTOneD<T>::fftInternal(complexTemplate<T> *in, 
			   complexTemplate<T> *out) 
{
  fftw_one(_plan, (fftw_complex *) in, (fftw_complex *)out); 
 if(_fftDir==19)
  {
  for(int i=1; i<_vectorSz; i++)
	{
	out[i].re = -out[i].re;
       }

   }	

}

template <class T> 
FFTOneD<T>::FFTOneD(unsigned int vectorSz,
		 short int fftDir,
		 unsigned int numOfFFTs):
  _vectorSz(vectorSz)
{
_fftDir =fftDir;
  assert(fftDir!=1||fftDir!=-1);
  assert(vectorSz>= 0);
  _numOfFFTs=numOfFFTs;
  
  if(fftDir==-1) {
    _fftw_direction = FFTW_FORWARD;
  }
  else if(fftDir==1) {
    _fftw_direction = FFTW_BACKWARD;
  }
   
 _plan = fftw_create_plan(_vectorSz, _fftw_direction, FFTW_ESTIMATE);
}

template <class T> 
void FFTOneD<T>::printFFT(complexTemplate<T> *out) 
{
  fftw_complex *output = (fftw_complex*) out;
} 

#endif
