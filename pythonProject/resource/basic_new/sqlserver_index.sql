case 01 "创建聚集索引" 0
before:
drop table test_idx1;
go
src_sql:
create table test_idx1
     (
         S_Id        int not null,
         S_StuNo        varchar(50)        not null,
         S_Name        varchar(20)        not null,
         S_Sex        varchar(10)        not null,
         S_Height    varchar(10)        null,
         S_BirthDate        varchar(30)        null
     );
CREATE CLUSTERED INDEX test_idx1_1 ON dbo.test_idx1 (S_Id);
insert into test_idx1(S_Id,S_StuNo,S_Name,S_Sex,S_Height) values (1,'001','项羽','男','190');
insert into test_idx1(S_Id,S_StuNo,S_Name,S_Sex,S_Height) values (2,'002','刘邦','男','170');
alter index test_idx1_1 ON dbo.test_idx1 rebuild;
insert into test_idx1(S_Id,S_StuNo,S_Name,S_Sex,S_Height) values (3,'003','貂蝉','女','180');
insert into test_idx1(S_Id,S_StuNo,S_Name,S_Sex,S_Height) values (4,'004','天明','男','155');
insert into test_idx1(S_Id,S_StuNo,S_Name,S_Sex,S_Height) values (5,'005','少司命','女','175');
insert into test_idx1(S_Id,S_StuNo,S_Name,S_Sex,S_Height) values (6,'006','王震','男','172');
update test_idx1 set S_BirthDate='1989-04-30' where S_Id=2;
delete from test_idx1 where S_Id=3;
drop index test_idx1_1 on dbo.test_idx1;
CREATE CLUSTERED index test_idx1_2 on dbo.test_idx1 (S_Id);
insert into test_idx1(S_Id,S_StuNo,S_Name,S_Sex,S_Height) values (7,'007','工藤','男','175');
insert into test_idx1(S_Id,S_StuNo,S_Name,S_Sex,S_Height) values (8,'008','柯南','男','152');
update test_idx1 set S_BirthDate='1993-01-30',S_Height='172' where S_Id=1;
delete from test_idx1 where S_Id=6;
go

tgt_sql:
select * from test_idx1 order by S_Id;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('test_idx1') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='test_idx1'  ORDER BY   c.name,a.name,d.name;
go

case 02 "创建唯一聚集索引" 0

before:
drop table test_idx2;
go
src_sql:
create table test_idx2
     (
         S_Id        int not null,
         S_StuNo        varchar(50)        not null,
         S_Name        varchar(20)        not null,
         S_Sex        varchar(10)        not null,
         S_Height    varchar(10)        null,
         S_BirthDate        varchar(30)        null
     );
CREATE UNIQUE CLUSTERED INDEX test_idx2_1 ON dbo.test_idx2 (S_Id);
insert into test_idx2(S_Id,S_StuNo,S_Name,S_Sex,S_Height) values (1,'001','项羽','男','190');
insert into test_idx2(S_Id,S_StuNo,S_Name,S_Sex,S_Height) values (2,'002','刘邦','男','170');
alter index test_idx2_1 ON dbo.test_idx2 rebuild;
insert into test_idx2(S_Id,S_StuNo,S_Name,S_Sex,S_Height) values (3,'003','貂蝉','女','180');
insert into test_idx2(S_Id,S_StuNo,S_Name,S_Sex,S_Height) values (4,'004','天明','男','155');
insert into test_idx2(S_Id,S_StuNo,S_Name,S_Sex,S_Height) values (5,'005','少司命','女','175');
insert into test_idx2(S_Id,S_StuNo,S_Name,S_Sex,S_Height) values (6,'006','王震','男','172');
update test_idx2 set S_BirthDate='1989-04-30' where S_Id=2;
delete from test_idx2 where S_Id=3;
drop index test_idx2_1 on dbo.test_idx2;
CREATE UNIQUE CLUSTERED INDEX test_idx2_2 ON dbo.test_idx2 (S_Id);
insert into test_idx2(S_Id,S_StuNo,S_Name,S_Sex,S_Height) values (7,'007','工藤','男','175');
insert into test_idx2(S_Id,S_StuNo,S_Name,S_Sex,S_Height) values (8,'008','柯南','男','152');
update test_idx2 set S_BirthDate='1993-01-30',S_Height='172' where S_Id=1;
delete from test_idx2 where S_Id=6;
go

tgt_sql:
select * from test_idx2 order by S_Id;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('test_idx2') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='test_idx2'  ORDER BY   c.name,a.name,d.name;
go


case 03 "创建唯一非聚集索引" 0
before:
drop table test_idx3;
go
src_sql:
create table test_idx3
     (
         S_Id        int not null identity(1,1) primary key,    --设置为主键和自增长列，起始值为1，每次自增1
         S_StuNo        varchar(50)        not null,
         S_Name        varchar(20)        not null,
         S_Sex        varchar(10)        not null,
         S_Height    varchar(10)        null,
         S_BirthDate        varchar(30)        null
     );
insert into test_idx3(S_StuNo,S_Name,S_Sex,S_Height) values ('001','项羽','男','190');
insert into test_idx3(S_StuNo,S_Name,S_Sex,S_Height) values ('002','刘邦','男','170');
insert into test_idx3(S_StuNo,S_Name,S_Sex,S_Height) values ('003','貂蝉','女','180');
insert into test_idx3(S_StuNo,S_Name,S_Sex,S_Height) values ('004','天明','男','155');
insert into test_idx3(S_StuNo,S_Name,S_Sex,S_Height) values ('005','少司命','女','175');
create unique nonclustered        --表示创建唯一非聚集索引
index test_idx3_1        --索引名称
on test_idx3(S_StuNo);     --数据表名称（建立索引的列名）
drop index test_idx3_1 on test_idx3;
create unique nonclustered index test_idx3_2 on test_idx3(S_StuNo);
update test_idx2 set S_Height='160' where S_StuNo='004';
delete from test_idx2 where S_StuNo='005';
go

tgt_sql:
select * from test_idx3 order by S_Id;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('test_idx3') order by name;
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('test_idx2') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='test_idx3'  ORDER BY   c.name,a.name,d.name;
go

case 04 "创建不唯一非聚集索引" 0
before:
drop table test_idx4;
go
src_sql:
create table test_idx4
     (
         S_Id        int not null identity(1,1) primary key,    --设置为主键和自增长列，起始值为1，每次自增1
         S_StuNo        varchar(50)        not null,
         S_Name        varchar(20)        not null,
         S_Sex        varchar(10)        not null,
         S_Height    varchar(10)        null,
         S_BirthDate        varchar(30)        null
     );
insert into test_idx4(S_StuNo,S_Name,S_Sex,S_Height) values ('001','项羽','男','190');
insert into test_idx4(S_StuNo,S_Name,S_Sex,S_Height) values ('002','刘邦','男','170');
insert into test_idx4(S_StuNo,S_Name,S_Sex,S_Height) values ('003','貂蝉','女','180');
insert into test_idx4(S_StuNo,S_Name,S_Sex,S_Height) values ('004','天明','男','155');
insert into test_idx4(S_StuNo,S_Name,S_Sex,S_Height) values ('005','少司命','女','175');
create nonclustered index test_idx4_1 on test_idx4(S_StuNo);
drop index test_idx4_1 on dbo.test_idx4;
create nonclustered index test_idx4_2 on test_idx4(S_StuNo);
alter table test_idx4 add constraint df_s4 default '男' for S_Sex;
go

tgt_sql:
select * from test_idx4 order by S_Id;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('test_idx4') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='test_idx4'  ORDER BY   c.name,a.name,d.name;
go

case 05 "创建非聚集复合索引" 0
before:
drop table test_idx5;
go
src_sql:
create table test_idx5
     (
         S_Id        int not null identity(1,1) primary key,    --设置为主键和自增长列，起始值为1，每次自增1
         S_StuNo        varchar(50)        not null,
         S_Name        varchar(20)        not null,
         S_Sex        varchar(10)        not null,
         S_Height    varchar(10)        null,
         S_BirthDate        varchar(30)        null
     );
insert into test_idx5(S_StuNo,S_Name,S_Sex,S_Height) values ('001','项羽','男','190');
insert into test_idx5(S_StuNo,S_Name,S_Sex,S_Height) values ('002','刘邦','男','170');
insert into test_idx5(S_StuNo,S_Name,S_Sex,S_Height) values ('003','貂蝉','女','180');
insert into test_idx5(S_StuNo,S_Name,S_Sex,S_Height) values ('004','天明','男','155');
insert into test_idx5(S_StuNo,S_Name,S_Sex,S_Height) values ('005','少司命','女','175');
create nonclustered index test_idx5_1
on test_idx5(S_StuNo,S_Name);
update test_idx5 set S_Height='160' where S_StuNo='004' and S_Name='天明';
delete from test_idx5 where S_StuNo='005' and S_Name='少司命';
go

tgt_sql:
select * from test_idx5 order by S_Id;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('test_idx5') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='test_idx5'  ORDER BY   c.name,a.name,d.name;
go

case 06 "创建非聚集覆盖索引" 0
before:
drop table test_idx6;
go
src_sql:
create table test_idx6
     (
         S_Id        int not null identity(1,1) primary key,    --设置为主键和自增长列，起始值为1，每次自增1
         S_StuNo        varchar(50)        not null,
         S_Name        varchar(20)        not null,
         S_Sex        varchar(10)        not null,
         S_Height    varchar(10)        null,
         S_BirthDate        varchar(30)        null
     );
insert into test_idx6(S_StuNo,S_Name,S_Sex,S_Height) values ('001','项羽','男','190');
insert into test_idx6(S_StuNo,S_Name,S_Sex,S_Height) values ('002','刘邦','男','170');
insert into test_idx6(S_StuNo,S_Name,S_Sex,S_Height) values ('003','貂蝉','女','180');
insert into test_idx6(S_StuNo,S_Name,S_Sex,S_Height) values ('004','天明','男','155');
insert into test_idx6(S_StuNo,S_Name,S_Sex,S_Height) values ('005','少司命','女','175');
create index test_idx6_1
on test_idx6(S_StuNo)
include (S_Name,S_Height);
update test_idx6 set S_Height='163' where S_StuNo='004';
delete from test_idx6 where S_StuNo='005';
go

tgt_sql:
select * from test_idx6 order by S_Id;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('test_idx6') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='test_idx6'  ORDER BY   c.name,a.name,d.name;
go


case 07 "没有聚集索引，只有唯一非聚集索引"
before:
drop table test_idx7;
go
src_sql:
create table test_idx7
     (
         S_Id        int,
         S_StuNo     varchar(50) not null,
         S_Name      varchar(20),
         S_Sex       varchar(10),
         S_Height    varchar(10),
         S_BirthDate varchar(30)
     );
sleep (3000);
insert into test_idx7(S_Id,S_StuNo,S_Name,S_Sex,S_Height) values (1,'001','项羽','男','190');
insert into test_idx7(S_Id,S_StuNo,S_Name,S_Sex,S_Height) values (2,'002','刘邦','男','170');
insert into test_idx7(S_Id,S_StuNo,S_Name,S_Sex,S_Height) values (3,'003','貂蝉','女','180');
insert into test_idx7(S_Id,S_StuNo,S_Name,S_Sex,S_Height) values (4,'004','天明','男','155');
insert into test_idx7(S_Id,S_StuNo,S_Name,S_Sex,S_Height) values (5,'005','少司命','女','175');
create unique nonclustered        --表示创建唯一非聚集索引
index test_idx7_1        --索引名称
on test_idx7(S_StuNo);       --数据表名称（建立索引的列名）
alter table test_idx7 add constraint height1 default '150' for S_Height;
alter table test_idx7 add constraint sex1 check (S_Sex='男' or S_Sex='女');
update test_idx7 set S_Height='160' where S_StuNo='004';
delete from test_idx7 where S_StuNo='005';
go

tgt_sql:
select * from test_idx7 order by S_Id;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('test_idx7') order by name;
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('test_idx7') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='test_idx3'  ORDER BY   c.name,a.name,d.name;
go

case 08 "创建xml索引"
before:
drop table test_idx8;
go
src_sql:
CREATE TABLE test_idx8
　　(
    　　Id int primary key,
    　　Info xml
　　);
go
INSERT into test_idx8 VALUES(1,'<Person><ID>1</ID><Name>刘备</Name></Person>');
INSERT into test_idx8 VALUES(2,'<Person><ID>2</ID><Name>关羽</Name></Person>');
INSERT into test_idx8 VALUES(3,'<Person><ID>3</ID><Name>张飞</Name></Person>');
create primary xml index test_idx8_1 on test_idx8 ( Info );
create xml index test_idx8_Path on test_idx8 ( Info ) using xml index test_idx8_1 for path;
create xml index test_idx8_Property on test_idx8 ( Info ) using xml index test_idx8_1 for property;
create xml index test_idx8_value on test_idx8 ( Info ) using xml index test_idx8_1 for value;
alter index test_idx8_1 on test_idx8 rebuild;
alter index test_idx8_Path on test_idx8 rebuild;
alter index test_idx8_Property on test_idx8 rebuild;
alter index test_idx8_value on test_idx8 rebuild;
go
tgt_sql:
select * from test_idx8 order by Id ;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('test_idx8') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='test_idx8'  ORDER BY   c.name,a.name,d.name;
select index_id,name,using_xml_index_id,secondary_type,secondary_type_desc from sys.xml_indexes;
go

case 09 "创建唯一聚集索引,带 identity" 0
before:
drop table test_idx9;
go
src_sql:
create table test_idx9
     (
         S_Id        int not null identity(1,1),    --设置为主键和自增长列，起始值为1，每次自增1
         S_StuNo        varchar(50)        not null,
         S_Name        varchar(20)        not null,
         S_Sex        varchar(10)        not null,
         S_Height    varchar(10)        null,
         S_BirthDate        varchar(30)        null
     );
sleep (3000);
insert into test_idx9(S_StuNo,S_Name,S_Sex,S_Height) values ('001','项羽','男','190');
insert into test_idx9(S_StuNo,S_Name,S_Sex,S_Height) values ('002','刘邦','男','170');
insert into test_idx9(S_StuNo,S_Name,S_Sex,S_Height) values ('003','貂蝉','女','180');
insert into test_idx9(S_StuNo,S_Name,S_Sex,S_Height) values ('004','天明','男','155');
insert into test_idx9(S_StuNo,S_Name,S_Sex,S_Height) values ('005','少司命','女','175');
create unique CLUSTERED index test_idx9_1 on test_idx9(S_StuNo);
update test_idx9 set S_Height='160' where S_StuNo='004';
delete from test_idx9 where S_StuNo='005';
go

tgt_sql:
select * from test_idx9 order by S_Id;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('test_idx9') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='test_idx9'  ORDER BY   c.name,a.name,d.name;
go