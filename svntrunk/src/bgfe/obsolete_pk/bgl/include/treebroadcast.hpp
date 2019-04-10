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
#ifndef INCLUDE_TREEBROADCAST_HPP
#define INCLUDE_TREEBROADCAST_HPP

class TreeBroadcast
{
public:
  static void Broadcast(
    double* SourceTarget,
    unsigned int Length, // in doublewords
    unsigned int Root
    ) ;
  static void BroadcastUnaligned(
    char* SourceTarget,
    unsigned int Length, // in bytes
    unsigned int Root
    ) ;
} ;
// Same meaning, but with 'C' interface

extern "C" {
   void tr_Broadcast(
    double* SourceTarget,
    unsigned int Length, // in doublewords
    unsigned int Root
   ) ;
   void tr_BroadcastUnaligned(
    char* SourceTarget,
    unsigned int Length, // in bytes
    unsigned int Root
   ) ;
   } ;

#endif
