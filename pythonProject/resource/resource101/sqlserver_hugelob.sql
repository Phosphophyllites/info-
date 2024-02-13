case 001 "blob" 0
before:
drop table blob_t1;
drop table blob_t1a;
go
src_sql:
create table blob_t1 ( no int primary key,a text,b ntext,c image );
create table blob_t1a ( no int not null,a text,b ntext,c image );
go
insert into blob_t1 select 1,'012345679809909089','这是一个测试用例INFO1',* from OPENROWSET (BULK N'c:\8m.jpg' , SINGLE_BLOB ) as c;
insert into blob_t1 select 2,'012345679809909090','这是一个测试用例INFO2',* from OPENROWSET (BULK N'c:\v1.mp4' , SINGLE_BLOB ) as c;
insert into blob_t1 select 3,'012345679809909091','这是一个测试用例INFO3',* from OPENROWSET (BULK N'c:\a.jpg' , SINGLE_BLOB ) as c;
insert into blob_t1a select 1,'012345679809909089','这是一个测试用例INFO1',* from OPENROWSET (BULK N'c:\8m.jpg' , SINGLE_BLOB ) as c;
insert into blob_t1a select 2,'012345679809909090','这是一个测试用例INFO2',* from OPENROWSET (BULK N'c:\v1.mp4' , SINGLE_BLOB ) as c;
insert into blob_t1a select 3,'012345679809909091','这是一个测试用例INFO3',* from OPENROWSET (BULK N'c:\a.jpg' , SINGLE_BLOB ) as c;
go
update blob_t1 set c= (select * from OPENROWSET (BULK N'c:\8m1.jpg' , SINGLE_BLOB ) as c ) where no=1;
update blob_t1 set a=null,b=null,c=null  where no =3
update blob_t1a set c= (select * from OPENROWSET (BULK N'c:\8m1.jpg' , SINGLE_BLOB ) as c ) where no=1;
update blob_t1a set a=null,b=null,c=null  where no =3
go
tgt_sql:
select * from blob_t1;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('blob_t1');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('blob_t1') and xtype <> 'IT' order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='blob_t1'  ORDER BY   c.name,a.name,d.name;
select * from blob_t1a;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('blob_t1a');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('blob_t1a') and xtype <> 'IT' order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='blob_t1a'  ORDER BY   c.name,a.name,d.name;
go

case 002 "clob" 0
before:
drop table clob_t1;
drop table clob_t1a;
go
src_sql:
CREATE TABLE clob_t1(
 no int primary key NOT NULL,
 txt nvarchar(max) NULL
 );
 CREATE TABLE clob_t1a(
 no int NOT NULL,
 txt nvarchar(max) NULL
 );
go
INSERT INTO clob_t1 SELECT 1,* FROM  OPENROWSET (BULK N'c:\c81.txt', SINGLE_NCLOB) AS txt;
INSERT INTO clob_t1 SELECT 2,* FROM  OPENROWSET (BULK N'c:\c.txt', SINGLE_NCLOB) AS txt;
INSERT INTO clob_t1a SELECT 1,* FROM  OPENROWSET (BULK N'c:\c81.txt', SINGLE_NCLOB) AS txt;
INSERT INTO clob_t1a SELECT 2,* FROM  OPENROWSET (BULK N'c:\c.txt', SINGLE_NCLOB) AS txt;
update clob_t1 set txt= (select * FROM OPENROWSET (BULK 'c:\c1.txt', SINGLE_NCLOB) AS txt) where no=2;
update clob_t1a set txt= (select * FROM OPENROWSET (BULK 'c:\c1.txt', SINGLE_NCLOB) AS txt) where no=2;
go
tgt_sql:
select * from clob_t1;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('clob_t1');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('clob_t1') and xtype <> 'IT' order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='clob_t1'  ORDER BY   c.name,a.name,d.name;
select * from clob_t1a;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('clob_t1a');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('clob_t1a') and xtype <> 'IT' order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='clob_t1a'  ORDER BY   c.name,a.name,d.name;
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
go
insert into dbo.hugerows(a,b,c,d) values(replicate('a',30),replicate('英方',251658240),replicate('c',30),replicate('d',30));
insert into dbo.hugerows(a,b,c,d) values(replicate('b',30),replicate('北京',251658240),replicate('c',30),replicate('d',30));
update dbo.hugerows set b=replicate('朝阳',258240);
go
tgt_sql:
select * from dbo.hugerows;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('hugerows');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('hugerows') and xtype <> 'IT' order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='hugerows'  ORDER BY   c.name,a.name,d.name;
go

case 004 "多列lob，每列大于2M，总数大于8M" 0
before:
drop table lob_t1;
drop table lob_t1a;
go
src_sql:
create table lob_t1(
no int primary key,
a image,
b image,
c nvarchar(max),
d nvarchar(max)
);
create table lob_t1a(
no int not null,
a image,
b image,
c nvarchar(max),
d nvarchar(max)
);
go
insert into lob_t1 select 1, * from OPENROWSET(BULK N'c:\a.jpg',SINGLE_BLOB ) as a,
OPENROWSET(BULK N'c:\b.jpg',SINGLE_BLOB) as b,
OPENROWSET(BULK N'c:\c.txt',SINGLE_NCLOB) AS c,
OPENROWSET(BULK N'c:\d.txt',SINGLE_NCLOB) AS d
insert into lob_t1a select 1, * from OPENROWSET(BULK N'c:\a.jpg',SINGLE_BLOB ) as a,
OPENROWSET(BULK N'c:\b.jpg',SINGLE_BLOB) as b,
OPENROWSET(BULK N'c:\c.txt',SINGLE_NCLOB) AS c,
OPENROWSET(BULK N'c:\d.txt',SINGLE_NCLOB) AS d
update dbo.lob_t1 set a=(select * from OPENROWSET(BULK N'c:\v1.mp4',SINGLE_BLOB) as a);
update dbo.lob_t1 set c=(select * from OPENROWSET(BULK N'c:\c1.txt',SINGLE_NCLOB) as c);
update dbo.lob_t1a set a=(select * from OPENROWSET(BULK N'c:\v1.mp4',SINGLE_BLOB) as a);
update dbo.lob_t1a set c=(select * from OPENROWSET(BULK N'c:\c1.txt',SINGLE_NCLOB) as c);
go
tgt_sql:
select * from lob_t1;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('lob_t1');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('lob_t1') and xtype <> 'IT' order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='lob_t1'  ORDER BY   c.name,a.name,d.name;
select * from lob_t1a;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('lob_t1a');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('lob_t1a') and xtype <> 'IT' order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='lob_t1a'  ORDER BY   c.name,a.name,d.name;
go

case 005 "多列lob，每列小于2M，总数大于8M" 0
before:
drop table lob_t2;
drop table lob_t2a;
go
src_sql:
create table lob_t2(
no int primary key,
b1 image,
b2 image,
b3 image,
c1 nvarchar(max),
c2 nvarchar(max),
c3 nvarchar(max)
);
create table lob_t2a(
no int not null,
b1 image,
b2 image,
b3 image,
c1 nvarchar(max),
c2 nvarchar(max),
c3 nvarchar(max)
);
go
insert into lob_t2 select 1, * from OPENROWSET(BULK N'c:\b1.jpg',SINGLE_BLOB ) as b1,
OPENROWSET(BULK N'c:\b2.jpg' , SINGLE_BLOB ) as b2,
OPENROWSET(BULK N'c:\b3.jpg' , SINGLE_BLOB ) as b3,
OPENROWSET(BULK 'C:\c1.txt', SINGLE_NCLOB) AS c1,
OPENROWSET(BULK 'C:\c2.txt', SINGLE_NCLOB) AS c2,
OPENROWSET(BULK 'C:\c3.txt', SINGLE_NCLOB) AS c3
insert into lob_t2a select 1, * from OPENROWSET(BULK N'c:\b1.jpg',SINGLE_BLOB ) as b1,
OPENROWSET(BULK N'c:\b2.jpg' , SINGLE_BLOB ) as b2,
OPENROWSET(BULK N'c:\b3.jpg' , SINGLE_BLOB ) as b3,
OPENROWSET(BULK 'C:\c1.txt', SINGLE_NCLOB) AS c1,
OPENROWSET(BULK 'C:\c2.txt', SINGLE_NCLOB) AS c2,
OPENROWSET(BULK 'C:\c3.txt', SINGLE_NCLOB) AS c3
update dbo.lob_t2 set b1=(select * from OPENROWSET(BULK N'c:\b.jpg',SINGLE_BLOB ) as b1);
update dbo.lob_t2 set c3=(select * FROM OPENROWSET (BULK N'c:\c.txt', SINGLE_NCLOB) AS c3);
update dbo.lob_t2a set b1=(select * from OPENROWSET(BULK N'c:\b.jpg',SINGLE_BLOB ) as b1);
update dbo.lob_t2a set c3=(select * FROM OPENROWSET (BULK N'c:\c.txt', SINGLE_NCLOB) AS c3);
go
tgt_sql:
select * from lob_t2;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('lob_t2');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('lob_t2') and xtype <> 'IT' order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='lob_t2'  ORDER BY   c.name,a.name,d.name;
select * from lob_t2a;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('lob_t2a');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('lob_t2a') and xtype <> 'IT' order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='lob_t2a'  ORDER BY   c.name,a.name,d.name;
go