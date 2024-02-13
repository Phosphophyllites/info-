case 047 "数据：sql_variant类型插入数据" 0
before:
drop table dbo.i2_variant001;
go
src_sql:
create table dbo.i2_variant001 (
	no int primary key,
	c_unique     sql_variant DEFAULT newID(),
    c_char20     sql_variant default 'def',
    c_varchar    sql_variant not null,
	c_nchar50    sql_variant,
    c_nvarchar   sql_variant,
    c_int        sql_variant default 0 not null,
	c_smallint   sql_variant,
	c_tinyint    sql_variant check (c_tinyint>=30 and c_tinyint<=180),
	c_bigint     sql_variant,
	c_decimal    sql_variant,
	c_numeric	 sql_variant,
	c_float      sql_variant,
	c_real       sql_variant,
	c_money      sql_variant,
	c_smallmoney sql_variant,
	c_bit        sql_variant,
	c_date       sql_variant,
	c_time       sql_variant,
	c_datetime	 sql_variant,
	c_datetime2  sql_variant,
	c_smalldatetime  sql_variant,
	c_datetimeoffset sql_variant,
	c_binary     sql_variant,
	c_varbinary  sql_variant,
	c_hierarchyid  sql_variant
	);
insert into dbo.i2_variant001 values (1,newid(),'fang56789','AA101','GHjjjjjjjjj','上海英方股份有限公司测试用例1',-2147483648,-32768,81,-9223372036854775808,-0.0000000008,-176543.2398,-300.12,-109.6789,-110.23,-101.45,1,
convert(date,SYSDATETIME()),
convert(time,SYSDATETIME()),
convert(datetime,'1999-12-12 14:31:56.333',20),
convert(datetime2,'2048-06-01 20:51:24.99999',21),
convert(smalldatetime,'2000-12-05 12:00:00',20),
CONVERT (datetimeoffset,SYSDATETIMEOFFSET()),
0x1f,0x111111111,'/1/2/3/');
insert into dbo.i2_variant001 values (2,newid(),'yuan56789','AA102','GHjjjjjjjjj','上海英方股份有限公司测试用例2',10,9999,91,67891,2020.88,500.6789,300.45,500.6789,100.23,300.45,1,
convert(date,SYSDATETIME()),
convert(time,SYSDATETIME()),
convert(datetime,'1999-12-12 14:31:56.333',20),
convert(datetime2,'2048-06-01 20:51:24.99999',21),
convert(smalldatetime,'2000-12-05 12:00:00',20),
CONVERT (datetimeoffset,SYSDATETIMEOFFSET()),
0x2f,0x111111111,'/1/2/3/');
insert into dbo.i2_variant001 values (3,newid(),'chang56789','AA103','GHjjjjjjjjj','上海英方股份有限公司测试用例4',10,9999,101,67891,2020.88,500.6789,300.45,500.6789,100.23,300.45,1,
convert(date,SYSDATETIME()),
convert(time,SYSDATETIME()),
convert(datetime,'1999-12-12 14:31:56.333',20),
convert(datetime2,'2048-06-01 20:51:24.99999',21),
convert(smalldatetime,'2000-12-05 12:00:00',20),
CONVERT (datetimeoffset,SYSDATETIMEOFFSET()),
0x3f,0x111111111,'/1/2/3/');
insert into dbo.i2_variant001(no,c_varchar,c_tinyint) values ( 4,'AA104',111);
go

tgt_sql: (1)
select no,convert(uniqueidentifier,c_unique),convert(char(20),c_char20),convert(varchar(50),c_varchar),convert(nchar(50),c_nchar50),convert(nvarchar(50),c_nvarchar),convert(int,c_int),convert(smallint,c_smallint),convert(tinyint,c_tinyint),convert(bigint,c_bigint),convert(decimal(10,4),c_decimal),convert(numeric(10,4),c_numeric),convert(float,c_float),convert(real,c_real),convert(money,c_money),convert(smallmoney,c_smallmoney),convert(bit,c_bit),convert(date,c_date),convert(time,c_time),convert(datetime,c_datetime),convert(datetime2,c_datetime2),convert(smalldatetime,c_smalldatetime),convert(datetimeoffset,c_datetimeoffset),convert(binary,c_binary),convert(varbinary,c_varbinary),convert(varchar(50),c_hierarchyid) from dbo.i2_variant001 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_variant001');
go

case 048 "数据：sql_variant类型更新数据" 0
before:
drop table dbo.i2_variant002;
go
src_sql:
create table dbo.i2_variant002 (
	no int primary key,
	c_unique     sql_variant DEFAULT newID(),
    c_char20     sql_variant default 'def',
    c_varchar    sql_variant not null,
	c_nchar50    sql_variant,
    c_nvarchar   sql_variant,
    c_int        sql_variant default 0 not null,
	c_smallint   sql_variant,
	c_tinyint    sql_variant check (c_tinyint>=30 and c_tinyint<=180),
	c_bigint     sql_variant,
	c_decimal    sql_variant,
	c_numeric	 sql_variant,
	c_float      sql_variant,
	c_real       sql_variant,
	c_money      sql_variant,
	c_smallmoney sql_variant,
	c_bit        sql_variant,
	c_date       sql_variant,
	c_time       sql_variant,
	c_datetime	 sql_variant,
	c_datetime2  sql_variant,
	c_smalldatetime  sql_variant,
	c_datetimeoffset sql_variant,
	c_binary     sql_variant,
	c_varbinary  sql_variant,
	c_hierarchyid  sql_variant
	);
insert into dbo.i2_variant002 values (1,newid(),'fang56789','AA101','GHjjjjjjjjj','上海英方股份有限公司测试用例1',10,9999,81,67891,2020.88,500.6789,300.45,500.6789,100.23,300.45,1,
convert(date,SYSDATETIME()),
convert(time,SYSDATETIME()),
convert(datetime,'1999-12-12 14:31:56.333',20),
convert(datetime2,'2048-06-01 20:51:24.99999',21),
convert(smalldatetime,'2000-12-05 12:00:00',20),
CONVERT (datetimeoffset,SYSDATETIMEOFFSET()),
0x1f,0x111111111,'/1/2/3/');
insert into dbo.i2_variant002 values (2,newid(),'yuan56789','AA102','GHjjjjjjjjj','上海英方股份有限公司测试用例2',10,9999,91,67891,2020.88,500.6789,300.45,500.6789,100.23,300.45,1,
convert(date,SYSDATETIME()),
convert(time,SYSDATETIME()),
convert(datetime,'1999-12-12 14:31:56.333',20),
convert(datetime2,'2048-06-01 20:51:24.99999',21),
convert(smalldatetime,'2000-12-05 12:00:00',20),
CONVERT (datetimeoffset,SYSDATETIMEOFFSET()),
0x2f,0x111111111,'/1/2/3/');
insert into dbo.i2_variant002 values (3,newid(),'chang56789','AA103','GHjjjjjjjjj','上海英方股份有限公司测试用例4',10,9999,101,67891,2020.88,500.6789,300.45,500.6789,100.23,300.45,1,
convert(date,SYSDATETIME()),
convert(time,SYSDATETIME()),
convert(datetime,'1999-12-12 14:31:56.333',20),
convert(datetime2,'2048-06-01 20:51:24.99999',21),
convert(smalldatetime,'2000-12-05 12:00:00',20),
CONVERT (datetimeoffset,SYSDATETIMEOFFSET()),
0x3f,0x111111111,'/1/2/3/');
insert into dbo.i2_variant002(no,c_varchar,c_tinyint) values ( 4,'AA104',111);
update dbo.i2_variant002 set c_float=201.34,c_datetime='2019-01-28 10:10:10.333',c_hierarchyid='/1/4/6/',c_binary=0x7f,c_bigint=56789 where no=2;
delete from dbo.i2_variant002 where  no=3;
go

tgt_sql: (1)
select no,convert(uniqueidentifier,c_unique),convert(char(20),c_char20),convert(varchar(50),c_varchar),convert(nchar(50),c_nchar50),convert(nvarchar(50),c_nvarchar),convert(int,c_int),convert(smallint,c_smallint),convert(tinyint,c_tinyint),convert(bigint,c_bigint),convert(decimal(10,4),c_decimal),convert(numeric(10,4),c_numeric),convert(float,c_float),convert(real,c_real),convert(money,c_money),convert(smallmoney,c_smallmoney),convert(bit,c_bit),convert(date,c_date),convert(time,c_time),convert(datetime,c_datetime),convert(datetime2,c_datetime2),convert(smalldatetime,c_smalldatetime),convert(datetimeoffset,c_datetimeoffset),convert(binary,c_binary),convert(varbinary,c_varbinary),convert(varchar(50),c_hierarchyid) from dbo.i2_variant002 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_variant002');
go

case 049 "数据：sql_variant类型删除数据" 0
before:
drop table dbo.i2_variant003;
go
src_sql:
create table dbo.i2_variant003 (
	no int primary key,
	c_unique     sql_variant DEFAULT newID(),
    c_char20     sql_variant default 'def',
    c_varchar    sql_variant not null,
	c_nchar50    sql_variant,
    c_nvarchar   sql_variant,
    c_int        sql_variant default 0 not null,
	c_smallint   sql_variant,
	c_tinyint    sql_variant check (c_tinyint>=30 and c_tinyint<=180),
	c_bigint     sql_variant,
	c_decimal    sql_variant,
	c_numeric	 sql_variant,
	c_float      sql_variant,
	c_real       sql_variant,
	c_money      sql_variant,
	c_smallmoney sql_variant,
	c_bit        sql_variant,
	c_date       sql_variant,
	c_time       sql_variant,
	c_datetime	 sql_variant,
	c_datetime2  sql_variant,
	c_smalldatetime  sql_variant,
	c_datetimeoffset sql_variant,
	c_binary     sql_variant,
	c_varbinary  sql_variant,
	c_hierarchyid  sql_variant
	);
insert into dbo.i2_variant003 values (1,newid(),'fang56789','AA101','GHjjjjjjjjj','上海英方股份有限公司测试用例1',10,9999,81,67891,2020.88,500.6789,300.45,500.6789,100.23,300.45,1,
convert(date,SYSDATETIME()),
convert(time,SYSDATETIME()),
convert(datetime,'1999-12-12 14:31:56.333',20),
convert(datetime2,'2048-06-01 20:51:24.99999',21),
convert(smalldatetime,'2000-12-05 12:00:00',20),
CONVERT (datetimeoffset,SYSDATETIMEOFFSET()),
0x1f,0x111111111,'/1/2/3/');
insert into dbo.i2_variant003 values (2,newid(),'yuan56789','AA102','GHjjjjjjjjj','上海英方股份有限公司测试用例2',10,9999,91,67891,2020.88,500.6789,300.45,500.6789,100.23,300.45,1,
convert(date,SYSDATETIME()),
convert(time,SYSDATETIME()),
convert(datetime,'1999-12-12 14:31:56.333',20),
convert(datetime2,'2048-06-01 20:51:24.99999',21),
convert(smalldatetime,'2000-12-05 12:00:00',20),
CONVERT (datetimeoffset,SYSDATETIMEOFFSET()),
0x2f,0x111111111,'/1/2/3/');
insert into dbo.i2_variant003 values (3,newid(),'chang56789','AA103','GHjjjjjjjjj','上海英方股份有限公司测试用例4',10,9999,101,67891,2020.88,500.6789,300.45,500.6789,100.23,300.45,1,
convert(date,SYSDATETIME()),
convert(time,SYSDATETIME()),
convert(datetime,'1999-12-12 14:31:56.333',20),
convert(datetime2,'2048-06-01 20:51:24.99999',21),
convert(smalldatetime,'2000-12-05 12:00:00',20),
CONVERT (datetimeoffset,SYSDATETIMEOFFSET()),
0x3f,0x111111111,'/1/2/3/');
insert into dbo.i2_variant003(no,c_varchar,c_tinyint) values ( 4,'AA104',111);
delete from dbo.i2_variant003 where  no=3;
go

tgt_sql: (1)
select no,convert(uniqueidentifier,c_unique),convert(char(20),c_char20),convert(varchar(50),c_varchar),convert(nchar(50),c_nchar50),convert(nvarchar(50),c_nvarchar),convert(int,c_int),convert(smallint,c_smallint),convert(tinyint,c_tinyint),convert(bigint,c_bigint),convert(decimal(10,4),c_decimal),convert(numeric(10,4),c_numeric),convert(float,c_float),convert(real,c_real),convert(money,c_money),convert(smallmoney,c_smallmoney),convert(bit,c_bit),convert(date,c_date),convert(time,c_time),convert(datetime,c_datetime),convert(datetime2,c_datetime2),convert(smalldatetime,c_smalldatetime),convert(datetimeoffset,c_datetimeoffset),convert(binary,c_binary),convert(varbinary,c_varbinary),convert(varchar(50),c_hierarchyid) from dbo.i2_variant003 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_variant003');
go

case 050 "数据：sql_variant类型添加列 " 0
before:
drop table dbo.i2_variant004;
go
src_sql:
create table dbo.i2_variant004 (
	no int primary key,
	c_unique     sql_variant DEFAULT newID(),
    c_char20     sql_variant default 'def',
    c_varchar    sql_variant not null,
	c_nchar50    sql_variant,
    c_nvarchar   sql_variant,
    c_int        sql_variant default 0 not null,
	c_smallint   sql_variant,
	c_tinyint    sql_variant check (c_tinyint>=30 and c_tinyint<=180),
	c_bigint     sql_variant,
	c_decimal    sql_variant,
	c_numeric	 sql_variant,
	c_float      sql_variant,
	c_real       sql_variant,
	c_money      sql_variant,
	c_smallmoney sql_variant,
	c_bit        sql_variant,
	c_datetime2  sql_variant,
	c_smalldatetime  sql_variant,
	c_datetimeoffset sql_variant,
	c_binary     sql_variant,
	c_varbinary  sql_variant,
	c_hierarchyid  sql_variant
	);
insert into dbo.i2_variant004 values (1,newid(),'fang56789','AA101','GHjjjjjjjjj','上海英方股份有限公司测试用例1',10,9999,81,67891,2020.88,500.6789,300.45,500.6789,100.23,300.45,1,
convert(datetime2,'2048-06-01 20:51:24.99999',21),
convert(smalldatetime,'2000-12-05 12:00:00',20),
CONVERT(datetimeoffset,SYSDATETIMEOFFSET()),
0x1f,0x111111111,'/1/2/3/');
insert into dbo.i2_variant004 values (2,newid(),'yuan56789','AA102','GHjjjjjjjjj','上海英方股份有限公司测试用例2',10,9999,91,67891,2020.88,500.6789,300.45,500.6789,100.23,300.45,1,
convert(datetime2,'2048-06-01 20:51:24.99999',21),
convert(smalldatetime,'2000-12-05 12:00:00',20),
CONVERT(datetimeoffset,SYSDATETIMEOFFSET()),
0x2f,0x111111111,'/1/2/3/');
alter table dbo.i2_variant004 add c_date sql_variant,c_time sql_variant;
alter table dbo.i2_variant004 add c_datetime sql_variant;
insert into dbo.i2_variant004 values (3,newid(),'chang56789','AA103','GHjjjjjjjjj','上海英方股份有限公司测试用例4',10,9999,101,67891,2020.88,500.6789,300.45,500.6789,100.23,300.45,1,
convert(datetime2,'2048-06-01 20:51:24.99999',21),
convert(smalldatetime,'2000-12-05 12:00:00',20),
CONVERT (datetimeoffset,SYSDATETIMEOFFSET()),
0x3f,0x111111111,'/1/2/3/',
convert(date,SYSDATETIME()),
convert(time,SYSDATETIME()),
convert(datetime,'1999-12-12 14:31:56.333',20)
);
insert into dbo.i2_variant004(no,c_varchar,c_tinyint) values ( 4,'AA104',111);
update dbo.i2_variant004 set c_date='2020-01-02',c_datetime='2021-02-03' where no=2;
delete from i2_variant004 where no=1;
go
tgt_sql: (1)
select no,convert(uniqueidentifier,c_unique),convert(char(20),c_char20),convert(varchar(50),c_varchar),convert(nchar(50),c_nchar50),convert(nvarchar(50),c_nvarchar),convert(int,c_int),convert(smallint,c_smallint),convert(tinyint,c_tinyint),convert(bigint,c_bigint),convert(decimal(10,4),c_decimal),convert(numeric(10,4),c_numeric),convert(float,c_float),convert(real,c_real),convert(money,c_money),convert(smallmoney,c_smallmoney),convert(bit,c_bit),convert(datetime2,c_datetime2),convert(smalldatetime,c_smalldatetime),convert(datetimeoffset,c_datetimeoffset),convert(binary,c_binary),convert(varbinary,c_varbinary),convert(varchar(50),c_hierarchyid),convert(date,c_date),convert(time,c_time),convert(datetime,c_datetime) from dbo.i2_variant004 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_variant004');
go

case 051 "数据：sql_variant类型删除列 " 0
before:
drop table dbo.i2_variant005;
go
src_sql:
create table dbo.i2_variant005 (
	no int primary key,
	c_unique     sql_variant DEFAULT newID(),
    c_char20     sql_variant default 'def',
    c_varchar    sql_variant not null,
	c_nchar50    sql_variant,
    c_nvarchar   sql_variant,
    c_int        sql_variant default 0 not null,
	c_smallint   sql_variant,
	c_tinyint    sql_variant check (c_tinyint>=30 and c_tinyint<=180),
	c_bigint     sql_variant,
	c_decimal    sql_variant,
	c_numeric	 sql_variant,
	c_float      sql_variant,
	c_real       sql_variant,
	c_money      sql_variant,
	c_smallmoney sql_variant,
	c_bit        sql_variant,
	c_date       sql_variant,
	c_time       sql_variant,
	c_datetime	 sql_variant,
	c_datetime2  sql_variant,
	c_smalldatetime  sql_variant,
	c_datetimeoffset sql_variant,
	c_binary     sql_variant,
	c_varbinary  sql_variant,
	c_hierarchyid  sql_variant
	);
insert into dbo.i2_variant005 values (1,newid(),'fang56789','AA101','GHjjjjjjjjj','上海英方股份有限公司测试用例1',10,9999,81,67891,2020.88,500.6789,300.45,500.6789,100.23,300.45,1,
convert(date,SYSDATETIME()),
convert(time,SYSDATETIME()),
convert(datetime,'1999-12-12 14:31:56.333',20),
convert(datetime2,'2048-06-01 20:51:24.99999',21),
convert(smalldatetime,'2000-12-05 12:00:00',20),
CONVERT (datetimeoffset,SYSDATETIMEOFFSET()),
0x1f,0x111111111,'/1/2/3/');
insert into dbo.i2_variant005 values (2,newid(),'yuan56789','AA102','GHjjjjjjjjj','上海英方股份有限公司测试用例2',10,9999,91,67891,2020.88,500.6789,300.45,500.6789,100.23,300.45,1,
convert(date,SYSDATETIME()),
convert(time,SYSDATETIME()),
convert(datetime,'1999-12-12 14:31:56.333',20),
convert(datetime2,'2048-06-01 20:51:24.99999',21),
convert(smalldatetime,'2000-12-05 12:00:00',20),
CONVERT (datetimeoffset,SYSDATETIMEOFFSET()),
0x2f,0x111111111,'/1/2/3/');
alter table dbo.i2_variant005 drop column c_binary;
alter table dbo.i2_variant005 drop column c_varbinary,c_hierarchyid;
insert into dbo.i2_variant005 values (3,newid(),'chang56789','AA103','GHjjjjjjjjj','上海英方股份有限公司测试用例4',10,9999,101,67891,2020.88,500.6789,300.45,500.6789,100.23,300.45,1,
convert(date,SYSDATETIME()),
convert(time,SYSDATETIME()),
convert(datetime,'1999-12-12 14:31:56.333',20),
convert(datetime2,'2048-06-01 20:51:24.99999',21),
convert(smalldatetime,'2000-12-05 12:00:00',20),
convert(datetimeoffset,SYSDATETIMEOFFSET())
);
insert into dbo.i2_variant005(no,c_varchar,c_tinyint) values ( 4,'AA104',111);
update dbo.i2_variant005 set c_date='2020-01-02',c_datetime='2021-02-03 17:18:19' where no=2;
delete from i2_variant005 where no=1;
go

tgt_sql: (1)
select no,convert(uniqueidentifier,c_unique),convert(char(20),c_char20),convert(varchar(50),c_varchar),convert(nchar(50),c_nchar50),convert(nvarchar(50),c_nvarchar),convert(int,c_int),convert(smallint,c_smallint),convert(tinyint,c_tinyint),convert(bigint,c_bigint),convert(decimal(10,4),c_decimal),convert(numeric(10,4),c_numeric),convert(float,c_float),convert(real,c_real),convert(money,c_money),convert(smallmoney,c_smallmoney),convert(bit,c_bit),convert(date,c_date),convert(time,c_time),convert(datetime,c_datetime),convert(datetime2,c_datetime2),convert(smalldatetime,c_smalldatetime),convert(datetimeoffset,c_datetimeoffset) from dbo.i2_variant005 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_variant005');
go

case 052 "数据：sql_variant类型重命名表 " 0
before:
drop table dbo.i2_variant006;
drop table dbo.i2_variant006_renew;
go
src_sql:
create table dbo.i2_variant006 (
	no int primary key,
	c_unique     sql_variant DEFAULT newID(),
    c_char20     sql_variant default 'def',
    c_varchar    sql_variant not null,
	c_nchar50    sql_variant,
    c_nvarchar   sql_variant,
    c_int        sql_variant default 0 not null,
	c_smallint   sql_variant,
	c_tinyint    sql_variant check (c_tinyint>=30 and c_tinyint<=180),
	c_bigint     sql_variant,
	c_decimal    sql_variant,
	c_numeric	 sql_variant,
	c_float      sql_variant,
	c_real       sql_variant,
	c_money      sql_variant,
	c_smallmoney sql_variant,
	c_bit        sql_variant,
	c_date       sql_variant,
	c_time       sql_variant,
	c_datetime	 sql_variant,
	c_datetime2  sql_variant,
	c_smalldatetime  sql_variant,
	c_datetimeoffset sql_variant,
	c_binary     sql_variant,
	c_varbinary  sql_variant,
	c_hierarchyid  sql_variant
	);
sleep(4000);
insert into dbo.i2_variant006 values (1,newid(),'fang56789','AA101','GHjjjjjjjjj','上海英方股份有限公司测试用例1',10,9999,81,67891,2020.88,500.6789,300.45,500.6789,100.23,300.45,1,
convert(date,SYSDATETIME()),
convert(time,SYSDATETIME()),
convert(datetime,'1999-12-12 14:31:56.333',20),
convert(datetime2,'2048-06-01 20:51:24.99999',21),
convert(smalldatetime,'2000-12-05 12:00:00',20),
CONVERT (datetimeoffset,SYSDATETIMEOFFSET()),
0x1f,0x111111111,'/1/2/3/');
insert into dbo.i2_variant006 values (2,newid(),'yuan56789','AA102','GHjjjjjjjjj','上海英方股份有限公司测试用例2',10,9999,91,67891,2020.88,500.6789,300.45,500.6789,100.23,300.45,1,
convert(date,SYSDATETIME()),
convert(time,SYSDATETIME()),
convert(datetime,'1999-12-12 14:31:56.333',20),
convert(datetime2,'2048-06-01 20:51:24.99999',21),
convert(smalldatetime,'2000-12-05 12:00:00',20),
CONVERT (datetimeoffset,SYSDATETIMEOFFSET()),
0x2f,0x111111111,'/1/2/3/');
exec sp_rename 'dbo.i2_variant006','i2_variant006_renew';
insert into i2_variant006_renew values (3,newid(),'chang56789','AA103','GHjjjjjjjjj','上海英方股份有限公司测试用例4',10,9999,101,67891,2020.88,500.6789,300.45,500.6789,100.23,300.45,1,
convert(date,SYSDATETIME()),
convert(time,SYSDATETIME()),
convert(datetime,'1999-12-12 14:31:56.333',20),
convert(datetime2,'2048-06-01 20:51:24.99999',21),
convert(smalldatetime,'2000-12-05 12:00:00',20),
CONVERT (datetimeoffset,SYSDATETIMEOFFSET()),
0x3f,0x111111111,'/1/2/3/');
insert into i2_variant006_renew(no,c_varchar,c_tinyint) values ( 4,'AA104',111);
update dbo.i2_variant006_renew set c_date='2020-01-02',c_datetime='2021-02-03 17:18:19' where no=2;
delete from i2_variant006_renew where no=1;
go

tgt_sql: (1)
select no,convert(uniqueidentifier,c_unique),convert(char(20),c_char20),convert(varchar(50),c_varchar),convert(nchar(50),c_nchar50),convert(nvarchar(50),c_nvarchar),convert(int,c_int),convert(smallint,c_smallint),convert(tinyint,c_tinyint),convert(bigint,c_bigint),convert(decimal(10,4),c_decimal),convert(numeric(10,4),c_numeric),convert(float,c_float),convert(real,c_real),convert(money,c_money),convert(smallmoney,c_smallmoney),convert(bit,c_bit),convert(date,c_date),convert(time,c_time),convert(datetime,c_datetime),convert(datetime2,c_datetime2),convert(smalldatetime,c_smalldatetime),convert(datetimeoffset,c_datetimeoffset),convert(binary,c_binary),convert(varbinary,c_varbinary),convert(varchar(50),c_hierarchyid) from dbo.i2_variant006_renew order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_variant006_renew');
go

case 148 "数据：sql_variant类型重命名列 " 0
before:
drop table dbo.i2_variant007;
go
src_sql:
create table dbo.i2_variant007 (
	no int primary key,
	c_unique     sql_variant DEFAULT newID(),
    c_char20     sql_variant default 'def',
    c_varchar    sql_variant not null,
	c_nchar50    sql_variant,
    c_nvarchar   sql_variant,
    c_int        sql_variant default 0 not null,
	c_smallint   sql_variant,
	c_tinyint    sql_variant check (c_tinyint>=30 and c_tinyint<=180),
	c_bigint     sql_variant,
	c_decimal    sql_variant,
	c_numeric	 sql_variant,
	c_float      sql_variant,
	c_real       sql_variant,
	c_money      sql_variant,
	c_smallmoney sql_variant,
	c_bit        sql_variant,
	c_datetime2  sql_variant,
	c_smalldatetime  sql_variant,
	c_datetimeoffset sql_variant,
	c_binary     sql_variant,
	c_varbinary  sql_variant,
	c_hierarchyid  sql_variant
	);
insert into dbo.i2_variant007 values (1,newid(),'fang56789','AA101','GHjjjjjjjjj','上海英方股份有限公司测试用例1',10,9999,81,67891,2020.88,500.6789,300.45,500.6789,100.23,300.45,1,
convert(datetime2,'2048-06-01 20:51:24.99999',21),
convert(smalldatetime,'2000-12-05 12:00:00',20),
CONVERT(datetimeoffset,SYSDATETIMEOFFSET()),
0x1f,0x111111111,'/1/2/3/');
insert into dbo.i2_variant007 values (2,newid(),'yuan56789','AA102','GHjjjjjjjjj','上海英方股份有限公司测试用例2',10,9999,91,67891,2020.88,500.6789,300.45,500.6789,100.23,300.45,1,
convert(datetime2,'2048-06-01 20:51:24.99999',21),
convert(smalldatetime,'2000-12-05 12:00:00',20),
CONVERT(datetimeoffset,SYSDATETIMEOFFSET()),
0x2f,0x111111111,'/1/2/3/');
alter table dbo.i2_variant007 add c_date sql_variant,c_time sql_variant;
alter table dbo.i2_variant007 add c_datetime sql_variant;
exec sp_rename 'dbo.i2_variant007.c_date','c_date_n','COLUMN';
exec sp_rename 'dbo.i2_variant007.c_time','c_time_n','COLUMN';
exec sp_rename 'dbo.i2_variant007.c_datetime','c_datetime_n','COLUMN';
insert into dbo.i2_variant007 values (3,newid(),'chang56789','AA103','GHjjjjjjjjj','上海英方股份有限公司测试用例4',10,9999,101,67891,2020.88,500.6789,300.45,500.6789,100.23,300.45,1,
convert(datetime2,'2048-06-01 20:51:24.99999',21),
convert(smalldatetime,'2000-12-05 12:00:00',20),
CONVERT (datetimeoffset,SYSDATETIMEOFFSET()),
0x3f,0x111111111,'/1/2/3/',
convert(date,SYSDATETIME()),
convert(time,SYSDATETIME()),
convert(datetime,'2009-12-12 14:31:56.333',20)
);
insert into dbo.i2_variant007(no,c_varchar,c_tinyint) values ( 4,'AA104',111);
update dbo.i2_variant007 set c_date_n='2020-01-02',c_datetime_n='2021-02-03 12:13:14' where no=2;
delete from i2_variant007 where no=1;
go
tgt_sql: (1)
select no,convert(uniqueidentifier,c_unique),convert(char(20),c_char20),convert(varchar(50),c_varchar),convert(nchar(50),c_nchar50),convert(nvarchar(50),c_nvarchar),convert(int,c_int),convert(smallint,c_smallint),convert(tinyint,c_tinyint),convert(bigint,c_bigint),convert(decimal(10,4),c_decimal),convert(numeric(10,4),c_numeric),convert(float,c_float),convert(real,c_real),convert(money,c_money),convert(smallmoney,c_smallmoney),convert(bit,c_bit),convert(datetime2,c_datetime2),convert(smalldatetime,c_smalldatetime),convert(datetimeoffset,c_datetimeoffset),convert(binary,c_binary),convert(varbinary,c_varbinary),convert(varchar(50),c_hierarchyid),convert(date,c_date_n),convert(time,c_time_n),convert(datetime,c_datetime_n) from dbo.i2_variant007 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_variant007');
go