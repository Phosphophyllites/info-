case 001 "blob" 0
before:
drop table blob_t1;
go
src_sql:
create table blob_t1 ( no int primary key,a text,b ntext,c image );
insert into blob_t1 select 1,'012345679809909089','这是一个测试用例INFO',* from OPENROWSET (BULK N'c:\a.jpg' , SINGLE_BLOB ) as c;
insert into blob_t1 select 2,'012345679809909089','这是一个测试用例INFO',* from OPENROWSET (BULK N'c:\a.jpg' , SINGLE_BLOB ) as c;
insert into blob_t1 select 3,'012345679809909039','这是一个测试用例INFO',* from OPENROWSET (BULK N'c:\a.jpg' , SINGLE_BLOB ) as c;
update blob_t1 set c= (select * from OPENROWSET (BULK N'c:\b.jpg' , SINGLE_BLOB ) as c ) where no=2;
update blob_t1 set a=null,b=null,c=null  where no =3
delete from blob_t1 where no=1;
go
tgt_sql:
select * from blob_t1;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('blob_t1');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('blob_t1') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='blob_t1'  ORDER BY   c.name,a.name,d.name;

go

case 002 "clob" 0
before:
drop table clob_t1;
go
src_sql:
CREATE TABLE clob_t1(
 no int primary key NOT NULL,
 txt nvarchar(max) NULL
 );
INSERT INTO clob_t1 SELECT 1,* FROM
 OPENROWSET
    (BULK 'C:/d.txt', SINGLE_NCLOB) AS txt;
INSERT INTO clob_t1 SELECT 2,* FROM
 OPENROWSET
    (BULK 'C:/d.txt', SINGLE_NCLOB) AS txt;
update clob_t1 set txt= (select * FROM
 OPENROWSET
    (BULK 'C:/e.txt', SINGLE_NCLOB) AS txt) where no=2;
delete from clob_t1 where no=1;
go
tgt_sql:
select * from clob_t1;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('clob_t1');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('clob_t1') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='clob_t1'  ORDER BY   c.name,a.name,d.name;
go
case 003 "hugerows" 0
before:
drop table dbo.hugerows;
go
src_sql:
create table dbo.hugerows
(
a varchar(80),
b nvarchar(max),
c varchar(80),
d varchar(80)
);
insert into dbo.hugerows
select replicate('a',30), replicate('英方',251658240),replicate('c',30),replicate('d',30);
insert into dbo.hugerows
select replicate('b',30), replicate('北京',251658240),replicate('c',30),replicate('d',30);
update dbo.hugerows set b=(select  replicate('上海',251658240));
go
tgt_sql:
select * from dbo.hugerows;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('hugerows');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('hugerows') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='hugerows'  ORDER BY   c.name,a.name,d.name;

go