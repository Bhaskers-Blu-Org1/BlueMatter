################################################################################
# Version: ODE5.0 (Build 20041004.0550, 04-Oct-2004)
#
# This file defines defaults for Variables used in the TSO build passes and 
#   target definitions for all targets defined in packaging passes.
#
#  Targets defined:
#    TSO_INFO_FILE
#
################################################################################
.if !defined(_TSO_STD_MK_)
_TSO_STD_MK_=

# Suffixes for TSO build process
ASM_SUFF ?= .asm
CBL_SUFF ?= .cbl .cob .cobol
PLS_SUFF ?= .pls
PLX_SUFF ?= .plx
MAC_SUFF ?= .mac
JCL_SUFF ?= .jcl

################################################################
# Set defaults for tso build passes
#
EXPORT_CONTENTS      != sbls -p ${EXPORTBASE}${EXPINCDIR}
ALL_MAC_FILES        ?= ${EXPORT_CONTENTS:XF}

TSO_INFO_FILE        ?= mvsbldlist${RESPFILE_SUFF}
TSO_SRC_FILE         ?= mvssrclist${RESPFILE_SUFF}
TSO_ALLOCJCL_FILE    ?= copy2tso${JCL_SUFF}
TSO_COMPILEJCL_FILES ?= compile*${JCL_SUFF}
TSO_HFSJCL_FILE      ?= copy2hfs${JCL_SUFF}

ASM_FILES            ?= ${ALL_FILES:M*${ASM_SUFF}}
CBL_FILES            ?= ${ALL_FILES:M*${CBL_SUFF}}
PLS_FILES            ?= ${ALL_FILES:M*${PLS_SUFF}}
PLX_FILES            ?= ${ALL_FILES:M*${PLX_SUFF}}
TSO_LOCAL_INCLUDES   ?= ${ALL_FILES:M*${MAC_SUFF}}
TSO_EXPORT_INCLUDES  ?= ${ALL_MAC_FILES:M*${MAC_SUFF}}

_PLSCFLAGS_ ?= ${${.TARGET}_PLSCFLAGS:U${PLSCFLAGS}}
_PLXCFLAGS_ ?= ${${.TARGET}_PLXCFLAGS:U${PLXCFLAGS}}
_ASMCFLAGS_ ?= ${${.TARGET}_ASMCFLAGS:U${ASMCFLAGS}}
_CBLCFLAGS_ ?= ${${.TARGET}_CBLCFLAGS:U${CBLCFLAGS}}

# Default TSO Builds Variables
BLD_USING_ALLOC_REXXEXEC ?= NO 
USE_ODE_TEMPLATES        ?= YES
USE_MY_TEMPLATES         ?= NO
LANGS_MY_TEMPLATES       ?= ASM COBOL PLS PLX
BLD_REGION_SIZE          ?= 0M
MVS_DELETE_OUTPUT        ?= YES
MVS_SAVE_OUTPUT_FILE     ?= NO

_BUILDTSOFLAGS_ ?= \
	-DSRCBASE=${SOURCEBASE}\
	-DSBOX=${SANDBOX} \
	-DBLD_NUM_OF_FILES=${NUM_OF_FILES_PER_JOB} \
	-DSRCPATH=${MAKEDIR} \
	-DSRCFULL=${SOURCEBASE}${MAKEDIR}\
	-DTGTPATH=${SOURCEBASE}${DIRSEP}${OBJECTDIR}${MAKEDIR} \
	-DTARGET=${.TARGET} \
	-DEXPPATH=${EXPORTDIR}${EXPINCDIR} \
	-DBLD_WITH_REXXEXEC=${BLD_USING_ALLOC_REXXEXEC} \
	-DBLD_SPACE_TYPE=${BLD_SPACE_TYPE} \
	-DBLD_PRIMARY_QTY=${BLD_PRIMARY_QTY} \
	-DBLD_SECONDARY_QTY=${BLD_SECONDARY_QTY} \
	-DBLD_DIRECTORY_BLKS=${BLD_DIRECTORY_BLOCKS} \
	-DBLD_BLK_SIZE=${BLD_BLOCK_SIZE} \
	-DBLD_LST_SPACE_TYPE=${BLD_LSTING_SPACE_TYPE} \
	-DBLD_LST_PRIMARY_QTY=${BLD_LSTING_PRIMARY_QTY} \
	-DBLD_LST_SECONDARY_QTY=${BLD_SECONDARY_QTY} \
	-DBLD_LST_DIR_BLKS=${BLD_LSTING_DIR_BLKS} \
	-DBLD_LST_BLK_SIZE=${BLD_LSTING_BLK_SIZE} \
	-DBLD_REMOTEHOST=${BLD_REMOTE_HOST} \
	-DBLD_ASMPGM=${BLD_ASM_PROGRAM_NAME} \
	-DBLD_CBLPGM=${BLD_CBL_PROGRAM_NAME} \
	-DBLD_PLSPGM=${BLD_PLS_PROGRAM_NAME} \
	-DBLD_PLXPGM=${BLD_PLX_PROGRAM_NAME} \
	-DBLD_REGION=${BLD_REGION_SIZE} \
	-DNETRC_FILE="${BLD_NETRC_FILE}" \
	-DASMFLAGS="${_ASMCFLAGS_}" \
	-DCBLFLAGS="${_CBLCFLAGS_}" \
	-DPLSFLAGS="${_PLSCFLAGS_}" \
	-DPLXFLAGS="${_PLXCFLAGS_}" \
	-DASM_STEPLIB=${BLD_ASM_STEPLIB} \
	-DCBL_STEPLIB=${BLD_CBL_STEPLIB} \
	-DPLS_STEPLIB=${BLD_PLS_STEPLIB} \
	-DPLX_STEPLIB=${BLD_PLX_STEPLIB} \
	-DPROD_ASM_SYSLIB="${PROD_ASM_SYSLIB}" \
	-DPROD_CBL_SYSLIB="${PROD_CBL_SYSLIB}" \
	-DPROD_PLS_SYSLIB="${PROD_PLS_SYSLIB}" \
	-DPROD_PLX_SYSLIB="${PROD_PLX_SYSLIB}" \
	-DSTANDARD_SYSLIB="${STANDARD_SYSLIB}" \
	-DUSE_ODE_TEMPLATES=${USE_ODE_TEMPLATES} \
	-DUSE_MY_TEMPLATES=${USE_MY_TEMPLATES} \
	-DLANGS_FOR_MY_TEMPLATES="${LANGS_FOR_MY_TEMPLATES}" \
	-DHLQ=${BLD_HLQ} \
	-DMVS_USERID=${MVS_USERID} \
	-DMVS_PASSWORD=${MVS_PASSWORD} \
	-DMVS_EXEC_DATASET=${MVS_EXEC_DATASET} \
	-DMVS_DELETE_OUTPUT=${MVS_DELETE_OUTPUT} \
	-DMVS_JOBMONITOR_TIME=${MVS_JOBMONITOR_TIME} \
	-DMVS_SAVE_OUTPUT_FILE=${MVS_SAVE_OUTPUT_FILE} \
	-DMVS_JOBCARD=${MVS_JOBCARD}


.endif # defined(TSO_STD_MK)
