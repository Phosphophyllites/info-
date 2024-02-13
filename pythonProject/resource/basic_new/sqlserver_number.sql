case 001 "数据：数字类型插入数据" 0
before:
drop table dbo.i2_no001;
go
src_sql:
create table dbo.i2_no001 (
    no             int primary key,
    c_int          int not null,
	c_tinyint	   tinyint,
	c_smallint	   smallint not null,
	c_bigint	   bigint not null,
	c_decimal	   decimal(38,15),
	c_numeric	   numeric(38,17),
    c_float        float,
    c_real         real,
    c_money        money,
    c_smallmoney   smallmoney,
    c_bit       bit
);
go
insert into dbo.i2_no001 values (1,-2147483648,0,-32768,-9223372036854775808,-0.000000000000008,-176543.23000000098000008,-300.567001212345678,-109.1116789,-922337203685477.5808,-214748.3648,1);
insert into dbo.i2_no001 values (2,2147483647,255,-2990,9223372036854775807,0.0000000054,276543.239812345678912,300,208.6789123,922337203685477.5807,214748.3647,0);
insert into dbo.i2_no001 values (3,-300,255,0,0,654.0000021,376543.2398,300.110056,307.671189,-330.23,303.45,1);
insert into dbo.i2_no001 values (4,400,65,4990,50004,0.0000000054,476543.2398, 300.0078, 406.6789,440.23,-404.45,0);
insert into dbo.i2_no001 values (5,500,75,32767,50005,987.50008,576543.2398,300.00099,505.6789,550.23,-505.45,1);
insert into dbo.i2_no001(no,c_int,c_smallint,c_bigint) values (6,400,10004,50004);
go
update dbo.i2_no001 set c_smallint=-1  where no=3;
update dbo.i2_no001 set c_smallint=32767,c_float=415.6600896 where no=1;
go
delete from dbo.i2_no001 where no=5;
go

tgt_sql:
select * from dbo.i2_no001;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_no001');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('i2_no001') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='i2_no001'  ORDER BY   c.name,a.name,d.name;
go

case 002 "数据：数字类型更新数据" 0
before:
drop table dbo.i2_no002;
go
src_sql:
create table dbo.i2_no002 (
    no             int IDENTITY(1,1) primary key,
    c_int          int default 0 not null,
	c_tinyint	   tinyint,
	c_smallint	   smallint not null,
	c_bigint	   bigint default 50000 not null,
	c_decimal	   decimal(15,10),
	c_numeric	   numeric(10,4),
    c_float        float,
    c_real         real,
    c_money        money,
    c_smallmoney   smallmoney,
	c_bit		   bit
);
go
insert into dbo.i2_no002 values (-2147483648,0,-32768,-9223372036854775808,-0.000000000000008,-176543.23000000098000008,-300.5670012,-109.1116789,-922337203685477.5808,-214748.3648,1);
insert into dbo.i2_no002 values (2147483647,255,-2990,9223372036854775807,0.0000000054,276543.2398,300,208.6789,922337203685477.5807,214748.3647,0);
insert into dbo.i2_no002 values (300,55,30000,50003,654.54,876543.2398,300.45,500.6789,100.23,300.45,1);
insert into dbo.i2_no002(c_int,c_smallint,c_bigint) values (400,10004,50004);
update dbo.i2_no002 set c_numeric=33333.8899,c_decimal=0.0000000002,c_float=0.000012,c_real=-0.0098,c_money=0,c_smallmoney=0 where no=2;
update dbo.i2_no002 set c_real=100.89,c_bit=1 where no=4;
update dbo.i2_no002 set c_int=-1000,c_tinyint=9,c_smallint=12345,c_bigint=-27999,c_bit=0 where no=1;
go

tgt_sql:
select * from dbo.i2_no002 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_no002');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('i2_no002') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='i2_no002'  ORDER BY   c.name,a.name,d.name;
go

case 003 "数据：数字类型删除数据" 0
before:
drop table dbo.i2_no003;
go
src_sql:
create table dbo.i2_no003(
    no             int primary key,
    c_int          int default 0 not null,
	c_tinyint	   tinyint check (c_tinyint>=0 and c_tinyint<=255),
	c_smallint	   smallint not null,
	c_bigint	   bigint default 50000 not null,
	c_decimal	   decimal(15,10),
	c_numeric	   numeric(10,4),
    c_float        float,
    c_real         real,
    c_money        money,
    c_smallmoney   smallmoney,
	c_bit		   bit
);
go
insert into dbo.i2_no003 values (1,-2147483648,0,-32768,-9223372036854775808,-0.000000000000008,-176543.23000000098000008,-300.5670012,-109.1116789,-922337203685477.5808,-214748.3648,1);
insert into dbo.i2_no003 values (2,2147483647,255,-2990,9223372036854775807,0.0000000054,276543.2398,300,208.6789,922337203685477.5807,214748.3647,0);
insert into dbo.i2_no003 values (3,300,55,30000,50003,654.54,876543.2398, 300.45, 500.6789, 100.23, 300.45,1);
insert into dbo.i2_no003(no,c_int,c_smallint,c_bigint) values (4,400,10004,50004);
delete from dbo.i2_no003 where no=3;
go

tgt_sql:
select * from dbo.i2_no003 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_no003');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('i2_no003') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='i2_no003'  ORDER BY   c.name,a.name,d.name;
go

case 004 "数据：数字类型增加列" 0
before:
drop table dbo.i2_no004;
go
src_sql:
create table dbo.i2_no004 (
    no             int primary key,
    c_int          int default 0 not null,
	c_tinyint	   tinyint check (c_tinyint>=0 and c_tinyint<=255),
	c_smallint	   smallint not null,
	c_bigint	   bigint default 50000 not null,
	c_decimal	   decimal(15,9),
	c_numeric	   numeric(16,10),
    c_float        float,
    c_real         real,
    c_money        money,
    c_smallmoney   smallmoney,
	c_bit		   bit
);
go
insert into dbo.i2_no004 values (1,-2147483648,0,-32768,-9223372036854775808,-0.000000000000008,-176543.23000000098000008,-300.5670012,-109.1116789,-922337203685477.5808,-214748.3648,1);
insert into dbo.i2_no004 values (2,2147483647,255,-2990,9223372036854775807,0.0000000054,276543.2398,300,208.6789,922337203685477.5807,214748.3647,0);
alter table dbo.i2_no004 add v1 numeric(18,12);
alter table dbo.i2_no004 add v2 int,v3 float,v4 bit;
insert into dbo.i2_no004 values ( 3,300,55,10003,50003,-167.45,876543.2398, 300.45, 500.6789, 100.23, 300.45,0,1234.-90,9999,76543.12,1);
insert into dbo.i2_no004 values ( 4,400,65,20004,50004,289.54,876543.2398, 300.45, 500.6789, 100.23, 300.45,0,6456.90,9999,-76543.12,1);
insert into dbo.i2_no004(no,c_int,c_smallint,c_bigint,v1,v2,v4) values (5,400,10004,50005,222.20,8888,1);
update dbo.i2_no004 set c_numeric=77777.8899,c_decimal=456.000000102,c_money=12,c_smallmoney=13,v1=33333.0000005678,v2=5634,v3=112.3456,v4=1 where no=1;
update dbo.i2_no004 set v1=6666.000000005678,v2=9634,v3=192.3496 where no=2;
update dbo.i2_no004 set c_real=100.89,v4=0 where no=5;
update dbo.i2_no004 set v1=3434.00000001234,v2=9634,v3=192.3496,v4=0 where no=4;
delete from i2_no004 where no=1;
go

tgt_sql:
select * from dbo.i2_no004 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_no004');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('i2_no004') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='i2_no004'  ORDER BY   c.name,a.name,d.name;
go

case 005 "数据：数字类型删除列" 0
before:
drop table dbo.i2_no005;
go
src_sql:
create table dbo.i2_no005 (
    no             int primary key,
    c_int          int default 0 not null,
	c_tinyint	   tinyint check (c_tinyint>=0 and c_tinyint<=255),
	c_smallint	   smallint not null,
	c_bigint	   bigint default 50000 not null,
	c_decimal	   decimal(15,8),
	c_numeric	   numeric(16,9),
    c_float        float,
    c_real         real,
    c_money        money,
    c_smallmoney   smallmoney,
	c_bit		   bit
);
go
insert into dbo.i2_no005 values (1,-2147483648,0,-32768,-9223372036854775808,-0.000000000000008,-176543.23000000098000008,-300.5670012,-109.1116789,-922337203685477.5808,-214748.3648,1);
insert into dbo.i2_no005 values (2,2147483647,255,-2990,9223372036854775807,0.0000000054,276543.2398,300,208.6789,922337203685477.5807,214748.3647,0);
alter table dbo.i2_no005 drop column c_float;
alter table dbo.i2_no005 drop column c_numeric,c_money;
insert into dbo.i2_no005 values (3,300,55,30000,50003,-554.000054,500.6789,-300.45,1);
insert into dbo.i2_no005(no,c_int,c_smallint,c_bigint) values (4,400,10004,50004);
update dbo.i2_no005 set c_smallint=79,c_decimal=-456.000012,c_smallmoney=-13 where no=2;
update dbo.i2_no005 set c_real=111.89 where no=4;
delete from i2_no005 where no=1;
go

tgt_sql:
select * from dbo.i2_no005 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_no005');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('i2_no005') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='i2_no005'  ORDER BY   c.name,a.name,d.name;
go

case 006 "数据：数字类型重命名表" 0
before:
drop table dbo.i2_no006;
drop table i2_no006_新表;
go
src_sql:
create table dbo.i2_no006 (
    no             int primary key,
    c_int          int default 0 not null,
	c_tinyint	   tinyint check (c_tinyint>=0 and c_tinyint<=255),
	c_smallint	   smallint not null,
	c_bigint	   bigint default 50000 not null,
	c_decimal	   decimal(5,2),
	c_numeric	   numeric(10,4),
    c_float        float,
    c_real         real,
    c_money        money,
    c_smallmoney   smallmoney,
	c_bit		   bit
);
sleep(3000);
insert into dbo.i2_no006 values (1,-2147483648,0,-32768,-9223372036854775808,-0.000000000000008,-176543.23000000098000008,-300.5670012,-109.1116789,-922337203685477.5808,-214748.3648,1);
insert into dbo.i2_no006 values (2,2147483647,255,-2990,9223372036854775807,0.0000000054,276543.2398,300,208.6789,922337203685477.5807,214748.3647,0);
exec sp_rename 'dbo.i2_no006','i2_no006_新表';
insert into i2_no006_新表 values ( 3,300,55,30000,50003,-654.54,876543.2398, 300.45, 500.6789, -100.23, -300.45,1);
insert into i2_no006_新表(no,c_int,c_smallint,c_bigint) values (4,400,10004,50004);
update dbo.i2_no006_新表 set c_smallint=79,c_decimal=456.12,c_smallmoney=13 where no=2;
update dbo.i2_no006_新表 set c_real=111.89 where no=4;
delete from i2_no006_新表 where no=1;
go

tgt_sql:
select * from dbo.i2_no006_新表 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_no006_新表');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('i2_no006_新表') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='i2_no006_新表'  ORDER BY   c.name,a.name,d.name;
go

case 007 "数据：数字类型修改列属性" 0
before:
drop table dbo.i2_no007;
go
src_sql:
create table dbo.i2_no007 (
    no             int primary key,
    c_int          int not null,
	c_tinyint	   tinyint ,
	c_smallint	   smallint not null,
	c_bigint	   bigint,
	c_decimal	   decimal(5,2),
	c_numeric	   numeric(10,4),
    c_float        float,
    c_real         real,
    c_money        money,
    c_smallmoney   smallmoney,
	c_bit		   bit
);
go
alter table dbo.i2_no007 alter column c_int tinyint not null;
alter table dbo.i2_no007 alter column c_tinyint smallint;
alter table dbo.i2_no007 alter column c_bigint int not null;
alter table dbo.i2_no007 alter column c_decimal decimal(18,10);
alter table dbo.i2_no007 alter column c_numeric numeric(15,8);
alter table dbo.i2_no007 alter column c_float real;
alter table dbo.i2_no007 alter column c_real float;
alter table dbo.i2_no007 alter column c_smallint int;
alter table dbo.i2_no007 alter column c_smallmoney money;
insert into dbo.i2_no007 values (1,48,31,-32768,-9808,-0.0000000008,-176543.2398,-300.12,-109.6789,-110.23,-101.45,1);
insert into dbo.i2_no007 values (2,20,45,200,502,345.54,876543.2398,300.45,500.6789,100.23,300.45,0);
insert into dbo.i2_no007 values (3,30,55,300,503,-554.0000000054,843.2398,300.4523,500.679,100.23,-300.45,1);
insert into dbo.i2_no007(no,c_int,c_smallint,c_bigint) values (4,40,104,504);
update dbo.i2_no007 set c_float=451.23,c_real=534.89 where no=4;
update dbo.i2_no007 set c_int=123,c_smallint=-111111111 where no=2;
delete from i2_no007 where no=1;
go

tgt_sql:
select * from dbo.i2_no007 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_no007');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('i2_no007') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='i2_no007'  ORDER BY   c.name,a.name,d.name;
go

case 008 "数据：数字类型重命名列" 0
before:
drop table dbo.i2_no008;
go
src_sql:
create table dbo.i2_no008 (
    no             int IDENTITY(1,1) primary key,
    c_int          int default 0 not null,
	c_tinyint	   tinyint,
	c_smallint	   smallint not null,
	c_bigint	   bigint default 50000 not null,
	c_decimal	   decimal(15,10),
	c_numeric	   numeric(10,4),
    c_float        float,
    c_real         real,
    c_money        money,
    c_smallmoney   smallmoney,
	c_bit		   bit
);
insert into dbo.i2_no008 values (-2147483648,0,-32768,-9223372036854775808,-0.0000000008,-176543.2398,-300.12,-109.6789,-110.23,-101.45,1);
insert into dbo.i2_no008 values (200,45,20000,50002,0.0000000054,876543.2398, 300.45, 500.6789, 100.23, 300.45,0);
ALTER TABLE dbo.i2_no008 ADD c_n1 int,c_n2 decimal(30,15),c_n3 money,c_n4 bit;
exec sp_rename 'dbo.i2_no008.c_n1','c_n1_n','COLUMN';
exec sp_rename 'dbo.i2_no008.c_n2','c_n2_n','COLUMN';
exec sp_rename 'dbo.i2_no008.c_n3','c_n3_n','COLUMN';
exec sp_rename 'dbo.i2_no008.c_n4','c_n4_n','COLUMN';
insert into dbo.i2_no008 values (300,55,30000,50003,654.54,876543.2398, 300.45, 500.6789, 100.23, 300.45,1,37,1234567.00000456,-1234.77,0);
insert into dbo.i2_no008(c_int,c_smallint,c_bigint,c_n1_n,c_n2_n,c_n3_n,c_n4_n) values (400,10004,50004,371,-9876.00004567,-123.45,0);
update dbo.i2_no008 set c_numeric=33333.8899,c_decimal=0.0000000002,c_float=0.000012,c_real=-0.0098,c_money=0,c_smallmoney=0,c_n1_n=999,c_n2_n=0.00000000045,c_n4_n=1 where no=2;
update dbo.i2_no008 set c_int=-1000,c_tinyint=9,c_smallint=12345,c_bigint=-27999,c_bit=0,c_n3_n=98765.1234 where no=4;
delete from dbo.i2_no008 where no=3;
go

tgt_sql:
select * from dbo.i2_no008 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_no008');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('i2_no008') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='i2_no008'  ORDER BY   c.name,a.name,d.name;
go

case 009 "decimal类型小数位处理" 0
before:
drop table i2_no009;
go
src_sql:
create table i2_no009 (
no decimal(4) primary key,
a1 decimal(8,2),
a2 decimal(18,5),
a3 decimal(28,19),
a4 decimal(37,30),
a5 decimal(18,17),
a6 decimal(10,4),
a7 decimal(20,8)
);
go
insert into i2_no009 values (1003,-888888.22,-1818181818181.55555,-282828282.8282828282999999999,-2542851.173899999819695949554443359375,-0.30000000000000004,-123456.7891,202020202020.88888888);
insert into i2_no009 values (1004,888888.22,1818181818181.55555,0.0000000000000000065,2542851.173899999819695949554443359375,0.00000000000000098,123456.7891,202020202020.88888888);
insert into i2_no009(no,a1,a2) values (1005,111111.33,67895.00004);
update i2_no009 set a2=0.00006,a3=0.000000000000357 where no=1004;
delete from i2_no009 where no=1003;
go

tgt_sql:
select * from dbo.i2_no009 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_no009');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('i2_no009') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='i2_no009'  ORDER BY   c.name,a.name,d.name;
go

case 010 "money类型同步" 0
before:
drop table dbo.i2_no010;
go
src_sql:
create table dbo.i2_no010(
comp_code nvarchar(20) not null,
copy_code nvarchar(3) not null,
acct_year nvarchar(4) not null,
acct_subj_code nvarchar(50) not null,
acct_month nvarchar(2) not null,
bal_os money not null,
this_od money not null,
this_oc money not null,
sum_od money not null,
sum_oc money not null,
end_os money not null,
start_num numeric(19,6) not null,
in_num numeric(19,6) not null,
out_num numeric(19,6) not null,
in_sum_num numeric(19,6) not null,
out_sum_num numeric(19,0) not null,
end_num numeric(19,6) not null,
constraint PK_acct_ledger primary key clustered
(
comp_code ASC,
copy_code ASC,
acct_year ASC,
acct_subj_code ASC,
acct_month ASC
)
);
alter table dbo.i2_no010 add constraint DF_acct_ledg_in_nu_5772F790 default (0) for in_num;
alter table dbo.i2_no010 add constraint DF_acct_ledg_out_n_58671BC9 default (0) for out_num;
alter table dbo.i2_no010 add constraint DF_acct_ledg_in_su_595B4002 default (0) for in_sum_num;
alter table dbo.i2_no010 add constraint DF_acct_ledg_out_sum_num default (0) for out_sum_num;
alter table dbo.i2_no010 add constraint DF_acct_ledg_end_num default (0) for end_num;
insert into dbo.i2_no010 values('0001','001','2019','16020402','12',-4795500.14,0,-0.14,0,860753.20,-4795500.00,0,0,0,0,0,0);
insert into dbo.i2_no010 values('0001','001','2019','24010306','06',-0.04,0,60180.86,328716.00,388896.90,-60180.90,0,0,0,0,0,0);
insert into dbo.i2_no010 values('0001','001','2019','24010306','05',-69382.84,172803.60,103420.80,328716.00,328716.04,-0.04,0,0,0,0,0,0);
go

tgt_sql:
select * from dbo.i2_no010;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_no010');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('i2_no010') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='i2_no010'  ORDER BY   c.name,a.name,d.name;
go


