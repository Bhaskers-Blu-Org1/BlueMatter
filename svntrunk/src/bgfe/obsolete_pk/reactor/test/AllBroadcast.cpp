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
 * Module:          AllReduce
 *
 * Purpose:         Active message based all reduce.
 *
 * Classification:  IBM Internal Use Only
 *
 * History:         Sept 20, 2002 BGF Created.
 *
 ***************************************************************************/

#include <pk/platform.hpp>
#include <pk/fxlogger.hpp>
#include <pk/AtomicOps.hpp>
#include <pk/ThreadCreate.hpp>

struct XXYYZZ
  {
  double X;
  double Y;
  double Z;
  };

template< class tElement >
class DataAllReduce
  {
  public:


  struct tActorPacket
    {
    struct tHeader
      {
      tElement *       mElementSubArrayPointer;
      unsigned short   mElementCount;            // This could be avoided if all callers have common partition
      unsigned short   mSourceNode;             // This is really for debugging - in case partitions are not correct
      };
    enum {            eMaxElementPayloadCount = ( Platform::Reactor::BROADCAST_PAYLOAD_SIZE - sizeof( tHeader ) ) / sizeof( tElement ) };
    tHeader           mHeader;
    tElement          mElementSubArray[ eMaxElementPayloadCount ];
    };

  static AtomicInteger ReceivedCount;

  static
  int
  ActorFx( void * pkt )
    {
    tActorPacket *ap = (tActorPacket *) pkt;

    BegLogLine(0)
      << "DataAllReduce::ActorFx(): "
      << " Src "
      << ap->mHeader.mSourceNode
      << " PayloadElementCount "
      << ap->mHeader.mElementCount
      << " Put data "
      << (void *) ap->mHeader.mElementSubArrayPointer
      << EndLogLine;

    for( int i = 0; i < ap->mHeader.mElementCount; i++ )
      {
      ap->mHeader.mElementSubArrayPointer[ i ] = ap->mElementSubArray[i];
      }
    // Increment local accumulator.
    ReceivedCount.AtomicAdd( ap->mHeader.mElementCount );

    BegLogLine(0)
      << "DataAllReduce::ActorFx(): "
      << " Done, ReceivedCount "
      << ReceivedCount.SafeFetch()
      << " Src "
      << ap->mHeader.mSourceNode
      << " PayloadElementCount "
      << ap->mHeader.mElementCount
      << " Put data "
      << (void *) ap->mHeader.mElementSubArrayPointer
      << EndLogLine;

    return(0);
    }

  void
  Do( int aCount, tElement aElementArray[], int aPartition[] )
    {
    int MyNode = Platform::Topology::GetAddressSpaceId();

    int ElementsInLowerNodesCount = 0;
    for( int pi = 0; pi < aCount; pi++ )
      {
      if( aPartition[ pi ] < MyNode )
         ElementsInLowerNodesCount++;
      }

    BegLogLine(1)
      << "DataAllReduce::Do(): "
      << " Begin wait for my turn "
      << EndLogLine;

    while( ReceivedCount.SafeFetch() <  ElementsInLowerNodesCount )
      Platform::Thread::Yield();

    BegLogLine(1)
      << "DataAllReduce::Do(): "
      << " Done wait for my turn "
      << EndLogLine;

    tActorPacket ap;
    ap.mHeader.mSourceNode   = MyNode;

    int Loaded = 0;

    for( int pi = 0; pi < aCount; pi++ )
      {
      if( aPartition[ pi ] == MyNode )
        {
        // If this is the first element in the packet, set the target address
        if ( Loaded == 0 )
          ap.mHeader.mElementSubArrayPointer = &(aElementArray[ pi ]);

        ap.mElementSubArray[ Loaded ] = aElementArray[ pi ];
        Loaded++;
        }

      if( Loaded
          &&
          (
            aPartition[ pi ] != MyNode
            ||
            Loaded == tActorPacket::eMaxElementPayloadCount
            ||
            (pi + 1) == aCount
          )
        )
        {
        // true size of packet is the addresss of the last element plus the sizeof an element minus that base address of the packet.
//        unsigned ap_true_size = ((unsigned) & ap.mElementSubArray[ Loaded ] ) + ( (unsigned) sizeof( ap.mElementSubArray[ 0 ] ) ) - ( (unsigned) & ap ) ;
        // It is always a question about whether this works with structure packing
        unsigned ap_true_size = sizeof( tActorPacket::tHeader ) + Loaded * sizeof( tElement ) ;

        ap.mHeader.mElementCount = Loaded;
        Loaded = 0;

        BegLogLine(0)
          << "DataAllReduce::Do(): "
          << " Calling trigger for Start Element "
          << pi - Loaded
          << " Loaded "
          << Loaded
          << "true size "
          << ap_true_size
          << EndLogLine;

        Platform::Reactor::Trigger( ActorFx,
                                    (void *) &ap,
                                    ap_true_size );
        }
      }

    BegLogLine(1)
      << "DataAllReduce::Do(): "
      << " Begin wait "
      << EndLogLine;

    while( ReceivedCount.SafeFetch() != aCount )
      {
      BegLogLine(0)
        << "AllReduce::Do() Waiting for "
        << aCount
        << " Got "
        << ReceivedCount.SafeFetch()
        << EndLogLine;
      // Should us a Platform::Mutex here
      Platform::Thread::Yield();
      }

    BegLogLine(1)
      << "DataAllReduce::Do(): "
      << " Done wait "
      << EndLogLine;

    ReceivedCount.AtomicSet( 0 );
    }

  };


enum { AllReduceTargetCount = 66000 };
XXYYZZ    AllReduceTarget         [ AllReduceTargetCount ];
int    AllReduceTargetPartition[ AllReduceTargetCount ];

typedef DataAllReduce< XXYYZZ > DataAllReduceXXYYZZ;
DataAllReduceXXYYZZ RedEng;

template< class XXYYZZ > AtomicInteger DataAllReduce< XXYYZZ >::ReceivedCount;

void *
UserThread( void * )
  {
  int AddressSpaceCount        =  Platform::Topology::GetAddressSpaceCount();
    const int Batch = 3;
    for( int i = 0; i < AllReduceTargetCount; i++ )
        AllReduceTargetPartition[ i ] = i / (AllReduceTargetCount / AddressSpaceCount) ;

  MPI_Barrier( MPI_COMM_WORLD );         //Wait for all processes to get here.
  sleep(1);
  for( int i = 0; i < 10; i++ )
    {
    BegLogLine(1) << "UserThread starting Do " << i << " on " << Platform::Topology::GetAddressSpaceId() << EndLogLine;
    RedEng.Do( AllReduceTargetCount, AllReduceTarget, AllReduceTargetPartition );
    BegLogLine(1) << "UserThread Finished Do " << i << " on " << Platform::Topology::GetAddressSpaceId() << EndLogLine;

    MPI_Barrier( MPI_COMM_WORLD );         //Wait for all processes to get here.
    sleep(1);
    }
  return( NULL );
  }


int
PkMain(int argc, char **argv, char **)
  {
  BegLogLine(1)
    << " Platform::Reactor::BROADCAST_PAYLOAD_SIZE "
    << Platform::Reactor::BROADCAST_PAYLOAD_SIZE
    << " sizeof( tReactorPacket ) "
    << sizeof( DataAllReduceXXYYZZ::tActorPacket )
    << " eMaxElementPayloadCount "
    << DataAllReduceXXYYZZ::tActorPacket::eMaxElementPayloadCount
    << " sizeof( tElement ) "
    << sizeof( XXYYZZ )
    << EndLogLine;

  int AddressSpaceCount        =  Platform::Topology::GetAddressSpaceCount();
  for( int i = 1; i < AddressSpaceCount; i++ )
    {
    ThreadCreate( i, UserThread, 0, NULL );
    }

  UserThread( NULL );
//  RedEng.Do( AllReduceTargetCount, AllReduceTarget, AllReduceTargetPartition );

  return(0);
  }

