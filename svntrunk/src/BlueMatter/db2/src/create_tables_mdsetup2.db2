-- This CLP file was created using DB2LOOK Version 8.2
-- Timestamp: Tue Mar  7 21:00:26 EST 2006
-- Database Name: MDSETUP        
-- Database Manager Version: DB2/6000 Version 8.2.4        
-- Database Codepage: 819
-- Database Collating Sequence is: UNIQUE


CONNECT TO MDSETUP2;



------------------------------------------------
-- DDL Statements for table "CHEM    "."CHEMICAL_COMPONENT"
------------------------------------------------
 
 CREATE TABLE "CHEM    "."CHEMICAL_COMPONENT"  (
		  "COMPONENT_NAME" VARCHAR(60) NOT NULL , 
		  "DESCRIPTION" VARCHAR(100) NOT NULL )   
		 IN "MDSHORT" ; 

-- DDL Statements for primary key on Table "CHEM    "."CHEMICAL_COMPONENT"

ALTER TABLE "CHEM    "."CHEMICAL_COMPONENT" 
	ADD PRIMARY KEY
		("COMPONENT_NAME");


------------------------------------------------
-- DDL Statements for table "CHEM    "."MOLECULE_TYPE"
------------------------------------------------
 
 CREATE TABLE "CHEM    "."MOLECULE_TYPE"  (
		  "CLASS" VARCHAR(60) NOT NULL , 
		  "DESCRIPTION" VARCHAR(100) NOT NULL )   
		 IN "MDSHORT" ; 

-- DDL Statements for primary key on Table "CHEM    "."MOLECULE_TYPE"

ALTER TABLE "CHEM    "."MOLECULE_TYPE" 
	ADD PRIMARY KEY
		("CLASS");


------------------------------------------------
-- DDL Statements for table "CHEM    "."ELEMENTS"
------------------------------------------------
 
 CREATE TABLE "CHEM    "."ELEMENTS"  (
		  "ATOMIC_NUMBER" INTEGER NOT NULL , 
		  "ELEMENT_SYMBOL" VARCHAR(60) NOT NULL , 
		  "ELEMENT_NAME" VARCHAR(50) NOT NULL , 
		  "ATOMIC_MASS" VARCHAR(30) NOT NULL )   
		 IN "MDSHORT" ; 

-- DDL Statements for primary key on Table "CHEM    "."ELEMENTS"

ALTER TABLE "CHEM    "."ELEMENTS" 
	ADD PRIMARY KEY
		("ELEMENT_SYMBOL");


------------------------------------------------
-- DDL Statements for table "CHEM    "."ATOM_TAG_TABLE"
------------------------------------------------
 
 CREATE TABLE "CHEM    "."ATOM_TAG_TABLE"  (
		  "COMPONENT_NAME" VARCHAR(60) NOT NULL , 
		  "ATOM_TAG" VARCHAR(60) NOT NULL )   
		 IN "MDSHORT" ; 

-- DDL Statements for primary key on Table "CHEM    "."ATOM_TAG_TABLE"

ALTER TABLE "CHEM    "."ATOM_TAG_TABLE" 
	ADD PRIMARY KEY
		("COMPONENT_NAME",
		 "ATOM_TAG");


------------------------------------------------
-- DDL Statements for table "CHEM    "."EXTENT_TABLE"
------------------------------------------------
 
 CREATE TABLE "CHEM    "."EXTENT_TABLE"  (
		  "COMPONENT_NAME" VARCHAR(60) NOT NULL , 
		  "ATOM_TAG" VARCHAR(60) NOT NULL , 
		  "MAX_EXTENT" VARCHAR(60) NOT NULL )   
		 IN "MDSHORT" ; 

-- DDL Statements for primary key on Table "CHEM    "."EXTENT_TABLE"

ALTER TABLE "CHEM    "."EXTENT_TABLE" 
	ADD PRIMARY KEY
		("COMPONENT_NAME");


------------------------------------------------
-- DDL Statements for table "CHEM    "."SITE_PARAM_TYPE"
------------------------------------------------
 
 CREATE TABLE "CHEM    "."SITE_PARAM_TYPE"  (
		  "TYPE_ID" INTEGER NOT NULL , 
		  "TYPE_DESC" VARCHAR(60) NOT NULL )   
		 IN "MDSHORT" ; 

-- DDL Statements for primary key on Table "CHEM    "."SITE_PARAM_TYPE"

ALTER TABLE "CHEM    "."SITE_PARAM_TYPE" 
	ADD PRIMARY KEY
		("TYPE_ID");


------------------------------------------------
-- DDL Statements for table "CHEM    "."WATER_PARAMETERS"
------------------------------------------------
 
 CREATE TABLE "CHEM    "."WATER_PARAMETERS"  (
		  "WATER_MODEL" VARCHAR(60) NOT NULL , 
		  "Q1" VARCHAR(60) NOT NULL , 
		  "Q2" VARCHAR(60) NOT NULL , 
		  "O_EPSILON" VARCHAR(60) NOT NULL , 
		  "O_SIGMA" VARCHAR(60) NOT NULL , 
		  "H_EPSILON" VARCHAR(60) NOT NULL , 
		  "H_SIGMA" VARCHAR(60) NOT NULL )   
		 IN "MDSHORT" ; 

-- DDL Statements for primary key on Table "CHEM    "."WATER_PARAMETERS"

ALTER TABLE "CHEM    "."WATER_PARAMETERS" 
	ADD PRIMARY KEY
		("WATER_MODEL");


------------------------------------------------
-- DDL Statements for table "REGISTRY"."UDF_RECORD"
------------------------------------------------
 
 CREATE TABLE "REGISTRY"."UDF_RECORD"  (
		  "UDF_ID" INTEGER NOT NULL , 
		  "UDF_NAME" VARCHAR(50) NOT NULL , 
		  "ENTRY_DATE" DATE , 
		  "ENTRY_TIME" TIME , 
		  "ARG_CHECK_SUM" INTEGER , 
		  "BODY_CHECK_SUM" INTEGER , 
		  "SITE_COUNT" INTEGER , 
		  "PARAM_COUNT" INTEGER )   
		 IN "MDSHORT" ; 

-- DDL Statements for primary key on Table "REGISTRY"."UDF_RECORD"

ALTER TABLE "REGISTRY"."UDF_RECORD" 
	ADD PRIMARY KEY
		("UDF_ID");


------------------------------------------------
-- DDL Statements for table "REGISTRY"."UDF_CATEGORY"
------------------------------------------------
 
 CREATE TABLE "REGISTRY"."UDF_CATEGORY"  (
		  "UDF_ID" INTEGER NOT NULL , 
		  "CATEGORY_NAME" VARCHAR(60) NOT NULL )   
		 IN "MDSHORT" ; 

-- DDL Statements for primary key on Table "REGISTRY"."UDF_CATEGORY"

ALTER TABLE "REGISTRY"."UDF_CATEGORY" 
	ADD PRIMARY KEY
		("UDF_ID",
		 "CATEGORY_NAME");


------------------------------------------------
-- DDL Statements for table "REGISTRY"."UDF_VARIABLE"
------------------------------------------------
 
 CREATE TABLE "REGISTRY"."UDF_VARIABLE"  (
		  "UDF_ID" INTEGER NOT NULL , 
		  "VAR_NAME" VARCHAR(40) NOT NULL , 
		  "TYPE_DESC" VARCHAR(30) , 
		  "TYPE_SIZE" INTEGER )   
		 IN "MDSHORT" ; 

-- DDL Statements for primary key on Table "REGISTRY"."UDF_VARIABLE"

ALTER TABLE "REGISTRY"."UDF_VARIABLE" 
	ADD PRIMARY KEY
		("UDF_ID",
		 "VAR_NAME");


------------------------------------------------
-- DDL Statements for table "MDSYSTEM"."SYSTEM"
------------------------------------------------
 
 CREATE TABLE "MDSYSTEM"."SYSTEM"  (
		  "SYS_ID" INTEGER NOT NULL GENERATED BY DEFAULT AS IDENTITY (  
		    START WITH +60000  
		    INCREMENT BY +1  
		    MINVALUE +60000  
		    MAXVALUE +2147483647  
		    NO CYCLE  
		    CACHE 20  
		    NO ORDER ) , 
		  "SYS_DESC" VARCHAR(30) NOT NULL , 
		  "CREATOR" VARCHAR(40) NOT NULL , 
		  "CREATED" TIMESTAMP NOT NULL , 
		  "SYS_CLASS" VARCHAR(60) NOT NULL )   
		 IN "MDSHORT" ; 

-- DDL Statements for primary key on Table "MDSYSTEM"."SYSTEM"

ALTER TABLE "MDSYSTEM"."SYSTEM" 
	ADD PRIMARY KEY
		("SYS_ID");


------------------------------------------------
-- DDL Statements for table "MDSYSTEM"."CHAIN"
------------------------------------------------
 
 CREATE TABLE "MDSYSTEM"."CHAIN"  (
		  "SYS_ID" INTEGER NOT NULL , 
		  "CHAIN_ID" INTEGER NOT NULL , 
		  "CHAIN_DESC" VARCHAR(100) )   
		 IN "MDSHORT" ; 

-- DDL Statements for primary key on Table "MDSYSTEM"."CHAIN"

ALTER TABLE "MDSYSTEM"."CHAIN" 
	ADD PRIMARY KEY
		("SYS_ID",
		 "CHAIN_ID");


------------------------------------------------
-- DDL Statements for table "MDSYSTEM"."CHEM_COMP_INSTANCE"
------------------------------------------------
 
 CREATE TABLE "MDSYSTEM"."CHEM_COMP_INSTANCE"  (
		  "SYS_ID" INTEGER NOT NULL , 
		  "CC_INSTANCE_ID" INTEGER NOT NULL , 
		  "COMPONENT_NAME" VARCHAR(100) NOT NULL )   
		 IN "MDSHORT" ; 

-- DDL Statements for primary key on Table "MDSYSTEM"."CHEM_COMP_INSTANCE"

ALTER TABLE "MDSYSTEM"."CHEM_COMP_INSTANCE" 
	ADD PRIMARY KEY
		("SYS_ID",
		 "CC_INSTANCE_ID");


------------------------------------------------
-- DDL Statements for table "MDSYSTEM"."SPECIFIC_MOLECULE"
------------------------------------------------
 
 CREATE TABLE "MDSYSTEM"."SPECIFIC_MOLECULE"  (
		  "SYS_ID" INTEGER NOT NULL , 
		  "MOL_ID" INTEGER NOT NULL , 
		  "MOLECULE_NAME" VARCHAR(60) NOT NULL , 
		  "CLASS" VARCHAR(60) NOT NULL , 
		  "GENERIC_NAME" VARCHAR(60) , 
		  "PDB_ID" VARCHAR(60) )   
		 IN "MDSHORT" ; 

-- DDL Statements for primary key on Table "MDSYSTEM"."SPECIFIC_MOLECULE"

ALTER TABLE "MDSYSTEM"."SPECIFIC_MOLECULE" 
	ADD PRIMARY KEY
		("SYS_ID",
		 "MOL_ID");


------------------------------------------------
-- DDL Statements for table "MDSYSTEM"."MOLECULE_INSTANCE"
------------------------------------------------
 
 CREATE TABLE "MDSYSTEM"."MOLECULE_INSTANCE"  (
		  "SYS_ID" INTEGER NOT NULL , 
		  "MOL_INSTANCE_ID" INTEGER NOT NULL , 
		  "MOL_ID" INTEGER NOT NULL )   
		 IN "MDSHORT" ; 
-- DDL Statements for indexes on Table "MDSYSTEM"."MOLECULE_INSTANCE"

CREATE INDEX "DB2INSTL"."MOLECULE_INSTANCE" ON "MDSYSTEM"."MOLECULE_INSTANCE" 
		("SYS_ID" ASC) ;


-- DDL Statements for primary key on Table "MDSYSTEM"."MOLECULE_INSTANCE"

ALTER TABLE "MDSYSTEM"."MOLECULE_INSTANCE" 
	ADD PRIMARY KEY
		("SYS_ID",
		 "MOL_INSTANCE_ID");


------------------------------------------------
-- DDL Statements for table "MDSYSTEM"."MONOMER_INSTANCE"
------------------------------------------------
 
 CREATE TABLE "MDSYSTEM"."MONOMER_INSTANCE"  (
		  "SYS_ID" INTEGER NOT NULL , 
		  "CHAIN_ID" INTEGER NOT NULL , 
		  "MONOMER_ORDINAL" INTEGER NOT NULL , 
		  "CC_INSTANCE_ID" INTEGER NOT NULL )   
		 IN "MDSHORT" ; 

-- DDL Statements for primary key on Table "MDSYSTEM"."MONOMER_INSTANCE"

ALTER TABLE "MDSYSTEM"."MONOMER_INSTANCE" 
	ADD PRIMARY KEY
		("SYS_ID",
		 "CHAIN_ID",
		 "MONOMER_ORDINAL");


------------------------------------------------
-- DDL Statements for table "MDSYSTEM"."PARAMTUPLELIST"
------------------------------------------------
 
 CREATE TABLE "MDSYSTEM"."PARAMTUPLELIST"  (
		  "SYS_ID" INTEGER NOT NULL , 
		  "PARAM_TUPLE_LIST_ID" INTEGER NOT NULL , 
		  "PARAM_TUPLE_DESC" VARCHAR(40) )   
		 IN "MDSHORT" ; 

-- DDL Statements for primary key on Table "MDSYSTEM"."PARAMTUPLELIST"

ALTER TABLE "MDSYSTEM"."PARAMTUPLELIST" 
	ADD PRIMARY KEY
		("SYS_ID",
		 "PARAM_TUPLE_LIST_ID");


------------------------------------------------
-- DDL Statements for table "MDSYSTEM"."PARAMTUPLESPEC"
------------------------------------------------
 
 CREATE TABLE "MDSYSTEM"."PARAMTUPLESPEC"  (
		  "SYS_ID" INTEGER NOT NULL , 
		  "PARAM_TUPLE_LIST_ID" INTEGER NOT NULL , 
		  "PARAM_ID" INTEGER NOT NULL , 
		  "PARAM_TYPE" INTEGER , 
		  "PARAM_NAME" VARCHAR(40) )   
		 IN "MDSHORT" ; 

-- DDL Statements for primary key on Table "MDSYSTEM"."PARAMTUPLESPEC"

ALTER TABLE "MDSYSTEM"."PARAMTUPLESPEC" 
	ADD PRIMARY KEY
		("SYS_ID",
		 "PARAM_TUPLE_LIST_ID",
		 "PARAM_ID");


------------------------------------------------
-- DDL Statements for table "MDSYSTEM"."PARAMTUPLE"
------------------------------------------------
 
 CREATE TABLE "MDSYSTEM"."PARAMTUPLE"  (
		  "SYS_ID" INTEGER NOT NULL , 
		  "PARAM_TUPLE_LIST_ID" INTEGER NOT NULL , 
		  "PARAM_TUPLE_ID" INTEGER NOT NULL )   
		 IN "MDSHORT" ; 
-- DDL Statements for indexes on Table "MDSYSTEM"."PARAMTUPLE"

CREATE INDEX "DB2INSTL"."PARAMTUPLE" ON "MDSYSTEM"."PARAMTUPLE" 
		("SYS_ID" ASC) ;


-- DDL Statements for primary key on Table "MDSYSTEM"."PARAMTUPLE"

ALTER TABLE "MDSYSTEM"."PARAMTUPLE" 
	ADD PRIMARY KEY
		("SYS_ID",
		 "PARAM_TUPLE_LIST_ID",
		 "PARAM_TUPLE_ID");


------------------------------------------------
-- DDL Statements for table "MDSYSTEM"."PARAMTUPLEDATA"
------------------------------------------------
 
 CREATE TABLE "MDSYSTEM"."PARAMTUPLEDATA"  (
		  "SYS_ID" INTEGER NOT NULL , 
		  "PARAM_TUPLE_LIST_ID" INTEGER NOT NULL , 
		  "PARAM_TUPLE_ID" INTEGER NOT NULL , 
		  "PARAM_ID" INTEGER NOT NULL , 
		  "PARAM_VALUE" VARCHAR(40) )   
		 IN "MDSHORT" ; 
-- DDL Statements for indexes on Table "MDSYSTEM"."PARAMTUPLEDATA"

CREATE INDEX "DB2INSTL"."PARAMTUPLEDATA" ON "MDSYSTEM"."PARAMTUPLEDATA" 
		("SYS_ID" ASC) ;


-- DDL Statements for primary key on Table "MDSYSTEM"."PARAMTUPLEDATA"

ALTER TABLE "MDSYSTEM"."PARAMTUPLEDATA" 
	ADD PRIMARY KEY
		("SYS_ID",
		 "PARAM_TUPLE_LIST_ID",
		 "PARAM_TUPLE_ID",
		 "PARAM_ID");


------------------------------------------------
-- DDL Statements for table "MDSYSTEM"."SITETUPLELIST"
------------------------------------------------
 
 CREATE TABLE "MDSYSTEM"."SITETUPLELIST"  (
		  "SYS_ID" INTEGER NOT NULL , 
		  "SITE_TUPLE_LIST_ID" INTEGER NOT NULL , 
		  "SITE_TUPLE_DESC" VARCHAR(40) )   
		 IN "MDSHORT" ; 

-- DDL Statements for primary key on Table "MDSYSTEM"."SITETUPLELIST"

ALTER TABLE "MDSYSTEM"."SITETUPLELIST" 
	ADD PRIMARY KEY
		("SYS_ID",
		 "SITE_TUPLE_LIST_ID");


------------------------------------------------
-- DDL Statements for table "MDSYSTEM"."UDF_INVOCATION_TABLE"
------------------------------------------------
 
 CREATE TABLE "MDSYSTEM"."UDF_INVOCATION_TABLE"  (
		  "SYS_ID" INTEGER NOT NULL , 
		  "UDF_ID" VARCHAR(60) NOT NULL , 
		  "SITE_TUPLE_LIST_ID" INTEGER NOT NULL , 
		  "PARAM_TUPLE_LIST_ID" INTEGER )   
		 IN "MDSHORT" ; 

-- DDL Statements for primary key on Table "MDSYSTEM"."UDF_INVOCATION_TABLE"

ALTER TABLE "MDSYSTEM"."UDF_INVOCATION_TABLE" 
	ADD PRIMARY KEY
		("SYS_ID",
		 "UDF_ID",
		 "SITE_TUPLE_LIST_ID");


------------------------------------------------
-- DDL Statements for table "MDSYSTEM"."SITETUPLE"
------------------------------------------------
 
 CREATE TABLE "MDSYSTEM"."SITETUPLE"  (
		  "SYS_ID" INTEGER NOT NULL , 
		  "SITE_TUPLE_LIST_ID" INTEGER NOT NULL , 
		  "SITE_TUPLE_ID" INTEGER NOT NULL )   
		 IN "MDSHORT" ; 
-- DDL Statements for indexes on Table "MDSYSTEM"."SITETUPLE"

CREATE INDEX "DB2INSTL"."SITETUPLE" ON "MDSYSTEM"."SITETUPLE" 
		("SYS_ID" ASC) ;


-- DDL Statements for primary key on Table "MDSYSTEM"."SITETUPLE"

ALTER TABLE "MDSYSTEM"."SITETUPLE" 
	ADD PRIMARY KEY
		("SYS_ID",
		 "SITE_TUPLE_LIST_ID",
		 "SITE_TUPLE_ID");


------------------------------------------------
-- DDL Statements for table "MDSYSTEM"."SITE"
------------------------------------------------
 
 CREATE TABLE "MDSYSTEM"."SITE"  (
		  "SYS_ID" INTEGER NOT NULL , 
		  "SITE_ID" INTEGER NOT NULL , 
		  "CC_INSTANCE_ID" INTEGER , 
		  "MOL_INSTANCE_ID" INTEGER , 
		  "EPSILON" VARCHAR(50) , 
		  "RMIN" VARCHAR(50) , 
		  "EPSILON14" VARCHAR(50) , 
		  "RMIN14" VARCHAR(50) , 
		  "ATOMIC_MASS" VARCHAR(50) , 
		  "CHARGE" VARCHAR(60) , 
		  "ATOM_TAG" VARCHAR(60) , 
		  "COMPONENT_NAME" VARCHAR(60) , 
		  "ELEMENT_SYMBOL" VARCHAR(10) )   
		 IN "MDSHORT" ; 
-- DDL Statements for indexes on Table "MDSYSTEM"."SITE"

CREATE INDEX "DB2INSTL"."SITE" ON "MDSYSTEM"."SITE" 
		("SYS_ID" ASC) ;


-- DDL Statements for primary key on Table "MDSYSTEM"."SITE"

ALTER TABLE "MDSYSTEM"."SITE" 
	ADD PRIMARY KEY
		("SYS_ID",
		 "SITE_ID");


------------------------------------------------
-- DDL Statements for table "MDSYSTEM"."SITETUPLEDATA"
------------------------------------------------
 
 CREATE TABLE "MDSYSTEM"."SITETUPLEDATA"  (
		  "SYS_ID" INTEGER NOT NULL , 
		  "SITE_TUPLE_LIST_ID" INTEGER NOT NULL , 
		  "SITE_TUPLE_ID" INTEGER NOT NULL , 
		  "SITE_ORDINAL" INTEGER NOT NULL , 
		  "SITE_ID" INTEGER NOT NULL )   
		 IN "MDSHORT" ; 
-- DDL Statements for indexes on Table "MDSYSTEM"."SITETUPLEDATA"

CREATE INDEX "DB2INSTL"."SITETUPLEDATA" ON "MDSYSTEM"."SITETUPLEDATA" 
		("SYS_ID" ASC) ;


-- DDL Statements for primary key on Table "MDSYSTEM"."SITETUPLEDATA"

ALTER TABLE "MDSYSTEM"."SITETUPLEDATA" 
	ADD PRIMARY KEY
		("SYS_ID",
		 "SITE_TUPLE_LIST_ID",
		 "SITE_TUPLE_ID",
		 "SITE_ORDINAL");


------------------------------------------------
-- DDL Statements for table "MDSYSTEM"."GROUP"
------------------------------------------------
 
 CREATE TABLE "MDSYSTEM"."GROUP"  (
		  "SYS_ID" INTEGER NOT NULL , 
		  "GROUP_ID" INTEGER NOT NULL , 
		  "GROUP_TYPE" VARCHAR(60) NOT NULL )   
		 IN "MDSHORT" ; 

-- DDL Statements for primary key on Table "MDSYSTEM"."GROUP"

ALTER TABLE "MDSYSTEM"."GROUP" 
	ADD PRIMARY KEY
		("SYS_ID",
		 "GROUP_ID");


------------------------------------------------
-- DDL Statements for table "MDSYSTEM"."GROUP_SITE"
------------------------------------------------
 
 CREATE TABLE "MDSYSTEM"."GROUP_SITE"  (
		  "SYS_ID" INTEGER NOT NULL , 
		  "GROUP_ID" INTEGER NOT NULL , 
		  "SITE_ID" INTEGER NOT NULL )   
		 IN "MDSHORT" ; 

-- DDL Statements for primary key on Table "MDSYSTEM"."GROUP_SITE"

ALTER TABLE "MDSYSTEM"."GROUP_SITE" 
	ADD PRIMARY KEY
		("SYS_ID",
		 "GROUP_ID",
		 "SITE_ID");


------------------------------------------------
-- DDL Statements for table "MDSYSTEM"."SITE_PARAM_SPEC"
------------------------------------------------
 
 CREATE TABLE "MDSYSTEM"."SITE_PARAM_SPEC"  (
		  "SYS_ID" INTEGER NOT NULL , 
		  "PARAM_ID" INTEGER NOT NULL , 
		  "TYPE_ID" INTEGER NOT NULL , 
		  "NAME" VARCHAR(60) NOT NULL )   
		 IN "MDSHORT" ; 

-- DDL Statements for primary key on Table "MDSYSTEM"."SITE_PARAM_SPEC"

ALTER TABLE "MDSYSTEM"."SITE_PARAM_SPEC" 
	ADD PRIMARY KEY
		("SYS_ID",
		 "PARAM_ID");


------------------------------------------------
-- DDL Statements for table "MDSYSTEM"."SITE_PARAM"
------------------------------------------------
 
 CREATE TABLE "MDSYSTEM"."SITE_PARAM"  (
		  "SYS_ID" INTEGER NOT NULL , 
		  "SITE_ID" INTEGER NOT NULL , 
		  "PARAM_ID" INTEGER NOT NULL , 
		  "VALUE" VARCHAR(60) NOT NULL )   
		 IN "MDSHORT" ; 

-- DDL Statements for primary key on Table "MDSYSTEM"."SITE_PARAM"

ALTER TABLE "MDSYSTEM"."SITE_PARAM" 
	ADD PRIMARY KEY
		("SYS_ID",
		 "SITE_ID",
		 "PARAM_ID");


------------------------------------------------
-- DDL Statements for table "MDSYSTEM"."BOND"
------------------------------------------------
 
 CREATE TABLE "MDSYSTEM"."BOND"  (
		  "SYS_ID" INTEGER NOT NULL , 
		  "BOND_ID" INTEGER NOT NULL , 
		  "SITE_ID1" INTEGER NOT NULL , 
		  "SITE_ID2" INTEGER NOT NULL , 
		  "BOND_TYPE" INTEGER )   
		 IN "MDSHORT" ; 
-- DDL Statements for indexes on Table "MDSYSTEM"."BOND"

CREATE INDEX "DB2INSTL"."BOND" ON "MDSYSTEM"."BOND" 
		("SYS_ID" ASC) ;


-- DDL Statements for primary key on Table "MDSYSTEM"."BOND"

ALTER TABLE "MDSYSTEM"."BOND" 
	ADD PRIMARY KEY
		("SYS_ID",
		 "BOND_ID");


------------------------------------------------
-- DDL Statements for table "MDSYSTEM"."GLOBAL_PARAMETER_TYPE"
------------------------------------------------
 
 CREATE TABLE "MDSYSTEM"."GLOBAL_PARAMETER_TYPE"  (
		  "SYS_ID" INTEGER NOT NULL , 
		  "PARAM_TYPE" INTEGER NOT NULL , 
		  "PARAM_DESC" VARCHAR(60) )   
		 IN "MDSHORT" ; 

-- DDL Statements for primary key on Table "MDSYSTEM"."GLOBAL_PARAMETER_TYPE"

ALTER TABLE "MDSYSTEM"."GLOBAL_PARAMETER_TYPE" 
	ADD PRIMARY KEY
		("SYS_ID",
		 "PARAM_TYPE");


------------------------------------------------
-- DDL Statements for table "MDSYSTEM"."GLOBAL_PARAMETER"
------------------------------------------------
 
 CREATE TABLE "MDSYSTEM"."GLOBAL_PARAMETER"  (
		  "SYS_ID" INTEGER NOT NULL , 
		  "PARAM_ID" VARCHAR(20) NOT NULL , 
		  "PARAM_TYPE" INTEGER NOT NULL , 
		  "SYMBOLIC_CONSTANT" INTEGER , 
		  "PARAM_VALUE" VARCHAR(60) )   
		 IN "MDSHORT" ; 

-- DDL Statements for primary key on Table "MDSYSTEM"."GLOBAL_PARAMETER"

ALTER TABLE "MDSYSTEM"."GLOBAL_PARAMETER" 
	ADD PRIMARY KEY
		("SYS_ID",
		 "PARAM_ID");


------------------------------------------------
-- DDL Statements for table "EXPERIMENT"."CTP_TABLE"
------------------------------------------------
 
 CREATE TABLE "EXPERIMENT"."CTP_TABLE"  (
		  "CTP_ID" INTEGER NOT NULL GENERATED BY DEFAULT AS IDENTITY (  
		    START WITH +60000  
		    INCREMENT BY +1  
		    MINVALUE +60000  
		    MAXVALUE +2147483647  
		    NO CYCLE  
		    CACHE 20  
		    NO ORDER ) , 
		  "FILENAME" VARCHAR(40) NOT NULL , 
		  "DESC" VARCHAR(100) , 
		  "CREATOR" VARCHAR(30) NOT NULL , 
		  "CREATED" TIMESTAMP NOT NULL )   
		 IN "MDSHORT" ; 

-- DDL Statements for primary key on Table "EXPERIMENT"."CTP_TABLE"

ALTER TABLE "EXPERIMENT"."CTP_TABLE" 
	ADD PRIMARY KEY
		("CTP_ID");


------------------------------------------------
-- DDL Statements for table "EXPERIMENT"."VOCAB"
------------------------------------------------
 
 CREATE TABLE "EXPERIMENT"."VOCAB"  (
		  "NAME" VARCHAR(100) NOT NULL , 
		  "DESC" VARCHAR(200) , 
		  "ATTRIBUTE" VARCHAR(60) )   
		 IN "MDSHORT" ; 

-- DDL Statements for primary key on Table "EXPERIMENT"."VOCAB"

ALTER TABLE "EXPERIMENT"."VOCAB" 
	ADD PRIMARY KEY
		("NAME");


------------------------------------------------
-- DDL Statements for table "EXPERIMENT"."CT_PARAMS"
------------------------------------------------
 
 CREATE TABLE "EXPERIMENT"."CT_PARAMS"  (
		  "CTP_ID" INTEGER NOT NULL , 
		  "NAME" VARCHAR(100) NOT NULL , 
		  "VALUE" VARCHAR(200) NOT NULL , 
		  "TYPE" VARCHAR(20) )   
		 IN "MDSHORT" ; 

-- DDL Statements for primary key on Table "EXPERIMENT"."CT_PARAMS"

ALTER TABLE "EXPERIMENT"."CT_PARAMS" 
	ADD PRIMARY KEY
		("CTP_ID",
		 "NAME");


------------------------------------------------
-- DDL Statements for table "EXPERIMENT"."IMPL_TABLE"
------------------------------------------------
 
 CREATE TABLE "EXPERIMENT"."IMPL_TABLE"  (
		  "IMPL_ID" INTEGER NOT NULL GENERATED BY DEFAULT AS IDENTITY (  
		    START WITH +1000  
		    INCREMENT BY +1  
		    MINVALUE +1000  
		    MAXVALUE +2147483647  
		    NO CYCLE  
		    CACHE 20  
		    NO ORDER ) , 
		  "FILENAME" VARCHAR(40) NOT NULL , 
		  "DESC" VARCHAR(100) , 
		  "CREATOR" VARCHAR(30) NOT NULL , 
		  "CREATED" TIMESTAMP NOT NULL )   
		 IN "MDSHORT" ; 

-- DDL Statements for primary key on Table "EXPERIMENT"."IMPL_TABLE"

ALTER TABLE "EXPERIMENT"."IMPL_TABLE" 
	ADD PRIMARY KEY
		("IMPL_ID");


------------------------------------------------
-- DDL Statements for table "EXPERIMENT"."IMPL_VOCAB"
------------------------------------------------
 
 CREATE TABLE "EXPERIMENT"."IMPL_VOCAB"  (
		  "NAME" VARCHAR(100) NOT NULL , 
		  "DESC" VARCHAR(200) , 
		  "ATTRIBUTE" VARCHAR(60) )   
		 IN "MDSHORT" ; 

-- DDL Statements for primary key on Table "EXPERIMENT"."IMPL_VOCAB"

ALTER TABLE "EXPERIMENT"."IMPL_VOCAB" 
	ADD PRIMARY KEY
		("NAME");


------------------------------------------------
-- DDL Statements for table "EXPERIMENT"."IMPL_PARAMS"
------------------------------------------------
 
 CREATE TABLE "EXPERIMENT"."IMPL_PARAMS"  (
		  "IMPL_ID" INTEGER NOT NULL , 
		  "NAME" VARCHAR(100) NOT NULL , 
		  "VALUE" VARCHAR(200) NOT NULL , 
		  "LITERAL" VARCHAR(20) )   
		 IN "MDSHORT" ; 

-- DDL Statements for primary key on Table "EXPERIMENT"."IMPL_PARAMS"

ALTER TABLE "EXPERIMENT"."IMPL_PARAMS" 
	ADD PRIMARY KEY
		("IMPL_ID",
		 "NAME");


------------------------------------------------
-- DDL Statements for table "EXPERIMENT"."PLATFORM_TABLE"
------------------------------------------------
 
 CREATE TABLE "EXPERIMENT"."PLATFORM_TABLE"  (
		  "PLATFORM_ID" INTEGER NOT NULL GENERATED BY DEFAULT AS IDENTITY (  
		    START WITH +1000  
		    INCREMENT BY +1  
		    MINVALUE +1000  
		    MAXVALUE +2147483647  
		    NO CYCLE  
		    CACHE 20  
		    NO ORDER ) , 
		  "FILENAME" VARCHAR(40) NOT NULL , 
		  "DESC" VARCHAR(100) , 
		  "CREATOR" VARCHAR(30) NOT NULL , 
		  "CREATED" TIMESTAMP NOT NULL )   
		 IN "MDSHORT" ; 

-- DDL Statements for primary key on Table "EXPERIMENT"."PLATFORM_TABLE"

ALTER TABLE "EXPERIMENT"."PLATFORM_TABLE" 
	ADD PRIMARY KEY
		("PLATFORM_ID");


------------------------------------------------
-- DDL Statements for table "EXPERIMENT"."PLATFORM_PARAMS"
------------------------------------------------
 
 CREATE TABLE "EXPERIMENT"."PLATFORM_PARAMS"  (
		  "PLATFORM_ID" INTEGER NOT NULL , 
		  "NAME" VARCHAR(100) NOT NULL , 
		  "VALUE" VARCHAR(200) NOT NULL , 
		  "TYPE" VARCHAR(20) )   
		 IN "MDSHORT" ; 

-- DDL Statements for primary key on Table "EXPERIMENT"."PLATFORM_PARAMS"

ALTER TABLE "EXPERIMENT"."PLATFORM_PARAMS" 
	ADD PRIMARY KEY
		("PLATFORM_ID",
		 "NAME");


------------------------------------------------
-- DDL Statements for table "EXPERIMENT"."SYSTEM_SOURCE"
------------------------------------------------
 
 CREATE TABLE "EXPERIMENT"."SYSTEM_SOURCE"  (
		  "SOURCE_ID" INTEGER NOT NULL GENERATED BY DEFAULT AS IDENTITY (  
		    START WITH +60000  
		    INCREMENT BY +1  
		    MINVALUE +60000  
		    MAXVALUE +2147483647  
		    NO CYCLE  
		    CACHE 20  
		    NO ORDER ) , 
		  "SYS_ID" INTEGER NOT NULL , 
		  "CTP_ID" INTEGER NOT NULL )   
		 IN "MDSHORT" ; 
-- DDL Statements for indexes on Table "EXPERIMENT"."SYSTEM_SOURCE"

CREATE INDEX "DB2INSTL"."SYSTEM_SOURCE" ON "EXPERIMENT"."SYSTEM_SOURCE" 
		("SYS_ID" ASC) ;


-- DDL Statements for primary key on Table "EXPERIMENT"."SYSTEM_SOURCE"

ALTER TABLE "EXPERIMENT"."SYSTEM_SOURCE" 
	ADD PRIMARY KEY
		("SOURCE_ID");


------------------------------------------------
-- DDL Statements for table "EXPERIMENT"."PROBSPEC"
------------------------------------------------
 
 CREATE TABLE "EXPERIMENT"."PROBSPEC"  (
		  "PROBSPEC_VERSION" INTEGER NOT NULL , 
		  "TAG" VARCHAR(200) NOT NULL )   
		 IN "MDSHORT" ; 

-- DDL Statements for primary key on Table "EXPERIMENT"."PROBSPEC"

ALTER TABLE "EXPERIMENT"."PROBSPEC" 
	ADD PRIMARY KEY
		("PROBSPEC_VERSION");


------------------------------------------------
-- DDL Statements for table "EXPERIMENT"."EXECUTABLE"
------------------------------------------------
 
 CREATE TABLE "EXPERIMENT"."EXECUTABLE"  (
		  "EXECUTABLE_ID" INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (  
		    START WITH +70000  
		    INCREMENT BY +1  
		    MINVALUE +70000  
		    MAXVALUE +2147483647  
		    NO CYCLE  
		    CACHE 20  
		    NO ORDER ) , 
		  "BUILDER" VARCHAR(50) NOT NULL , 
		  "BUILD_BEGIN" TIMESTAMP , 
		  "BUILD_END" TIMESTAMP , 
		  "PROBSPEC_VERSION" INTEGER , 
		  "SOURCE_ID" INTEGER NOT NULL , 
		  "PLATFORM_ID" INTEGER NOT NULL , 
		  "IMPL_ID" INTEGER NOT NULL , 
		  "INSTALL_IMAGE_TAG" VARCHAR(100) NOT NULL , 
		  "INSTALL_IMAGE_PATH" VARCHAR(200) NOT NULL )   
		 IN "MDSHORT" ; 
-- DDL Statements for indexes on Table "EXPERIMENT"."EXECUTABLE"

CREATE INDEX "DB2INSTL"."EXECUTABLE" ON "EXPERIMENT"."EXECUTABLE" 
		("SOURCE_ID" ASC) ;


-- DDL Statements for primary key on Table "EXPERIMENT"."EXECUTABLE"

ALTER TABLE "EXPERIMENT"."EXECUTABLE" 
	ADD PRIMARY KEY
		("EXECUTABLE_ID");


------------------------------------------------
-- DDL Statements for table "EXPERIMENT"."RTP_TABLE"
------------------------------------------------
 
 CREATE TABLE "EXPERIMENT"."RTP_TABLE"  (
		  "RTP_ID" INTEGER NOT NULL GENERATED BY DEFAULT AS IDENTITY (  
		    START WITH +0  
		    INCREMENT BY +1  
		    MINVALUE +0  
		    MAXVALUE +2147483647  
		    NO CYCLE  
		    CACHE 20  
		    NO ORDER ) , 
		  "FILENAME" VARCHAR(40) NOT NULL , 
		  "DESC" VARCHAR(60) NOT NULL , 
		  "CREATOR" VARCHAR(30) NOT NULL , 
		  "CREATED" TIMESTAMP NOT NULL )   
		 IN "MDSHORT" ; 

-- DDL Statements for primary key on Table "EXPERIMENT"."RTP_TABLE"

ALTER TABLE "EXPERIMENT"."RTP_TABLE" 
	ADD PRIMARY KEY
		("RTP_ID");


------------------------------------------------
-- DDL Statements for table "EXPERIMENT"."RT_PARAMS"
------------------------------------------------
 
 CREATE TABLE "EXPERIMENT"."RT_PARAMS"  (
		  "RTP_ID" INTEGER NOT NULL , 
		  "NAME" VARCHAR(100) NOT NULL , 
		  "VALUE" VARCHAR(200) NOT NULL )   
		 IN "MDSHORT" ; 

-- DDL Statements for primary key on Table "EXPERIMENT"."RT_PARAMS"

ALTER TABLE "EXPERIMENT"."RT_PARAMS" 
	ADD PRIMARY KEY
		("RTP_ID",
		 "NAME");


------------------------------------------------
-- DDL Statements for table "SUITS   "."COMMON_NAME"
------------------------------------------------
 
 CREATE TABLE "SUITS   "."COMMON_NAME"  (
		  "NAME" VARCHAR(100) NOT NULL , 
		  "SYS_ID" INTEGER , 
		  "CREATED" TIMESTAMP )   
		 IN "USERSPACE1" ; 

-- DDL Statements for primary key on Table "SUITS   "."COMMON_NAME"

ALTER TABLE "SUITS   "."COMMON_NAME" 
	ADD PRIMARY KEY
		("NAME");

------------------------------------------------
-- DDL Statements for table "EXPERIMENT"."EXPERIMENT"
------------------------------------------------
 
 CREATE TABLE "EXPERIMENT"."EXPERIMENT"  (
		  "EXP_ID" INTEGER NOT NULL GENERATED BY DEFAULT AS IDENTITY (  
		    START WITH +0  
		    INCREMENT BY +1  
		    MINVALUE +0  
		    MAXVALUE +2147483647  
		    NO CYCLE  
		    CACHE 20  
		    NO ORDER ) , 
		  "PDB" CLOB(1048576) LOGGED NOT COMPACT , 
		  "SOLVENT_MOL_COUNT" INTEGER , 
		  "NONSOLV_ATOM_COUNT" INTEGER NOT NULL , 
		  "DESC" VARCHAR(128) NOT NULL , 
		  "WORKING_DIR" VARCHAR(1024) NOT NULL , 
		  "SEED_NAME" VARCHAR(64) NOT NULL , 
		  "DVS_START" VARCHAR(128) NOT NULL )   
		 IN "MDSHORT" LONG IN "MDLONG" ; 

-- DDL Statements for primary key on Table "EXPERIMENT"."EXPERIMENT"

ALTER TABLE "EXPERIMENT"."EXPERIMENT" 
	ADD PRIMARY KEY
		("EXP_ID");


------------------------------------------------
-- DDL Statements for table "EXPERIMENT"."EXP_PARAMS"
------------------------------------------------
 
 CREATE TABLE "EXPERIMENT"."EXP_PARAMS"  (
		  "EXP_ID" INTEGER NOT NULL , 
		  "NAME" VARCHAR(64) NOT NULL , 
		  "VALUE" VARCHAR(256) NOT NULL )   
		 IN "MDSHORT" LONG IN "MDLONG" ; 

-- DDL Statements for primary key on Table "EXPERIMENT"."EXP_PARAMS"

ALTER TABLE "EXPERIMENT"."EXP_PARAMS" 
	ADD PRIMARY KEY
		("EXP_ID",
		 "NAME");


------------------------------------------------
-- DDL Statements for table "EXPERIMENT"."RUN"
------------------------------------------------
 
 CREATE TABLE "EXPERIMENT"."RUN"  (
		  "EXP_ID" INTEGER NOT NULL , 
		  "SEQ_ID" INTEGER NOT NULL , 
		  "SRDG_COUNT" INTEGER NOT NULL , 
		  "NODE_COUNT" INTEGER NOT NULL , 
		  "SPLIT_SIZE" INTEGER NOT NULL , 
		  "RDG_BASE" VARCHAR(128) NOT NULL , 
		  "EXECUTABLE_ID" INTEGER NOT NULL , 
		  "DVS_START" VARCHAR(128) NOT NULL , 
		  "DVS_STOP" VARCHAR(128) , 
		  "RUN_BEGIN" TIMESTAMP , 
		  "RUN_END" TIMESTAMP )   
		 IN "MDSHORT" LONG IN "MDLONG" ; 

-- DDL Statements for primary key on Table "EXPERIMENT"."RUN"

ALTER TABLE "EXPERIMENT"."RUN" 
	ADD PRIMARY KEY
		("EXP_ID",
		 "SEQ_ID");


------------------------------------------------
-- DDL Statements for table "EXPERIMENT"."RUN_PARAMS"
------------------------------------------------
 
 CREATE TABLE "EXPERIMENT"."RUN_PARAMS"  (
		  "EXP_ID" INTEGER NOT NULL , 
		  "SEQ_ID" INTEGER NOT NULL , 
		  "NAME" VARCHAR(64) NOT NULL , 
		  "VALUE" VARCHAR(256) NOT NULL )   
		 IN "MDSHORT" LONG IN "MDLONG" ; 

-- DDL Statements for primary key on Table "EXPERIMENT"."RUN_PARAMS"

ALTER TABLE "EXPERIMENT"."RUN_PARAMS" 
	ADD PRIMARY KEY
		("EXP_ID",
		 "SEQ_ID",
		 "NAME");


------------------------------------------------
-- DDL Statements for table "MDSYSTEM"."SYS_SIZE"
------------------------------------------------
 SET CURRENT SCHEMA = "DB2INSTL";
SET CURRENT PATH = "SYSIBM","SYSFUN","SYSPROC","DB2INSTL";
create table mdsystem.sys_size (sys_id, size) as (select sys_id, count(*)
from mdsystem.site group by sys_id) data initially deferred refresh immediate
enable query optimization;

------------------------------------------------
-- DDL Statements for table "PERF    "."TRACE_GROUP"
------------------------------------------------
 
 CREATE TABLE "PERF    "."TRACE_GROUP"  (
		  "GROUP_ID" INTEGER NOT NULL GENERATED BY DEFAULT AS IDENTITY (  
		    START WITH +300  
		    INCREMENT BY +1  
		    MINVALUE +300  
		    MAXVALUE +2147483647  
		    NO CYCLE  
		    CACHE 20  
		    NO ORDER ) , 
		  "CREATOR" VARCHAR(30) NOT NULL , 
		  "CREATED" TIMESTAMP NOT NULL , 
		  "DESC" VARCHAR(1024) )   
		 IN "MDSHORT" ; 

-- DDL Statements for primary key on Table "PERF    "."TRACE_GROUP"

ALTER TABLE "PERF    "."TRACE_GROUP" 
	ADD PRIMARY KEY
		("GROUP_ID");


------------------------------------------------
-- DDL Statements for table "PERF    "."TRACE_SET"
------------------------------------------------
 
 CREATE TABLE "PERF    "."TRACE_SET"  (
		  "TRACE_SET_ID" INTEGER NOT NULL GENERATED BY DEFAULT AS IDENTITY (  
		    START WITH +3000  
		    INCREMENT BY +1  
		    MINVALUE +3000  
		    MAXVALUE +2147483647  
		    NO CYCLE  
		    CACHE 20  
		    NO ORDER ) , 
		  "GROUP_ID" INTEGER NOT NULL , 
		  "EXECUTABLE_ID" INTEGER NOT NULL , 
		  "NODE_COUNT" INTEGER NOT NULL , 
		  "BIN_FILE" VARCHAR(128) NOT NULL )   
		 IN "MDSHORT" ; 

-- DDL Statements for primary key on Table "PERF    "."TRACE_SET"

ALTER TABLE "PERF    "."TRACE_SET" 
	ADD PRIMARY KEY
		("TRACE_SET_ID");


------------------------------------------------
-- DDL Statements for table "PERF    "."TRACE_SET_DATA"
------------------------------------------------
 
 CREATE TABLE "PERF    "."TRACE_SET_DATA"  (
		  "TRACE_SET_ID" INTEGER NOT NULL , 
		  "NAME" VARCHAR(64) NOT NULL , 
		  "VALUE" VARCHAR(256) NOT NULL )   
		 IN "MDSHORT" ; 

-- DDL Statements for primary key on Table "PERF    "."TRACE_SET_DATA"

ALTER TABLE "PERF    "."TRACE_SET_DATA" 
	ADD PRIMARY KEY
		("TRACE_SET_ID",
		 "NAME");


------------------------------------------------
-- DDL Statements for table "PERF    "."TRACE_ID"
------------------------------------------------
 
 CREATE TABLE "PERF    "."TRACE_ID"  (
		  "TRACE_SET_ID" INTEGER NOT NULL , 
		  "TRACE_ID" INTEGER NOT NULL , 
		  "TRACE_TYPE" INTEGER NOT NULL , 
		  "TRACE_LABEL" VARCHAR(48) NOT NULL , 
		  "TRACE_DESC" VARCHAR(256) NOT NULL )   
		 IN "MDSHORT" ; 

-- DDL Statements for primary key on Table "PERF    "."TRACE_ID"

ALTER TABLE "PERF    "."TRACE_ID" 
	ADD PRIMARY KEY
		("TRACE_SET_ID",
		 "TRACE_ID");


------------------------------------------------
-- DDL Statements for table "PERF    "."PERFORMANCE"
------------------------------------------------
 
 CREATE TABLE "PERF    "."PERFORMANCE"  (
		  "TRACE_SET_ID" INTEGER NOT NULL , 
		  "TRACE_LABEL" VARCHAR(48) NOT NULL , 
		  "AVG" DOUBLE , 
		  "STD_DEV" DOUBLE , 
		  "MIN" DOUBLE , 
		  "MAX" DOUBLE , 
		  "COUNT" INTEGER , 
		  "MIN_DEV" DOUBLE , 
		  "MAX_DEV" DOUBLE )   
		 IN "MDSHORT" ; 

-- DDL Statements for primary key on Table "PERF    "."PERFORMANCE"

ALTER TABLE "PERF    "."PERFORMANCE" 
	ADD PRIMARY KEY
		("TRACE_SET_ID",
		 "TRACE_LABEL");


------------------------------------------------
-- DDL Statements for table "PERF    "."BLOCKS"
------------------------------------------------
 
 CREATE TABLE "PERF    "."BLOCKS"  (
		  "BLOCK_ID" VARCHAR(16) NOT NULL , 
		  "PX" INTEGER NOT NULL , 
		  "PY" INTEGER NOT NULL , 
		  "PZ" INTEGER NOT NULL , 
		  "NUMPSETS" INTEGER NOT NULL )   
		 IN "MDSHORT" ; 

-- DDL Statements for primary key on Table "PERF    "."BLOCKS"

ALTER TABLE "PERF    "."BLOCKS" 
	ADD PRIMARY KEY
		("BLOCK_ID");



-- DDL Statements for foreign keys on Table "CHEM    "."ATOM_TAG_TABLE"

ALTER TABLE "CHEM    "."ATOM_TAG_TABLE" 
	ADD CONSTRAINT "SQL030401160536921" FOREIGN KEY
		("COMPONENT_NAME")
	REFERENCES "CHEM    "."CHEMICAL_COMPONENT"
		("COMPONENT_NAME")
	ON DELETE CASCADE
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

-- DDL Statements for foreign keys on Table "CHEM    "."EXTENT_TABLE"

ALTER TABLE "CHEM    "."EXTENT_TABLE" 
	ADD CONSTRAINT "SQL030401160537911" FOREIGN KEY
		("COMPONENT_NAME",
		 "ATOM_TAG")
	REFERENCES "CHEM    "."ATOM_TAG_TABLE"
		("COMPONENT_NAME",
		 "ATOM_TAG")
	ON DELETE CASCADE
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

-- DDL Statements for foreign keys on Table "REGISTRY"."UDF_CATEGORY"

ALTER TABLE "REGISTRY"."UDF_CATEGORY" 
	ADD CONSTRAINT "SQL030401160542551" FOREIGN KEY
		("UDF_ID")
	REFERENCES "REGISTRY"."UDF_RECORD"
		("UDF_ID")
	ON DELETE CASCADE
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

-- DDL Statements for foreign keys on Table "REGISTRY"."UDF_VARIABLE"

ALTER TABLE "REGISTRY"."UDF_VARIABLE" 
	ADD CONSTRAINT "SQL030401160543521" FOREIGN KEY
		("UDF_ID")
	REFERENCES "REGISTRY"."UDF_RECORD"
		("UDF_ID")
	ON DELETE CASCADE
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

-- DDL Statements for foreign keys on Table "MDSYSTEM"."CHAIN"

ALTER TABLE "MDSYSTEM"."CHAIN" 
	ADD CONSTRAINT "SQL030401160545601" FOREIGN KEY
		("SYS_ID")
	REFERENCES "MDSYSTEM"."SYSTEM"
		("SYS_ID")
	ON DELETE CASCADE
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

-- DDL Statements for foreign keys on Table "MDSYSTEM"."CHEM_COMP_INSTANCE"

ALTER TABLE "MDSYSTEM"."CHEM_COMP_INSTANCE" 
	ADD CONSTRAINT "SQL030401160546571" FOREIGN KEY
		("SYS_ID")
	REFERENCES "MDSYSTEM"."SYSTEM"
		("SYS_ID")
	ON DELETE CASCADE
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

ALTER TABLE "MDSYSTEM"."CHEM_COMP_INSTANCE" 
	ADD CONSTRAINT "SQL030401160546572" FOREIGN KEY
		("COMPONENT_NAME")
	REFERENCES "CHEM    "."CHEMICAL_COMPONENT"
		("COMPONENT_NAME")
	ON DELETE CASCADE
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

-- DDL Statements for foreign keys on Table "MDSYSTEM"."SPECIFIC_MOLECULE"

ALTER TABLE "MDSYSTEM"."SPECIFIC_MOLECULE" 
	ADD CONSTRAINT "SQL030401160547580" FOREIGN KEY
		("SYS_ID")
	REFERENCES "MDSYSTEM"."SYSTEM"
		("SYS_ID")
	ON DELETE CASCADE
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

ALTER TABLE "MDSYSTEM"."SPECIFIC_MOLECULE" 
	ADD CONSTRAINT "SQL030401160547581" FOREIGN KEY
		("CLASS")
	REFERENCES "CHEM    "."MOLECULE_TYPE"
		("CLASS")
	ON DELETE CASCADE
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

-- DDL Statements for foreign keys on Table "MDSYSTEM"."MOLECULE_INSTANCE"

ALTER TABLE "MDSYSTEM"."MOLECULE_INSTANCE" 
	ADD CONSTRAINT "SQL030401160548601" FOREIGN KEY
		("SYS_ID")
	REFERENCES "MDSYSTEM"."SYSTEM"
		("SYS_ID")
	ON DELETE CASCADE
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

ALTER TABLE "MDSYSTEM"."MOLECULE_INSTANCE" 
	ADD CONSTRAINT "SQL030401160548620" FOREIGN KEY
		("SYS_ID",
		 "MOL_ID")
	REFERENCES "MDSYSTEM"."SPECIFIC_MOLECULE"
		("SYS_ID",
		 "MOL_ID")
	ON DELETE CASCADE
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

-- DDL Statements for foreign keys on Table "MDSYSTEM"."MONOMER_INSTANCE"

ALTER TABLE "MDSYSTEM"."MONOMER_INSTANCE" 
	ADD CONSTRAINT "SQL030401160549610" FOREIGN KEY
		("SYS_ID")
	REFERENCES "MDSYSTEM"."SYSTEM"
		("SYS_ID")
	ON DELETE CASCADE
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

ALTER TABLE "MDSYSTEM"."MONOMER_INSTANCE" 
	ADD CONSTRAINT "SQL030401160549611" FOREIGN KEY
		("SYS_ID",
		 "CHAIN_ID")
	REFERENCES "MDSYSTEM"."CHAIN"
		("SYS_ID",
		 "CHAIN_ID")
	ON DELETE CASCADE
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

ALTER TABLE "MDSYSTEM"."MONOMER_INSTANCE" 
	ADD CONSTRAINT "SQL030401160549612" FOREIGN KEY
		("SYS_ID",
		 "CC_INSTANCE_ID")
	REFERENCES "MDSYSTEM"."CHEM_COMP_INSTANCE"
		("SYS_ID",
		 "CC_INSTANCE_ID")
	ON DELETE CASCADE
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

-- DDL Statements for foreign keys on Table "MDSYSTEM"."PARAMTUPLELIST"

ALTER TABLE "MDSYSTEM"."PARAMTUPLELIST" 
	ADD CONSTRAINT "SQL030401160550611" FOREIGN KEY
		("SYS_ID")
	REFERENCES "MDSYSTEM"."SYSTEM"
		("SYS_ID")
	ON DELETE CASCADE
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

-- DDL Statements for foreign keys on Table "MDSYSTEM"."PARAMTUPLESPEC"

ALTER TABLE "MDSYSTEM"."PARAMTUPLESPEC" 
	ADD CONSTRAINT "SQL030401160551591" FOREIGN KEY
		("SYS_ID",
		 "PARAM_TUPLE_LIST_ID")
	REFERENCES "MDSYSTEM"."PARAMTUPLELIST"
		("SYS_ID",
		 "PARAM_TUPLE_LIST_ID")
	ON DELETE CASCADE
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

-- DDL Statements for foreign keys on Table "MDSYSTEM"."PARAMTUPLE"

ALTER TABLE "MDSYSTEM"."PARAMTUPLE" 
	ADD CONSTRAINT "SQL030401160552571" FOREIGN KEY
		("SYS_ID",
		 "PARAM_TUPLE_LIST_ID")
	REFERENCES "MDSYSTEM"."PARAMTUPLELIST"
		("SYS_ID",
		 "PARAM_TUPLE_LIST_ID")
	ON DELETE CASCADE
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

-- DDL Statements for foreign keys on Table "MDSYSTEM"."PARAMTUPLEDATA"

ALTER TABLE "MDSYSTEM"."PARAMTUPLEDATA" 
	ADD CONSTRAINT "SQL030401160553620" FOREIGN KEY
		("SYS_ID",
		 "PARAM_TUPLE_LIST_ID")
	REFERENCES "MDSYSTEM"."PARAMTUPLELIST"
		("SYS_ID",
		 "PARAM_TUPLE_LIST_ID")
	ON DELETE CASCADE
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

-- DDL Statements for foreign keys on Table "MDSYSTEM"."SITETUPLELIST"

ALTER TABLE "MDSYSTEM"."SITETUPLELIST" 
	ADD CONSTRAINT "SQL030401160554630" FOREIGN KEY
		("SYS_ID")
	REFERENCES "MDSYSTEM"."SYSTEM"
		("SYS_ID")
	ON DELETE CASCADE
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

-- DDL Statements for foreign keys on Table "MDSYSTEM"."UDF_INVOCATION_TABLE"

ALTER TABLE "MDSYSTEM"."UDF_INVOCATION_TABLE" 
	ADD CONSTRAINT "SQL030401160555611" FOREIGN KEY
		("SYS_ID",
		 "SITE_TUPLE_LIST_ID")
	REFERENCES "MDSYSTEM"."SITETUPLELIST"
		("SYS_ID",
		 "SITE_TUPLE_LIST_ID")
	ON DELETE CASCADE
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

ALTER TABLE "MDSYSTEM"."UDF_INVOCATION_TABLE" 
	ADD CONSTRAINT "SQL030401160555612" FOREIGN KEY
		("SYS_ID",
		 "PARAM_TUPLE_LIST_ID")
	REFERENCES "MDSYSTEM"."PARAMTUPLELIST"
		("SYS_ID",
		 "PARAM_TUPLE_LIST_ID")
	ON DELETE CASCADE
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

-- DDL Statements for foreign keys on Table "MDSYSTEM"."SITETUPLE"

ALTER TABLE "MDSYSTEM"."SITETUPLE" 
	ADD CONSTRAINT "SQL030401160556611" FOREIGN KEY
		("SYS_ID",
		 "SITE_TUPLE_LIST_ID")
	REFERENCES "MDSYSTEM"."SITETUPLELIST"
		("SYS_ID",
		 "SITE_TUPLE_LIST_ID")
	ON DELETE CASCADE
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

-- DDL Statements for foreign keys on Table "MDSYSTEM"."SITE"

ALTER TABLE "MDSYSTEM"."SITE" 
	ADD CONSTRAINT "SQL030401160557601" FOREIGN KEY
		("SYS_ID")
	REFERENCES "MDSYSTEM"."SYSTEM"
		("SYS_ID")
	ON DELETE CASCADE
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

ALTER TABLE "MDSYSTEM"."SITE" 
	ADD CONSTRAINT "SQL030401160557620" FOREIGN KEY
		("SYS_ID",
		 "MOL_INSTANCE_ID")
	REFERENCES "MDSYSTEM"."MOLECULE_INSTANCE"
		("SYS_ID",
		 "MOL_INSTANCE_ID")
	ON DELETE CASCADE
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

ALTER TABLE "MDSYSTEM"."SITE" 
	ADD CONSTRAINT "SQL030401160557621" FOREIGN KEY
		("SYS_ID",
		 "CC_INSTANCE_ID")
	REFERENCES "MDSYSTEM"."CHEM_COMP_INSTANCE"
		("SYS_ID",
		 "CC_INSTANCE_ID")
	ON DELETE CASCADE
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

ALTER TABLE "MDSYSTEM"."SITE" 
	ADD CONSTRAINT "SQL030401160557630" FOREIGN KEY
		("ELEMENT_SYMBOL")
	REFERENCES "CHEM    "."ELEMENTS"
		("ELEMENT_SYMBOL")
	ON DELETE CASCADE
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

ALTER TABLE "MDSYSTEM"."SITE" 
	ADD CONSTRAINT "SQL030401160557631" FOREIGN KEY
		("COMPONENT_NAME",
		 "ATOM_TAG")
	REFERENCES "CHEM    "."ATOM_TAG_TABLE"
		("COMPONENT_NAME",
		 "ATOM_TAG")
	ON DELETE CASCADE
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

-- DDL Statements for foreign keys on Table "MDSYSTEM"."SITETUPLEDATA"

ALTER TABLE "MDSYSTEM"."SITETUPLEDATA" 
	ADD CONSTRAINT "SQL030401160558681" FOREIGN KEY
		("SYS_ID",
		 "SITE_TUPLE_LIST_ID")
	REFERENCES "MDSYSTEM"."SITETUPLELIST"
		("SYS_ID",
		 "SITE_TUPLE_LIST_ID")
	ON DELETE CASCADE
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

ALTER TABLE "MDSYSTEM"."SITETUPLEDATA" 
	ADD CONSTRAINT "SQL030401160558690" FOREIGN KEY
		("SYS_ID",
		 "SITE_ID")
	REFERENCES "MDSYSTEM"."SITE"
		("SYS_ID",
		 "SITE_ID")
	ON DELETE CASCADE
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

-- DDL Statements for foreign keys on Table "MDSYSTEM"."GROUP_SITE"

ALTER TABLE "MDSYSTEM"."GROUP_SITE" 
	ADD CONSTRAINT "SQL030401160600660" FOREIGN KEY
		("SYS_ID",
		 "SITE_ID")
	REFERENCES "MDSYSTEM"."SITE"
		("SYS_ID",
		 "SITE_ID")
	ON DELETE CASCADE
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

ALTER TABLE "MDSYSTEM"."GROUP_SITE" 
	ADD CONSTRAINT "SQL030401160600661" FOREIGN KEY
		("SYS_ID",
		 "GROUP_ID")
	REFERENCES "MDSYSTEM"."GROUP"
		("SYS_ID",
		 "GROUP_ID")
	ON DELETE CASCADE
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

-- DDL Statements for foreign keys on Table "MDSYSTEM"."SITE_PARAM_SPEC"

ALTER TABLE "MDSYSTEM"."SITE_PARAM_SPEC" 
	ADD CONSTRAINT "SQL030401160601670" FOREIGN KEY
		("SYS_ID")
	REFERENCES "MDSYSTEM"."SYSTEM"
		("SYS_ID")
	ON DELETE CASCADE
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

ALTER TABLE "MDSYSTEM"."SITE_PARAM_SPEC" 
	ADD CONSTRAINT "SQL030401160601680" FOREIGN KEY
		("TYPE_ID")
	REFERENCES "CHEM    "."SITE_PARAM_TYPE"
		("TYPE_ID")
	ON DELETE CASCADE
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

-- DDL Statements for foreign keys on Table "MDSYSTEM"."SITE_PARAM"

ALTER TABLE "MDSYSTEM"."SITE_PARAM" 
	ADD CONSTRAINT "SQL030401160602741" FOREIGN KEY
		("SYS_ID",
		 "PARAM_ID")
	REFERENCES "MDSYSTEM"."SITE_PARAM_SPEC"
		("SYS_ID",
		 "PARAM_ID")
	ON DELETE CASCADE
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

ALTER TABLE "MDSYSTEM"."SITE_PARAM" 
	ADD CONSTRAINT "SQL030401160602760" FOREIGN KEY
		("SYS_ID",
		 "SITE_ID")
	REFERENCES "MDSYSTEM"."SITE"
		("SYS_ID",
		 "SITE_ID")
	ON DELETE CASCADE
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

-- DDL Statements for foreign keys on Table "MDSYSTEM"."BOND"

ALTER TABLE "MDSYSTEM"."BOND" 
	ADD CONSTRAINT "SQL030401160603771" FOREIGN KEY
		("SYS_ID")
	REFERENCES "MDSYSTEM"."SYSTEM"
		("SYS_ID")
	ON DELETE CASCADE
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

-- DDL Statements for foreign keys on Table "MDSYSTEM"."GLOBAL_PARAMETER_TYPE"

ALTER TABLE "MDSYSTEM"."GLOBAL_PARAMETER_TYPE" 
	ADD CONSTRAINT "SQL030401160604811" FOREIGN KEY
		("SYS_ID")
	REFERENCES "MDSYSTEM"."SYSTEM"
		("SYS_ID")
	ON DELETE CASCADE
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

-- DDL Statements for foreign keys on Table "MDSYSTEM"."GLOBAL_PARAMETER"

ALTER TABLE "MDSYSTEM"."GLOBAL_PARAMETER" 
	ADD CONSTRAINT "SQL030401160606231" FOREIGN KEY
		("SYS_ID",
		 "PARAM_TYPE")
	REFERENCES "MDSYSTEM"."GLOBAL_PARAMETER_TYPE"
		("SYS_ID",
		 "PARAM_TYPE")
	ON DELETE CASCADE
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

-- DDL Statements for foreign keys on Table "EXPERIMENT"."CT_PARAMS"

ALTER TABLE "EXPERIMENT"."CT_PARAMS" 
	ADD CONSTRAINT "SQL030401160609491" FOREIGN KEY
		("CTP_ID")
	REFERENCES "EXPERIMENT"."CTP_TABLE"
		("CTP_ID")
	ON DELETE CASCADE
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

ALTER TABLE "EXPERIMENT"."CT_PARAMS" 
	ADD CONSTRAINT "SQL030401160609492" FOREIGN KEY
		("NAME")
	REFERENCES "EXPERIMENT"."VOCAB"
		("NAME")
	ON DELETE CASCADE
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

-- DDL Statements for foreign keys on Table "EXPERIMENT"."IMPL_PARAMS"

ALTER TABLE "EXPERIMENT"."IMPL_PARAMS" 
	ADD CONSTRAINT "SQL030401160612530" FOREIGN KEY
		("IMPL_ID")
	REFERENCES "EXPERIMENT"."IMPL_TABLE"
		("IMPL_ID")
	ON DELETE CASCADE
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

ALTER TABLE "EXPERIMENT"."IMPL_PARAMS" 
	ADD CONSTRAINT "SQL030401160612531" FOREIGN KEY
		("NAME")
	REFERENCES "EXPERIMENT"."IMPL_VOCAB"
		("NAME")
	ON DELETE CASCADE
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

-- DDL Statements for foreign keys on Table "EXPERIMENT"."PLATFORM_PARAMS"

ALTER TABLE "EXPERIMENT"."PLATFORM_PARAMS" 
	ADD CONSTRAINT "SQL030401160614540" FOREIGN KEY
		("PLATFORM_ID")
	REFERENCES "EXPERIMENT"."PLATFORM_TABLE"
		("PLATFORM_ID")
	ON DELETE CASCADE
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

-- DDL Statements for foreign keys on Table "EXPERIMENT"."SYSTEM_SOURCE"

ALTER TABLE "EXPERIMENT"."SYSTEM_SOURCE" 
	ADD CONSTRAINT "SQL030401160615571" FOREIGN KEY
		("SYS_ID")
	REFERENCES "MDSYSTEM"."SYSTEM"
		("SYS_ID")
	ON DELETE CASCADE
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

ALTER TABLE "EXPERIMENT"."SYSTEM_SOURCE" 
	ADD CONSTRAINT "SQL030401160615572" FOREIGN KEY
		("CTP_ID")
	REFERENCES "EXPERIMENT"."CTP_TABLE"
		("CTP_ID")
	ON DELETE CASCADE
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

-- DDL Statements for foreign keys on Table "EXPERIMENT"."EXECUTABLE"

ALTER TABLE "EXPERIMENT"."EXECUTABLE" 
	ADD CONSTRAINT "SQL030401160617560" FOREIGN KEY
		("PROBSPEC_VERSION")
	REFERENCES "EXPERIMENT"."PROBSPEC"
		("PROBSPEC_VERSION")
	ON DELETE CASCADE
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

ALTER TABLE "EXPERIMENT"."EXECUTABLE" 
	ADD CONSTRAINT "SQL030401160617561" FOREIGN KEY
		("IMPL_ID")
	REFERENCES "EXPERIMENT"."IMPL_TABLE"
		("IMPL_ID")
	ON DELETE CASCADE
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

ALTER TABLE "EXPERIMENT"."EXECUTABLE" 
	ADD CONSTRAINT "SQL030401160617562" FOREIGN KEY
		("PLATFORM_ID")
	REFERENCES "EXPERIMENT"."PLATFORM_TABLE"
		("PLATFORM_ID")
	ON DELETE CASCADE
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

ALTER TABLE "EXPERIMENT"."EXECUTABLE" 
	ADD CONSTRAINT "SQL030401160617570" FOREIGN KEY
		("SOURCE_ID")
	REFERENCES "EXPERIMENT"."SYSTEM_SOURCE"
		("SOURCE_ID")
	ON DELETE CASCADE
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

-- DDL Statements for foreign keys on Table "EXPERIMENT"."RT_PARAMS"

ALTER TABLE "EXPERIMENT"."RT_PARAMS" 
	ADD CONSTRAINT "SQL030401160620031" FOREIGN KEY
		("RTP_ID")
	REFERENCES "EXPERIMENT"."RTP_TABLE"
		("RTP_ID")
	ON DELETE CASCADE
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

ALTER TABLE "EXPERIMENT"."RT_PARAMS" 
	ADD CONSTRAINT "SQL030401160620040" FOREIGN KEY
		("NAME")
	REFERENCES "EXPERIMENT"."VOCAB"
		("NAME")
	ON DELETE CASCADE
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

-- DDL Statements for foreign keys on Table "SUITS   "."COMMON_NAME"

ALTER TABLE "SUITS   "."COMMON_NAME" 
	ADD CONSTRAINT "SQL030205164004490" FOREIGN KEY
		("SYS_ID")
	REFERENCES "MDSYSTEM"."SYSTEM"
		("SYS_ID")
	ON DELETE CASCADE
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

-- DDL Statements for foreign keys on Table "EXPERIMENT"."COORDS_TABLE"

ALTER TABLE "EXPERIMENT"."COORDS_TABLE" 
	ADD CONSTRAINT "SQL040224175013550" FOREIGN KEY
		("SYS_ID")
	REFERENCES "MDSYSTEM"."SYSTEM"
		("SYS_ID")
	ON DELETE CASCADE
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

-- DDL Statements for foreign keys on Table "EXPERIMENT"."EXP_PARAMS"

ALTER TABLE "EXPERIMENT"."EXP_PARAMS" 
	ADD CONSTRAINT "SQL040603180322450" FOREIGN KEY
		("EXP_ID")
	REFERENCES "EXPERIMENT"."EXPERIMENT"
		("EXP_ID")
	ON DELETE CASCADE
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

-- DDL Statements for foreign keys on Table "EXPERIMENT"."RUN"

ALTER TABLE "EXPERIMENT"."RUN" 
	ADD CONSTRAINT "SQL040603180323500" FOREIGN KEY
		("EXP_ID")
	REFERENCES "EXPERIMENT"."EXPERIMENT"
		("EXP_ID")
	ON DELETE CASCADE
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

ALTER TABLE "EXPERIMENT"."RUN" 
	ADD CONSTRAINT "SQL040603180323510" FOREIGN KEY
		("EXECUTABLE_ID")
	REFERENCES "EXPERIMENT"."EXECUTABLE"
		("EXECUTABLE_ID")
	ON DELETE CASCADE
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

-- DDL Statements for foreign keys on Table "EXPERIMENT"."RUN_PARAMS"

ALTER TABLE "EXPERIMENT"."RUN_PARAMS" 
	ADD CONSTRAINT "SQL040603180324630" FOREIGN KEY
		("EXP_ID",
		 "SEQ_ID")
	REFERENCES "EXPERIMENT"."RUN"
		("EXP_ID",
		 "SEQ_ID")
	ON DELETE CASCADE
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

COMMIT WORK;

CONNECT RESET;

TERMINATE;
