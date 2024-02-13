case 001 "创建无参数存储" 0
before:
drop procedure proc_p1;
drop table proc_t1;
go
src_sql:
create table proc_t1
     (
         S_Id        int        not null    identity(1,1)    primary key,    --设置为主键和自增长列，起始值为1，每次自增1
         S_StuNo        varchar(50)        not null,
         S_Name        varchar(20)        not null,
         S_Sex        varchar(10)        not null,
         S_Height    varchar(10)        null,
         S_BirthDate        varchar(30)        null
     );
insert into proc_t1(S_StuNo,S_Name,S_Sex,S_Height) values ('001','项羽','男','190');
insert into proc_t1(S_StuNo,S_Name,S_Sex,S_Height) values ('002','刘邦','男','170');
insert into proc_t1(S_StuNo,S_Name,S_Sex,S_Height) values ('003','貂蝉','女','180');
insert into proc_t1(S_StuNo,S_Name,S_Sex,S_Height) values ('004','天明','男','155');
insert into proc_t1(S_StuNo,S_Name,S_Sex,S_Height) values ('005','少司命','女','175');

--创建名为 GetStuCou 的无参数存储过程
create procedure proc_p1
as
begin
    select * from proc_t1
end
go
--执行名为 GetStuCou 的无参数存储过程

tgt_sql:
execute proc_p1;
select * from dbo.proc_t1;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('proc_t1');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('proc_t1') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='proc_t1'  ORDER BY   c.name,a.name,d.name;
SELECT Name,Definition FROM sys.sql_modules INNER JOIN sys.all_objects  ON sys.sql_modules.object_id = sys.all_objects.object_id WHERE sys.all_objects.[type] ='P' and name ='proc_p1';
go

case 002 "创建有返回值的存储" 0
before:
drop procedure proc_p2;
drop table proc_t2;
go
src_sql:
create table proc_t2
(
         C_Id        int        not null    identity(1,1)    Primary key,
         C_Name        varchar(100)    not null
 );
insert into proc_t2 (C_Name) values ('英语');
insert into proc_t2 (C_Name) values ('数据');
insert into proc_t2 (C_Name) values ('语文');
create procedure proc_p2
as
begin
insert into proc_t2 (C_Name) values ('物理')
select  SCOPE_IDENTITY ()
end
go
execute proc_p2;
go
tgt_sql:
select * from dbo.proc_t2;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('proc_t2');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('proc_t2') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='proc_t2'  ORDER BY   c.name,a.name,d.name;
SELECT Name,Definition FROM sys.sql_modules INNER JOIN sys.all_objects  ON sys.sql_modules.object_id = sys.all_objects.object_id WHERE sys.all_objects.[type] ='P' and name ='proc_p2';
go

case 003 "创建有输入参数的存储过程" 0
before:
drop procedure proc_p3;
drop table proc_t3;
go
src_sql:
create table proc_t3
     (
         S_Id        int        not null    identity(1,1)    primary key,    --设置为主键和自增长列，起始值为1，每次自增1
         S_StuNo        varchar(50)        not null,
         S_Name        varchar(20)        not null,
         S_Sex        varchar(10)        not null,
         S_Height    varchar(10)        null,
         S_BirthDate        varchar(30)        null
     );
insert into proc_t3(S_StuNo,S_Name,S_Sex,S_Height) values ('001','项羽','男','190');
insert into proc_t3(S_StuNo,S_Name,S_Sex,S_Height) values ('002','刘邦','男','170');
insert into proc_t3(S_StuNo,S_Name,S_Sex,S_Height) values ('003','貂蝉','女','180');
insert into proc_t3(S_StuNo,S_Name,S_Sex,S_Height) values ('004','天明','男','155');
insert into proc_t3(S_StuNo,S_Name,S_Sex,S_Height) values ('005','少司命','女','175');
go
--创建名为 GetStuCou_In 的有输入参数的存储过程
create procedure proc_p3
@StuNo    nvarchar(64)='001'        --设置默认值
as
begin
    select * from proc_t3 where S_StuNo=@StuNo
end
go
tgt_sql:
--执行名为 GetStuCou_In 的有输入参数的存储过程（不传参数，即使用默认值）
execute proc_p3;
--执行名为 GetStuCou_In 的有输入参数的存储过程（传入参数）
execute proc_p3 '005';
select * from dbo.proc_t3;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('proc_t3');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('proc_t3') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='proc_t3'  ORDER BY   c.name,a.name,d.name;
SELECT Name,Definition FROM sys.sql_modules INNER JOIN sys.all_objects  ON sys.sql_modules.object_id = sys.all_objects.object_id WHERE sys.all_objects.[type] ='P' and name ='proc_p3';
go

case 004 "创建有输入输出参数的存储过程" 0
before:
drop procedure proc_p4;
drop table proc_t4;
go
src_sql:
create table proc_t4
     (
         S_Id        int        not null    identity(1,1)    primary key,    --设置为主键和自增长列，起始值为1，每次自增1
         S_StuNo        varchar(50)        not null,
         S_Name        varchar(20)        not null,
         S_Sex        varchar(10)        not null,
         S_Height    varchar(10)        null,
         S_BirthDate        varchar(30)        null
     );
insert into proc_t4(S_StuNo,S_Name,S_Sex,S_Height) values ('001','项羽','男','190');
insert into proc_t4(S_StuNo,S_Name,S_Sex,S_Height) values ('002','刘邦','男','170');
insert into proc_t4(S_StuNo,S_Name,S_Sex,S_Height) values ('003','貂蝉','女','180');
insert into proc_t4(S_StuNo,S_Name,S_Sex,S_Height) values ('004','天明','男','155');
insert into proc_t4(S_StuNo,S_Name,S_Sex,S_Height) values ('005','少司命','女','175');
--创建名为 GetStuCou_Out 的有输入参数和输出参数的存储过程
create procedure proc_p4
@StuNo    nvarchar(64),
@Height nvarchar(32)
as
begin
    if(@StuNo is not null and @StuNo <> '')
    begin
        select @Height=S_Height from proc_t4  where S_StuNo= @StuNo
        select @Height
    end
    else
    begin
        set @Height='185'
        select @Height
    end
end
go
--执行名为 GetStuCou_Out 的有输入参数和输出参数的存储过程

tgt_sql:
execute proc_p4 '005',null;
select * from dbo.proc_t4;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('proc_t4');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('proc_t4') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='proc_t4'  ORDER BY   c.name,a.name,d.name;
SELECT Name,Definition FROM sys.sql_modules INNER JOIN sys.all_objects  ON sys.sql_modules.object_id = sys.all_objects.object_id WHERE sys.all_objects.[type] ='P' and name ='proc_p4';
go

case 005 "创建返回多个结果集的存储过程" 0
before:
drop procedure proc_p5;
drop table proc_t5;
go
src_sql:
create table proc_t5
     (
         S_Id        int        not null    identity(1,1)    primary key,    --设置为主键和自增长列，起始值为1，每次自增1
         S_StuNo        varchar(50)        not null,
         S_Name        varchar(20)        not null,
         S_Sex        varchar(10)        not null,
         S_Height    varchar(10)        null,
         S_BirthDate        varchar(30)        null
     );
insert into proc_t5(S_StuNo,S_Name,S_Sex,S_Height) values ('001','项羽','男','190');
insert into proc_t5(S_StuNo,S_Name,S_Sex,S_Height) values ('002','刘邦','男','170');
insert into proc_t5(S_StuNo,S_Name,S_Sex,S_Height) values ('003','貂蝉','女','180');
insert into proc_t5(S_StuNo,S_Name,S_Sex,S_Height) values ('004','天明','男','155');
insert into proc_t5(S_StuNo,S_Name,S_Sex,S_Height) values ('005','少司命','女','175');
--创建名为 GetStuCou_DSS 的返回多个结果集的存储过程
create procedure proc_p5
@StuNo    nvarchar(64),
@Height  nvarchar(32)
as
begin
    if(@StuNo is not null and @StuNo <> '')
    begin
        select * from proc_t5 where S_StuNo= @StuNo
    end
    if(@Height is not null and @Height <> '')
    begin
        select * from proc_t5 where S_Height= @Height
    end
end
go
--执行名为 GetStuCou_DSS 的返回多个结果集的存储过程
tgt_sql:
execute proc_p5 '005','180';
select * from dbo.proc_t5;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('proc_t5');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('proc_t5') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='proc_t5'  ORDER BY   c.name,a.name,d.name;
SELECT Name,Definition FROM sys.sql_modules INNER JOIN sys.all_objects  ON sys.sql_modules.object_id = sys.all_objects.object_id WHERE sys.all_objects.[type] ='P' and name ='proc_p5';
go

case 006 "存储过程中创建变量、赋值变量、创建表变量和临时表" 0
before:
drop procedure proc_p6;
drop table proc_t6;
go
src_sql:
create table proc_t6
     (
         S_Id        int        not null    identity(1,1)    primary key,    --设置为主键和自增长列，起始值为1，每次自增1
         S_StuNo        varchar(50)        not null,
         S_Name        varchar(20)        not null,
         S_Sex        varchar(10)        not null,
         S_Height    varchar(10)        null,
         S_BirthDate        varchar(30)        null
     );
insert into proc_t6(S_StuNo,S_Name,S_Sex,S_Height) values ('001','项羽','男','190');
insert into proc_t6(S_StuNo,S_Name,S_Sex,S_Height) values ('002','刘邦','男','170');
insert into proc_t6(S_StuNo,S_Name,S_Sex,S_Height) values ('003','貂蝉','女','180');
insert into proc_t6(S_StuNo,S_Name,S_Sex,S_Height) values ('004','天明','男','155');
insert into proc_t6(S_StuNo,S_Name,S_Sex,S_Height) values ('005','少司命','女','175');
--创建名为 GetStuCou_Ext 的返回多个结果集的存储过程
create procedure proc_p6
@StuNo    nvarchar(64),
@Height nvarchar(32)
as
begin
    declare @Var nvarchar(10)    --定义变量
    set @Var='123'        --赋值变量
    --定义表变量
    declare @StuTab table
    (
        ID     int not null primary key,
        StuNo    nvarchar(50) unique,
        Name varchar(50),
        Sex varchar(10),
        Height varchar(10)
    )
    --表变量只能在定义的时候添加约束

    --定义临时表
    create table #Tab
    (
        ID     int not null primary key,
        StuNo    nvarchar(50),
        Name varchar(50),
        Sex varchar(10),
        Height varchar(10)
    )

    alter table #Tab add constraint S_UNIQUE unique(StuNo)

    --临时表可以在之后添加约束

    if(@StuNo is not null and @StuNo <> '')
    begin
        insert into @StuTab(ID,StuNo,Name,Sex,Height)    --把数据插入表变量
        select S_Id,S_StuNo,S_Name,S_Sex,S_Height
        from proc_t6
        where S_StuNo=@StuNo

        insert into #Tab(ID,StuNo,Name,Sex,Height)    --把数据插入临时表
        select S_Id,S_StuNo,S_Name,S_Sex,S_Height
        from proc_t6
        where S_StuNo=@StuNo
    end

    if(@Height is not null and @Height <> '')
    begin
        insert into @StuTab(ID,StuNo,Name,Sex,Height)    --把数据插入表变量
        select S_Id,S_StuNo,S_Name,S_Sex,S_Height
        from proc_t6
        where S_Height=@Height

        insert into #Tab(ID,StuNo,Name,Sex,Height)    --把数据插入临时表
        select S_Id,S_StuNo,S_Name,S_Sex,S_Height
        from proc_t6
        where S_Height=@Height
    end

    SELECT * FROM @StuTab
    select * from #Tab
end
go
--执行名为 GetStuCou_DSS 的返回多个结果集的存储过程
execute proc_p6 '005','170';
go
tgt_sql:
select * from dbo.proc_t6;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('proc_t6');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('proc_t6') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='proc_t6'  ORDER BY   c.name,a.name,d.name;
SELECT Name,Definition FROM sys.sql_modules INNER JOIN sys.all_objects  ON sys.sql_modules.object_id = sys.all_objects.object_id WHERE sys.all_objects.[type] ='P' and name ='proc_p6';
go

case 007 "存储过程执行动态sql" 0
before:
drop procedure proc_p7;
drop table proc_t7;
go
src_sql:
create table proc_t7
     (
         S_Id        int        not null    identity(1,1)    primary key,    --设置为主键和自增长列，起始值为1，每次自增1
         S_StuNo        varchar(50)        not null,
         S_Name        varchar(20)        not null,
         S_Sex        varchar(10)        not null,
         S_Height    varchar(10)        null,
         S_BirthDate        varchar(30)        null
     );
insert into proc_t7(S_StuNo,S_Name,S_Sex,S_Height) values ('001','项羽','男','190');
insert into proc_t7(S_StuNo,S_Name,S_Sex,S_Height) values ('002','刘邦','男','170');
insert into proc_t7(S_StuNo,S_Name,S_Sex,S_Height) values ('003','貂蝉','女','180');
insert into proc_t7(S_StuNo,S_Name,S_Sex,S_Height) values ('004','天明','男','155');
insert into proc_t7(S_StuNo,S_Name,S_Sex,S_Height) values ('005','少司命','女','175');
create proc proc_p7
@StuNo nvarchar(500)
as
begin
    declare @Sql nvarchar(3000)

    if(@StuNo is not null and @StuNo <> '')
    begin
        set @Sql=' select * from proc_t7 where S_StuNo in ('+@StuNo+') '
    end
    exec (@Sql)    --执行动态 sql
end
go
exec proc_p7 '003,004,005';
tgt_sql:
select * from dbo.proc_t7;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('proc_t7');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('proc_t7') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='proc_t7'  ORDER BY   c.name,a.name,d.name;
SELECT Name,Definition FROM sys.sql_modules INNER JOIN sys.all_objects  ON sys.sql_modules.object_id = sys.all_objects.object_id WHERE sys.all_objects.[type] ='P' and name ='proc_p7';
go
