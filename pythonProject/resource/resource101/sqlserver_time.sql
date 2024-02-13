case 001 "数据：日期类型插入数据" 0
before:
drop table dbo.i2_time001;
drop table dbo.i2_time001a;
drop table dbo.i2_time001b;
go
src_sql:
create table dbo.i2_time001 (
    no                   int IDENTITY(1,1) primary key,
    c_date               date,
	c_time				 time(0),
	c_datetime			 datetime,
	c_datetime2			 datetime2(0),
    c_timestamp          timestamp,
	c_smalldatetime		 smalldatetime,
	c_datetimeoffset	 datetimeoffset(0)
);
insert into dbo.i2_time001 values
(
convert(date,SYSDATETIME()),
convert(time,'10:01:16.1234567'),
convert(datetime,'1999-12-12 14:31:56.003',20),
convert(datetime2,'2048-06-01 20:51:24.1234567',21),
default,
convert(smalldatetime,'2000-12-05 12:01:25',20),
CONVERT (datetimeoffset,'2021-01-13 16:50:33.1234567 +08:00')
);
insert into dbo.i2_time001(c_date) values (convert(date,'2000-12-31'));
insert into dbo.i2_time001(c_date) values (convert(date,'2020-12-31'));
insert into dbo.i2_time001(c_date) values (convert(date,'2020-02-29'));
go
create table dbo.i2_time001a (
    no                   int primary key,
    c_date               date not null,
	c_time				 time(1),
	c_datetime			 datetime,
	c_datetime2			 datetime2(1),
    c_timestamp          timestamp,
	c_smalldatetime		 smalldatetime,
	c_datetimeoffset	 datetimeoffset(1)
);
insert into dbo.i2_time001a values
(1,
convert(date,SYSDATETIME()),
convert(time,'10:01:16.1234567'),
convert(datetime,'1999-12-12 14:31:56.003',20),
convert(datetime2,'2048-06-01 20:51:24.0004567',21),
default,
convert(smalldatetime,'2000-12-05 12:01:25',20),
CONVERT (datetimeoffset,'2021-01-13 16:50:33.0004567 +08:00')
);
insert into dbo.i2_time001a values
(2,
convert(date,SYSDATETIME()),
convert(time,'10:01:16.1234567'),
convert(datetime,'1999-12-12 14:31:56.321',20),
convert(datetime2,'2048-06-01 20:51:24.1234567',21),
default,
convert(smalldatetime,'2000-12-05 12:01:25',20),
CONVERT (datetimeoffset,'2021-01-13 16:50:33.1234567 +08:00')
);
create table dbo.i2_time001b (
    no                   int primary key,
    c_date               date not null,
	c_time				 time(7),
	c_datetime			 datetime,
	c_datetime2			 datetime2(7),
    c_timestamp          timestamp,
	c_smalldatetime		 smalldatetime,
	c_datetimeoffset	 datetimeoffset(7)
);
insert into dbo.i2_time001b values
(1,
convert(date,SYSDATETIME()),
convert(time,'10:01:16.1234567'),
convert(datetime,'1999-12-12 14:31:56.003',20),
convert(datetime2,'2048-06-01 20:51:24.1234567',21),
default,
convert(smalldatetime,'2000-12-05 12:01:25',20),
CONVERT (datetimeoffset,'2021-01-13 16:50:33.1234567 +08:00')
);
go

tgt_sql:
select no,c_date,c_time,c_datetime,c_datetime2,c_smalldatetime,c_datetimeoffset from dbo.i2_time001 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_time001');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('i2_time001') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='i2_time001'  ORDER BY   c.name,a.name,d.name;
select no,c_date,c_time,c_datetime,c_datetime2,c_smalldatetime,c_datetimeoffset from dbo.i2_time001a order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_time001a');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('i2_time001a') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='i2_time001a'  ORDER BY   c.name,a.name,d.name;
select no,c_date,c_time,c_datetime,c_datetime2,c_smalldatetime,c_datetimeoffset from dbo.i2_time001b order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_time001b');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('i2_time001b') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='i2_time001b'  ORDER BY   c.name,a.name,d.name;
go

case 002 "数据：日期类型更新数据" 0
before:
drop table dbo.i2_time002;
go
src_sql:
create table dbo.i2_time002 (
    no                   int IDENTITY(1,1) primary key,
    c_date               date,
	c_time				 time(0),
	c_datetime			 datetime,
	c_datetime2			 datetime2(0),
    c_timestamp          timestamp,
	c_smalldatetime		 smalldatetime,
	c_datetimeoffset	 datetimeoffset(0)
);
insert into dbo.i2_time002 values
(
convert(date,SYSDATETIME()),
convert(time,'10:01:16.001'),
convert(datetime,'1999-12-12 14:31:56.003',20),
convert(datetime2,'2048-06-01 20:51:24.00099',21),
default,
convert(smalldatetime,'2000-12-05 12:01:25',20),
CONVERT (datetimeoffset,'2021-01-13 16:50:33.0191327 +08:00')
);
insert into dbo.i2_time002 values
(
convert(date,'2020-08-31'),
convert(time,SYSDATETIME()),
convert(datetime,'1998-12-12 14:31:56.013',20),
convert(datetime2,'2047-06-01 20:51:24.00199',21),
default,
convert(smalldatetime,'2001-12-05 12:02:20',20),
CONVERT (datetimeoffset,SYSDATETIMEOFFSET())
);
insert into dbo.i2_time002 values
(
convert(date,SYSDATETIME()),
convert(time,SYSDATETIME()),
convert(datetime,'1997-12-12 14:31:56.333',20),
convert(datetime2,'2046-06-01 20:51:24.99999',21),
default,
convert(smalldatetime,'2002-12-05 12:00:00',20),
CONVERT (datetimeoffset,SYSDATETIMEOFFSET())
);
insert into dbo.i2_time002(c_datetimeoffset) values (CONVERT (datetimeoffset,SYSDATETIMEOFFSET()));
update dbo.i2_time002 set c_date=CONVERT (date,'2020-12-31') where no=2;
update dbo.i2_time002 set c_datetime=CONVERT (datetime,'2021-06-11 10:11:14.013') where no=1;

go

tgt_sql:
select no,c_date,c_time,c_datetime,c_datetime2,c_smalldatetime,c_datetimeoffset from dbo.i2_time002 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_time002');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('i2_time002') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='i2_time002'  ORDER BY   c.name,a.name,d.name;
go

case 003 "数据：日期类型删除数据" 0
before:
drop table dbo.i2_time003;
go
src_sql:
create table dbo.i2_time003 (
    no                   int primary key,
    c_date               date not null,
	c_time				 time,
	c_datetime			 datetime,
	c_datetime2			 datetime2,
    c_timestamp          timestamp,
	c_smalldatetime		 smalldatetime,
	c_datetimeoffset	 datetimeoffset
);
insert into dbo.i2_time003 values
(1,
convert(date,SYSDATETIME()),
convert(time,SYSDATETIME()),
convert(datetime,'1999-12-12 14:31:56.003',20),
convert(datetime2,'2048-06-01 20:51:24.00099',21),
default,
convert(smalldatetime,'2000-12-05 12:00:00',20),
CONVERT (datetimeoffset,SYSDATETIMEOFFSET())
);
insert into dbo.i2_time003 values
(2,
convert(date,SYSDATETIME()),
convert(time,SYSDATETIME()),
convert(datetime,'1998-12-12 14:31:56.333',20),
convert(datetime2,'2047-06-01 20:51:24.99999',21),
default,
convert(smalldatetime,'2001-12-05 12:00:00',20),
CONVERT (datetimeoffset,SYSDATETIMEOFFSET())
);
insert into dbo.i2_time003 values
(3,
convert(date,SYSDATETIME()),
convert(time,SYSDATETIME()),
convert(datetime,'1997-12-12 14:31:56.333',20),
convert(datetime2,'2046-06-01 20:51:24.99999',21),
default,
convert(smalldatetime,'2002-12-05 12:00:00',20),
CONVERT (datetimeoffset,SYSDATETIMEOFFSET())
);
insert into dbo.i2_time003(no,c_date) values (4,convert(date,SYSDATETIME()));
delete from dbo.i2_time003 where  no=3;
go

tgt_sql:
select no,c_date,c_time,c_datetime,c_datetime2,c_smalldatetime,c_datetimeoffset from dbo.i2_time003 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_time003');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('i2_time003') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='i2_time003'  ORDER BY   c.name,a.name,d.name;
go

case 004 "数据：日期类型添加列" 0
before:
drop table dbo.i2_time004;
go
src_sql:
create table dbo.i2_time004 (
    no                   int primary key,
    c_date               date not null,
	c_time				 time,
	c_datetime			 datetime,
	c_datetime2			 datetime2,
    c_timestamp          timestamp,
	c_smalldatetime		 smalldatetime,
	c_datetimeoffset	 datetimeoffset
);

insert into dbo.i2_time004 values
(1,
convert(date,SYSDATETIME()),
convert(time,SYSDATETIME()),
convert(datetime,'1999-12-12 14:31:56.003',20),
convert(datetime2,'2048-06-01 20:51:24.00099',21),
default,
convert(smalldatetime,'2000-12-05 12:00:00',20),
CONVERT (datetimeoffset,SYSDATETIMEOFFSET())
);
insert into dbo.i2_time004 values
(2,
convert(date,SYSDATETIME()),
convert(time,SYSDATETIME()),
convert(datetime,'1998-12-12 14:31:56.333',20),
convert(datetime2,'2047-06-01 20:51:24.99999',21),
default,
convert(smalldatetime,'2001-12-05 12:00:00',20),
CONVERT (datetimeoffset,SYSDATETIMEOFFSET())
);
alter table dbo.i2_time004 add v1 date;
alter table dbo.i2_time004 add v2 smalldatetime,v3 datetime;
insert into dbo.i2_time004 values (3,'2022-01-01','11:34:45.555','1997-10-11 14:31:56.333','2046-06-01 20:51:24.99999',default,'2002-12-05 12:00:10','1997-12-01 23:59:59.999999','2022-01-02','2002-12-15 10:10:10','1997-02-11 11:31:56.333');
insert into dbo.i2_time004(no,c_date) values (4,'2023-09-01');
update dbo.i2_time004 set c_date=CONVERT (date,'2020-06-01'),v1='2020-02-28',v2='2021-11-25 11:11:15',v3='2022-02-11 12:30:51.013' where no=4;
update dbo.i2_time004 set c_date=CONVERT (date,'2021-03-01'),v1='2019-01-28',v2='2018-10-25 11:11:15',v3='2017-04-21 12:30:51.003' where no=1;
update dbo.i2_time004 set v1='2029-01-28',v2='2028-10-25 11:11:15',v3='2027-04-21 12:30:51.003' where no=2;
delete from i2_time004 where no=3;
go

tgt_sql:
select no,c_date,c_time,c_datetime,c_datetime2,c_smalldatetime,c_datetimeoffset,v1,v2,v3 from dbo.i2_time004 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_time004');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('i2_time004') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='i2_time004'  ORDER BY   c.name,a.name,d.name;
go

case 005 "数据：日期类型删除列" 0
before:
drop table dbo.i2_time005;
go
src_sql:
create table dbo.i2_time005 (
    no                   int primary key,
    c_date               date not null,
	c_time				 time,
	c_datetime			 datetime,
	c_datetime2			 datetime2,
    c_timestamp          timestamp,
	c_smalldatetime		 smalldatetime,
	c_datetimeoffset	 datetimeoffset
);
insert into dbo.i2_time005 values
(1,
convert(date,SYSDATETIME()),
convert(time,SYSDATETIME()),
convert(datetime,'1999-12-12 14:31:56.003',20),
convert(datetime2,'2048-06-01 20:51:24.00999',21),
default,
convert(smalldatetime,'2000-12-05 12:00:00',20),
CONVERT (datetimeoffset,SYSDATETIMEOFFSET())
);
insert into dbo.i2_time005 values
(2,
convert(date,SYSDATETIME()),
convert(time,SYSDATETIME()),
convert(datetime,'1998-12-12 14:31:56.333',20),
convert(datetime2,'2047-06-01 20:51:24.99999',21),
default,
convert(smalldatetime,'2001-12-05 12:00:00',20),
CONVERT (datetimeoffset,SYSDATETIMEOFFSET())
);
alter table dbo.i2_time005 drop column c_time;
alter table dbo.i2_time005 drop column c_smalldatetime,c_datetimeoffset;
insert into dbo.i2_time005 values (3,'2022-01-01','1997-10-11 14:31:56.333','2046-06-01 20:51:24.99999',default);
insert into dbo.i2_time005(no,c_date) values (4,'2023-09-01');
update dbo.i2_time005 set c_date=CONVERT (date,'2025-05-05'),c_datetime2='2022-06-01 11:11:14.00088',c_datetime='2027-08-18 19:11:33.011' where no=4;
update dbo.i2_time005 set c_date=CONVERT (date,'2023-05-15'),c_datetime2='2021-05-01 12:11:14.00188',c_datetime='2029-09-10 19:11:33.022' where no=1;
delete from i2_time005 where no=2;
go

tgt_sql:
select no,c_date,c_datetime,c_datetime2 from dbo.i2_time005 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_time005');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('i2_time005') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='i2_time005'  ORDER BY   c.name,a.name,d.name;
go

case 006 "数据：日期类型重命名表" 0
before:
drop table dbo.i2_time006;
drop table i2_time006_新表;
go
src_sql:
create table dbo.i2_time006 (
    no                   int primary key,
    c_date               date not null,
	c_time				 time,
	c_datetime			 datetime,
	c_datetime2			 datetime2,
    c_timestamp          timestamp,
	c_smalldatetime		 smalldatetime,
	c_datetimeoffset	 datetimeoffset
);
sleep(3000);
insert into dbo.i2_time006 values
(1,
convert(date,SYSDATETIME()),
convert(time,SYSDATETIME()),
convert(datetime,'1999-12-12 14:31:56.333',20),
convert(datetime2,'2048-06-01 20:51:24.99999',21),
default,
convert(smalldatetime,'2000-12-05 12:00:00',20),
CONVERT (datetimeoffset,SYSDATETIMEOFFSET())
);
insert into dbo.i2_time006 values
(2,
convert(date,SYSDATETIME()),
convert(time,SYSDATETIME()),
convert(datetime,'1998-12-12 14:31:56.333',20),
convert(datetime2,'2047-06-01 20:51:24.99999',21),
default,
convert(smalldatetime,'2001-12-05 12:00:00',20),
CONVERT (datetimeoffset,SYSDATETIMEOFFSET())
);
exec sp_rename 'i2_time006','i2_time006_新表';
insert into i2_time006_新表 values (3,'2022-01-01','11:34:45.555','1997-10-11 14:31:56.333','2046-06-01 20:51:24.99999',default,'2002-12-05 12:00:10','1997-12-01 23:59:59.999999');
insert into i2_time006_新表(no,c_date) values (4,'2023-09-01');
update dbo.i2_time006_新表 set c_date=CONVERT (date,'2025-05-05'),c_datetime2='2022-06-01 11:11:14.88888',c_datetime='2027-08-18 19:11:33.666' where no=4;
update dbo.i2_time006_新表 set c_date=CONVERT (date,'2023-05-15'),c_datetime2='2021-05-01 12:11:14.88888',c_datetime='2029-09-10 19:11:33.666' where no=1;
delete from i2_time006_新表 where no=2;
go

tgt_sql:
select no,c_date,c_time,c_datetime,c_datetime2,c_smalldatetime,c_datetimeoffset from dbo.i2_time006_新表 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_time006_新表');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('i2_time006_新表') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='i2_time006_新表'  ORDER BY   c.name,a.name,d.name;
go

case 007 "数据：日期类型修改列属性" 0
before:
drop table dbo.i2_time007;
go
src_sql:
create table dbo.i2_time007 (
    no                   int primary key,
    c_date               date not null,
	c_time				 time,
	c_datetime			 datetime,
	c_datetime2			 datetime2,
    c_timestamp          timestamp,
	c_smalldatetime		 smalldatetime,
	c_datetimeoffset	 datetimeoffset
);
go
alter table dbo.i2_time007 alter column c_smalldatetime datetime;
alter table dbo.i2_time007 alter column c_datetime datetime2(0);
insert into dbo.i2_time007 values
(1,
convert(date,SYSDATETIME()),
convert(time,SYSDATETIME()),
convert(datetime,'1999-12-12 14:31:56.333',20),
convert(datetime2,'2048-06-01 20:51:24.99999',21),
default,
convert(smalldatetime,'2000-12-05 12:00:00',20),
CONVERT (datetimeoffset,SYSDATETIMEOFFSET())
);
insert into dbo.i2_time007 values
(2,
convert(date,SYSDATETIME()),
convert(time,SYSDATETIME()),
convert(datetime,'1998-12-12 14:31:56.333',20),
convert(datetime2,'2047-06-01 20:51:24.99999',21),
default,
convert(smalldatetime,'2001-12-05 12:00:00',20),
CONVERT (datetimeoffset,SYSDATETIMEOFFSET())
);
insert into dbo.i2_time007 values (3,'2022-01-01','11:34:45.555','1997-10-11 14:31:56.99999','2046-06-01 20:51:24.99999',default,'2002-12-05 12:00:10.333','1997-12-01 23:59:59.999999');
insert into dbo.i2_time007(no,c_date) values (4,'2023-09-01');
update dbo.i2_time007 set c_date=CONVERT (date,'2025-05-05'),c_datetime='2022-06-01 11:11:14.88888',c_datetime2='2027-08-18 19:11:33.666' where no=4;
update dbo.i2_time007 set c_date=CONVERT (date,'2023-05-15'),c_datetime='2021-05-01 12:11:14.88888',c_datetime2='2029-09-10 19:11:33.666' where no=1;
delete from i2_time007 where no=2;
go

tgt_sql:
select no,c_date,c_time,c_datetime,c_datetime2,c_smalldatetime,c_datetimeoffset from dbo.i2_time007 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_time007');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('i2_time007') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='i2_time007'  ORDER BY   c.name,a.name,d.name;
go

case 008 "数据：日期类型重命名列" 0
before:
drop table dbo.i2_time008;
go
src_sql:
create table dbo.i2_time008 (
    no                   int IDENTITY(1,1) primary key,
    c_date               date,
	c_time				 time(0),
	c_datetime			 datetime,
	c_datetime2			 datetime2(0),
    c_timestamp          timestamp,
	c_smalldatetime		 smalldatetime,
	c_datetimeoffset	 datetimeoffset(0)
);
sleep (3000);
insert into dbo.i2_time008 values
(
convert(date,SYSDATETIME()),
convert(time,'10:01:16.001'),
convert(datetime,'1999-12-12 14:31:56.003',20),
convert(datetime2,'2048-06-01 20:51:24.00099',21),
default,
convert(smalldatetime,'2000-12-05 12:01:25',20),
CONVERT (datetimeoffset,'2021-01-13 16:50:33.0191327 +08:00')
);
insert into dbo.i2_time008 values
(
convert(date,'2020-08-31'),
convert(time,SYSDATETIME()),
convert(datetime,'1998-12-12 14:31:56.013',20),
convert(datetime2,'2047-06-01 20:51:24.00199',21),
default,
convert(smalldatetime,'2001-12-05 12:02:20',20),
CONVERT (datetimeoffset,SYSDATETIMEOFFSET())
);
ALTER TABLE dbo.i2_time008 ADD c_t1 date,c_t2 time,c_t3 datetime,c_t4 datetime2,c_t5 smalldatetime,c_t6 datetimeoffset;
exec sp_rename 'dbo.i2_time008.c_t1','c_t1_n','COLUMN';
exec sp_rename 'dbo.i2_time008.c_t2','c_t2_n','COLUMN';
exec sp_rename 'dbo.i2_time008.c_t3','c_t3_n','COLUMN';
exec sp_rename 'dbo.i2_time008.c_t4','c_t4_n','COLUMN';
exec sp_rename 'dbo.i2_time008.c_t5','c_t5_n','COLUMN';
exec sp_rename 'dbo.i2_time008.c_t6','c_t6_n','COLUMN';
insert into dbo.i2_time008 values
(
convert(date,SYSDATETIME()),
convert(time,SYSDATETIME()),
convert(datetime,'1997-12-12 14:31:56.333',20),
convert(datetime2,'2046-06-01 20:51:24.99999',21),
default,
convert(smalldatetime,'2002-12-05 12:00:00',20),
CONVERT (datetimeoffset,SYSDATETIMEOFFSET()),
convert(date,'2022-01-31'),
convert(time,'14:11:36.024'),
null,
null,
null,
null
);
insert into dbo.i2_time008(c_datetimeoffset,c_t6_n) values (CONVERT (datetimeoffset,SYSDATETIMEOFFSET()),CONVERT (datetimeoffset,'2022-11-23 06:05:13.0191327 +08:00'));
update dbo.i2_time008 set c_date=CONVERT (date,'2020-12-31'),c_t3_n=convert(datetime,'2017-02-12 11:11:16.333',20),c_t6_n=CONVERT (datetimeoffset,'2021-06-01 06:05:13.0191327 +08:00') where no=2;
update dbo.i2_time008 set c_datetime=CONVERT (datetime,'2021-06-11 10:11:14.013'),c_t1_n=null,c_t2_n=null,c_t3_n=convert(datetime,'2019-11-22 10:31:56.003',20),c_t4_n=convert(datetime2,'2068-06-01 20:51:24.00099',21),c_t5_n=convert(smalldatetime,'2009-12-05 12:01:25',20),c_t6_n=CONVERT (datetimeoffset,'2022-05-13 16:05:13.123456 +08:00') where no=4;
delete from dbo.i2_time008 where no=3;
go

tgt_sql:
select no,c_date,c_time,c_datetime,c_datetime2,c_smalldatetime,c_datetimeoffset,c_t1_n,c_t2_n,c_t3_n,c_t4_n from dbo.i2_time008 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_time008');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('i2_time008') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='i2_time008'  ORDER BY   c.name,a.name,d.name;
go

case 009 "数据：日期类型加列带非空default约束" 0
before:
drop table dbo.i2_time009;
go
src_sql:
create table dbo.i2_time009 (
    no                   int primary key,
    c_date               date not null,
	c_time				 time,
	c_datetime			 datetime,
	c_datetime2			 datetime2,
    c_timestamp          timestamp,
	c_smalldatetime		 smalldatetime,
	c_datetimeoffset	 datetimeoffset
);

insert into dbo.i2_time009 values
(1,
convert(date,SYSDATETIME()),
convert(time,SYSDATETIME()),
convert(datetime,'1999-12-12 14:31:56.003',20),
convert(datetime2,'2048-06-01 20:51:24.00099',21),
default,
convert(smalldatetime,'2000-12-05 12:00:00',20),
CONVERT (datetimeoffset,SYSDATETIMEOFFSET())
);
insert into dbo.i2_time009 values
(2,
convert(date,SYSDATETIME()),
convert(time,SYSDATETIME()),
convert(datetime,'1998-12-12 14:31:56.333',20),
convert(datetime2,'2047-06-01 20:51:24.99999',21),
default,
convert(smalldatetime,'2001-12-05 12:00:00',20),
CONVERT (datetimeoffset,SYSDATETIMEOFFSET())
);
alter table dbo.i2_time009 add v1 date not null default '2051-12-31';
alter table dbo.i2_time009 add v2 time not null default '23:59:59.1111111';
alter table dbo.i2_time009 add v3 datetime not null default '1977-10-11 14:31:56.333';
alter table dbo.i2_time009 add v4 datetime2 not null default '2048-02-29 11:11:24.99999';
alter table dbo.i2_time009 add v5 smalldatetime not null default '2053-12-15 10:10:10';
alter table dbo.i2_time009 add v6 datetimeoffset not null default '2043-09-04 17:36:37.0617115 +08:00';
insert into dbo.i2_time009 values (3,'2022-01-01','11:34:45.555','1997-10-11 14:31:56.333','2046-06-01 20:51:24.99999',default,'2002-12-05 12:00:10','1997-12-01 23:59:59.999999','2022-01-02','19:18:17.1234567','2002-12-15 10:10:10.333','1997-02-11 11:31:56.1234567','2052-12-15 10:10:10',CONVERT (datetimeoffset,SYSDATETIMEOFFSET()));
insert into dbo.i2_time009(no,c_date) values (4,'2023-09-01');
go

tgt_sql:
select no,c_date,c_time,c_datetime,c_datetime2,c_smalldatetime,c_datetimeoffset,v1,v2,v3 from dbo.i2_time009 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_time009');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('i2_time009') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='i2_time009'  ORDER BY   c.name,a.name,d.name;
go