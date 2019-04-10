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
 /*
 * File: treereduce.hpp
 *
 * Purpose: Define application interface for floating-point 'reduce' on BG/L
 *
 * Author: Chris Ward (tjcw@us.ibm.com)
 *         (c) IBM, 2003
 *
 * History : 04/25/2003: TJCW - Created
 */
#ifndef INCLUDE_TREEREDUCE_HPP
#define INCLUDE_TREEREDUCE_HPP

class TreeReduce
{
public:
  static void Init(unsigned int aChannel, unsigned int aClass) ;
  static void AllReduce(
    double* Target,
    const double* Source,
    unsigned int Length,
    unsigned int Channel
    ) ;
  static double AllReduce1(
    double Source,
    unsigned int Channel
    ) ;
} ;
// Same meaning, but with 'C' interface

extern "C" {
   void tr_AllReduceInit(unsigned int aChannel ,unsigned int aClass) ;
   void tr_AllReduceCharInit(unsigned int aChannel ,unsigned int aClass) ;

   void tr_AllReduce(
    double* Target,
    const double* Source,
    unsigned int Length,
    unsigned int Channel
   ) ;
   double tr_AllReduce1(
    double Source,
    unsigned int Channel
   ) ;

  void tr_AllReduceChar(
    char* InOut,
    unsigned int Length,
    unsigned int Channel
  ) ;

} ;

#endif
