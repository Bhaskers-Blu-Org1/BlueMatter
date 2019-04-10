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
 /***************************************************************************
 * Project:         pK
 *
 * Module:          pkactor.C
 *
 * Purpose:         File contains cheasy unit test.
 *
 * Classification:  IBM Internal Use Only
 *
 * History:         010297 BGF Created.
 *
 ***************************************************************************/

#include <pk/platform.hpp>
#include <pk/reactor.hpp>
#include <pk/mpi.hpp>

int print_something( void *something )
  {

  printf("print_something got >%s<\n", something );
  fflush( stdout );

  return(0);
  }



void PkMain(int argc, char **argv, char **envp)
  {
  char *something = "** protocol ";
  char sendCounter[50];
  int counter=0;

  int addressSpaceCount = Platform::Topology::GetAddressSpaceCount() ;
  //  for(;;)
    for (int k=0; k <10; k++)
    {
    sleep(1);
    BegLogLine( PKFXLOG_PKREACTOR )
      << "iv00:  "
      << " Send Trigger... "
      << EndLogLine;

   sprintf(sendCounter, "%s %d **", something, counter++);
   Platform::Reactor::Trigger( k % addressSpaceCount,
           print_something,
           &sendCounter,   // this should proably be a pointer to the wrapper
           1 + strlen( sendCounter ) );
    //sleep(1);
    }

  }





