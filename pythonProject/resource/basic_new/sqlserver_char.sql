case 001 "数据：字符类型插入数据" 0
before:
drop table dbo.i2_char001;
drop table dbo.i2_char001a;
drop table dbo.i2_char001b;
drop table dbo.i2_char001c;
drop table dbo.i2_char001d;
drop table dbo.i2_char001e;
drop table dbo.i2_char001f;
go
src_sql:
create table dbo.i2_char001 (
    no           int IDENTITY(1,1),
    c_char       char(5) not null,
    c_nchar      nchar(10) default 'def',
    c_varchar    varchar(20) not null,
    c_nvarchar   nvarchar(3000),
	constraint pk_nochar001 primary key(no)
);
begin tran
insert into dbo.i2_char001 values ('A€','56789','AB101','测试ABC');
insert into dbo.i2_char001 values ('B€','45678','AB102',N'䒦');
insert into dbo.i2_char001 values ('C€','45678','AB103€',N'𧿹');
insert into dbo.i2_char001 values ('/*/','45678','AB103€',N'䗪');
insert into dbo.i2_char001(c_char,c_varchar) values ('D€','上海英方股份');
commit

create table dbo.i2_char001a (
    no           int,
    c_char       char(8) not null,
    c_nchar      nchar(8) not null default '英方',
    c_varchar    varchar(8) not null,
    c_nvarchar   nvarchar(8)not null
);
insert into dbo.i2_char001a values (1,'测试用例', '英方软件测试用例','英方软件','北京市朝阳区英方');

create table dbo.i2_char001b (
    no           int,
	c_char1      char(1),
    c_char2      char(8000) not null
);
insert into dbo.i2_char001b values (1,'B',replicate('英方软件',10000));
insert into dbo.i2_char001b values (2,'A',replicate('ABCD',10000));

create table dbo.i2_char001c (
    no           int,
	c_nchar1     nchar(1),
    c_nchar2     nchar(4000) not null
);
insert into dbo.i2_char001c values (1,'测',replicate('英方软件',10000));
insert into dbo.i2_char001c values (2,'试',replicate(N'ABCD',10000));

create table dbo.i2_char001d (
    no           int,
	c_varchar1   varchar(1),
    c_varchar2   varchar(8000) not null
);
insert into dbo.i2_char001d values (1,'1',replicate('英方软件',10000));
insert into dbo.i2_char001d values (2,'0',replicate('ABCD',10000));

create table dbo.i2_char001e (
    no           int,
	c_nvarchar1  nvarchar(1),
    c_nvarchar2  nvarchar(4000) not null
);
insert into dbo.i2_char001e values (1,'英',replicate('英方软件',10000));
insert into dbo.i2_char001e values (2,'方',replicate(N'ABCD',10000));

create table dbo.i2_char001f (
    no          int,
	c_varmax	varchar(max),
	c_nvarmax	nvarchar(max)
);
insert into dbo.i2_char001f values (1,replicate(cast('英方软件' as varchar(max)),65555),replicate(cast(N'测试用例' as nvarchar(max)),65555));
go
tgt_sql: (1)
select * from dbo.i2_char001 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_char001');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('i2_char001') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='i2_char001'  ORDER BY   c.name,a.name,d.name;
select * from dbo.i2_char001a order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_char001a');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('i2_char001a') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='i2_char001a'  ORDER BY   c.name,a.name,d.name;
select * from dbo.i2_char001b order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_char001b');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('i2_char001b') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='i2_char001b'  ORDER BY   c.name,a.name,d.name;
select * from dbo.i2_char001c order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_char001c');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('i2_char001c') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='i2_char001c'  ORDER BY   c.name,a.name,d.name;
select * from dbo.i2_char001d order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_char001d');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('i2_char001d') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='i2_char001d'  ORDER BY   c.name,a.name,d.name;
select * from dbo.i2_char001e order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_char001e');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('i2_char001e') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='i2_char001e'  ORDER BY   c.name,a.name,d.name;
select * from dbo.i2_char001f order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_char001f');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('i2_char001f') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='i2_char001f'  ORDER BY   c.name,a.name,d.name;
go

case 002 "数据：字符类型更新数据" 0
before:
drop table dbo.i2_char002;
go
src_sql:
create table dbo.i2_char002 (
    no           int IDENTITY(1,1),
    c_char       char(5) not null,
    c_nchar      nchar(10) default 'def',
    c_varchar    varchar(20) not null,
    c_nvarchar   nvarchar(3000),
	constraint pk_nochar002 primary key(no)
);
insert into dbo.i2_char002 values ('A','56789','AA101','测试ABC');
insert into dbo.i2_char002 values ('B','45678','AA102','用例DEF');
insert into dbo.i2_char002 values ('C','45678','AB103','上海英方股份');
insert into dbo.i2_char002(c_char,c_varchar) values ('D','AB104');
update dbo.i2_char002 set c_char='X',c_varchar='  ',c_nvarchar= '' where no=2;
update dbo.i2_char002 set c_varchar= '源端AC4',C_NVARCHAR=N'䗪' where no=1;
update dbo.i2_char002 set c_nchar= '源E7',C_NVARCHAR='备端kh8' where no=4;
update dbo.i2_char002 set c_varchar= '看看00',C_NVARCHAR=N'𧿹' where no=4;
update dbo.i2_char002 set c_char= 'fanjh' where no=3;
go

tgt_sql:(1)
select * from dbo.i2_char002 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_char002');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('i2_char002') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='i2_char002'  ORDER BY   c.name,a.name,d.name;
go

case 003 "数据：字符类型删除数据" 0
before:
drop table dbo.i2_char003;
go
src_sql:
create table dbo.i2_char003 (
    no           int IDENTITY(1,1),
    c_char       char(5) not null,
    c_nchar      nchar(10) default 'def',
    c_varchar    varchar(20) not null,
    c_nvarchar   nvarchar(3000),
	constraint pk_nochar003 primary key(no)
);
insert into dbo.i2_char003 values ('A','56789','AA101','测试ABC');
insert into dbo.i2_char003 values ('B','45678','AA102','用例DEF');
insert into dbo.i2_char003 values ('C','45678','AB103','上海英方股份');
insert into dbo.i2_char003(c_char,c_varchar) values ('D','AB104');
delete from dbo.i2_char003 where  no=3;
go

tgt_sql:   (1)
select * from dbo.i2_char003 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_char003');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('i2_char003') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='i2_char003'  ORDER BY   c.name,a.name,d.name;
go

case 004 "数据：字符类型添加列" 0
before:
drop table dbo.i2_char004;
go
src_sql:
create table dbo.i2_char004 (
    no           int IDENTITY(1,1),
    c_char       char(5) not null,
    c_nchar      nchar(10) default 'def',
    c_varchar    varchar(20) not null,
    c_nvarchar   nvarchar(3000),
	constraint pk_nochar004 primary key(no)
);
insert into dbo.i2_char004 values ('A','56789','AA101','测试ABC');
insert into dbo.i2_char004 values ('B','45678','AA102','用例DEF');
ALTER TABLE dbo.i2_char004 ADD c_addchar1 VARCHAR(13);
ALTER TABLE dbo.i2_char004 ADD c_addchar2 varchar(max),c_addchar3 nvarchar(max);
insert into dbo.i2_char004 values ('C', '45678','AB103','JK','c_addchar1','c_addchar2','c_addchar3' );
insert into dbo.i2_char004(c_char,c_varchar,c_addchar1,c_addchar2,c_addchar3 ) values ('D','AB104','c_addchar1','c_addchar2','c_addchar3' );
update dbo.i2_char004 set c_addchar1='中国武汉A',c_addchar2= '中文武汉B' where no=3;
update dbo.i2_char004 set c_addchar3= '测试组自动化' where no=4;
update dbo.i2_char004 set c_addchar1='天气晴朗A',c_addchar2= '多云有阵雨B',c_addchar3= '有小雪C' where no=1;
update dbo.i2_char004 set c_char= 'fanjh' where no=2;
delete from dbo.i2_char004 where no=1;
go

tgt_sql:   (1)
select * from dbo.i2_char004 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_char004');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('i2_char004') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='i2_char004'  ORDER BY   c.name,a.name,d.name;
go

case 005 "数据：字符类型删除列" 0
before:
drop table dbo.i2_char005;
go
src_sql:
create table dbo.i2_char005 (
    no           int IDENTITY(1,1) primary key,
    c_char       char(5) not null,
    c_nchar      nchar(10) default 'def',
    c_varchar    varchar(20) not null,
    c_nvarchar   nvarchar(3000),
	c_char30     char(30),
	c_varchar50  varchar(50)
);
insert into dbo.i2_char005 values ('A','56789','AA101','GH','0123456789','这是一个测试用例INFO');
insert into dbo.i2_char005 values ('B','45678','AA102','ED','0123456789','这是一个测试用例INFO');
ALTER TABLE dbo.i2_char005 drop column c_varchar50,c_char30;
insert into dbo.i2_char005 values ('C','45678','AA103','备机AC5');
insert into dbo.i2_char005(c_char,c_varchar) values ('D','AA104');
update dbo.i2_char005 set c_char='X',c_varchar= '中国指针' where no=1;
update dbo.i2_char005 set c_varchar= '公司278' where no=2;
update dbo.i2_char005 set c_varchar= 'AG578' where no=4;
delete from dbo.i2_char005 where no=1;
go

tgt_sql: (1)
select * from dbo.i2_char005 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_char005');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('i2_char005') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='i2_char005'  ORDER BY   c.name,a.name,d.name;
go

case 006 "数据：字符类型重命名表" 0
before:
drop table dbo.i2_char006;
drop table i2_char006_新表;
go
src_sql:
create table dbo.i2_char006 (
    no           int IDENTITY(1,1),
    c_char       char(5) not null,
    c_nchar      nchar(10) default 'def',
    c_varchar    varchar(20) not null,
    c_nvarchar   nvarchar(3000),
	constraint pk_nochar006 primary key(no)
);
sleep(3000);
insert into dbo.i2_char006 values ('A','56789','AA101','测试ABC');
insert into dbo.i2_char006 values ('B','45678','AA102','用例DEF');
exec sp_rename 'dbo.i2_char006','i2_char006_新表';
insert into i2_char006_新表 values ('E', '45678','AB103','JK');
insert into i2_char006_新表(c_char,c_varchar) values ('F','AB104');
update dbo.i2_char006_新表 set c_char='X',c_varchar= '中国指针' where no=3;
update dbo.i2_char006_新表 set c_char= '1278' where no=2;
update dbo.i2_char006_新表 set c_varchar= 'AG578' where no=4;
update dbo.i2_char006_新表 set c_char='F' where no=1;
delete from i2_char006_新表 where no=1;
go

tgt_sql: (1)
select * from dbo.i2_char006_新表 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_char006_新表');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('i2_char006_新表') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='i2_char006_新表'  ORDER BY   c.name,a.name,d.name;
go

case 007 "数据：字符类型修改列属性" 0
before:
drop table dbo.i2_char007;
go
src_sql:
create table dbo.i2_char007 (
    no           int IDENTITY(1,1),
    c_char       char(5) not null,
    c_nchar      nchar(10) default 'def',
    c_varchar    varchar(20),
    c_nvarchar   nvarchar(3000),
	constraint pk_nochar007 primary key(no)
);
go
alter table dbo.i2_char007 alter column c_char varchar(30);
alter table dbo.i2_char007 alter column c_nchar nchar(20);
alter table dbo.i2_char007 alter column c_varchar varchar(50) not null;
insert into dbo.i2_char007 values ('A','56789','AA101','测试ABC');
insert into dbo.i2_char007 values ('B','45678','AA102','用例DEF');
insert into dbo.i2_char007 values ('C', '45678','AB103','JK');
insert into dbo.i2_char007(c_char,c_varchar) values ('D','AB104');
update dbo.i2_char007 set c_char='X',c_varchar= '中国指针' where no=3;
update dbo.i2_char007 set c_varchar= '公司278' where no=2;
update dbo.i2_char007 set c_varchar= 'AG578' where no=4;
delete from dbo.i2_char007 where no=1;
go
tgt_sql: (1)
select * from dbo.i2_char007 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_char007');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('i2_char007') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='i2_char007'  ORDER BY   c.name,a.name,d.name;
go

case 008 "数据：主键列，空字符串" 0
before:
drop table dbo.i2_char008;
go
src_sql:
CREATE TABLE dbo.i2_char008(
	[COM_CFG_SN] [int] NOT NULL,
	[COM_CFG] [int] NOT NULL,
	[INT_ORG] [smallint] NOT NULL,
	[STKBD] [char](2) NOT NULL,
	[STK_CLS] [char](1) NOT NULL,
	[STK_CODE] [varchar](8) NOT NULL,
	[STK_BIZ] [smallint] NOT NULL,
	[STK_FLAG] [char](1) NOT NULL,
	[CURRENCY] [char](1) NOT NULL,
	[FEE_RATE] [bigint] NOT NULL,
	[FEE_MAX] [bigint] NOT NULL,
	[FEE_MIN] [bigint] NOT NULL,
	[FEE_SUB_FLAG] [char](1) NOT NULL,
	[COM_CATEGORY] [char](1) NOT NULL,
	[FEE_CAL_METHOD] [char](1) NOT NULL,
 CONSTRAINT [i2_char_PK008] PRIMARY KEY CLUSTERED
(
	[INT_ORG] ASC,
	[COM_CFG] ASC,
	[STKBD] ASC,
	[STK_CLS] ASC,
	[STK_CODE] ASC,
	[STK_BIZ] ASC,
	[STK_FLAG] ASC,
	[CURRENCY] ASC
));
INSERT [dbo].[i2_char008] VALUES (23381, 120, 888, N'15', N'D', N'', 400, N'0', N'0', 250000000, 0, 0, N'0', N'0', N'1');
INSERT [dbo].[i2_char008] VALUES (23558, 120, 889, N'15', N'D', N'', 401, N'0', N'0', 250000000, 0, 0, N'0', N'0', N'1');
INSERT [dbo].[i2_char008] VALUES (23735, 120, 890, N'15', N'D', N'', 402, N'0', N'0', 0, 0, 0, N'0', N'0', N'1');
INSERT [dbo].[i2_char008] VALUES (23912, 120, 891, N'15', N'D', N'', 403, N'0', N'0', 250000000, 0, 0, N'0', N'0', N'1');
INSERT [dbo].[i2_char008] VALUES (24089, 120, 892, N'15', N'D', N'', 404, N'0', N'0', 0, 0, 0, N'0', N'0', N'1');
go
tgt_sql: (1)
select * from dbo.i2_char008 order by COM_CFG_SN;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_char008');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('i2_char008') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='i2_char008'  ORDER BY   c.name,a.name,d.name;
go

case 009 "数据：字符类型重命名列" 0
before:
drop table dbo.i2_char009;
go
src_sql:
create table dbo.i2_char009 (
    no           int IDENTITY(1,1),
    c_char       char(5) not null,
    c_nchar      nchar(10) default 'def',
    c_varchar    varchar(20) not null,
    c_nvarchar   nvarchar(20),
	constraint pk_nochar009 primary key(no)
);
insert into dbo.i2_char009 values ('A','56789','AA101','测试ABC');
insert into dbo.i2_char009 values ('B','45678','AA102','用例DEF');
ALTER TABLE dbo.i2_char009 ADD c_c1 VARCHAR(13),c_c2 nvarchar(max);
exec sp_rename 'dbo.i2_char009.c_c1','c_c1新列','COLUMN';
exec sp_rename 'dbo.i2_char009.c_c2','新列c_c2','COLUMN';
insert into dbo.i2_char009 values ('C','45678','AB103','上海英方股份','testcate',null);
insert into dbo.i2_char009(c_char,c_varchar,c_c1新列,新列c_c2) values ('D','AB104','成都','');
update dbo.i2_char009 set c_char='X',c_c1新列='  ',新列c_c2= ' ' where no=2;
update dbo.i2_char009 set c_c1新列= '看看00',新列c_c2='搜索kan' where no=4;
delete from i2_char009 where no=3;
go

tgt_sql:(1)
select * from dbo.i2_char009 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_char009');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('i2_char009') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='i2_char009'  ORDER BY   c.name,a.name,d.name;
go