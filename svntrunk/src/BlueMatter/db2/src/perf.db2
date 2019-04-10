create schema perf;

create table perf.trace_group (
 group_id int not null generated by default as identity,
 creator VARCHAR(30) NOT NULL,       
 created TIMESTAMP NOT NULL,
 desc varchar(1024),
 primary key (group_id));

create table perf.trace_set (
 trace_set_id int not null generated by default as identity,
 group_id int not null,
 executable_id int not null,
 node_count int not null,
 bin_file varchar(128) not null,
 primary key (trace_set_id),
 foreign key (group_id) references trace_group
   on delete cascade);

create table perf.trace_set_data (
 trace_set_id int not null,
 name varchar(64) not null,
 value varchar(256) not null,
 primary key (trace_set_id, name),
 foreign key (trace_set_id) references trace_set
  on delete cascade);

create table perf.trace_id (
 trace_set_id int not null,
 trace_id int not null,
 trace_type int not null,
 trace_label varchar(48) not null,
 trace_desc varchar(256) not null,
 primary key (trace_set_id, trace_id),
 foreign key (trace_set_id) references trace_set
  on delete cascade);

create table perf.performance (
 trace_set_id int not null,
 trace_label varchar(48) not null,
 avg float,
 std_dev float,
 min_dev float,
 max_dev float,
 min float,
 max float,
 count int,
 primary key (trace_set_id, trace_label),
 foreign key (trace_set_id) references trace_set
   on delete cascade);

create table perf.blocks (
 block_id varchar(16) not null,
 px int not null,
 py int not null,
 pz int not null,
 numpsets int not null,
 primary key(block_id));
