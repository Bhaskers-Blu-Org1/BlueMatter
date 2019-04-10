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
 // ***********************************************************************
// File: fccgen.hpp
// Date: May 19, 2003
// Author: RSG
// Class: FCCGen
// Description: Class encapsulating the generation of an array of
//              positions on an FCC lattice.  Code is strongly
//              influenced by the Allen & Tildesley routine available
//              from ftp://ftp.dl.ac.uk/ccp5/ALLEN_TILDESLEY/F.23
//              This routine generates positions within a unit cube
//              centered at the origin.
// ***********************************************************************
#ifndef INCLUDE_FCCGEN_HPP
#define INCLUDE_FCCGEN_HPP

#include <BlueMatter/XYZ.hpp>
#include <vector>

class FCCGen
{
public:
  // args are unit cell count in each dimension and array of f_XYZ
  // into which positions will be placed.  Number of particles is
  // returned.
  static int generate(int, std::vector<XYZ>&);
};
#endif
