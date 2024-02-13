case 001 "compute列" 0
before:
drop table yuangonggongzibiao;
go
src_sql:
create table yuangonggongzibiao(
	zhigongbianhao int primary key,
	zhigonghao varchar(50) unique,
	changkuhao varchar(50),
	jibengongzi int,
	jiabangongzi int,
	jiangjin int,
	koulv int,
  yingfagongzi as (jibengongzi+jiabangongzi+jiangjin-koulv), --as为自动计算字段，不能输入值--
	CONSTRAINT check_yuangonggongzibiao_jibengongzi CHECK  (jibengongzi>=800 and jibengongzi<=21000)
);
go
insert into yuangonggongzibiao values(1,'158','hz001',8000,2000,1500,800);
insert into yuangonggongzibiao values(2,'159','hz002',9000,3000,2500,1800);
insert into yuangonggongzibiao values(3,'160','hz003',6000,1000,1200,500);
update yuangonggongzibiao set  jiangjin=3000 where zhigongbianhao=1;
update yuangonggongzibiao set  jiangjin=3200 where zhigongbianhao=2;
delete from yuangonggongzibiao where zhigongbianhao=3;
go

tgt_sql:
select * from yuangonggongzibiao order by zhigongbianhao;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('yuangonggongzibiao') order by name;
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('yuangonggongzibiao') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='yuangonggongzibiao'  ORDER BY   c.name,a.name,d.name;
go

case 003 "外键表" 0
before:
drop table salary;
drop table empinfo;
go
src_sql:
create table empinfo(
no int primary key,
ename varchar(20),
job varchar(20),
birth datetime
);
create table salary(
no int primary key,
base_salary numeric(8,2),
job_allowance numeric(8,2),
travelling_allowance numeric(8,2),
personal_income_tax numeric(8,2),
constraint salary_eid_fk foreign key(no) references empinfo(no)
);
go
insert into empinfo values(1,'张毅','销售','1991-12-10');
insert into empinfo values(2,'刘晨','库管','1993-02-11');
insert into empinfo values(3,'王璐','售后','1992-10-07');
insert into empinfo values(4,'张罗','技术','1995-08-13');
insert into salary values(1,3000.51,1000.89,500.72,300.24);
insert into salary values(2,3500.51,1200.19,600.22,400.24);
insert into salary values(3,4000.51,1300.29,700.32,400.24);
insert into salary values(4,5000.51,1400.39,400.42,600.24);
update salary set  base_salary=600000,job_allowance=1800.34 where no=2;
update empinfo set  ename='刘琳',job='主管' where no=2;
delete from salary where no=4;
delete from empinfo where no=4;
go
tgt_sql:
select * from empinfo;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('empinfo') order by name;
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('empinfo') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='empinfo'  ORDER BY   c.name,a.name,d.name;
select * from salary;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('salary') order by name;
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('salary') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='salary'  ORDER BY   c.name,a.name,d.name;
go

case 005 "多外键" 0
before:
drop table marks;
drop table fk_s_t;
drop table fk_t_t;
go
src_sql:
create table fk_s_t
(
s_id int identity(1,1) primary key,
s_name varchar(20) not null,
s_age int
);
go
create table fk_t_t
(
test_no int identity(1,1),
test_name varchar(30),
nax_marks int not null default(0),
min_marks int not null default(0),
primary key(test_no,test_name)
);
go
create table marks
(
s_id int not null,
test_no int not null,
test_name varchar(30),
marks int not null default(0),
primary key(s_id,test_no)
);
go
alter table marks add constraint fk_marks_1 foreign key(s_id) references fk_s_t(s_id);
alter table marks add constraint fk_marks_2 foreign key(test_no,test_name) references fk_t_t(test_no,test_name)
go
alter table marks drop constraint fk_marks_1;
alter table marks drop constraint fk_marks_2;
go
alter table marks add constraint fk_marks_1 foreign key(s_id) references fk_s_t(s_id);
alter table marks add constraint fk_marks_2 foreign key(test_no,test_name) references fk_t_t(test_no,test_name)
go
tgt_sql:
select * from fk_s_t;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('fk_s_t') order by name;
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('fk_s_t') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='fk_s_t'  ORDER BY   c.name,a.name,d.name;
select * from fk_t_t;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('fk_t_t') order by name;
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('fk_t_t') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='fk_t_t'  ORDER BY   c.name,a.name,d.name;
select * from marks;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('marks') order by name;
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('marks') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='marks'  ORDER BY   c.name,a.name,d.name;
go

case 006 "循环依赖外键" 0
before:
alter table fk_test9 drop constraint fk_t9fk;
alter table fk_test8 drop constraint fk_t8fk;
alter table fk_test7 drop constraint fk_t7fk;
alter table fk_test6 drop constraint fk_t6fk;
alter table fk_test5 drop constraint fk_t5fk;
alter table fk_test4 drop constraint fk_t4fk;
alter table fk_test3 drop constraint fk_t3fk;
alter table fk_test2 drop constraint fk_t2fk;
alter table fk_test1 drop constraint fk_t1fk;
drop table fk_test1;
drop table fk_test2;
drop table fk_test3;
drop table fk_test4;
drop table fk_test5;
drop table fk_test6;
drop table fk_test7;
drop table fk_test8;
drop table fk_test9;
go
src_sql:
create table fk_test1(i int primary key, j int not null, c char(10));
create table fk_test2(i int primary key, j int not null, c char(10));
create table fk_test3(i int primary key, j int not null, c char(10));
create table fk_test4(i int primary key, j int not null, c char(10));
create table fk_test5(i int primary key, j int not null, c char(10));
create table fk_test6(i int primary key, j int not null, c char(10));
create table fk_test7(i int primary key, j int not null, c char(10));
create table fk_test8(i int primary key, j int not null, c char(10));
create table fk_test9(i int primary key, j int not null, c char(10));
alter table fk_test2 add constraint fk_t2fk foreign key (j) references fk_test1(i);
alter table fk_test3 add constraint fk_t3fk foreign key (j) references fk_test2(i);
alter table fk_test4 add constraint fk_t4fk foreign key (j) references fk_test3(i);
alter table fk_test5 add constraint fk_t5fk foreign key (j) references fk_test4(i);
alter table fk_test6 add constraint fk_t6fk foreign key (j) references fk_test5(i);
alter table fk_test7 add constraint fk_t7fk foreign key (j) references fk_test6(i);
alter table fk_test8 add constraint fk_t8fk foreign key (j) references fk_test7(i);
alter table fk_test9 add constraint fk_t9fk foreign key (j) references fk_test8(i);
alter table fk_test1 add constraint fk_t1fk foreign key (j) references fk_test9(i);
go
alter table fk_test9 drop constraint fk_t9fk;
alter table fk_test8 drop constraint fk_t8fk;
alter table fk_test7 drop constraint fk_t7fk;
alter table fk_test6 drop constraint fk_t6fk;
alter table fk_test5 drop constraint fk_t5fk;
alter table fk_test4 drop constraint fk_t4fk;
alter table fk_test3 drop constraint fk_t3fk;
alter table fk_test2 drop constraint fk_t2fk;
alter table fk_test1 drop constraint fk_t1fk;
go
alter table fk_test2 add constraint fk_t2fk foreign key (j) references fk_test1(i);
alter table fk_test3 add constraint fk_t3fk foreign key (j) references fk_test2(i);
alter table fk_test4 add constraint fk_t4fk foreign key (j) references fk_test3(i);
alter table fk_test5 add constraint fk_t5fk foreign key (j) references fk_test4(i);
alter table fk_test6 add constraint fk_t6fk foreign key (j) references fk_test5(i);
alter table fk_test7 add constraint fk_t7fk foreign key (j) references fk_test6(i);
alter table fk_test8 add constraint fk_t8fk foreign key (j) references fk_test7(i);
alter table fk_test9 add constraint fk_t9fk foreign key (j) references fk_test8(i);
alter table fk_test1 add constraint fk_t1fk foreign key (j) references fk_test9(i);
go
tgt_sql:
select * from fk_test1;
select * from fk_test2;
select * from fk_test3;
select * from fk_test4;
select * from fk_test5;
select * from fk_test6;
select * from fk_test7;
select * from fk_test8;
select * from fk_test9;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('fk_test1') order by name;
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('fk_test1') order by name;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('fk_test2') order by name;
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('fk_test2') order by name;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('fk_test3') order by name;
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('fk_test3') order by name;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('fk_test4') order by name;
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('fk_test4') order by name;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('fk_test5') order by name;
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('fk_test5') order by name;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('fk_test6') order by name;
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('fk_test6') order by name;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('fk_test7') order by name;
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('fk_test7') order by name;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('fk_test8') order by name;
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('fk_test8') order by name;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('fk_test9') order by name;
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('fk_test9') order by name;
go

case 007 "sparse" 0
before:
drop table sparsetable2;
go
src_sql:
create table sparsetable2(
no varchar(36) not null primary key,
c_char char(20) sparse,
c_nchar nchar(20) sparse,
c_varchar varchar(40) sparse,
c_nvarchar nvarchar(1000) sparse,
c_varcharm varchar(max) sparse,
c_nvarcharm nvarchar(max) sparse,
c_int int sparse,
c_tinyint tinyint sparse,
c_smallint smallint sparse,
c_bigint bigint sparse,
c_decimal decimal(15,10) sparse,
c_numeric numeric(10,4) sparse,
c_float float sparse,
c_real real sparse,
c_money money sparse,
c_smallmoney smallmoney sparse,
c_bit bit sparse,
c_date date sparse,
c_time time(0) sparse,
c_datetime  datetime sparse,
c_datetime2 datetime2(1) sparse,
c_smalldatetime smalldatetime sparse,
c_datetimeoffset datetimeoffset(0) sparse,
c_binary binary(50) sparse,
c_varbinary varbinary(100) sparse,
c_varbinarym varbinary(max) sparse,
c_xml xml sparse,
c_uniqueidentifier uniqueidentifier sparse,
c_variant sql_variant sparse,
c_clr hierarchyid sparse
);
go
sleep(6000);
insert into  sparsetable2 values(newid(),null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
insert into  sparsetable2 values(newid(),'地址41','地址42','地址43',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
update sparsetable2 set c_variant='this is a testcase';
update sparsetable2 set c_char='测试',c_varbinary=0xffff;
update sparsetable2 set c_nchar='上海',c_varchar='英方软件股份有限公司',c_nvarchar='上海英方软件股份有限公司北京分公司',c_varcharm='杭州分公司',c_nvarcharm='深圳分公司',c_int=-123456,c_tinyint=99,c_smallint=-32768,c_bigint=-9808,c_decimal=-7156.000000008,c_numeric=-176543.2398,c_float=-300.12,c_real=-109.6789,c_money=-110.23,c_smallmoney=-101.45,c_bit=1;
update sparsetable2 set c_date=convert(date,'2020-08-31'),c_time=convert(time,SYSDATETIME()),c_datetime=convert(datetime,'1998-12-12 14:31:56.013',20),c_datetime2=convert(datetime2,'2047-06-01 20:51:24.00199',21),c_smalldatetime=convert(smalldatetime,'2001-12-05 12:02:20',20),c_datetimeoffset=CONVERT (datetimeoffset,SYSDATETIMEOFFSET());
update sparsetable2 set c_binary=0x3f,c_varbinary=0x2abcd345,c_varbinarym=0x123456789123456789123456789;
update sparsetable2 set c_xml='<Root>
<Location LocationID="40"
LaborHours="4.1"
MachineHours=".2" >
<step>Manufacturing step 1 at this work center</step>
<step>Manufacturing step 2 at this work center</step>
 Manufacturing steps are described here.
</Location>
</Root>';
update sparsetable2 set c_uniqueidentifier='6F9619FF-8B86-D011-B42D-00C04FC964BB',c_clr='/-1/-2.3/-3.-999/';
ALTER TABLE dbo.sparsetable2 ADD c_addcol1 VARCHAR(max) sparse;
ALTER TABLE dbo.sparsetable2 ADD c_addcol2 sql_variant sparse,c_addcol3 decimal(20,12) sparse;
ALTER TABLE dbo.sparsetable2 ADD c_addcol4 datetime2(0) sparse,c_addcol5 bit sparse,c_addcol6 xml sparse;
insert into  sparsetable2(no,c_addcol1,c_addcol6) values(newid(),'  ',
'<Root>
<Location LocationID="40"
LaborHours="4.1"
MachineHours=".2" >
<step>Manufacturing step 1 at this work center</step>
<step>Manufacturing step 2 at this work center</step>
 Manufacturing steps are described here.
</Location>
</Root>');
ALTER TABLE dbo.sparsetable2 drop column c_variant,c_addcol4;
exec sp_rename 'dbo.sparsetable2.c_addcol2','c_variant','COLUMN';
alter table dbo.sparsetable2 alter column c_addcol3 decimal(25,15);
alter table dbo.sparsetable2 alter column c_addcol3 decimal(25,10) sparse;
alter table dbo.sparsetable2 alter column c_int bigint;
go
tgt_sql:
select no,c_char,c_nchar,c_varchar,c_nvarchar,c_varcharm,c_nvarcharm,c_int,c_tinyint,c_smallint,c_decimal,c_numeric,c_float,c_real,c_money,c_smallmoney,c_bit,c_date,c_time,c_datetime,c_datetime2,c_smalldatetime,c_datetimeoffset,c_binary,c_varbinary,c_varbinarym,c_xml,c_uniqueidentifier,c_clr,c_addcol1,convert(varchar(30),c_variant) c_variant,c_addcol3,c_addcol5,c_addcol6 from sparsetable2;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('sparsetable2');
select name,is_sparse from sys.columns where object_id=OBJECT_ID('sparsetable2');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('sparsetable2') and xtype <> 'IT' order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='sparsetable2'  ORDER BY   c.name,a.name,d.name;
go

case 008 "末尾空字符串，影响sparse数据解析" 0
before:
drop table sparsetest1;
drop table sparsetest2;
drop table sparsetest3;
go
src_sql:
create table sparsetest1(
	i int primary key,
	vc1 varchar(20),
	vc2 varchar(20),
	vc3 varchar(20),
	vc4 varchar(20),
	dt datetime sparse,
	txt text,
	vc6 varchar(20),
	vc7 varchar(20),
	vc8 varchar(20)
);
ALTER TABLE [dbo].sparsetest1 ADD  CONSTRAINT [DFsparsetest1_vc1]  DEFAULT ('') FOR vc1;
ALTER TABLE [dbo].sparsetest1 ADD  CONSTRAINT [DFsparsetest1_vc3]  DEFAULT ('') FOR vc3;
ALTER TABLE [dbo].sparsetest1 ADD  CONSTRAINT [DFsparsetest1_vc6]  DEFAULT ('') FOR vc6;
ALTER TABLE [dbo].sparsetest1 ADD  CONSTRAINT [DFsparsetest1_vc7]  DEFAULT ('') FOR vc7;
create table sparsetest2(i int primary key,
	vc1 varchar(10),
	vc2 varchar(10),
	vc3 varchar(10) sparse);
create table sparsetest3(i int primary key,vc1 varchar(20),vc2 varchar(20),dt datetime sparse,vc3 varchar(30));
create nonclustered index NonClu_sp3_Index1 on sparsetest3(dt);
sleep(8000);
insert into sparsetest3 values(1,'','',GETDATE(),'');
insert into sparsetest3 values(2,'','',GETDATE(),'');
insert into sparsetest2 values(17,'',NULL,'111');
insert into sparsetest2 values(14,'',NULL,'111');
insert into sparsetest2 values(15,'','','111');
insert into sparsetest2 values(16,NULL,'','111');
insert into sparsetest1(i,vc4,txt) values(1,'111','12345');
insert into sparsetest1(i,vc4,txt) values(2,'222','22345');
insert into sparsetest1(i,vc4,dt) values(3,'333',getdate());
go
tgt_sql:
select * from sparsetest1;
select * from sparsetest2;
select * from sparsetest3;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('sparsetest1');
select name,is_sparse from sys.columns where object_id=OBJECT_ID('sparsetest1');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('sparsetest1') and xtype <> 'IT' order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='sparsetest1'  ORDER BY   c.name,a.name,d.name;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('sparsetest2');
select name,is_sparse from sys.columns where object_id=OBJECT_ID('sparsetest2');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('sparsetest2') and xtype <> 'IT' order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='sparsetest2'  ORDER BY   c.name,a.name,d.name;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('sparsetest3');
select name,is_sparse from sys.columns where object_id=OBJECT_ID('sparsetest3');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('sparsetest3') and xtype <> 'IT' order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='sparsetest3'  ORDER BY   c.name,a.name,d.name;
go