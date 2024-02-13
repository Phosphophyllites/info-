case 023 "数据：二进制类型插入数据" 0
before:
drop table dbo.i2_binary001;
go
src_sql:
create table dbo.i2_binary001 (
    no                  int primary key,
    c_binary            binary(30),
    c_varbinary         varbinary(1000),
	c_varbinarym	    varbinary(max)
);
sleep(3000);
insert into dbo.i2_binary001 values (1,0x1f,0x111111111,0x44444444aaaaaaaaa);
insert into dbo.i2_binary001 values (2,0x2f,0x222222222,0x55555555bbbbbbbbb);
insert into dbo.i2_binary001 values (3,0x3f,0x333333333,0x66666666ccccccccc);
insert into dbo.i2_binary001(no,c_binary) values(4,0x4f);
go

tgt_sql:
select * from dbo.i2_binary001 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_binary001');
go

case 024 "数据：二进制类型更新数据" 0
before:
drop table dbo.i2_binary002;
go
src_sql:
create table dbo.i2_binary002 (
    no                  int primary key,
    c_binary            binary(30),
    c_varbinary         varbinary(1000),
	c_varbinarym	    varbinary(max)
);
sleep(3000);
insert into dbo.i2_binary002 values (1,0x1f,0x111111111,0x44444444aaaaaaaaa);
insert into dbo.i2_binary002 values (2,0x2f,0x222222222,0x55555555bbbbbbbbb);
insert into dbo.i2_binary002 values (3,0x3f,0x333333333,0x66666666ccccccccc);
insert into dbo.i2_binary002(no,c_binary) values(4,0x4f);
update dbo.i2_binary002 set c_binary=0x5e,c_varbinary=0x34343535365,c_varbinarym=0x123123123123 where no=2;
go

tgt_sql:
select * from dbo.i2_binary002 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_binary002');
go

case 025 "数据：二进制类型删除数据" 0
before:
drop table dbo.i2_binary003;
go
src_sql:
create table dbo.i2_binary003 (
    no                  int primary key,
    c_binary            binary(30),
    c_varbinary         varbinary(1000),
	c_varbinarym	    varbinary(max)
);
sleep(3000);
insert into dbo.i2_binary003 values (1,0x1f,0x111111111,0x44444444aaaaaaaaa);
insert into dbo.i2_binary003 values (2,0x2f,0x222222222,0x55555555bbbbbbbbb);
insert into dbo.i2_binary003 values (3,0x3f,0x333333333,0x66666666ccccccccc);
insert into dbo.i2_binary003(no,c_binary) values(4,0x4f);
delete from dbo.i2_binary003 where  no=3;
go

tgt_sql:
select * from dbo.i2_binary003 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_binary003');
go

case 026 "数据：二进制类型添加列 " 0
before:
drop table dbo.i2_binary004;
go
src_sql:
create table dbo.i2_binary004 (
    no                  int primary key,
    c_binary            binary(30),
    c_varbinary         varbinary(1000)
);
insert into dbo.i2_binary004 values (1,0x1f,0x111111111);
insert into dbo.i2_binary004 values (2,0x2f,0x222222222);
alter table dbo.i2_binary004 add v1 binary(10);
alter table dbo.i2_binary004 add v2 varbinary(200),v3 varbinary(MAX);
insert into dbo.i2_binary004 values (3,0x3f,0x333333333,0x1ef,0x2abcd345,0x123456789123456789123456789);
insert into dbo.i2_binary004(no,c_binary) values(4,0x4f);
update dbo.i2_binary004 set v1=0x3c,v2=0x66666666666666,v3=0x754433345433323434454 where no=2;
update dbo.i2_binary004 set c_binary=0x4a,c_varbinary=0x56784532,v1=0x4b,v2=0x7777777777777,v3=0x32432432423432424 where no=4;
update dbo.i2_binary004 set c_binary=0x77,c_varbinary=0x777777777,v1=0x7d,v2=0x99999999999,v3=0x328587827854782758 where no=1;
delete from dbo.i2_binary004 where no=2;
go

tgt_sql:
select * from dbo.i2_binary004 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_binary004');
go

case 027 "数据：二进制类型删除列 " 0
before:
drop table dbo.i2_binary005;
go
src_sql:
create table dbo.i2_binary005 (
    no                  int primary key,
    c_binary            binary(30),
    c_binary1           binary(100),
	c_varbinary2        varbinary(200)
);
insert into dbo.i2_binary005 values (1,0x1f,0x111111111,0x18F6D0D51D96A9);
insert into dbo.i2_binary005 values (2,0x2f,0x222222222,0x28F6D0D51163B4);
alter table dbo.i2_binary005 drop column c_binary1,c_varbinary2;
insert into dbo.i2_binary005 values (3,0x3f);
insert into dbo.i2_binary005(no,c_binary) values(4,0x4f);
update dbo.i2_binary005 set c_binary=0x5e where no=1;
update dbo.i2_binary005 set c_binary=0x7a where no=3;
delete from dbo.i2_binary005 where no=2;
go

tgt_sql:
select * from dbo.i2_binary005 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_binary005');
go

case 028 "数据：二进制类型重命名表 " 0
jump
before:
drop table dbo.i2_binary006;
drop table i2_binary006_renew;
go
src_sql:
create table dbo.i2_binary006 (
    no                  int primary key,
    c_binary            binary(30),
    c_varbinary         varbinary(1000)
);
sleep(3000);
insert into dbo.i2_binary006 values (1,0x1f,0x111111111);
insert into dbo.i2_binary006 values (2,0x2f,0x222222222);
exec sp_rename 'i2_binary006','i2_binary006_renew';
insert into i2_binary006_renew values (3,0x3f,0x333333333);
insert into i2_binary006_renew(no,c_binary) values(4,0x4f);
update dbo.i2_binary006_renew set c_binary=0x5e11111111111111 where no=1;
update dbo.i2_binary006_renew set c_binary=0x7a33333333333 where no=3;
delete from dbo.i2_binary006_renew where no=2;
go

tgt_sql:
select * from dbo.i2_binary006_renew order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_binary006_renew');
go

case 029 "数据：二进制类型修改列属性" 0
before:
drop table dbo.i2_binary007;
go
src_sql:
create table dbo.i2_binary007 (
    no                  int primary key,
    c_binary            binary(30),
    c_varbinary         varbinary(50)
);
insert into dbo.i2_binary007 values (1,0x1f,0x111111111);
insert into dbo.i2_binary007 values (2,0x2f,0x222222222);
alter table dbo.i2_binary007 alter column c_binary binary(50) not null;
alter table dbo.i2_binary007 alter column c_varbinary varbinary(150) not null;
insert into dbo.i2_binary007 values (3,0x3f,0x333333333);
update dbo.i2_binary007 set c_binary=0x6d55555555 where no=2;
delete from i2_binary007 where no=1;
go

tgt_sql:
select * from dbo.i2_binary007 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_binary007');
go

case 142 "数据：二进制类型重命名列" 0
before:
drop table dbo.i2_binary008;
go
src_sql:
create table dbo.i2_binary008 (
    no                  int primary key,
    c_binary            binary(30),
    c_varbinary         varbinary(1000),
	c_varbinarym	    varbinary(max)
);
sleep(3000);
insert into dbo.i2_binary008 values (1,0x1f,0x111111111,0x44444444aaaaaaaaa);
insert into dbo.i2_binary008 values (2,0x2f,0x222222222,0x55555555bbbbbbbbb);
ALTER TABLE dbo.i2_binary008 ADD c_b1 binary(50),c_b2 varbinary(2000),c_b3 varbinary(max);
exec sp_rename 'dbo.i2_binary008.c_b1','c_b1_n','COLUMN';
exec sp_rename 'dbo.i2_binary008.c_b2','c_b2_n','COLUMN';
exec sp_rename 'dbo.i2_binary008.c_b3','c_b3_n','COLUMN';
insert into dbo.i2_binary008 values (3,0x3f,0x333333333,0x66666666ccccccccc,0x12345aaaaaa,0x12345abc678fff,null);
insert into dbo.i2_binary008(no,c_binary,c_b1_n,c_b3_n) values(4,0x4f,0x99999aabbcc,0x678567456ffff);
update dbo.i2_binary008 set c_binary=0x5e,c_b2_n=0x34343535365,c_b3_n=0x123123123123 where no=2;
delete from dbo.i2_binary008 where no=1
go

tgt_sql:
select * from dbo.i2_binary008 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_binary008');
go
