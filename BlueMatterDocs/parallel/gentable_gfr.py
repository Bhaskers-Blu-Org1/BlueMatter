# "scalability" estimates for non-bond contributions to total time
# step using global force reduction via the tree
import bglestimate as bgl
import sys
import math

if len(sys.argv) < 3:
    print sys.argv[0],"atomCount meshSize"
    sys.exit(1)
atomCount=int(sys.argv[1])
meshSize = int(sys.argv[2])

print "# atom count = ",atomCount
print "# mesh size = ", meshSize
boxSide=math.pow(atomCount/bgl.waterAtomDensity,0.33333333)
print "# corresponding to a water box with side = ",boxSide,"Angstroms"
print "# procCount px py pz fftComm fftComp realSpaceNB forceReduction"
print "# verletIntegration verletIntegrationSingleNode totalTS totalFFT ParallelEfficiency"

singleNode = bgl.tsEstimate_singleNode_gfr((meshSize,meshSize,meshSize),atomCount, 10)
singleNodeTotal = singleNode[6]
print '%12d %4d %4d %4d' % (1,1,1,1),
print '%12.3e %12.3e %12.3e %12.3e %12.3e %12.3e %12.3e %12.3e' %\
      singleNode,
print '%12.3e' % (float(singleNodeTotal)/float(singleNodeTotal))

for p in ((2,2,2),(2,4,4),(4,4,4),(8,4,4),(8,8,4),(8,8,8),(8,8,16),(8,16,16),(16,16,16),(16,16,32),(16,32,32)):
    procs=p[0]*p[1]*p[2]
    currentTS = bgl.tsEstimate_gfr((p[0],p[1],p[2]), (meshSize,meshSize,meshSize),atomCount, 10)
    print '%12d %4d %4d %4d' % (procs,p[0],p[1],p[2]),
    print '%12.3e %12.3e %12.3e %12.3e %12.3e %12.3e %12.3e %12.3e' %\
          currentTS,
    print '%12.3e' % (float(singleNodeTotal)/float(procs*currentTS[6]))