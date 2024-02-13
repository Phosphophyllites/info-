case 001 "数据：文本类型插入数据" 0
before:
drop table dbo.i2_text001;
go
src_sql:
create table dbo.i2_text001
(
  no           int primary key,
	c_text		 text,
	c_ntext		 ntext,
	c_bit1    bit,
	c_image      image,
	c_bit2      bit
);
insert into dbo.i2_text001 values (1,'012345679809909089','这是一个测试用例INFO',0,0x18F6D0D51D96A9664FC1491174A9DAFD67C8B0D2571EB1ABF7EDEC2CCB508EEAA4D7163B4,1);
insert into dbo.i2_text001 values (2,'lkjdkgljasjhjjklgs','这是一个测试用例INFO',1,0x28F6D0D51D96A9664FC1491174A9DAFD67C8B0D2571EB1ABF7EDEC2CCB508EEAA4D7163B4,0);
insert into dbo.i2_text001 values (3,'kljlkjlkjkloiuiyio','这是一个测试用例INFO',0,0x38F6D0D51D96A9664FC1491174A9DAFD67C8B0D2571EB1ABF7EDEC2CCB508EEAA4D7163B4,1);
insert into dbo.i2_text001(no,c_text,c_bit1,c_bit2) values(4,'zzzzzzzzzzzz',1,0);
go

tgt_sql:
select * from dbo.i2_text001 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_text001');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('i2_text001') and xtype <> 'IT' order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='i2_text001'  ORDER BY   c.name,a.name,d.name;
go

case 002 "数据：文本类型更新数据" 0
before:
drop table dbo.i2_text002;
drop table dbo.i2_text002a;
go
src_sql:
create table dbo.i2_text002 (
    no           int primary key,
	c_text		 text,
	c_ntext		 ntext,
	c_image      image
);
create table dbo.i2_text002a (
    no           int not null,
	c_text		 text,
	c_ntext		 ntext,
	c_image      image
);
go
insert into dbo.i2_text002 values (1,'012345679809909089','这是一个测试用例INFO',0x18F6D0D51D96A9664FC1491174A9DAFD67C8B0D2571EB1ABF7EDEC2CCB508EEAA4D7163B4);
insert into dbo.i2_text002 values (2,'lkjdkgljasjhjjklgs','这是一个测试用例INFO',0x28F6D0D51D96A9664FC1491174A9DAFD67C8B0D2571EB1ABF7EDEC2CCB508EEAA4D7163B4);
insert into dbo.i2_text002 values (3,'kljlkjlkjkloiuiyio','这是一个测试用例INFO',0x38F6D0D51D96A9664FC1491174A9DAFD67C8B0D2571EB1ABF7EDEC2CCB508EEAA4D7163B4);
insert into dbo.i2_text002(no,c_ntext) values(4,'zzzzzzzzzzzz');
insert into dbo.i2_text002 values (5,'','',0x38F6D0D51D96A9664FC1491174A9DAFD67C8B0D2571EB1ABF7EDEC2CCB508EEAA4D7163B4);
insert into dbo.i2_text002a values (1,'012345679809909089','这是一个测试用例INFO',0x18F6D0D51D96A9664FC1491174A9DAFD67C8B0D2571EB1ABF7EDEC2CCB508EEAA4D7163B4);
insert into dbo.i2_text002a values (2,'lkjdkgljasjhjjklgs','这是一个测试用例INFO',0x28F6D0D51D96A9664FC1491174A9DAFD67C8B0D2571EB1ABF7EDEC2CCB508EEAA4D7163B4);
insert into dbo.i2_text002a values (3,'kljlkjlkjkloiuiyio','这是一个测试用例INFO',0x38F6D0D51D96A9664FC1491174A9DAFD67C8B0D2571EB1ABF7EDEC2CCB508EEAA4D7163B4);
insert into dbo.i2_text002a(no,c_ntext) values(4,'zzzzzzzzzzzz');
insert into dbo.i2_text002a values (5,'','',0x38F6D0D51D96A9664FC1491174A9DAFD67C8B0D2571EB1ABF7EDEC2CCB508EEAA4D7163B4);
update dbo.i2_text002 set c_text='yingfang test case',c_ntext='肯德基ad卡拉胶阿卡阿坎吉到了看发掘',c_image=0x59F6D0D51D96A9664FC1491174A9DAFD67C8B0D2571EB1ABF7EDEC2CCB508EEAA4D716111 where no=1;
update dbo.i2_text002a set c_text='yingfang test case',c_ntext='肯德基ad卡拉胶阿卡阿坎吉到了看发掘',c_image=0x59F6D0D51D96A9664FC1491174A9DAFD67C8B0D2571EB1ABF7EDEC2CCB508EEAA4D716111 where no=2;
go

tgt_sql:
select * from dbo.i2_text002 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_text002');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('i2_text002') and xtype <> 'IT' order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='i2_text002'  ORDER BY   c.name,a.name,d.name;
select * from dbo.i2_text002a order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_text002a');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('i2_text002a') and xtype <> 'IT' order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='i2_text002a'  ORDER BY   c.name,a.name,d.name;
go

case 003 "数据：文本类型删除数据" 0
before:
drop table dbo.i2_text003;
go
src_sql:
create table dbo.i2_text003 (
    no           int primary key,
	c_text		 text,
	c_ntext		 ntext,
	c_image      image
);
insert into dbo.i2_text003 values (1,'012345679809909089','这是一个测试用例INFO',0x18F6D0D51D96A9664FC1491174A9DAFD67C8B0D2571EB1ABF7EDEC2CCB508EEAA4D7163B4);
insert into dbo.i2_text003 values (2,'lkjdkgljasjhjjklgs','这是一个测试用例INFO',0x28F6D0D51D96A9664FC1491174A9DAFD67C8B0D2571EB1ABF7EDEC2CCB508EEAA4D7163B4);
insert into dbo.i2_text003 values (3,'kljlkjlkjkloiuiyio','这是一个测试用例INFO',0x38F6D0D51D96A9664FC1491174A9DAFD67C8B0D2571EB1ABF7EDEC2CCB508EEAA4D7163B4);
insert into dbo.i2_text003(no,c_text) values(4,'zzzzzzzzzzzz');
delete from dbo.i2_text003 where  no=3;
go

tgt_sql:
select * from dbo.i2_text003 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_text003');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('i2_text003') and xtype <> 'IT' order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='i2_text003'  ORDER BY   c.name,a.name,d.name;
go

case 004 "数据：文本类型添加列 " 0
before:
drop table dbo.i2_text004;
go
src_sql:
create table dbo.i2_text004 (
    no           int primary key,
	c_text		 text,
	c_ntext		 ntext,
	c_image      image
);
insert into dbo.i2_text004 values (1,'012345679809909089','这是一个测试用例INFO',0x18F6D0D51D96A9664FC1491174A9DAFD67C8B0D2571EB1ABF7EDEC2CCB508EEAA4D7163B4);
insert into dbo.i2_text004 values (2,'lkjdkgljasjhjjklgs','这是一个测试用例INFO',0x28F6D0D51D96A9664FC1491174A9DAFD67C8B0D2571EB1ABF7EDEC2CCB508EEAA4D7163B4);
alter table dbo.i2_text004 add v1 text;
alter table dbo.i2_text004 add v2 ntext,v3 image;
insert into dbo.i2_text004 values (3,'kljlkjlkjkloiuiyio','这是一个测试用例INFO',0x38F6D0D51D96A9664FC1491174A9DAFD67C8B0D2571EB1ABF7EDEC2CCB508EEAA4D7163B4,'cccccccccccccc','这是一个测试用例cccc',0x38F6D0D51D96A9664FC1491174A9DAFD67C8B0D2571EB1ABF7EDEC2CCB508EEAA4D7163B4);
insert into dbo.i2_text004(no,c_text) values(4,'zzzzzzzzzzzz');
update dbo.i2_text004 set c_text='看记录卡',v1='看见看见',v2='看记录卡即可',v3=0x78F6D0D51D96A9664FC1491174A9DAFD67C8B0D2571EB1ABF7EDEC2CCB508EEAA4D7163B4 where no=2;
delete from dbo.i2_text004 where no=1;
go

tgt_sql: (1)
select * from dbo.i2_text004 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_text004');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('i2_text004') and xtype <> 'IT' order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='i2_text004'  ORDER BY   c.name,a.name,d.name;
go

case 005 "数据：文本类型删除列 " 0
before:
drop table dbo.i2_text005;
go
src_sql:
create table dbo.i2_text005 (
    no           int primary key,
	c_text		 text,
	c_ntext		 ntext,
	c_image      image
);
insert into dbo.i2_text005 values (1,'012345679809909089','这是一个测试用例INFO',0x18F6D0D51D96A9664FC1491174A9DAFD67C8B0D2571EB1ABF7EDEC2CCB508EEAA4D7163B4);
insert into dbo.i2_text005 values (2,'lkjdkgljasjhjjklgs','这是一个测试用例INFO',0x28F6D0D51D96A9664FC1491174A9DAFD67C8B0D2571EB1ABF7EDEC2CCB508EEAA4D7163B4);
alter table dbo.i2_text005 drop column c_ntext,c_image;
insert into dbo.i2_text005 values (3,'');
insert into dbo.i2_text005(no,c_text) values(4,'mmmmmmmmmmmmm');
update dbo.i2_text005 set c_text='' where no=2;
update dbo.i2_text005 set c_text='upupuopuoupup' where no=2;
delete from i2_text005 where no=1;
go

tgt_sql:
select * from dbo.i2_text005 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_text005');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('i2_text005') and xtype <> 'IT' order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='i2_text005'  ORDER BY   c.name,a.name,d.name;
go

case 006 "数据：文本类型重命名表 " 0
before:
drop table dbo.i2_text006;
drop table i2_text006_新表;
go
src_sql:
create table dbo.i2_text006 (
    no           int primary key,
	c_text		 text,
	c_ntext		 ntext,
	c_image      image
);
sleep(3000);
insert into dbo.i2_text006 values (1,'012345679809909089','这是一个测试用例INFO',0x18F6D0D51D96A9664FC1491174A9DAFD67C8B0D2571EB1ABF7EDEC2CCB508EEAA4D7163B4);
insert into dbo.i2_text006 values (2,'lkjdkgljasjhjjklgs','这是一个测试用例INFO',0x28F6D0D51D96A9664FC1491174A9DAFD67C8B0D2571EB1ABF7EDEC2CCB508EEAA4D7163B4);
exec sp_rename 'dbo.i2_text006','i2_text006_新表';
insert into i2_text006_新表 values (3,'kljlkjlkjkloiuiyio','这是一个测试用例INFO',0x38F6D0D51D96A9664FC1491174A9DAFD67C8B0D2571EB1ABF7EDEC2CCB508EEAA4D7163B4);
insert into i2_text006_新表(no,c_text) values(4,'zzzzzzzzzzzz');
update dbo.i2_text006_新表 set c_text='upupupupupupupup' where no=2;
delete from i2_text006_新表 where no=1
go

tgt_sql: (1)
select * from dbo.i2_text006_新表 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_text006_新表');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('i2_text006_新表') and xtype <> 'IT' order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='i2_text006_新表'  ORDER BY   c.name,a.name,d.name;
go

case 007 "数据：文本类型修改列属性" 0
before:
drop table dbo.i2_text007;
go
src_sql:
create table dbo.i2_text007 (
    no           int primary key,
	c_text		 text,
	c_ntext		 ntext,
	c_image      image
);
insert into dbo.i2_text007 values (1,'012345679809909089','这是一个测试用例INFO',0x18F6D0D51D96A9664FC1491174A9DAFD67C8B0D2571EB1ABF7EDEC2CCB508EEAA4D7163B4);
insert into dbo.i2_text007 values (2,'lkjdkgljasjhjjklgs','这是一个测试用例INFO',0x28F6D0D51D96A9664FC1491174A9DAFD67C8B0D2571EB1ABF7EDEC2CCB508EEAA4D7163B4);
alter table dbo.i2_text007 alter column c_ntext nvarchar(500);
insert into dbo.i2_text007 values (3,'这是一个测试用例uuu','这是一个测试用例INFO',0x38F6D0D51D96A9664FC1491174A9DAFD67C8B0D2571EB1ABF7EDEC2CCB508EEAA4D7163B4);
insert into dbo.i2_text007(no,c_text) values(4,'这是一个测试用例oooo');
update dbo.i2_text007 set c_ntext='upupupupupupupup' where no=2;
update dbo.i2_text007 set c_text='fanfanjkdjafanfanjfan' where no=4;
delete from dbo.i2_text007 where no=1
go

tgt_sql: (1)
select * from dbo.i2_text007 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_text007');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('i2_text007') and xtype <> 'IT' order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='i2_text007'  ORDER BY   c.name,a.name,d.name;
go

case 008 "数据：文本类型重命名列 " 0
before:
drop table dbo.i2_text008;
go
src_sql:
create table dbo.i2_text008 (
    no           int primary key,
	c_text		 text,
	c_ntext		 ntext,
	c_image      image
);
insert into dbo.i2_text008 values (1,'012345679809909089','这是一个测试用例INFO',0x18F6D0D51D96A9664FC1491174A9DAFD67C8B0D2571EB1ABF7EDEC2CCB508EEAA4D7163B4);
insert into dbo.i2_text008 values (2,'lkjdkgljasjhjjklgs','这是一个测试用例INFO',0x28F6D0D51D96A9664FC1491174A9DAFD67C8B0D2571EB1ABF7EDEC2CCB508EEAA4D7163B4);
alter table dbo.i2_text008 add v1 text;
alter table dbo.i2_text008 add v2 ntext,v3 image;
exec sp_rename 'dbo.i2_text008.v1','v1_n','COLUMN';
exec sp_rename 'dbo.i2_text008.v2','v2_n','COLUMN';
exec sp_rename 'dbo.i2_text008.v3','v3_n','COLUMN';
insert into dbo.i2_text008 values (3,'kljlkjlkjkloiuiyio','这是一个测试用例INFO',0x38F6D0D51D96A9664FC1491174A9DAFD67C8B0D2571EB1ABF7EDEC2CCB508EEAA4D7163B4,'cccccccccccccc','这是一个测试用例cccc',0x38F6D0D51D96A9664FC1491174A9DAFD67C8B0D2571EB1ABF7EDEC2CCB508EEAA4D7163B4);
insert into dbo.i2_text008(no,v1_n) values(4,'zzzzzzzzzzzz');
update dbo.i2_text008 set c_text='看记录卡',v1_n='看见看见',v2_n='看记录卡即可',v3_n=0x78F6D0D51D96A9664FC1491174A9DAFD67C8B0D2571EB1ABF7EDEC2CCB508EEAA4D7163B4 where no=2;
delete from dbo.i2_text008 where no=1;
go

tgt_sql: (1)
select * from dbo.i2_text008 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_text008');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('i2_text008') and xtype <> 'IT' order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='i2_text008'  ORDER BY   c.name,a.name,d.name;
go
