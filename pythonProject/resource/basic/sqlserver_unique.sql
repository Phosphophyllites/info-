case 042 "数据：uniqueidentifier类型插入数据" 0
before:
drop table dbo.i2_unique001;
go
src_sql:
create table dbo.i2_unique001(no int primary key,c_unique UNIQUEIDENTIFIER DEFAULT newID(),c_varchar varchar(20) );
insert into dbo.i2_unique001 VALUES (1,newID(), 'def');
insert into dbo.i2_unique001 VALUES (2,newID(), 'ying');
insert into dbo.i2_unique001 VALUES (3,newID(), 'fang');
insert into dbo.i2_unique001(no,c_varchar) VALUES (4,'abc');
go

tgt_sql:
select * from dbo.i2_unique001 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_unique001');
go

case 043 "数据：uniqueidentifier类型更新数据" 0
before:
drop table dbo.i2_unique002;
go
src_sql:
CREATE TABLE dbo.i2_unique002
(no int primary key,
c_unique UNIQUEIDENTIFIER DEFAULT newID(),
c_varchar VARCHAR(20) );
INSERT INTO dbo.i2_unique002 VALUES (1,newID(), 'def');
INSERT INTO dbo.i2_unique002 VALUES (2,newID(), 'ying');
INSERT INTO dbo.i2_unique002 VALUES (3,newID(), 'fang');
INSERT INTO dbo.i2_unique002(no,c_varchar) VALUES (4,'abc');
update dbo.i2_unique002 set c_unique='6F9619FF-8B86-D011-B42D-00C04FC964FF' where no=1;
delete from dbo.i2_unique002 where  no=3;
go

tgt_sql:
select * from dbo.i2_unique002 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_unique002');
go

case 044 "数据：uniqueidentifier类型删除数据" 0
before:
drop table dbo.i2_unique003;
go
src_sql:
CREATE TABLE dbo.i2_unique003
(no int primary key,
c_unique UNIQUEIDENTIFIER DEFAULT newID(),
c_varchar VARCHAR(20) );
INSERT INTO dbo.i2_unique003 VALUES (1,newID(), 'def');
INSERT INTO dbo.i2_unique003 VALUES (2,newID(), 'ying');
INSERT INTO dbo.i2_unique003 VALUES (3,newID(), 'fang');
INSERT INTO dbo.i2_unique003(no,c_varchar) VALUES (4,'abc');
delete from dbo.i2_unique003 where  no=3;
go

tgt_sql:
select * from dbo.i2_unique003 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_unique003');
go

case 045 "数据：uniqueidentifier类型添加列 " 0
before:
drop table dbo.i2_unique004;
go
src_sql:
CREATE TABLE dbo.i2_unique004
(no int primary key,
c_varchar VARCHAR(20) );
INSERT INTO dbo.i2_unique004 VALUES (1,'def');
INSERT INTO dbo.i2_unique004 VALUES (2,'ying');
alter table dbo.i2_unique004 add c_unique UNIQUEIDENTIFIER DEFAULT newID();
INSERT INTO dbo.i2_unique004 VALUES (3,'fang',newID());
INSERT INTO dbo.i2_unique004(no,c_varchar) VALUES (4,'abc');
update dbo.i2_unique004 set c_unique='6F9619FF-8B86-D011-B42D-00C04FC964BB' where no=1;
delete from dbo.i2_unique004 where  no=2;
go

tgt_sql:
select * from dbo.i2_unique004 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_unique004');
go

case 046 "数据：uniqueidentifier类型重命名表 " 0
jump
before:
drop table dbo.i2_unique005;
drop table i2_unique005_renew;
go
src_sql:
CREATE TABLE dbo.i2_unique005
(no int primary key,
c_unique UNIQUEIDENTIFIER DEFAULT newID(),
c_varchar VARCHAR(20) );
sleep(3000);
INSERT INTO dbo.i2_unique005 VALUES (1,newID(), 'def');
INSERT INTO dbo.i2_unique005 VALUES (2,newID(), 'ying');
exec sp_rename 'dbo.i2_unique005','i2_unique005_renew';
INSERT INTO i2_unique005_renew VALUES (3,newID(), 'fang');
INSERT INTO i2_unique005_renew(no,c_varchar) VALUES (4,'abc');
update dbo.i2_unique005_renew set c_unique='6F9619FF-8B86-D011-B42D-00C04FC964BB' where no=1;
delete from dbo.i2_unique005_renew where  no=3;
go

tgt_sql:
select * from dbo.i2_unique005_renew order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_unique005_renew');
go

case 358 "数据：uniqueidentifier类型重命名列 " 0
before:
drop table dbo.i2_unique006;
go
src_sql:
CREATE TABLE dbo.i2_unique006
(no int primary key,
c_varchar VARCHAR(20) );
sleep(3000);
INSERT INTO dbo.i2_unique006 VALUES (1,'def');
INSERT INTO dbo.i2_unique006 VALUES (2,'ying');
alter table dbo.i2_unique006 add v1 UNIQUEIDENTIFIER DEFAULT newID();
exec sp_rename 'dbo.i2_unique006.v1','v1_n','COLUMN';
INSERT INTO i2_unique006 VALUES (3,'fang',newID());
INSERT INTO i2_unique006(no,c_varchar) VALUES (4,'abc');
update dbo.i2_unique006 set v1_n='6F9619FF-8B86-D011-B42D-00C04FC964BB' where no=1;
delete from dbo.i2_unique006 where  no=3;
go

tgt_sql:
select * from dbo.i2_unique006 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_unique006');
go
