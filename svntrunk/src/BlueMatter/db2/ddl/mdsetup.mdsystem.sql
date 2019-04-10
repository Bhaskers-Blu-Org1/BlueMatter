-- This CLP file was created using DB2LOOK Version 8.2
-- Timestamp: Thu May 18 03:20:10 EDT 2006
-- Database Name: MDSETUP        
-- Database Manager Version: DB2/6000 Version 8.2.4        
-- Database Codepage: 819
-- Database Collating Sequence is: UNIQUE


CONNECT TO MDSETUP;



------------------------------------------------
-- DDL Statements for table "MDSYSTEM"."SYSTEM"
------------------------------------------------
 
 CREATE TABLE "MDSYSTEM"."SYSTEM"  (
		  "SYS_ID" INTEGER NOT NULL GENERATED BY DEFAULT AS IDENTITY (  
		    START WITH +50000  
		    INCREMENT BY +1  
		    MINVALUE +50000  
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
-- DDL Statements for table "MDSYSTEM"."SYS_SIZE"
------------------------------------------------
 SET CURRENT SCHEMA = "DB2INSTL";
SET CURRENT PATH = "SYSIBM","SYSFUN","SYSPROC","DB2INSTL";
create table mdsystem.sys_size (sys_id, size) as (select sys_id, count(*)
from mdsystem.site group by sys_id) data initially deferred refresh immediate
enable query optimization;









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


COMMIT WORK;

CONNECT RESET;

TERMINATE;
