case 103 "创建普通视图" 0
before:
drop table i2_nov;
drop view view_nov;
go
src_sql:
create table i2_nov (
    no             int primary key,
    c_int          int default 0 not null,
	c_tinyint	   tinyint check (c_tinyint>=30 and c_tinyint<=180),
	c_smallint	   smallint not null,
	c_bigint	   bigint default 50000 not null unique,
	c_decimal	   decimal(5,2),
	c_numeric	   numeric(10,4),
    c_float        float,
    c_real         real,
    c_money        money,
    c_smallmoney   smallmoney,
	c_bit		   bit
);
insert into i2_nov values ( 1,100,35,10000,50001,123.45,876543.2398, 300.45, 500.6789, 100.23, 300.45,1);
insert into i2_nov values ( 2,200,45,20000,50002,345.54,876543.2398, 300.45, 500.6789, 100.23, 300.45,0);
insert into i2_nov values ( 3,300,55,30000,50003,654.54,876543.2398, 300.45, 500.6789, 100.23, 300.45,1);
insert into i2_nov(no,c_int,c_smallint,c_bigint) values (4,400,10004,50004);
create view dbo.view_nov as select * from i2_nov where no>1
go
alter view dbo.view_nov as select * from i2_nov where no>2
go

tgt_sql:
select * from view_nov;
go

case 104 "通过视图管理表，增删改数据" 0
before:
drop table stuTable;
drop view stu_insert_view;
go
src_sql:
create table stuTable(
    id int identity(1,1) primary key,--id 主键，自增
    name varchar(20),
    gender char(2),
    age int
);
--往表中插入数据
insert into stuTable(name,gender,age) values('刘邦','男',23);
insert into stuTable(name,gender,age) values('项羽','男',22);
insert into stuTable(name,gender,age) values('韩信','男',21);
insert into stuTable(name,gender,age) values('萧何','男',24);
create view stu_insert_view(编号,姓名,性别,年龄)
as
select id,name,gender,age from stuTable;
go
---插入一条数据
insert into stu_insert_view values('孙权','男',34);
update stu_insert_view set 年龄=30 where 姓名='萧何';
delete stu_insert_view where 姓名 ='刘邦';
go
tgt_sql:
select * from stuTable;
select * from stu_insert_view;
go

case 105 "创建依赖视图" 0
before:
drop view dbo.uv_op_ssxx;
drop table dbo.OP_SSSQMX;
go
src_sql:
CREATE TABLE dbo.OP_SSSQMX(
	JGDM  varchar(20) NULL,
	SQDH  varchar(12) NULL,
	BRID  varchar(20) NOT NULL,
	XH    varchar(10) NULL,
	SSZD  varchar(50) NOT NULL,
	SSZDMC varchar(64) NULL,
	NISS  varchar(20) NULL,
	SSBW  varchar(20) NULL,
	ISMAIN varchar(1) NULL,
	QKDJ  varchar(20) NULL,
	YHDE  varchar(20) NULL,
	SSDJ  varchar(20) NULL,
	SSZDBZ  varchar(200) NULL
);
insert into dbo.OP_SSSQMX values ( 'aaaa01','bbbb','56789','AA101','测试ABC','较好的空间啊哈','kdsjkf','ksjdfk','a','dksjkf','daggagfda','dgasgfa','放假啊是离开的就来看撒感觉啊可怜的讲噶快乐节点');
insert into dbo.OP_SSSQMX values ( 'aaaa02','cccc','12345','cc102','看得见','较好的空间啊哈','kdsjkf','ksjdfk','a','dksjkf','daggagfda','dgasgfa','放假啊是离开的就来看撒感觉啊可怜的讲噶快乐节点');
create view dbo.uv_op_ssxx with schemabinding as
   select JGDM,SQDH,BRID,XH,SSZD,SSZDMC from dbo.OP_SSSQMX;
go

tgt_sql:
select JGDM,SQDH,BRID,XH,SSZD,SSZDMC from uv_op_ssxx;
go
