case 01 "建表自带未命名约束" 0
before:
drop table test_cons1;
drop table test_cons1a;
go
src_sql:
create table test_cons1 (
id int primary key,
c1 date not null,
c2 time unique,
c3 varchar(20) not null unique,
c4 varchar(10) default 'AUTO'
);
create table test_cons1a (
id int,
c1 char(10),
c2 int,
c3 varchar(20),
c4 int,
c5 char(5) check (c5='男' or c5='女'),
primary key(id,c1),
unique(c2,c3)
);
go
tgt_sql:
select * from test_cons1;
select * from test_cons1a;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('test_cons1') order by name;
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('test_cons1') order by name;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('test_cons1a') order by name;
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('test_cons1a') order by name;
go

case 02 "建表自带命名约束" 0
before:
drop table test_cons2;
go
src_sql:
create table test_cons2 (
id int,
c1 char(10),
c2 int,
c3 varchar(20),
c4 int,
c5 tinyint,
constraint pk_cons_2k primary key(id,c1),
constraint qu_cons_2u unique(c2),
constraint qu_cons_2fu unique(c3,c4),
constraint ck_cons_2c check(c5>=30 and c5<=180)
);
go
tgt_sql:
select * from test_cons2;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('test_cons2') order by name;
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('test_cons2') order by name;
go

case 03 "修改空与非空" 0
before:
drop table test_cons3;
go
src_sql:
create table test_cons3 (id int,c1 date not null,c2 varchar(20),c3 bit not null);
go
ALTER TABLE test_cons3 ALTER COLUMN c1 date NULL;
ALTER TABLE test_cons3 ALTER COLUMN c2 varchar(20) NOT NULL;
go
tgt_sql:
select * from test_cons3;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('test_cons3') order by name;
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('test_cons3') order by name;
go

case 04 "添加未命名主键" 0
before:
drop table test_cons4;
go
src_sql:
create table test_cons4 (
id int not null,
c1 char(10) not null,
c2 int
);
go
alter table test_cons4 add primary key(id,c1);
go
tgt_sql:
select * from test_cons4;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('test_cons4') order by name;
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('test_cons4') order by name;
go

case 05 "添加删除命名主键" 0
before:
drop table test_cons5;
go
src_sql:
create table test_cons5 (
id int not null,
c1 char(10) not null,
c2 int
);
go
alter table test_cons5 add constraint PK_test_cons5 primary key(id,c1);
alter table test_cons5 drop constraint PK_test_cons5;
alter table test_cons5 add constraint PK_test_cons5a primary key(id);
go
tgt_sql:
select * from test_cons5;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('test_cons5') order by name;
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('test_cons5') order by name;
go

case 06 "添加未命名复合约束(包含主键和唯一键)" 0
before:
drop table test_cons6;
go
src_sql:
create table test_cons6(
id int not null,
c1 char(10) not null,
c2 int,
c3 varchar(20),
c4 int
);
go
alter table test_cons6 add primary key(id,c1);
alter table test_cons6 add unique(c3,c4);
go
tgt_sql:
select * from test_cons6;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('test_cons6') order by name;
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('test_cons6') order by name;
go

case 07 "添加删除命名复合约束(包含主键和唯一键)" 0
before:
drop table test_cons7;
go
src_sql:
create table test_cons7(
id int not null,
c1 char(10) not null,
c2 int,
c3 varchar(20),
c4 int
);
go
alter table test_cons7 add constraint PK_test_cons7 primary key(id,c1);
alter table test_cons7 add constraint UK_test_cons7 unique(c3,c4);
alter table test_cons7 drop PK_test_cons7;
alter table test_cons7 drop UK_test_cons7;
alter table test_cons7 add constraint PK_test_cons7a primary key(id,c1);
alter table test_cons7 add constraint UK_test_cons7a unique(c3,c4);
go
tgt_sql:
select * from test_cons7;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('test_cons7') order by name;
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('test_cons7') order by name;
go

case 08 "添加删除未命名default" 0
before:
drop table test_cons8;
go
src_sql:
create table test_cons8(
id int not null,
c1 char(10) not null,
c2 int,
c3 varchar(20),
c4 int
);
go
alter table test_cons8 add  primary key(id,c1);
alter table test_cons8 add default 5000 for c2;
alter table test_cons8 add default('空') for c3;
go

tgt_sql:
select * from test_cons8;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('test_cons8') order by name;
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('test_cons8') order by name;
go

case 09 "添加删除命名default" 0
before:
drop table test_cons9;
go
src_sql:
create table test_cons9(
id int not null,
c1 char(10) not null,
c2 int,
c3 varchar(20),
c4 int
);
go
alter table test_cons9 add constraint PK_test_cons9 primary key(id,c1);
alter table test_cons9 add constraint DF_test_cons91 default 5000 for c2;
alter table test_cons9 add constraint DF_test_cons92 default('空') for c3;
alter table test_cons9 drop PK_test_cons9;
alter table test_cons9 drop DF_test_cons91;
alter table test_cons9 drop DF_test_cons92;
alter table test_cons9 add constraint PK_test_cons9a primary key(id,c1);
alter table test_cons9 add constraint DF_test_cons91a default 321 for c2;
alter table test_cons9 add constraint DF_test_cons92a default('降') for c3;
go

tgt_sql:
select * from test_cons9;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('test_cons9') order by name;
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('test_cons9') order by name;
go

case 10 "添加删除未命名check" 0
before:
drop table test_cons10;
go
src_sql:
create table test_cons10(
id int not null,
c1 char(10) not null,
c2 int,
c3 varchar(20),
c4 int
);
go
alter table test_cons10 add primary key(id,c1);
alter table test_cons10 add check (c2>=30 and c2<=180);
alter table test_cons10 add check (c3='男' or c3='女');
go

tgt_sql:
select * from test_cons10;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('test_cons10') order by name;
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('test_cons10') order by name;
go

case 11 "添加删除命名check" 0
before:
drop table test_cons11;
go
src_sql:
create table test_cons11(
id int not null,
c1 char(10) not null,
c2 int,
c3 varchar(20),
c4 int
);
go
alter table test_cons11 add constraint PK_test_cons11 primary key(id,c1);
alter table test_cons11 add constraint CK_test_cons11a check (c2>=30 and c2<=180);
alter table test_cons11 add constraint CK_test_cons11b check (c3='男' or c3='女');
alter table test_cons11 drop PK_test_cons11;
alter table test_cons11 drop CK_test_cons11a;
alter table test_cons11 drop CK_test_cons11b;
alter table test_cons11 add constraint PK_test_cons111 primary key(id,c1);
alter table test_cons11 add constraint CK_test_cons11a1 check (c2>=50 and c2<=160);
alter table test_cons11 add constraint CK_test_cons11b1 check (c3='男' or c3='女');
go

tgt_sql:
select * from test_cons11;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('test_cons11') order by name;
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('test_cons11') order by name;
go
