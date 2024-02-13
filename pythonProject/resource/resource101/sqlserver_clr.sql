case 001 "数据：CLR数据类型插入数据" 0
before:
drop table dbo.i2_clr001;
go
src_sql:
CREATE TABLE dbo.i2_clr001
(
    no                  int primary key,
	c_hierarchyid       hierarchyid,
	c_h1                hierarchyid
);
insert into dbo.i2_clr001 values (1,'/1/2/3/','/-1/-2.3/-3.-999/');
insert into dbo.i2_clr001 values (2,'/1/2/4/','/1/2/2/');
insert into dbo.i2_clr001 values (3,'/1/1/2/','/1/2/5/');
insert into dbo.i2_clr001(no,c_hierarchyid) values(4,'/1/1/1/');
go

tgt_sql:
select * from dbo.i2_clr001 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_clr001');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('i2_clr001') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='i2_clr001'  ORDER BY   c.name,a.name,d.name;
go

case 002 "数据：CLR数据类型更新数据" 0
before:
drop table dbo.i2_clr002;
go
src_sql:
CREATE TABLE dbo.i2_clr002
(
    no                  int primary key,
	c_hierarchyid       hierarchyid,
	c_h1                hierarchyid
);
insert into dbo.i2_clr002 values (1,'/1/2/3/','/1/2/6/');
insert into dbo.i2_clr002 values (2,'/1/2/4/','/1/2/2/');
insert into dbo.i2_clr002 values (3,'/1/1/2/','/1/2/5/');
insert into dbo.i2_clr002(no,c_hierarchyid) values(4,'/1/1/1/');
update dbo.i2_clr002 set c_h1='/-1/-2.3/-3.-999/' where no=2;
go

tgt_sql:
select * from dbo.i2_clr002 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_clr002');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('i2_clr002') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='i2_clr002'  ORDER BY   c.name,a.name,d.name;
go

case 003 "数据：CLR数据类型删除数据" 0
before:
drop table dbo.i2_clr003;
go
src_sql:
CREATE TABLE dbo.i2_clr003
(
    no                  int primary key,
	c_hierarchyid       hierarchyid,
	c_h1                hierarchyid
);
insert into dbo.i2_clr003 values (1,'/1/2/3/','/1/2/6/');
insert into dbo.i2_clr003 values (2,'/1/2/4/','/1/2/2/');
insert into dbo.i2_clr003 values (3,'/1/1/2/','/1/2/5/');
insert into dbo.i2_clr003(no,c_hierarchyid) values(4,'/1/1/1/');
delete from dbo.i2_clr003 where  no=3;
go

tgt_sql:
select * from dbo.i2_clr003 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_clr003');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('i2_clr003') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='i2_clr003'  ORDER BY   c.name,a.name,d.name;
go

case 004 "数据：CLR数据类型添加列 " 0
before:
drop table dbo.i2_clr004;
go
src_sql:
CREATE TABLE dbo.i2_clr004
(
    no                  int primary key,
	c_hierarchyid       hierarchyid,
	c_h1                hierarchyid
);
sleep(3000);
insert into dbo.i2_clr004 values (1,'/1/2/3/','/1/2/6/');
insert into dbo.i2_clr004 values (2,'/1/2/4/','/1/2/2/');
alter table dbo.i2_clr004 add v1 hierarchyid,v2 hierarchyid;
alter table dbo.i2_clr004 add v3 hierarchyid;
insert into dbo.i2_clr004 values (3,'/1/2/5/','/1/2/4/','/1/1/1/','/1/1/7/','/1/1/8/');
insert into dbo.i2_clr004(no,c_hierarchyid) values(4,'/1/2/7/');
update dbo.i2_clr004 set v1='/-1/-2.3/-3.-999/',v2='/1/2/7/',v3='/1/2/6/' where no=2;
update dbo.i2_clr004 set c_h1='/1/2/5/' where no=1;
update dbo.i2_clr004 set v1='/1/4/1/',v2='/1/4/2/',v3='/-1/-2.3/-3.-999/' where no=4;
delete from i2_clr004 where no=3;
go

tgt_sql:
select * from dbo.i2_clr004 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_clr004');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('i2_clr004') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='i2_clr004'  ORDER BY   c.name,a.name,d.name;
go

case 005 "数据：CLR数据类型删除列 " 0
before:
drop table dbo.i2_clr005;
go
src_sql:
CREATE TABLE dbo.i2_clr005
(
    no                  int primary key,
	c_hierarchyid       hierarchyid,
	c_h1                hierarchyid,
	v1 				    hierarchyid
);
sleep(3000);
insert into dbo.i2_clr005 values (1,'/1/2/1/','/1/2/2/','/1/2/3/');
insert into dbo.i2_clr005 values (2,'/1/2/4/','/1/2/5/','/1/2/6/');
alter table dbo.i2_clr005 drop column c_h1,v1;
insert into dbo.i2_clr005 values (3,'/1/2/5/');
insert into dbo.i2_clr005(no,c_hierarchyid) values(4,'/1/2/7/');
update dbo.i2_clr005 set c_hierarchyid='/-1/-2.3/-3.-999/' where no=2;
delete from i2_clr005 where no=1;
go

tgt_sql:
select * from dbo.i2_clr005 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_clr005');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('i2_clr005') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='i2_clr005'  ORDER BY   c.name,a.name,d.name;
go


case 006 "数据：CLR数据类型重命名表 " 0
before:
drop table dbo.i2_clr006;
drop table dbo.i2_clr006_new;
go
src_sql:
CREATE TABLE dbo.i2_clr006
(
    no                  int primary key,
	c_hierarchyid       hierarchyid,
	c_h1                hierarchyid,
	v1 				    hierarchyid
);
sleep(3000);
insert into dbo.i2_clr006 values (1,'/1/2/1/','/1/2/2/','/1/2/3/');
insert into dbo.i2_clr006 values (2,'/1/2/4/','/1/2/5/','/1/2/6/');
exec sp_rename 'dbo.i2_clr006','i2_clr006_new';
insert into dbo.i2_clr006_new values (3,'/1/2/5/','/1/2/4/','/1/1/1/');
insert into dbo.i2_clr006_new (no,c_hierarchyid) values(4,'/1/2/7/');
update dbo.i2_clr006_new set c_h1='/-1/-2.3/-3.-999/' where no=2;
delete from i2_clr006_new where no=1;
go

tgt_sql:
select * from dbo.i2_clr006_new order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_clr006_new');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('i2_clr006_new') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='i2_clr006_new'  ORDER BY   c.name,a.name,d.name;
go

case 007 "数据：CLR数据类型重命名列 " 0
before:
drop table dbo.i2_clr007;
go
src_sql:
CREATE TABLE dbo.i2_clr007
(
    no                  int primary key,
	c_hierarchyid       hierarchyid,
	c_h1                hierarchyid
);
sleep(3000);
insert into dbo.i2_clr007 values (1,'/1/2/3/','/1/2/6/');
insert into dbo.i2_clr007 values (2,'/1/2/4/','/1/2/2/');
alter table dbo.i2_clr007 add v1 hierarchyid,v2 hierarchyid,v3 hierarchyid;
exec sp_rename 'dbo.i2_clr007.v1','v1_n','COLUMN';
exec sp_rename 'dbo.i2_clr007.v2','v2_n','COLUMN';
exec sp_rename 'dbo.i2_clr007.v3','v3_n','COLUMN';
insert into dbo.i2_clr007 values (3,'/1/2/5/','/1/2/4/','/1/1/1/','/1/1/7/','/1/1/8/');
insert into dbo.i2_clr007(no,c_hierarchyid,v1_n,v3_n) values(4,'/1/2/7/','/1/2/4/','/1/2/3/');
update dbo.i2_clr007 set v1_n='/-1/-2.3/-3.-999/',v2_n='/1/2/7/',v3_n='/1/2/6/' where no=2;
update dbo.i2_clr007 set v1_n='/1/2/5/' where no=1;
update dbo.i2_clr007 set v1_n='/1/4/1/',v2_n='/1/4/2/',v3_n='/-1/-2.3/-3.-999/' where no=4;
delete from dbo.i2_clr007 where no=3;
go

tgt_sql:
select * from dbo.i2_clr007 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_clr007');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('i2_clr007') order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='i2_clr007'  ORDER BY   c.name,a.name,d.name;
go
