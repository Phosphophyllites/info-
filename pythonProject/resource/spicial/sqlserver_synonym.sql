case 106 "创建表的同义词" 0
before:
drop synonym syn_t
drop table syn_t1;
go
src_sql:
create table syn_t1
     (
         S_Id        int        not null    identity(1,1)    primary key,    --设置为主键和自增长列，起始值为1，每次自增1
         S_StuNo        varchar(50)        not null,
         S_Name        varchar(20)        not null,
         S_Sex        varchar(10)        not null,
         S_Height    varchar(10)        null,
         S_BirthDate        varchar(30)        null
     )
go
insert into syn_t1(S_StuNo,S_Name,S_Sex,S_Height) values ('001','项羽','男','190');
insert into syn_t1(S_StuNo,S_Name,S_Sex,S_Height) values ('002','刘邦','男','170');
insert into syn_t1(S_StuNo,S_Name,S_Sex,S_Height) values ('003','貂蝉','女','180');
insert into syn_t1(S_StuNo,S_Name,S_Sex,S_Height) values ('004','天明','男','155');
insert into syn_t1(S_StuNo,S_Name,S_Sex,S_Height) values ('005','少司命','女','175');
CREATE SYNONYM syn_t
FOR syn_t1
go
INSERT INTO syn_t (S_StuNo,S_Name,S_Sex,S_Height)
VALUES ('006','王志','女','153');
update syn_t set S_BirthDate='1989-04-30' where S_StuNo='004';
delete from syn_t where S_StuNo='002';
go
tgt_sql:
SELECT * FROM syn_t;
select count(*) from sys.synonyms where name='syn_t'
go

case 107 "创建索引的同义词" 0
before:
drop synonym syn_idx;
drop table syn_t2;
go
src_sql:
CREATE TABLE syn_t2
(
  rec_num        int NOT NULL ,             /*记录号                             */
  date           char(8) NOT NULL ,         /*数据写入日期                       */
  time           char(8) NOT NULL ,         /*数据写入时间                       */
  reff           char(10) NOT NULL ,        /*用户使用，若是撤单，则与申报单相同 */
  acc            char(10) NOT NULL ,        /*帐号                               */
  stock          char(6) NOT NULL ,         /*股票代码                           */
  bs             char NOT NULL ,            /*B/S，若是撤单，则与申报单相同      */
  price          char(8) NOT NULL ,         /*价格，若是撤单，则与申报单相同     */
  qty            char(8) NOT NULL ,         /*数量，若是撤单，则与申报单相同     */
  status         char NOT NULL,             /*R/r 正确待发                       */
  owflag         char(3) NOT NULL,          /*委托单或撤消单标志(ORD/WTH)        */
  ordrec         char(8) ,                  /*撤消单相应的委托单rec_num，委托单此域空 */
  firmid         char(5) ,                  /*A股为空，B股为清算席位             */
  checkord       Binary(16),                /*加密校验码                         */
  branchid       char(5)                    /*营业部代码,20091228 xuzj add       */
);
CREATE UNIQUE CLUSTERED INDEX idx_syn_t2 ON syn_t2 (rec_num)
create synonym syn_idx for idx_syn_t2;
go
tgt_sql:
select count(*) from sys.synonyms where name='syn_idx'
go

case 108 "创建视图的同义词" 0
before:
drop synonym syn_view;
drop view view_v3
drop table syn_t3;
go
src_sql:
create table syn_t3 (
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
)
go
insert into syn_t3 values ( 1,100,35,10000,50001,123.45,876543.2398, 300.45, 500.6789, 100.23, 300.45,1);
insert into syn_t3 values ( 2,200,45,20000,50002,345.54,876543.2398, 300.45, 500.6789, 100.23, 300.45,0);
insert into syn_t3 values ( 3,300,55,30000,50003,654.54,876543.2398, 300.45, 500.6789, 100.23, 300.45,1);
insert into syn_t3(no,c_int,c_smallint,c_bigint) values (4,400,10004,50004);
create view view_v3
as
   select * from syn_t3 where no>1
go
create synonym syn_view for view_v3;
go
tgt_sql:
select * from syn_view;
select count(*) from sys.synonyms where name='syn_view';
go

case 109 "创建存储的同义词" 0
before:
drop synonym syn_p;
drop procedure pro_4
drop table syn_t4;
go
src_sql:
create table syn_t4
     (
         S_Id        int        not null    identity(1,1)    primary key,    --设置为主键和自增长列，起始值为1，每次自增1
         S_StuNo        varchar(50)        not null,
         S_Name        varchar(20)        not null,
         S_Sex        varchar(10)        not null,
         S_Height    varchar(10)        null,
         S_BirthDate        varchar(30)        null
     )
go
insert into syn_t4(S_StuNo,S_Name,S_Sex,S_Height) values ('001','项羽','男','190');
insert into syn_t4(S_StuNo,S_Name,S_Sex,S_Height) values ('002','刘邦','男','170');
insert into syn_t4(S_StuNo,S_Name,S_Sex,S_Height) values ('003','貂蝉','女','180');
insert into syn_t4(S_StuNo,S_Name,S_Sex,S_Height) values ('004','天明','男','155');
insert into syn_t4(S_StuNo,S_Name,S_Sex,S_Height) values ('005','少司命','女','175');
create procedure pro_4
as
begin
    select * from syn_t4
end
go
create synonym syn_p for pro_4;
execute syn_p;
go
tgt_sql:
select count(*) from sys.synonyms where name='syn_p';
go

case 110 "创建函数的同义词" 0
before:
drop synonym syn_f;
drop table syn_t5;
drop function syn_f5;
go
src_sql:
create table syn_t5(
    id int primary key,
    name varchar(10),
    birthDay datetime
);
insert into syn_t5 values(1,'张三','1998-02-01');
insert into syn_t5 values(2,'李四','1981-10-1');
insert into syn_t5 values(3,'王五','1985-5-2');
create function syn_f5(@birthDay datetime)
returns int
as
begin
declare @age int
set @age = datediff(yy,@birthDay,getdate())
return @age
end
go
create synonym syn_f for syn_f5;
go
tgt_sql:
select name as 姓名,dbo.syn_f(birthDay) as 年龄 from syn_t5;
go