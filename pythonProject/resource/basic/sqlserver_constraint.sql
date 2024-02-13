case 074 "主键，非空，唯一，非空唯一，default" 0
before:
drop table test_cons1;
go
src_sql:
create table test_cons1 (id int primary key,c1 date not null,c2 time unique,c3 varchar(20) not null unique,c4 varchar(10) default 'AUTO');
insert into test_cons1 values(1,'1980-01-01','12:59:59','aaa','manual');
insert into test_cons1 values(2,'1990-02-02','10:01:20','bbb','manual');
insert into test_cons1 values(3,'2019-09-30','09:52:30','ccc','manual');
insert into test_cons1 values(4,'2020-01-31','18:59:59','ddd','manual');
insert into test_cons1(id,c1,c2,c3) values(5,'2008-01-01','12:59:58','eee');
insert into test_cons1(id,c1,c2,c3) values(6,'2018-01-01','14:35:30','fff');
go

tgt_sql:
select * from test_cons1 order by id;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('test_cons1') order by name;
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('test_cons1') order by name;
go

case 075 "主键，唯一，default" 0
before:
drop table test_cons2;
go
src_sql:
create table test_cons2 (id int,c1 date,c2 time,c3 varchar(20),c4 varchar(10) default 'AUTO',c5 int,
primary key(id),
unique(c2)
);
insert into test_cons2 values(1,'1980-01-01','12:59:59','aaa','manual',9);
insert into test_cons2 values(2,'1990-02-02','10:01:20','bbb','manual',8);
insert into test_cons2 values(3,'2019-09-30','09:52:30','ccc','manual',7);
insert into test_cons2 values(4,'2020-01-31','18:59:59','ddd','manual',6);
insert into test_cons2(id,c1,c2,c3) values(5,'2008-01-01','12:59:58','eee');
insert into test_cons2(id,c1,c2,c3) values(6,'2018-01-01','14:35:30','fff');
go

tgt_sql:
select * from test_cons2 order by id;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('test_cons2') order by name;
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('test_cons2') order by name;
go

case 076 "主键，非空，check，非空唯一，default" 0
before:
drop table test_cons3;
go
src_sql:
create table test_cons3 (
    no             int primary key,
    c_int          int default 0 not null,
	c_tinyint	   tinyint check (c_tinyint>=30 and c_tinyint<=180),
	c_smallint	   smallint not null,
	c_bigint	   bigint default 50000 not null unique,
	c_decimal	   decimal(5,2),
	c_numeric	   numeric(10,4),
    c_float        float,
    c_real         real,
    c_money        money,
    c_smallmoney   smallmoney,
	c_bit		   bit
);
insert into test_cons3 values ( 1,100,35,10000,50001,123.45,876543.2398, 300.45, 500.6789, 100.23, 300.45,1);
insert into test_cons3 values ( 2,200,45,20000,50002,345.54,876543.2398, 300.45, 500.6789, 100.23, 300.45,0);
insert into test_cons3 values ( 3,300,55,30000,50003,654.54,876543.2398, 300.45, 500.6789, 100.23, 300.45,1);
insert into test_cons3(no,c_int,c_smallint,c_bigint) values (4,400,10004,50004);
go

tgt_sql:
select * from test_cons3 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('test_cons3') order by name;
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('test_cons3') order by name;
go

case 077 "复合约束" 0
before:
drop table test_cons4;
go
src_sql:
create table test_cons4 (id int,c1 char(10),c2 int,c3 varchar(20),c4 int,c5 int,
primary key(id,c1),
unique(c2,c3)
);
insert into test_cons4 values(1,'test',1,'female',1,11);
insert into test_cons4 values(2,'manager',2,'female',2,12);
insert into test_cons4 values(3,'student',3,'male',2,12);
go

tgt_sql:
select * from test_cons4 order by id;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('test_cons4') order by name;
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('test_cons4') order by name;
go

case 078 "约束命名" 0
before:
drop table test_cons5;
go
src_sql:
create table test_cons5 (
    no             int IDENTITY(1,1),
    c_int          int default 0 not null,
	c_tinyint	   tinyint,
	c_smallint	   smallint not null,
	c_bigint	   bigint default 50000 not null,
	c_decimal	   decimal(5,2),
	c_numeric	   numeric(10,4),
    c_float        float,
    c_real         real,
    c_money        money,
    c_smallmoney   smallmoney,
	c_bit		   bit,
	constraint pk_no5 primary key(no),
	constraint qu_big5 unique(c_bigint),
	constraint ck_tiny5 check(c_tinyint>=30 and c_tinyint<=180)
);
insert into test_cons5 values (100,35,10000,50001,123.45,876543.2398, 300.45, 500.6789, 100.23, 300.45,1);
insert into test_cons5 values (200,45,20000,50002,345.54,876543.2398, 300.45, 500.6789, 100.23, 300.45,0);
insert into test_cons5 values (300,55,30000,50003,654.54,876543.2398, 300.45, 500.6789, 100.23, 300.45,1);
insert into test_cons5(c_int,c_smallint,c_bigint) values (400,10004,50004);
update test_cons5 set c_smallint=12345 where no=2;
update test_cons5 set c_int=2 where no=4;
go

tgt_sql:
select * from test_cons5 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('test_cons5') order by name;
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('test_cons5') order by name;
go

case 079 "建表后alter添加约束" 0
before:
drop table dbo.test_cons6;
go
src_sql:
create table dbo.test_cons6 (
    no             int IDENTITY(1,1),
    c_int          int,
	c_tinyint	   tinyint,
	c_smallint	   smallint,
	c_bigint	   bigint not null,
	c_decimal	   decimal(5,2),
	c_numeric	   numeric(10,4),
    c_float        float,
    c_real         real,
    c_money        money,
    c_smallmoney   smallmoney,
	c_bit		   bit
);
sleep 3000;
alter table test_cons6 add constraint pk_no6a primary key(no);
ALTER TABLE test_cons6 ALTER COLUMN c_int INT NOT NULL;
ALTER TABLE test_cons6 ALTER COLUMN c_smallint SMALLINT NOT NULL;
alter table test_cons6 add constraint qu_big6a unique(c_bigint);
alter table test_cons6 add constraint df_int6a default 0 for c_int;
alter table test_cons6 add constraint df_big6a default 50000 for c_bigint;
alter table test_cons6 add constraint ck_tiny6a check (c_tinyint>=30 and c_tinyint<=180);
insert into dbo.test_cons6 values (100,35,10000,50001,123.45,876543.2398, 300.45, 500.6789, 100.23, 300.45,1);
insert into dbo.test_cons6 values (200,45,20000,50002,345.54,876543.2398, 300.45, 500.6789, 100.23, 300.45,0);
insert into dbo.test_cons6 values (300,55,30000,50003,654.54,876543.2398, 300.45, 500.6789, 100.23, 300.45,1);
insert into dbo.test_cons6(c_int,c_smallint,c_bigint) values (400,10004,50004);
insert into dbo.test_cons6 values (500,75,12345,50005,443.12,876543.2398, 300.45, 500.6789, 100.23, 300.45,1);
update test_cons6 set c_smallint='12789' where no=2;
go

tgt_sql:
select * from test_cons6 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('test_cons6') order by name;
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('test_cons6') order by name;
go

case 080 "not null变为null" 0
before:
drop table dbo.test_cons7;
go
src_sql:
create table dbo.test_cons7 (
    no             int primary key,
    c_int          int,
	c_tinyint	   tinyint,
	c_smallint	   smallint not null,
	c_bigint	   bigint not null,
	c_decimal	   decimal(5,2),
	c_numeric	   numeric(10,4),
    c_float        float,
    c_real         real,
    c_money        money,
    c_smallmoney   smallmoney,
	c_bit		   bit
);
ALTER TABLE test_cons7 ALTER COLUMN c_smallint SMALLINT NULL
go

tgt_sql:
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('test_cons7') order by name;
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('test_cons7') order by name;
go

case 081 "删除约束" 0
before:
drop table dbo.test_cons8;
go
src_sql:
create table test_cons8 (
    no             int IDENTITY(1,1),
    c_int          int default 0 not null,
	c_tinyint	   tinyint,
	c_smallint	   smallint not null,
	c_bigint	   bigint default 50000 not null,
	c_decimal	   decimal(5,2),
	c_numeric	   numeric(10,4),
    c_float        float,
    c_real         real,
    c_money        money,
    c_smallmoney   smallmoney,
	c_bit		   bit,
	constraint pk_id8d primary key(no),
	constraint qu_b8d unique(c_bigint),
	constraint ck_t8d check(c_tinyint>=30 and c_tinyint<=180)
);
insert into test_cons8 values (100,35,10000,50001,123.45,876543.2398, 300.45, 500.6789, 100.23, 300.45,1);
insert into test_cons8 values (200,45,20000,50002,345.54,876543.2398, 300.45, 500.6789, 100.23, 300.45,0);
alter table test_cons8 drop constraint qu_b8d;
alter table test_cons8 drop constraint ck_t8d;
go

tgt_sql:
select * from test_cons8 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('test_cons8') order by name;
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('test_cons8') order by name;
go

case 082 "无主键，有复合唯一约束" 0
before:
drop table test_cons9;
go
src_sql:
create table test_cons9(
id int,
name1 varchar(64),
name2 varchar(64),
age int,
CONSTRAINT unique_test_cons9_id unique (id),
CONSTRAINT unique_test_cons9_name1name2 unique(name1,name2)
);
insert into test_cons9(id,name1,name2,age) values(1,'1','1',1);
insert into test_cons9(id,name1,name2,age) values(2,'1','2',2);
insert into test_cons9(id,name1,name2,age) values(3,'1','3',3);
update test_cons9 set name1='2' where age=2;
delete from test_cons9 where id=1;
go

tgt_sql:
select * from test_cons9 order by id;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('test_cons9') order by name;
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('test_cons9') order by name;
go
