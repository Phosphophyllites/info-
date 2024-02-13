case 066 "数据：sysname类型插入数据" 0
before:
drop table dbo.i2_sysname001;
go
src_sql:
create table dbo.i2_sysname001 (no int primary key,c_s1 sysname,c_n1 nvarchar(128) not null);
insert into dbo.i2_sysname001 values (1,N'test sysname定义A','数据的同时级联插入');
insert into dbo.i2_sysname001 values (2,N'test sysname定义AB','数据的同时级联插入');
insert into dbo.i2_sysname001 values (3,N'test sysname定义ABC','数据的同时级联插入');
insert into dbo.i2_sysname001(no,c_s1,c_n1) values (4,N'test sysname定义ABCD','数据的同时级联插入');
go

tgt_sql:
select * from dbo.i2_sysname001 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_sysname001');
go

case 067 "数据：sysname类型更新数据" 0
before:
drop table dbo.i2_sysname002;
go
src_sql:
create table dbo.i2_sysname002 (no int primary key,c_s1 sysname,c_n1 nvarchar(128) not null);
insert into dbo.i2_sysname002 values (1,N'test sysname定义A','数据的同时级联插入');
insert into dbo.i2_sysname002 values (2,N'test sysname定义AB','数据的同时级联插入');
insert into dbo.i2_sysname002 values (3,N'test sysname定义ABC','数据的同时级联插入');
insert into dbo.i2_sysname002(no,c_s1,c_n1) values (4,N'test sysname定义ABCD','数据的同时级联插入');
update dbo.i2_sysname002 set c_s1=N'test sysname定义FF' where no=2;
go

tgt_sql:
select * from dbo.i2_sysname002 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_sysname002');
go

case 068 "数据：sysname类型删除数据" 0
before:
drop table dbo.i2_sysname003;
go
src_sql:
create table dbo.i2_sysname003 (no int primary key,c_s1 sysname,c_n1 nvarchar(128) not null);
insert into dbo.i2_sysname003 values (1,N'test sysname定义A','数据的同时级联插入');
insert into dbo.i2_sysname003 values (2,N'test sysname定义AB','数据的同时级联插入');
insert into dbo.i2_sysname003 values (3,N'test sysname定义ABC','数据的同时级联插入');
insert into dbo.i2_sysname003(no,c_s1,c_n1) values (4,N'test sysname定义ABCD','数据的同时级联插入');
delete from dbo.i2_sysname003 where  no=3;
go

tgt_sql:
select * from dbo.i2_sysname003 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_sysname003');
go

case 069 "数据：sysname类型添加列 " 0
before:
drop table dbo.i2_sysname004;
go
src_sql:
create table dbo.i2_sysname004 (no int primary key,c_s1 sysname,c_n1 nvarchar(128) not null);
insert into dbo.i2_sysname004 values (1,N'test sysname定义A','数据的同时级联插入');
insert into dbo.i2_sysname004 values (2,N'test sysname定义AB','数据的同时级联插入');
alter table dbo.i2_sysname004 add v1 sysname,v2 sysname;
alter table dbo.i2_sysname004 add v3 sysname;
insert into dbo.i2_sysname004 values (3,N'test sysname定义ABC','数据的同时级联插入',N'test sysname定义ABC',N'test sysname定义ABC',N'test sysname定义ABC');
insert into dbo.i2_sysname004 values (4,N'test sysname定义ABCD','数据的同时级联插入',N'test sysname定义ABC',N'test sysname定义ABC',N'test sysname定义ABC');
update dbo.i2_sysname004 set c_s1=N'test sysname定义GG',v1=N'test sysname定义jj',v2=N'test sysname定义hh',v3=N'test sysname定义yy' where no=1;
delete from i2_sysname004 where no=2;
go

tgt_sql:
select * from dbo.i2_sysname004 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_sysname004');
go

case 070 "数据：sysname类型删除列 " 0
before:
drop table dbo.i2_sysname005;
go
src_sql:
create table dbo.i2_sysname005 (no int primary key,c_s1 sysname,c_n1 nvarchar(128) not null,v1 sysname,v2 sysname,v3 sysname);
insert into dbo.i2_sysname005 values (1,N'test sysname定义ABC','数据的同时级联插入',N'test sysname定义ABC',N'test sysname定义ABC',N'test sysname定义ABC');
insert into dbo.i2_sysname005 values (2,N'test sysname定义ABCD','数据的同时级联插入',N'test sysname定义ABC',N'test sysname定义ABC',N'test sysname定义ABC');
alter table dbo.i2_sysname005 drop column v1,v2;
alter table dbo.i2_sysname005 drop column v3;
insert into dbo.i2_sysname005 values (3,N'test sysname定义A','数据的同时级联插入');
insert into dbo.i2_sysname005(no,c_s1,c_n1) values (4,N'test sysname定义AB','数据的同时级联插入');
update dbo.i2_sysname005 set c_s1=N'test sysname定义GG' where no=2;
update dbo.i2_sysname005 set c_s1=N'test sysname定义KK' where no=4;
update dbo.i2_sysname005 set c_s1=N'test sysname定义yy' where no=1;
delete from i2_sysname005 where no=3;
go

tgt_sql:
select * from dbo.i2_sysname005 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_sysname005');
go

case 071 "数据：sysname类型重命名表 " 0
    jump
before:
drop table dbo.i2_sysname006;
drop table dbo.i2_sysname006_new;
go
src_sql:
create table dbo.i2_sysname006 (no int primary key,c_s1 sysname,c_n1 nvarchar(128) not null);
sleep(3000);
insert into dbo.i2_sysname006 values (1,N'test sysname定义ABC','数据的同时级联插入');
insert into dbo.i2_sysname006 values (2,N'test sysname定义ABCD','数据的同时级联插入');
exec sp_rename 'dbo.i2_sysname006','i2_sysname006_new';
insert into i2_sysname006_new values (3,N'test sysname定义A','数据的同时级联插入');
insert into i2_sysname006_new(no,c_s1,c_n1) values (4,N'test sysname定义AB','数据的同时级联插入');
update dbo.i2_sysname006_new set c_s1=N'test sysname定义GG' where no=2;
delete from i2_sysname006_new where no=1;
go

tgt_sql:
select * from dbo.i2_sysname006_new order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_sysname006_new');
go

case 145 "数据：sysname类型重命列 " 0
before:
drop table dbo.i2_sysname007;
go
src_sql:
create table dbo.i2_sysname007 (no int primary key,c_s1 sysname,c_n1 nvarchar(128) not null);
insert into dbo.i2_sysname007 values (1,N'test sysname定义A','数据的同时级联插入');
insert into dbo.i2_sysname007 values (2,N'test sysname定义AB','数据的同时级联插入');
ALTER TABLE dbo.i2_sysname007 ADD c_s2 sysname;
exec sp_rename 'dbo.i2_sysname007.c_s2','c_s2_n','COLUMN';
insert into dbo.i2_sysname007 values (3,N'test sysname定义ABC','数据的同时级联插入',N'~!@#$%^&*');
insert into dbo.i2_sysname007(no,c_s1,c_n1,c_s2_n) values (4,N'test sysname定义ABCD','一般法看就看',N'看了就看了就是的');
update dbo.i2_sysname007 set c_s2_n=N'test sysname定义FF' where no=2;
delete from dbo.i2_sysname007 where no=3;
go

tgt_sql:
select * from dbo.i2_sysname007 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_sysname007');
go
