case 016 "数据：日期类型插入数据" 0
before:
drop table dbo.i2_time001;
drop table dbo.i2_time001a;
drop table dbo.i2_time001b;
go
src_sql:
create table dbo.i2_time001 (
    no                   int IDENTITY(1,1),
    c_date               date,
	c_time				 time(6),
	c_datetime			 datetime,
	c_datetime2			 datetime2(3),
    c_timestamp          timestamp,
	c_smalldatetime		 smalldatetime,
	c_datetimeoffset	 datetimeoffset(7)
);
CREATE UNIQUE CLUSTERED INDEX idx_time001 ON dbo.i2_time001 (no);
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
select no,c_date,c_time,c_datetime,c_datetime2,c_smalldatetime,c_datetimeoffset from dbo.i2_time001a order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_time001a');
select no,c_date,c_time,c_datetime,c_datetime2,c_smalldatetime,c_datetimeoffset from dbo.i2_time001b order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_time001b');
go

case 017 "数据：日期类型更新数据" 0
before:
drop table dbo.i2_time002;
go
src_sql:
create table dbo.i2_time002 (
    no                   int primary key IDENTITY(1,1),
    c_date               date,
	c_time				 time(0),
	c_datetime			 datetime,
	c_datetime2			 datetime2(0),
    c_timestamp          timestamp,
	c_smalldatetime		 smalldatetime,
	c_datetimeoffset	 datetimeoffset(0));
CREATE UNIQUE CLUSTERED INDEX idx_time002 ON dbo.i2_time002 (no);
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
go

case 018 "数据：日期类型删除数据" 0
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
go

case 019 "数据：日期类型添加列" 0
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
go

case 020 "数据：日期类型删除列" 0
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
go

case 021 "数据：日期类型重命名表" 0
jump
before:
drop table dbo.i2_time006;
drop table i2_time006_renew;
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
exec sp_rename 'i2_time006','i2_time006_renew';
insert into i2_time006_renew values (3,'2022-01-01','11:34:45.555','1997-10-11 14:31:56.333','2046-06-01 20:51:24.99999',default,'2002-12-05 12:00:10','1997-12-01 23:59:59.999999');
insert into i2_time006_renew(no,c_date) values (4,'2023-09-01');
update dbo.i2_time006_renew set c_date=CONVERT (date,'2025-05-05'),c_datetime2='2022-06-01 11:11:14.88888',c_datetime='2027-08-18 19:11:33.666' where no=4;
update dbo.i2_time006_renew set c_date=CONVERT (date,'2023-05-15'),c_datetime2='2021-05-01 12:11:14.88888',c_datetime='2029-09-10 19:11:33.666' where no=1;
delete from i2_time006_renew where no=2;
go

tgt_sql:
select no,c_date,c_time,c_datetime,c_datetime2,c_smalldatetime,c_datetimeoffset from dbo.i2_time006_新表 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_time006_新表');
go

case 022 "数据：日期类型修改列属性" 0
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
go

case 141 "数据：日期类型重命名列" 0
before:
drop table dbo.i2_time008;
go
src_sql:
create table dbo.i2_time008 (
    no                   int primary key IDENTITY(1,1),
    c_date               date,
	c_time				 time(0),
	c_datetime			 datetime,
	c_datetime2			 datetime2(0),
    c_timestamp          timestamp,
	c_smalldatetime		 smalldatetime,
	c_datetimeoffset	 datetimeoffset(0)
);
CREATE UNIQUE CLUSTERED INDEX idx_time008 ON dbo.i2_time008 (no);
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
go