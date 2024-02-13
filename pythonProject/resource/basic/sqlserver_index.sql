case 083 "唯一聚集索引" 0
before:
drop table Student;
go
src_sql:
create table Student
     (
         S_Id        int not null,
         S_StuNo        varchar(50)        not null,
         S_Name        varchar(20)        not null,
         S_Sex        varchar(10)        not null,
         S_Height    varchar(10)        null,
         S_BirthDate        varchar(30)        null
     );
CREATE UNIQUE CLUSTERED INDEX idx_stu ON dbo.Student (S_Id);
insert into Student(S_Id,S_StuNo,S_Name,S_Sex,S_Height) values (1,'001','项羽','男','190');
insert into Student(S_Id,S_StuNo,S_Name,S_Sex,S_Height) values (2,'002','刘邦','男','170');
alter index idx_stu ON dbo.Student rebuild;
insert into Student(S_Id,S_StuNo,S_Name,S_Sex,S_Height) values (3,'003','貂蝉','女','180');
insert into Student(S_Id,S_StuNo,S_Name,S_Sex,S_Height) values (4,'004','天明','男','155');
insert into Student(S_Id,S_StuNo,S_Name,S_Sex,S_Height) values (5,'005','少司命','女','175');
insert into Student(S_Id,S_StuNo,S_Name,S_Sex,S_Height) values (6,'006','王震','男','172');
update Student set S_BirthDate='1989-04-30' where S_Id=2;
delete from Student where S_Id=3;
drop index idx_stu on dbo.Student;
CREATE UNIQUE CLUSTERED INDEX idx_stu ON dbo.Student (S_Id);
insert into Student(S_Id,S_StuNo,S_Name,S_Sex,S_Height) values (7,'007','工藤','男','175');
insert into Student(S_Id,S_StuNo,S_Name,S_Sex,S_Height) values (8,'008','柯南','男','152');
update Student set S_BirthDate='1993-01-30',S_Height='172' where S_Id=1;
delete from Student where S_Id=6;
go

tgt_sql:
select * from Student order by S_Id;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('Student') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='Student'  ORDER BY   c.name,a.name,d.name;
go

case 084 "创建不唯一非聚集索引" 0
before:
drop table Student1;
go
src_sql:
create table Student1
     (
         S_Id        int not null identity(1,1) primary key,    --设置为主键和自增长列，起始值为1，每次自增1
         S_StuNo        varchar(50)        not null,
         S_Name        varchar(20)        not null,
         S_Sex        varchar(10)        not null,
         S_Height    varchar(10)        null,
         S_BirthDate        varchar(30)        null
     );
insert into Student1(S_StuNo,S_Name,S_Sex,S_Height) values ('001','项羽','男','190');
insert into Student1(S_StuNo,S_Name,S_Sex,S_Height) values ('002','刘邦','男','170');
insert into Student1(S_StuNo,S_Name,S_Sex,S_Height) values ('003','貂蝉','女','180');
insert into Student1(S_StuNo,S_Name,S_Sex,S_Height) values ('004','天明','男','155');
insert into Student1(S_StuNo,S_Name,S_Sex,S_Height) values ('005','少司命','女','175');
create nonclustered index NonClu_Index1 on Student1(S_StuNo);
drop index NonClu_Index1 on dbo.Student1;
create nonclustered index NonClu_Index1 on Student1(S_StuNo);
alter table Student1 add constraint df_s1 default '男' for S_Sex;
go

tgt_sql:
select * from Student1 order by S_Id;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('Student1') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='Student1'  ORDER BY   c.name,a.name,d.name;
go

case 085 "创建唯一非聚集索引" 0
before:
drop table Student2;
go
src_sql:
create table Student2
     (
         S_Id        int not null identity(1,1) primary key,    --设置为主键和自增长列，起始值为1，每次自增1
         S_StuNo        varchar(50)        not null,
         S_Name        varchar(20)        not null,
         S_Sex        varchar(10)        not null,
         S_Height    varchar(10)        null,
         S_BirthDate        varchar(30)        null
     );
insert into Student2(S_StuNo,S_Name,S_Sex,S_Height) values ('001','项羽','男','190');
insert into Student2(S_StuNo,S_Name,S_Sex,S_Height) values ('002','刘邦','男','170');
insert into Student2(S_StuNo,S_Name,S_Sex,S_Height) values ('003','貂蝉','女','180');
insert into Student2(S_StuNo,S_Name,S_Sex,S_Height) values ('004','天明','男','155');
insert into Student2(S_StuNo,S_Name,S_Sex,S_Height) values ('005','少司命','女','175');
create unique nonclustered        --表示创建唯一非聚集索引
index UQ_NonClu_StuNo2        --索引名称
on Student2(S_StuNo);     --数据表名称（建立索引的列名）
drop index UQ_NonClu_StuNo2 on Student2;
create unique nonclustered index UQ_NonClu_StuNo2 on Student2(S_StuNo);
update Student2 set S_Height='160' where S_StuNo='004';
delete from Student2 where S_StuNo='005';
go

tgt_sql:
select * from Student2 order by S_Id;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('Student2') order by name;
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('Student2') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='Student2'  ORDER BY   c.name,a.name,d.name;
go

case 086 "没有聚集索引，只有唯一非聚集索引"
before:
drop table Student3;
go
src_sql:
create table Student3
     (
         S_Id        int,
         S_StuNo     varchar(50) not null,
         S_Name      varchar(20),
         S_Sex       varchar(10),
         S_Height    varchar(10),
         S_BirthDate varchar(30)
     );
sleep (3000);
insert into Student3(S_Id,S_StuNo,S_Name,S_Sex,S_Height) values (1,'001','项羽','男','190');
insert into Student3(S_Id,S_StuNo,S_Name,S_Sex,S_Height) values (2,'002','刘邦','男','170');
insert into Student3(S_Id,S_StuNo,S_Name,S_Sex,S_Height) values (3,'003','貂蝉','女','180');
insert into Student3(S_Id,S_StuNo,S_Name,S_Sex,S_Height) values (4,'004','天明','男','155');
insert into Student3(S_Id,S_StuNo,S_Name,S_Sex,S_Height) values (5,'005','少司命','女','175');
create unique nonclustered        --表示创建唯一非聚集索引
index UQ_NonClu_StuNo3        --索引名称
on Student3(S_StuNo);       --数据表名称（建立索引的列名）
alter table Student3 add constraint height1 default '150' for S_Sex;
alter table Student3 add constraint sex1 check (S_Sex='男' or S_Sex='女');
update Student3 set S_Height='160' where S_StuNo='004';
delete from Student3 where S_StuNo='005';
go

tgt_sql:
select * from Student3 order by S_Id;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('Student3') order by name;
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('Student3') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='Student3'  ORDER BY   c.name,a.name,d.name;
go

case 087 "创建唯一聚集索引,带 identity" 0
before:
drop table Student4;
go
src_sql:
create table Student4
     (
         S_Id        int not null identity(1,1),    --设置为主键和自增长列，起始值为1，每次自增1
         S_StuNo        varchar(50)        not null,
         S_Name        varchar(20)        not null,
         S_Sex        varchar(10)        not null,
         S_Height    varchar(10)        null,
         S_BirthDate        varchar(30)        null
     );
sleep (3000);
insert into Student4(S_StuNo,S_Name,S_Sex,S_Height) values ('001','项羽','男','190');
insert into Student4(S_StuNo,S_Name,S_Sex,S_Height) values ('002','刘邦','男','170');
insert into Student4(S_StuNo,S_Name,S_Sex,S_Height) values ('003','貂蝉','女','180');
insert into Student4(S_StuNo,S_Name,S_Sex,S_Height) values ('004','天明','男','155');
insert into Student4(S_StuNo,S_Name,S_Sex,S_Height) values ('005','少司命','女','175');
create unique CLUSTERED index Clu_Index4 on Student4(S_StuNo);
update Student4 set S_Height='160' where S_StuNo='004';
delete from Student4 where S_StuNo='005';
go

tgt_sql:
select * from Student4 order by S_Id;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('Student4') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='Student4'  ORDER BY   c.name,a.name,d.name;
go

case 088 "创建非聚集复合索引" 0
before:
drop table Student5;
go
src_sql:
create table Student5
     (
         S_Id        int not null identity(1,1) primary key,    --设置为主键和自增长列，起始值为1，每次自增1
         S_StuNo        varchar(50)        not null,
         S_Name        varchar(20)        not null,
         S_Sex        varchar(10)        not null,
         S_Height    varchar(10)        null,
         S_BirthDate        varchar(30)        null
     );
insert into Student5(S_StuNo,S_Name,S_Sex,S_Height) values ('001','项羽','男','190');
insert into Student5(S_StuNo,S_Name,S_Sex,S_Height) values ('002','刘邦','男','170');
insert into Student5(S_StuNo,S_Name,S_Sex,S_Height) values ('003','貂蝉','女','180');
insert into Student5(S_StuNo,S_Name,S_Sex,S_Height) values ('004','天明','男','155');
insert into Student5(S_StuNo,S_Name,S_Sex,S_Height) values ('005','少司命','女','175');
create nonclustered index Index_StuNo_SName5
on Student5(S_StuNo,S_Name);
update Student5 set S_Height='160' where S_StuNo='004' and S_Name='天明';
delete from Student5 where S_StuNo='005' and S_Name='少司命';
go

tgt_sql:
select * from Student5 order by S_Id;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('Student5') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='Student5'  ORDER BY   c.name,a.name,d.name;
go

case 089 "创建非聚集覆盖索引" 0
before:
drop table Student6;
go
src_sql:
create table Student6
     (
         S_Id        int not null identity(1,1) primary key,    --设置为主键和自增长列，起始值为1，每次自增1
         S_StuNo        varchar(50)        not null,
         S_Name        varchar(20)        not null,
         S_Sex        varchar(10)        not null,
         S_Height    varchar(10)        null,
         S_BirthDate        varchar(30)        null
     );
insert into Student6(S_StuNo,S_Name,S_Sex,S_Height) values ('001','项羽','男','190');
insert into Student6(S_StuNo,S_Name,S_Sex,S_Height) values ('002','刘邦','男','170');
insert into Student6(S_StuNo,S_Name,S_Sex,S_Height) values ('003','貂蝉','女','180');
insert into Student6(S_StuNo,S_Name,S_Sex,S_Height) values ('004','天明','男','155');
insert into Student6(S_StuNo,S_Name,S_Sex,S_Height) values ('005','少司命','女','175');
create index NonClu_Index6
on Student6(S_StuNo)
include (S_Name,S_Height);
update Student6 set S_Height='163' where S_StuNo='004';
delete from Student6 where S_StuNo='005';
go

tgt_sql:
select * from Student6 order by S_Id;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('Student6') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='Student6'  ORDER BY   c.name,a.name,d.name;
go
