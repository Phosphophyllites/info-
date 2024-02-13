case 1 "数据：数值类型:整数类型 建表" 0
src_sql:
drop table t_int1;

create table t_int1 (
id    integer primary key,
c1    smallint,
c2    integer,
c3    bigint
);

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_int1';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_int1';

case 2 "数据：数值类型:整数类型 插入数据" 0
src_sql:
drop table t_int1;

create table t_int1 (
id    integer primary key,
c1    smallint,
c2    integer,
c3    bigint
);


insert into t_int1 values(1,11,22,4444);
insert into t_int1 values(2,11,-22,-4444);
insert into t_int1 values(3,11,null,4444);
insert into t_int1 values(4,11,null,-4444);
insert into t_int1(id,c1) values(5,55);
insert into t_int1(c2,id,c1) values(4444,6,22);
insert into t_int1 values (7,77);

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_int1';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_int1';

select * from t_int1 order by id;

case 3 "数据：数值类型:整数类型 修改数据" 0
BEFORE:
drop table t_int1;
src_sql:
create table t_int1 (
id    integer primary key,
c1    smallint,
c2    integer,
c3    bigint
);

insert into t_int1 values(1,11,22,4444);
insert into t_int1 values(2,11,-22,-4444);
insert into t_int1 values(3,11,null,4444);
insert into t_int1 values(4,11,null,-4444);
insert into t_int1(id,c1) values(5,55);
insert into t_int1(c2,id,c1) values(4444,6,22);
insert into t_int1 values (7,77);

update t_int1 set c1=null,c2=null,c3=null where id=1;
update t_int1 set c3=100 where id=2;
update t_int1 set c3=c3*10 where id=3 returning id,c1,c2,c3 as c3_new;

delete from t_int1 where id=3;
delete from t_int1 where id=4 returning *;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_int1';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_int1';

select * from t_int1;

case 4 "数据：数值类型:整数类型 重命名表" 0
src_sql:
drop table t_int1;

create table t_int1 (
id    integer primary key,
c1    smallint,
c2    integer,
c3    bigint
);

insert into t_int1 values(1,11,22,4444);
insert into t_int1 values(2,11,-22,-4444);

alter table t_int1 rename to c_t_int1;

insert into c_t_int1 values(3,11,null,4444);

update c_t_int1 set c3=100 where id=3;

delete from c_t_int1 where id=3;

alter table c_t_int1 rename to t_int1;

insert into t_int1 values(3,11,null,4444);

update t_int1 set c3=100 where id=3;

delete from t_int1 where id=3;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_int1';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_int1';

select * from t_int1;

case 5 "数据：数值类型:整数类型 添加列" 0
src_sql:
drop table t_int1;

create table t_int1 (
id    integer primary key,
c1    smallint,
c2    integer,
c3    bigint
);

insert into t_int1 values(1,11,22,4444);
insert into t_int1 values(2,11,-22,-4444);

alter table t_int1 add test1 smallint;

insert into t_int1 values(3,11,null,4444,11);

update t_int1 set test1=100 where id=3;

delete from t_int1 where id=3;

alter table t_int1 add test2 integer,add test3 bigint;

insert into t_int1 values(3,11,null,4444,11,-22,-4444);

update t_int1 set test2=null,test3=3333 where id=3;

delete from t_int1 where id=3;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_int1';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_int1';

select * from t_int1;

case 6 "数据：数值类型:整数类型 删除列" 0
src_sql:
drop table t_int1;

create table t_int1 (
id    integer primary key,
c1    smallint,
c2    integer,
c3    bigint,
test1 smallint,
test2 integer,
test3 bigint
);

insert into t_int1 values(1,11,22,4444,11,-22,-4444);
insert into t_int1 values(2,11,-22,-4444,22,22,4444);

alter table t_int1 drop test1;

insert into t_int1 values(3,11,null,4444,-22,-4444);

update t_int1 set test2=null,test3=3333 where id=3;

delete from t_int1 where id=3;

alter table t_int1 drop test2,drop c3;

insert into t_int1 values(3,11,null,4444);

update t_int1 set c2=100 where id=3;

delete from t_int1 where id=3;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_int1';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_int1';

select * from t_int1;

case 7 "数据：数值类型:整数类型 修改列属性" 0
src_sql:
drop table t_int1;

create table t_int1 (
id    integer primary key,
c1    smallint,
c2    integer,
test3 bigint
);


insert into t_int1 values(1,11,22,4444);
insert into t_int1 values(2,11,-22,-4444);

alter table t_int1 alter column c1 type integer;

insert into t_int1 values(3,11,null,4444);

update t_int1 set c1=100 where id=3;

delete from t_int1 where id=3;

alter table t_int1 alter column c2 type bigint,
                        alter column test3 type text;
						
insert into t_int1 values(3,11,null,'12qwde4444');

update t_int1 set c2=100,test3='qweerqqqqqaaasffvd' where id=3;

delete from t_int1 where id=3;			

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_int1';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_int1';

select * from t_int1;

case 8 "数据：数值类型:整数类型 重命名列" 0	
src_sql:
drop table t_int1;

create table t_int1 (
id    integer primary key,
c1    smallint,
c2    integer,
test3 bigint
);

insert into t_int1 values(1,11,22,4444);
insert into t_int1 values(2,11,-22,-4444);

alter table t_int1 rename column test3 to test1;

insert into t_int1 values(3,11,null,'12qwde4444');

update t_int1 set c2=100,test1='qweerqqqqqaaasffvd' where id=3;

delete from t_int1 where id=3;	

alter table t_int1 rename column test1 to test;

insert into t_int1 values(3,11,null,'12qwde4444');

update t_int1 set c2=100,test='qweerqqqqqaaasffvd' where id=3;

delete from t_int1 where id=3;	

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_int1';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_int1';

select * from t_int1;

case 9 "数据：数值类型:整数类型 添加默认值" 0	
src_sql:
drop table t_int1;

create table t_int1 (
id    integer primary key,
c1    smallint,
c2    integer,
test bigint
);

insert into t_int1 values(1,11,22,4444);
insert into t_int1 values(2,11,-22,-4444);

alter table t_int1 alter column test set default 'test';

insert into t_int1 values(3,11,111,default);

update t_int1 set test='qaswderftgthkoplkjd' where id=3;

delete from t_int1 where id=3;	

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_int1';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_int1';

select * from t_int1;

case 10 "数据：数值类型:整数类型 truncate表" 0	
src_sql:
drop table t_int1;

create table t_int1 (
id    integer primary key,
c1    smallint,
c2    integer,
test bigint
);

insert into t_int1 values(1,11,22,4444);
insert into t_int1 values(2,11,-22,-4444);

truncate table t_int1;

insert into t_int1 values(1,11,111,default);
insert into t_int1 values(2,11,111,'q2q3');
insert into t_int1 values(3,11,111,default);

update t_int1 set test='qaswderftgthkoplkjd' where id=3;

delete from t_int1 where id=3;	

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_int1';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_int1';

select * from t_int1;

case 11 "数据：数值类型:任意精度型&序列整型(串行类型smallserial/serial/bigserial) 建表" 0
src_sql:
drop table t_int2;

create table t_int2 (
id    integer primary key,
c1    numeric(10,5),
c2    decimal(6,4),
c3    smallserial,
c4    serial,
c5    bigserial
);

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_int2';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_int2';

case 12 "数据：数值类型:任意精度型&序列整型(串行类型smallserial/serial/bigserial) 插入数据" 0
src_sql:
drop table t_int2;

create table t_int2 (
id    integer primary key,
c1    numeric(10,5),
c2    decimal(6,4),
c3    smallserial,
c4    serial,
c5    bigserial
);

insert into t_int2 values(1,12345.45678,45.78,default,default,default);
insert into t_int2 values(2,12345.45,45.78,default,default,default);
insert into t_int2 values(3,-12345.45678,-45.78,default,default,default);

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_int2';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_int2';

select * from t_int2;

case 13 "数据：数值类型:任意精度型&序列整型(串行类型smallserial/serial/bigserial) 修改数据" 0
BEFORE:
drop table t_int2;
src_sql:
create table t_int2 (
id    integer primary key,
c1    numeric(10,5),
c2    decimal(6,4),
c3    smallserial,
c4    serial,
c5    bigserial
);

insert into t_int2 values(1,12345.45678,45.78,default,default,default);
insert into t_int2 values(2,12345.45,45.78,default,default,default);
insert into t_int2 values(3,-12345.45678,-45.78,default,default,default);

update t_int2 set c1=null,c2=null where id=1;
update t_int2 set c2=10.203 where id=2;

delete from t_int2 where id=3;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_int2';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_int2';

select * from t_int2;

case 14 "数据：数值类型:任意精度型&序列整型(串行类型smallserial/serial/bigserial) 重命名表" 0
src_sql:
drop table t_int2;

create table t_int2 (
id    integer primary key,
c1    numeric(10,5),
c2    decimal(6,4),
c3    smallserial,
c4    serial,
c5    bigserial
);

insert into t_int2 values(1,12345.45678,45.78,default,default,default);
insert into t_int2 values(2,12345.45,45.78,default,default,default);

alter table t_int2 rename to c_t_int2;

insert into c_t_int2 values(3,-12345.45678,-45.78,default,default,default);

update c_t_int2 set c3=100 where id=3;

delete from c_t_int2 where id=3;

alter table c_t_int2 rename to t_int2;

insert into t_int2 values(3,-12345.45678,-45.78,default,default,default);

update t_int2 set c3=100 where id=3;

delete from t_int2 where id=3;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_int2';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_int2';

select * from t_int2;

case 15 "数据：数值类型:任意精度型&序列整型(串行类型smallserial/serial/bigserial) 添加列" 0
src_sql:
drop table t_int2;

create table t_int2 (
id    integer primary key,
c1    numeric(10,5),
c2    decimal(6,4),
c3    smallserial,
c4    serial,
c5    bigserial
);

insert into t_int2 values(1,12345.45678,45.78,default,default,default);
insert into t_int2 values(2,12345.45,45.78,default,default,default);

alter table t_int2 add test1 numeric(5,2);

insert into t_int2 values(3,-45.4568,-45.78,default,default,default,22);

update t_int2 set test1=100 where id=3;

delete from t_int2 where id=3;

alter table t_int2 add test2 decimal(6,4),add test3 smallint;

insert into t_int2 values(3,-45.4568,-45.78,default,default,default,22,44,1);

update t_int2 set test2=100,test3=100 where id=3;

delete from t_int2 where id=3;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_int2';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_int2';

select * from t_int2;

case 16 "数据：数值类型:任意精度型&序列整型(串行类型smallserial/serial/bigserial) 删除列" 0
src_sql:
drop table t_int2;

create table t_int2 (
id    integer primary key,
c1    numeric(10,5),
c2    decimal(6,4),
c3    smallserial,
c4    serial,
c5    bigserial,
test1 numeric(5,2),
test2 decimal(6,4),
test3 smallint
);

insert into t_int2 values(1,12345.45678,45.78,default,default,default,22,44,1);
insert into t_int2 values(2,12345.45,45.78,default,default,default,22,44,1);

alter table t_int2 drop test1;

insert into t_int2 values(3,-45.4568,-45.78,default,default,default,44,1);

update t_int2 set c3=100 where id=3;

delete from t_int2 where id=3;

alter table t_int2 drop test2,drop c3;

insert into t_int2 values(3,-12345.45678,-45.78,default,default,112);

update t_int2 set c1=100 where id=3;

delete from t_int2 where id=3;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_int2';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_int2';

select * from t_int2;

case 17 "数据：数值类型:任意精度型&序列整型(串行类型smallserial/serial/bigserial) 修改列属性" 0
src_sql:
drop table t_int2;

create table t_int2 (
id    integer primary key,
c1    numeric(10,5),
c2    decimal(6,4),
c4    serial,
c5    bigserial,
test3 smallint
);

insert into t_int2 values(1,12345.45678,45.78,default,default,1);
insert into t_int2 values(2,12345.45,45.78,default,default,1);

alter table t_int2 alter column test3 type int;

insert into t_int2 values(3,-12345.45678,-45.78,default,default,112);

update t_int2 set test3=100 where id=3;

delete from t_int2 where id=3;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_int2';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_int2';

select * from t_int2;

case 18 "数据：数值类型:任意精度型&序列整型(串行类型smallserial/serial/bigserial) 重命名列" 0
src_sql:
drop table t_int2;

create table t_int2 (
id    integer primary key,
c1    numeric(10,5),
c2    decimal(6,4),
c4    serial,
c5    bigserial,
test3 smallint
);

insert into t_int2 values(1,12345.45678,45.78,default,default,1);
insert into t_int2 values(2,12345.45,45.78,default,default,1);

alter table t_int2 rename column test3 to test1;

insert into t_int2 values(3,-12345.45678,-45.78,default,default,112);

update t_int2 set test1=100 where id=3;

delete from t_int2 where id=3;

alter table t_int2 rename column test1 to test;

insert into t_int2 values(3,-12345.45678,-45.78,default,default,112);

update t_int2 set test=100 where id=3;

delete from t_int2 where id=3;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_int2';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_int2';

select * from t_int2;

case 19 "数据：数值类型:任意精度型&序列整型(串行类型smallserial/serial/bigserial) 添加默认值" 0
src_sql:
drop table t_int2;

create table t_int2 (
id    integer primary key,
c1    numeric(10,5),
c2    decimal(6,4),
c4    serial,
c5    bigserial,
test smallint
);

insert into t_int2 values(1,12345.45678,45.78,default,default,1);
insert into t_int2 values(2,12345.45,45.78,default,default,1);

alter table t_int2 alter column c2 set default 21;

insert into t_int2 values(3,-12345.45678,default,default,default,112);

update t_int2 set c2=100 where id=3;

delete from t_int2 where id=3;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_int2';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_int2';

select * from t_int2;

case 20 "数据：数值类型:任意精度型&序列整型(串行类型smallserial/serial/bigserial) truncate表" 0
src_sql:
drop table t_int2;

create table t_int2 (
id    integer primary key,
c1    numeric(10,5),
c2    decimal(6,4),
c4    serial,
c5    bigserial,
test smallint
);

insert into t_int2 values(1,12345.45678,45.78,default,default,1);
insert into t_int2 values(2,12345.45,45.78,default,default,1);

truncate table t_int2;

insert into t_int2 values(2,-12345.45678,default,default,default,112);
insert into t_int2 values(3,-12345.45678,-45.78,default,default,112);

update t_int2 set test3=100 where id=3;

delete from t_int2 where id=3;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_int2';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_int2';

select * from t_int2;

case 21 "数据：数值类型:浮点类型 建表" 0
src_sql:
drop table t_int3;

create table t_int3 (
id    integer primary key,
c1    real,
c2    float4,
c3    float8,
c4    float,
c5    float(3),
c6    decimal(10,4)
);

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_int3';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_int3';

case 22 "数据：数值类型:浮点类型 插入数据" 0
src_sql:
drop table t_int3;

create table t_int3 (
id    integer primary key,
c1    real,
c2    float4,
c3    float8,
c4    float,
c5    float(3),
c6    decimal(10,4)
);

INSERT INTO t_int3 VALUES(1,10.1234511,10.365456,123456.1234,123456.1234,10.321411, 321.321);
INSERT INTO t_int3 VALUES(2,-10.12345,-10.365456,-123456.1234,-123456.1234,-10.3214, -321.321);
INSERT INTO t_int3 VALUES(3,10.12345,10.365456,123456.1234,123456.1234,10.3214, 321.321);
INSERT INTO t_int3 VALUES(4,10.1234511,10.3654561,123456.1234,123456.1234,10.321411, 321.321);
INSERT INTO t_int3 VALUES(5,1033.12345,10.365456,123456.1234,123456.1234,10.3214, 321.321);

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_int3';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_int3';

select * from t_int3;

case 23 "数据：数值类型:浮点类型 修改数据" 0
src_sql:
drop table t_int3;

create table t_int3 (
id    integer primary key,
c1    real,
c2    float4,
c3    float8,
c4    float,
c5    float(3),
c6    decimal(10,4)
);

INSERT INTO t_int3 VALUES(1,10.1234511,10.365456,123456.1234,123456.1234,10.321411, 321.321);
INSERT INTO t_int3 VALUES(2,-10.12345,-10.365456,-123456.1234,-123456.1234,-10.3214, -321.321);
INSERT INTO t_int3 VALUES(3,10.12345,10.365456,123456.1234,123456.1234,10.3214, 321.321);
INSERT INTO t_int3 VALUES(4,10.1234511,10.3654561,123456.1234,123456.1234,10.321411, 321.321);
INSERT INTO t_int3 VALUES(5,1033.12345,10.365456,123456.1234,123456.1234,10.3214, 321.321);

update t_int3 set c1=null,c2=null,c3=null where id=1;
update t_int3 set c3=100.0203 where id=2;

delete from t_int3 where id>3;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_int3';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_int3';

select * from t_int3;

case 24 "数据：数值类型:浮点类型 重命名表" 0
src_sql:
drop table t_int3;

create table t_int3 (
id    integer primary key,
c1    real,
c2    float4,
c3    float8,
c4    float,
c5    float(3),
c6    decimal(10,4)
);

INSERT INTO t_int3 VALUES(1,10.1234511,10.365456,123456.1234,123456.1234,10.321411, 321.321);
INSERT INTO t_int3 VALUES(2,-10.12345,-10.365456,-123456.1234,-123456.1234,-10.3214, -321.321);
INSERT INTO t_int3 VALUES(3,10.12345,10.365456,123456.1234,123456.1234,10.3214, 321.321);

alter table t_int3 rename to c_t_int3;

INSERT INTO c_t_int3 VALUES(4,10.1234511,10.3654561,123456.1234,123456.1234,10.321411, 321.321);

update c_t_int3 set c3=100 where id=3;

delete from c_t_int3 where id=4;

alter table c_t_int3 rename to t_int3;

INSERT INTO t_int3 VALUES(4,10.1234511,10.3654561,123456.1234,123456.1234,10.321411, 321.321);

update t_int3 set c3=100 where id=3;

delete from t_int3 where id=4;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_int3';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_int3';

select * from t_int3;

case 25 "数据：数值类型:浮点类型 添加列" 0
src_sql:
drop table t_int3;

create table t_int3 (
id    integer primary key,
c1    real,
c2    float4,
c3    float8,
c4    float,
c5    float(3),
c6    decimal(10,4)
);

INSERT INTO t_int3 VALUES(1,10.1234511,10.365456,123456.1234,123456.1234,10.321411, 321.321);
INSERT INTO t_int3 VALUES(2,-10.12345,-10.365456,-123456.1234,-123456.1234,-10.3214, -321.321);
INSERT INTO t_int3 VALUES(3,10.12345,10.365456,123456.1234,123456.1234,10.3214, 321.321);

alter table t_int3 add test1 real;

INSERT INTO t_int3 VALUES(4,10.1234511,10.3654561,123456.1234,123456.1234,10.321411, 321.321,10.11);

update t_int3 set test1=100.111 where id=4;

delete from t_int3 where id=4;

alter table t_int3 add test2 float4,add test3 decimal(10,4);

INSERT INTO t_int3 VALUES(4,10.1234511,10.3654561,123456.1234,123456.1234,10.321411, 321.321,10.11,10.31,321.321);

update t_int3 set test2=33.33,test3=456.654 where id=4;

delete from t_int3 where id=4;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_int3';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_int3';

select * from t_int3;

case 26 "数据：数值类型:浮点类型 删除列" 0
src_sql:
drop table t_int3;

create table t_int3 (
id    integer primary key,
c1    real,
c2    float4,
c3    float8,
c4    float,
c5    float(3),
c6    decimal(10,4),
test1 real,
test2 float4,
test3 decimal(10,4)
);

INSERT INTO t_int3 VALUES(1,10.1234511,10.365456,123456.1234,123456.1234,10.321411, 321.321,10.11,10.31,321.321);
INSERT INTO t_int3 VALUES(2,-10.12345,-10.365456,-123456.1234,-123456.1234,-10.3214, -321.321,10.11,10.31,321.321);
INSERT INTO t_int3 VALUES(3,10.12345,10.365456,123456.1234,123456.1234,10.3214, 321.321,10.11,10.31,321.321);

alter table t_int3 drop test1;

INSERT INTO t_int3 VALUES(4,10.1234511,10.3654561,123456.1234,123456.1234,10.321411,321.321,10.31,321.321);

update t_int3 set test2=33.33,test3=456.654 where id=4;

delete from t_int3 where id=4;

alter table t_int3 drop test2,drop c3;

INSERT INTO t_int3 VALUES(4,10.1234511,10.3654561,123456.1234,10.321411, 321.321,321.321);

update t_int3 set c2=100 where id=4;

delete from t_int3 where id=4;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_int3';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_int3';

select * from t_int3;

case 27 "数据：数值类型:浮点类型 修改列属性" 0
src_sql:
drop table t_int3;

create table t_int3 (
id    integer primary key,
c1    real,
c2    float4,
c4    float,
c5    float(3),
c6    decimal(10,4),
test3 decimal(10,4)
);

INSERT INTO t_int3 VALUES(1,10.1234511,10.365456,123456.1234,10.321411, 321.321,321.321);
INSERT INTO t_int3 VALUES(2,-10.12345,-10.365456,-123456.1234,-10.3214, -321.321,321.321);
INSERT INTO t_int3 VALUES(3,10.12345,10.365456,123456.1234,10.3214, 321.321,321.321);

alter table t_int3 alter column c2 type float8;

INSERT INTO t_int3 VALUES(4,10.1234511,10.3654561,123456.1234,10.321411, 321.321,321.321);

update t_int3 set c2=100 where id=4;

delete from t_int3 where id=4;

alter table t_int3 alter column test3 type decimal(10,5),
                        alter column c4 type float(3);
						
INSERT INTO t_int3 VALUES(4,10.1234511,10.3654561,123456.1234,123456.1234,10.321411, 321.321);

update t_int3 set c4=100,test3=null where id=4;

delete from t_int3 where id=4;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_int3';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_int3';

select * from t_int3;

case 28 "数据：数值类型:浮点类型 重命名列" 0
src_sql:
drop table t_int3;

create table t_int3 (
id    integer primary key,
c1    real,
c2    float4,
c4    float,
c5    float(3),
c6    decimal(10,4),
test3 decimal(10,4)
);

INSERT INTO t_int3 VALUES(1,10.1234511,10.365456,123456.1234,10.321411, 321.321,321.321);
INSERT INTO t_int3 VALUES(2,-10.12345,-10.365456,-123456.1234,-10.3214, -321.321,321.321);
INSERT INTO t_int3 VALUES(3,10.12345,10.365456,123456.1234,10.3214, 321.321,321.321);

alter table t_int3 rename column test3 to test1;

INSERT INTO t_int3 VALUES(4,10.1234511,10.3654561,123456.1234,123456.1234,10.321411, 321.321);

update t_int3 set test1=100 where id=4;

delete from t_int3 where id=4;

alter table t_int3 rename column test1 to test;

INSERT INTO t_int3 VALUES(4,10.1234511,10.3654561,123456.1234,123456.1234,10.321411, 321.321);

update t_int3 set test=100 where id=4;

delete from t_int3 where id=4;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_int3';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_int3';

select * from t_int3;

case 29 "数据：数值类型:浮点类型 添加默认值" 0
src_sql:
drop table t_int3;

create table t_int3 (
id    integer primary key,
c1    real,
c2    float4,
c4    float,
c5    float(3),
c6    decimal(10,4),
test decimal(10,4)
);

INSERT INTO t_int3 VALUES(1,10.1234511,10.365456,123456.1234,10.321411, 321.321,321.321);
INSERT INTO t_int3 VALUES(2,-10.12345,-10.365456,-123456.1234,-10.3214, -321.321,321.321);
INSERT INTO t_int3 VALUES(3,10.12345,10.365456,123456.1234,10.3214, 321.321,321.321);

alter table t_int3 alter column c4 set default 123.1234;

INSERT INTO t_int3 VALUES(4,10.1234511,10.3654561,default,123456.1234,10.321411, 321.321);

update t_int3 set c4=100 where id=4;

delete from t_int3 where id=4;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_int3';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_int3';

select * from t_int3;

case 30 "数据：数值类型:浮点类型 truncate表" 0
src_sql:
drop table t_int3;

create table t_int3 (
id    integer primary key,
c1    real,
c2    float4,
c4    float,
c5    float(3),
c6    decimal(10,4),
test decimal(10,4)
);

INSERT INTO t_int3 VALUES(1,10.1234511,10.365456,123456.1234,10.321411, 321.321,321.321);
INSERT INTO t_int3 VALUES(2,-10.12345,-10.365456,-123456.1234,-10.3214, -321.321,321.321);
INSERT INTO t_int3 VALUES(3,10.12345,10.365456,123456.1234,10.3214, 321.321,321.321);

truncate table t_int3;

INSERT INTO t_int3 VALUES(3,10.1234511,10.3654561,default,123456.1234,10.321411, 321.321);
INSERT INTO t_int3 VALUES(4,10.1234511,10.3654561,123456.1234,123456.1234,10.321411, 321.321);

update t_int3 set test=100 where id=4;

delete from t_int3 where id=4;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_int3';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_int3';

select * from t_int3;

case 31 "数据：货币类型&布尔类型 建表" 0
src_sql:
drop table t_bool;

create table t_bool (
id    integer primary key,
c1    money,
c2    boolean
);

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_bool';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_bool';

case 32 "数据：货币类型&布尔类型 插入数据" 0
src_sql:
drop table t_bool;

create table t_bool (
id    integer primary key,
c1    money,
c2    boolean
);

insert into t_bool values(1,100.00,false);
insert into t_bool values(2,-2100.01,true);
insert into t_bool values(3,2100.01,null);

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_bool';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_bool';

select * from t_bool;

case 33 "数据：货币类型&布尔类型 修改数据" 0
src_sql:
drop table t_bool;

create table t_bool (
id    integer primary key,
c1    money,
c2    boolean
);

insert into t_bool values(1,100.00,false);
insert into t_bool values(2,-2100.01,true);
insert into t_bool values(3,2100.01,null);

update t_bool set c1=null,c2=null where id=1;
update t_bool set c1=123456,c2=false where id=2;

delete from t_bool where id=3;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_bool';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_bool';

select * from t_bool;

case 34 "数据：货币类型&布尔类型 重命名表" 0
src_sql:
drop table t_bool;

create table t_bool (
id    integer primary key,
c1    money,
c2    boolean
);

insert into t_bool values(1,100.00,false);
insert into t_bool values(2,-2100.01,true);
insert into t_bool values(3,2100.01,null);

alter table t_bool rename to c_t_bool;

INSERT INTO c_t_bool VALUES(3,2100.01,null);

update c_t_bool set c1=100 where id=3;

delete from c_t_bool where id=3;

alter table c_t_bool rename to t_bool;

INSERT INTO t_bool VALUES(3,2100.01,null);

update t_bool set c1=100 where id=3;

delete from t_bool where id=3;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_bool';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_bool';

select * from t_bool;

case 35 "数据：货币类型&布尔类型 添加列" 0
src_sql:
drop table t_bool;

create table t_bool (
id    integer primary key,
c1    money,
c2    boolean
);

insert into t_bool values(1,100.00,false);
insert into t_bool values(2,-2100.01,true);
insert into t_bool values(3,2100.01,null);

alter table t_bool add test1 money;

INSERT INTO t_bool VALUES(3,2100.01,null,-2100.01);

update t_bool set test1=100 where id=3;

delete from t_bool where id=3;

alter table t_bool add test2 boolean,add test3 money;

INSERT INTO t_bool VALUES(3,2100.01,null,-2100.01,true,321.321);

update t_bool set test3=100,test2=false where id=3;

delete from t_bool where id=3;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_bool';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_bool';

select * from t_bool;

case 36 "数据：货币类型&布尔类型 删除列" 0
src_sql:
drop table t_bool;

create table t_bool (
id    integer primary key,
c1    money,
c2    boolean,
test1 money,
test2 boolean,
test3 money
);

insert into t_bool values(1,100.00,false,-2100.01,true,321.321);
insert into t_bool values(2,-2100.01,true,-2100.01,true,321.321);
insert into t_bool values(3,2100.01,null,-2100.01,true,321.321);

alter table t_bool drop test1;

INSERT INTO t_bool VALUES(3,2100.01,null,true,321.321);

update t_bool set test3=100,test2=false where id=3;

delete from t_bool where id=3;

alter table t_bool drop test2,drop c1;

INSERT INTO t_bool VALUES(3,true, 321.321);

update t_bool set test3=100 where id=3;

delete from t_bool where id=3;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_bool';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_bool';

select * from t_bool;

case 37 "数据：货币类型&布尔类型 修改列属性" 0
src_sql:
drop table t_bool;

create table t_bool (
id    integer primary key,
c2    boolean,
test3 money
);

insert into t_bool values(1,false,321.321);
insert into t_bool values(2,true,321.321);
insert into t_bool values(3,null,321.321);

alter table t_bool alter column c2 type char(5);

INSERT INTO t_bool VALUES(3,true, 321.321);

update t_bool set c2='hhhh' where id=3;

delete from t_bool where id=3;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_bool';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_bool';

select * from t_bool;

case 38 "数据：货币类型&布尔类型 重命名列" 0
src_sql:
drop table t_bool;

create table t_bool (
id    integer primary key,
c2    boolean,
test3 money
);

insert into t_bool values(1,false,321.321);
insert into t_bool values(2,true,321.321);
insert into t_bool values(3,null,321.321);

alter table t_bool rename column test3 to test1;

INSERT INTO t_bool VALUES(3,true, 321.321);

update t_bool set test1=100 where id=3;

delete from t_bool where id=3;

alter table t_bool rename column test1 to test;

INSERT INTO t_bool VALUES(3,true, 321.321);

update t_bool set test=100 where id=3;

delete from t_bool where id=3;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_bool';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_bool';

select * from t_bool;

case 39 "数据：货币类型&布尔类型 添加默认值" 0
src_sql:
drop table t_bool;

create table t_bool (
id    integer primary key,
c2    boolean,
test money
);

insert into t_bool values(1,false,321.321);
insert into t_bool values(2,true,321.321);
insert into t_bool values(3,null,321.321);

alter table t_bool alter column test set default 123;

INSERT INTO t_bool VALUES(3,true, default);

update t_bool set test=100 where id=3;

delete from t_bool where id=3;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_bool';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_bool';

select * from t_bool;

case 40 "数据：货币类型&布尔类型 truncate表" 0
src_sql:
drop table t_bool;

create table t_bool (
id    integer primary key,
c2    boolean,
test money
);

insert into t_bool values(1,false,321.321);
insert into t_bool values(2,true,321.321);
insert into t_bool values(3,null,321.321);

truncate table t_bool;

INSERT INTO t_bool VALUES(2,true, 321.321);
INSERT INTO t_bool VALUES(3,true, 321.321);

update t_bool set test=100 where id=3;

delete from t_bool where id=3;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_bool';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_bool';

select * from t_bool;

case 41 "数据：字符类型 " 0
src_sql:
drop table t_char;

create table t_char (
id    integer primary key,
c1    char,
c2    char(5),
c3    character,
c4    character(6),
c5    varchar,
c6    varchar(10),
c7    character varying,
c8    character varying(6),
c9    text
);

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_char';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_char';

case 42 "数据：字符类型 插入数据" 0
src_sql:
drop table t_char;

create table t_char (
id    integer primary key,
c1    char,
c2    char(5),
c3    character,
c4    character(6),
c5    varchar,
c6    varchar(10),
c7    character varying,
c8    character varying(6),
c9    text
);

insert into t_char values(1,'1','world','w','test1','info','soft','active','stream','banana');
insert into t_char values(2,' ','\,.*;','8','#%^;',',%^;o','#&&;','#%^;','%%**@@','^^&&**');
insert into t_char values(3,'w','你好','w','测试','完成','了呢','产品','开发','测试2');
insert into t_char values(4,'h','world','w','test1','info','soft','active','stream','banana');
insert into t_char values(5,'w','\/','w','测/试','完\成','了呢','产品','开发','测试2');

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_char';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_char';

select * from t_char;

case 43 "数据：字符类型 修改数据" 0
src_sql:
drop table t_char;

create table t_char (
id    integer primary key,
c1    char,
c2    char(5),
c3    character,
c4    character(6),
c5    varchar,
c6    varchar(10),
c7    character varying,
c8    character varying(6),
c9    text
);

insert into t_char values(1,'1','world','w','test1','info','soft','active','stream','banana');
insert into t_char values(2,' ','\,.*;','8','#%^;',',%^;o','#&&;','#%^;','%%**@@','^^&&**');
insert into t_char values(3,'w','你好','w','测试','完成','了呢','产品','开发','测试2');
insert into t_char values(4,'h','world','w','test1','info','soft','active','stream','banana');
insert into t_char values(5,'w','\/','w','测/试','完\成','了呢','产品','开发','测试2');

update t_char set c1=null,c2=null,c3=null,c4=null,c5=null,c6=null,c7=null,c8=null,c9=null where id=1;
update t_char set c1='y',c2='heel',c9='0' where id=2;

delete from t_char where id>3;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_char';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_char';

select * from t_char;

case 44 "数据：字符类型 重命名表" 0
src_sql:
drop table t_char;

create table t_char (
id    integer primary key,
c1    char,
c2    char(5),
c3    character,
c4    character(6),
c5    varchar,
c6    varchar(10),
c7    character varying,
c8    character varying(6),
c9    text
);

insert into t_char values(1,'1','world','w','test1','info','soft','active','stream','banana');
insert into t_char values(2,' ','\,.*;','8','#%^;',',%^;o','#&&;','#%^;','%%**@@','^^&&**');
insert into t_char values(3,'w','你好','w','测试','完成','了呢','产品','开发','测试2');

alter table t_char rename to c_t_char;

insert into c_t_char values(4,'h','world','w','test1','info','soft','active','stream','banana');

update c_t_char set c3=null where id=3;

delete from c_t_char where id=4;

alter table c_t_char rename to t_char;

insert into t_char values(4,'h','world','w','test1','info','soft','active','stream','banana');

update t_char set c3=null where id=3;

delete from t_char where id=4;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_char';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_char';

select * from t_char;

case 45 "数据：字符类型 添加列" 0
src_sql:
drop table t_char;

create table t_char (
id    integer primary key,
c1    char,
c2    char(5),
c3    character,
c4    character(6),
c5    varchar,
c6    varchar(10),
c7    character varying,
c8    character varying(6),
c9    text
);

insert into t_char values(1,'1','world','w','test1','info','soft','active','stream','banana');
insert into t_char values(2,' ','\,.*;','8','#%^;',',%^;o','#&&;','#%^;','%%**@@','^^&&**');
insert into t_char values(3,'w','你好','w','测试','完成','了呢','产品','开发','测试2');

alter table t_char add test1 char;

INSERT INTO t_char VALUES(4,'h','world','w','test1','info','soft','active','stream','banana','h');

update t_char set test1='r' where id=3;

delete from t_char where id=4;

alter table t_char add test2 character(6),add test3 character varying;

INSERT INTO t_char VALUES(4,'h','world','w','test1','info','soft','active','stream','banana','h','world','123qs');

update t_char set test1='r',test2='',test3=null where id=3;

delete from t_char where id=4;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_char';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_char';

select * from t_char;

case 46 "数据：字符类型 删除列" 0
src_sql:
drop table t_char;

create table t_char (
id    integer primary key,
c1    char,
c2    char(5),
c3    character,
c4    character(6),
c5    varchar,
c6    varchar(10),
c7    character varying,
c8    character varying(6),
c9    text,
test1 char,
test2 character(6),
test3 character varying
);

insert into t_char values(1,'1','world','w','test1','info','soft','active','stream','banana','h','world','123qs');
insert into t_char values(2,' ','\,.*;','8','#%^;',',%^;o','#&&;','#%^;','%%**@@','^^&&**','h','world','123qs');
insert into t_char values(3,'w','你好','w','测试','完成','了呢','产品','开发','测试2','h','world','123qs');

alter table t_char drop test1;

INSERT INTO t_char VALUES(4,'h','world','w','test1','info','soft','active','stream','banana','world','123qs');

update t_char set test2='',test3=null where id=3;

delete from t_char where id=4;

alter table t_char drop test2,drop c1;

INSERT INTO t_char VALUES(4,'world','w','test1','info','soft','active','stream','banana','123qs');

update t_char set test3='efr100' where id=4;

delete from t_char where id=4;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_char';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_char';

select * from t_char;

case 47 "数据：字符类型 修改列属性" 0
src_sql:
drop table t_char;

create table t_char (
id    integer primary key,
c2    char(5),
c3    character,
c4    character(6),
c5    varchar,
c6    varchar(10),
c7    character varying,
c8    character varying(6),
c9    text,
test3 character varying
);

insert into t_char values(1,'world','w','test1','info','soft','active','stream','banana','123qs');
insert into t_char values(2,'\,.*;','8','#%^;',',%^;o','#&&;','#%^;','%%**@@','^^&&**','123qs');
insert into t_char values(3,'你好','w','测试','完成','了呢','产品','开发','测试2','123qs');

alter table t_char alter column c2 type text;

INSERT INTO t_char VALUES(4,'world','w','test1','info','soft','active','stream','banana','123qs');

update t_char set c2='efr100' where id=4;

delete from t_char where id=4;

alter table t_char alter column test3 type varchar(20),
                        alter column c4 type character varying(6);
						
INSERT INTO t_char VALUES(4,'world','w','test1','info','soft','active','stream','banana','123qs');

update t_char set test3='efr100',c4='' where id=4;

delete from t_char where id=4;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_char';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_char';

select * from t_char;

case 48 "数据：字符类型 重命名列" 0
src_sql:
drop table t_char;

create table t_char (
id    integer primary key,
c2    char(5),
c3    character,
c4    character(6),
c5    varchar,
c6    varchar(10),
c7    character varying,
c8    character varying(6),
c9    text,
test3 character varying
);

insert into t_char values(1,'world','w','test1','info','soft','active','stream','banana','123qs');
insert into t_char values(2,'\,.*;','8','#%^;',',%^;o','#&&;','#%^;','%%**@@','^^&&**','123qs');
insert into t_char values(3,'你好','w','测试','完成','了呢','产品','开发','测试2','123qs');

alter table t_char rename column test3 to test1;

INSERT INTO t_char VALUES(4,'world','w','test1','info','soft','active','stream','banana','123qs');

update t_char set test1='efr100' where id=4;

delete from t_char where id=4;

alter table t_char rename column test1 to test;

INSERT INTO t_char VALUES(4,'world','w','test1','info','soft','active','stream','banana','123qs');

update t_char set test='efr100' where id=4;

delete from t_char where id=4;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_char';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_char';

select * from t_char;

case 49 "数据：字符类型 添加默认值" 0
src_sql:
drop table t_char;

create table t_char (
id    integer primary key,
c2    char(5),
c3    character,
c4    character(6),
c5    varchar,
c6    varchar(10),
c7    character varying,
c8    character varying(6),
c9    text,
test character varying
);

insert into t_char values(1,'world','w','test1','info','soft','active','stream','banana','123qs');
insert into t_char values(2,'\,.*;','8','#%^;',',%^;o','#&&;','#%^;','%%**@@','^^&&**','123qs');
insert into t_char values(3,'你好','w','测试','完成','了呢','产品','开发','测试2','123qs');

alter table t_char alter column test set default '123';

INSERT INTO t_char VALUES(4,'world','w','test1','info','soft','active','stream','banana',default);

update t_char set test='efr100' where id=4;

delete from t_char where id=4;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_char';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_char';

select * from t_char;

case 50 "数据：字符类型 truncate表" 0
src_sql:
drop table t_char;

create table t_char (
id    integer primary key,
c2    char(5),
c3    character,
c4    character(6),
c5    varchar,
c6    varchar(10),
c7    character varying,
c8    character varying(6),
c9    text,
test character varying
);

insert into t_char values(1,'world','w','test1','info','soft','active','stream','banana','123qs');
insert into t_char values(2,'\,.*;','8','#%^;',',%^;o','#&&;','#%^;','%%**@@','^^&&**','123qs');
insert into t_char values(3,'你好','w','测试','完成','了呢','产品','开发','测试2','123qs');

truncate table t_char;

INSERT INTO t_char VALUES(1,'world','w','test1','info','soft','active','stream','banana',default);
INSERT INTO t_char VALUES(2,'world','w','test1','info','soft','active','stream','banana','46tr');
INSERT INTO t_char VALUES(4,'world','w','test1','info','soft','active','stream','banana',default);

update t_char set test='efr100' where id=4;

delete from t_char where id=4;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_char';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_char';

select * from t_char;

case 51 "数据：日期/时间类型 建表" 0
src_sql:
drop table t_time;

create table t_time (
id                  integer primary key,
c_date              date,
c_time              time,
c_time4             time(4),
c_timezone          time with time zone,
c_time4zone         time(4) with time zone,
c_timestamp         timestamp,
c_timestamp5        timestamp(5),
c_timestampzone     timestamp with time zone,
c_timestamp5zone    timestamp(5) with time zone,
c_interval3         interval(3)   
);

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_time';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_time';

case 52 "数据：日期/时间类型 插入数据" 0
src_sql:
drop table t_time;

create table t_time (
id                  integer primary key,
c_date              date,
c_time              time,
c_time4             time(4),
c_timezone          time with time zone,
c_time4zone         time(4) with time zone,
c_timestamp         timestamp,
c_timestamp5        timestamp(5),
c_timestampzone     timestamp with time zone,
c_timestamp5zone    timestamp(5) with time zone,
c_interval3         interval(3)   
);

insert into t_time values (1, date '08/12/21 12:34:56',
'21:21:21', '09:32:21', '21:21:21 pst', '09:32:21 -8:00',
'2021-12-12','2022-03-12','2013-12-11 pst','2022-03-12 -8:00',
interval '2' year
);
INSERT INTO t_time VALUES (2, date '12/10/20 12:34:56',
'now', '09:32:21', '21:21:21 pst', '09:32:21 -8:00',
'today','2022-03-12','2013-12-11 pst','2022-03-12 -8:00',
interval '3' day
);
INSERT INTO t_time VALUES (3, 'yesterday',
'now', '09:32:21', '21:21:21 pst', '09:32:21 -8:00',
'today','2022-03-12','2013-12-11 pst','2022-03-12 -8:00',
interval '3' day
);
insert into t_time values (4, date '08/12/21 12:34:56',
'21:21:21', '09:32:21', '21:21:21 -8:00', '09:32:21 pst',
'2021-12-12','2022-03-12','2013-12-11 pst','2022-03-12 -8:00',
interval '3' day
);

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_time';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_time';

select * from t_time;

case 53 "数据：日期/时间类型 修改数据" 0
src_sql:
drop table t_time;

create table t_time (
id                  integer primary key,
c_date              date,
c_time              time,
c_time4             time(4),
c_timezone          time with time zone,
c_time4zone         time(4) with time zone,
c_timestamp         timestamp,
c_timestamp5        timestamp(5),
c_timestampzone     timestamp with time zone,
c_timestamp5zone    timestamp(5) with time zone,
c_interval3         interval(3)   
);

insert into t_time values (1, date '08/12/21 12:34:56',
'21:21:21', '09:32:21', '21:21:21 pst', '09:32:21 -8:00',
'2021-12-12','2022-03-12','2013-12-11 pst','2022-03-12 -8:00',
interval '2' year
);
INSERT INTO t_time VALUES (2, date '12/10/20 12:34:56',
'now', '09:32:21', '21:21:21 pst', '09:32:21 -8:00',
'today','2022-03-12','2013-12-11 pst','2022-03-12 -8:00',
interval '3' day
);
INSERT INTO t_time VALUES (3, 'yesterday',
'now', '09:32:21', '21:21:21 pst', '09:32:21 -8:00',
'today','2022-03-12','2013-12-11 pst','2022-03-12 -8:00',
interval '3' day
);
insert into t_time values (4, date '08/12/21 12:34:56',
'21:21:21', '09:32:21', '21:21:21 -8:00', '09:32:21 pst',
'2021-12-12','2022-03-12','2013-12-11 pst','2022-03-12 -8:00',
interval '3' day
);

update t_time set c_date = date '2033-10-22 11:22:33',c_time ='04:05:06.789-8' where id = 3;
update t_time set c_date =null,c_time=null where id =2;

delete from t_time where id=1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_time';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_time';

select * from t_time;

case 54 "数据：日期/时间类型 重命名表" 0
src_sql:
drop table t_time;

create table t_time (
id                  integer primary key,
c_date              date,
c_time              time,
c_time4             time(4),
c_timezone          time with time zone,
c_time4zone         time(4) with time zone,
c_timestamp         timestamp,
c_timestamp5        timestamp(5),
c_timestampzone     timestamp with time zone,
c_timestamp5zone    timestamp(5) with time zone,
c_interval3         interval(3)   
);


INSERT INTO t_time VALUES (2, date '12/10/20 12:34:56',
'now', '09:32:21', '21:21:21 pst', '09:32:21 -8:00',
'today','2022-03-12','2013-12-11 pst','2022-03-12 -8:00',
interval '3' day
);
INSERT INTO t_time VALUES (3, 'yesterday',
'now', '09:32:21', '21:21:21 pst', '09:32:21 -8:00',
'today','2022-03-12','2013-12-11 pst','2022-03-12 -8:00',
interval '3' day
);

alter table t_time rename to c_t_time;

INSERT INTO c_t_time VALUES (1, 'yesterday',
'now', '09:32:21', '21:21:21 pst', '09:32:21 -8:00',
'today','2022-03-12','2013-12-11 pst','2022-03-12 -8:00',
interval '3' day
);

update c_t_time set c_date =null,c_time=null where id=3;

delete from c_t_time where id=3;

alter table c_t_time rename to t_time;

INSERT INTO t_time VALUES (1, 'yesterday',
'now', '09:32:21', '21:21:21 pst', '09:32:21 -8:00',
'today','2022-03-12','2013-12-11 pst','2022-03-12 -8:00',
interval '3' day
);

update t_time set c_date =null,c_time=null where id=3;

delete from t_time where id=3;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_time';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_time';

select * from t_time;

case 55 "数据：日期/时间类型 添加列" 0
src_sql:
drop table t_time;

create table t_time (
id                  integer primary key,
c_date              date,
c_time              time,
c_time4             time(4),
c_timezone          time with time zone,
c_time4zone         time(4) with time zone,
c_timestamp         timestamp,
c_timestamp5        timestamp(5),
c_timestampzone     timestamp with time zone,
c_timestamp5zone    timestamp(5) with time zone,
c_interval3         interval(3)   
);


insert into t_time values (1, date '08/12/21 12:34:56',
'21:21:21', '09:32:21', '21:21:21 pst', '09:32:21 -8:00',
'2021-12-12','2022-03-12','2013-12-11 pst','2022-03-12 -8:00',
interval '2' year
);
INSERT INTO t_time VALUES (2, date '12/10/20 12:34:56',
'now', '09:32:21', '21:21:21 pst', '09:32:21 -8:00',
'today','2022-03-12','2013-12-11 pst','2022-03-12 -8:00',
interval '3' day
);

alter table t_time add test1 timestamp with time zone;

INSERT INTO t_time VALUES (3, 'yesterday',
'now', '09:32:21', '21:21:21 pst', '09:32:21 -8:00',
'today','2022-03-12','2013-12-11 pst','2022-03-12 -8:00',
interval '3' day
);

update t_time set test1 =null,c_time=null where id=3;

delete from t_time where id=4;

alter table t_time add test2 timestamp(5) with time zone,add test3 interval(3);

INSERT INTO t_time VALUES (3, 'yesterday',
'now', '09:32:21', '21:21:21 pst', '09:32:21 -8:00',
'today','2022-03-12','2013-12-11 pst','2022-03-12 -8:00',
interval '3' day,'2013-12-11 pst','2022-03-12 -8:00',
interval '3' day
);

update t_time set test2 =null,test3=null where id=3;

delete from t_time where id=4;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_time';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_time';

select * from t_time;

case 56 "数据：日期/时间类型 删除列" 0
src_sql:
drop table t_time;

create table t_time (
id                  integer primary key,
c_date              date,
c_time              time,
c_time4             time(4),
c_timezone          time with time zone,
c_time4zone         time(4) with time zone,
c_timestamp         timestamp,
c_timestamp5        timestamp(5),
c_timestampzone     timestamp with time zone,
c_timestamp5zone    timestamp(5) with time zone,
c_interval3         interval(3),
test1				timestamp with time zone,
test2				timestamp(5) with time zone,
test3   			interval(3)
);


insert into t_time values (1, date '08/12/21 12:34:56',
'21:21:21', '09:32:21', '21:21:21 pst', '09:32:21 -8:00',
'2021-12-12','2022-03-12','2013-12-11 pst','2022-03-12 -8:00',
interval '2' year,'2013-12-11 pst','2022-03-12 -8:00',
interval '3' day
);
INSERT INTO t_time VALUES (2, date '12/10/20 12:34:56',
'now', '09:32:21', '21:21:21 pst', '09:32:21 -8:00',
'today','2022-03-12','2013-12-11 pst','2022-03-12 -8:00',
interval '3' day,'2013-12-11 pst','2022-03-12 -8:00',
interval '3' day
);

alter table t_time drop test1;

INSERT INTO t_time VALUES (3, 'yesterday',
'now', '09:32:21', '21:21:21 pst', '09:32:21 -8:00',
'today','2022-03-12','2013-12-11 pst','2022-03-12 -8:00',
'2013-12-11 pst','2022-03-12 -8:00',
interval '3' day
);

update t_time set test2 =null,test3=null where id=3;

delete from t_time where id=4;

alter table t_time drop test2,drop test3;

insert into t_time values (4, date '08/12/21 12:34:56',
'21:21:21', '09:32:21', '21:21:21 -8:00', '09:32:21 pst',
'2021-12-12','2022-03-12','2013-12-11 pst','2022-03-12 -8:00',
interval '3' day
);

update t_time set c_date =null,c_time=null where id=4;

delete from t_time where id=4;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_time';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_time';

select * from t_time;

case 57 "数据：日期/时间类型 修改列属性" 0
src_sql:
drop table t_time;

create table t_time (
id                  integer primary key,
c_date              date,
c_time              time,
c_time4             time(4),
c_timezone          time with time zone,
c_time4zone         time(4) with time zone,
c_timestamp         timestamp,
c_timestamp5        timestamp(5),
c_timestampzone     timestamp with time zone,
c_timestamp5zone    timestamp(5) with time zone,
c_interval3         interval(3)   
);


insert into t_time values (1, date '08/12/21 12:34:56',
'21:21:21', '09:32:21', '21:21:21 pst', '09:32:21 -8:00',
'2021-12-12','2022-03-12','2013-12-11 pst','2022-03-12 -8:00',
interval '2' year
);
INSERT INTO t_time VALUES (2, date '12/10/20 12:34:56',
'now', '09:32:21', '21:21:21 pst', '09:32:21 -8:00',
'today','2022-03-12','2013-12-11 pst','2022-03-12 -8:00',
interval '3' day
);

alter table t_time alter column c_time type text;

insert into t_time values (4, date '08/12/21 12:34:56',
'21:21:21', '09:32:21', '21:21:21 -8:00', '09:32:21 pst',
'2021-12-12','2022-03-12','2013-12-11 pst','2022-03-12 -8:00',
interval '3' day
);

update t_time set c_date =null,c_time=null where id=4;

delete from t_time where id=4;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_time';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_time';

select * from t_time;

case 58 "数据：日期/时间类型 重命名列" 0
src_sql:
drop table t_time;

create table t_time (
id                  integer primary key,
c_date              date,
c_time              time,
c_time4             time(4),
c_timezone          time with time zone,
c_time4zone         time(4) with time zone,
c_timestamp         timestamp,
c_timestamp5        timestamp(5),
c_timestampzone     timestamp with time zone,
c_timestamp5zone    timestamp(5) with time zone,
c_interval3         interval(3)   
);


insert into t_time values (1, date '08/12/21 12:34:56',
'21:21:21', '09:32:21', '21:21:21 pst', '09:32:21 -8:00',
'2021-12-12','2022-03-12','2013-12-11 pst','2022-03-12 -8:00',
interval '2' year
);
INSERT INTO t_time VALUES (2, date '12/10/20 12:34:56',
'now', '09:32:21', '21:21:21 pst', '09:32:21 -8:00',
'today','2022-03-12','2013-12-11 pst','2022-03-12 -8:00',
interval '3' day
);

alter table t_time rename column c_date to c_date_n;

insert into t_time values (4, date '08/12/21 12:34:56',
'21:21:21', '09:32:21', '21:21:21 -8:00', '09:32:21 pst',
'2021-12-12','2022-03-12','2013-12-11 pst','2022-03-12 -8:00',
interval '3' day
)
update t_time set c_date_n =null,c_time=null where id=4;

delete from t_time where id=4;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_time';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_time';

select * from t_time;

case 59 "数据：日期/时间类型 添加默认值" 0
src_sql:
drop table t_time;

create table t_time (
id                  integer primary key,
c_date_n            date,
c_time              time,
c_time4             time(4),
c_timezone          time with time zone,
c_time4zone         time(4) with time zone,
c_timestamp         timestamp,
c_timestamp5        timestamp(5),
c_timestampzone     timestamp with time zone,
c_timestamp5zone    timestamp(5) with time zone,
c_interval3         interval(3)   
);


insert into t_time values (1, date '08/12/21 12:34:56',
'21:21:21', '09:32:21', '21:21:21 pst', '09:32:21 -8:00',
'2021-12-12','2022-03-12','2013-12-11 pst','2022-03-12 -8:00',
interval '2' year
);
INSERT INTO t_time VALUES (2, date '12/10/20 12:34:56',
'now', '09:32:21', '21:21:21 pst', '09:32:21 -8:00',
'today','2022-03-12','2013-12-11 pst','2022-03-12 -8:00',
interval '3' day
);

alter table t_time alter column c_interval3 set default interval '3' day;

insert into t_time values (4, date '08/12/21 12:34:56',
'21:21:21', '09:32:21', '21:21:21 -8:00', '09:32:21 pst',
'2021-12-12','2022-03-12','2013-12-11 pst','2022-03-12 -8:00',
default
);

update t_time set c_interval3=null where id=4;

delete from t_time where id=4;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_time';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_time';

select * from t_time;

case 60 "数据：日期/时间类型 truncate表" 0
src_sql:
drop table t_time;

create table t_time (
id                  integer primary key,
c_date_n            date,
c_time              time,
c_time4             time(4),
c_timezone          time with time zone,
c_time4zone         time(4) with time zone,
c_timestamp         timestamp,
c_timestamp5        timestamp(5),
c_timestampzone     timestamp with time zone,
c_timestamp5zone    timestamp(5) with time zone,
c_interval3         interval(3)   
);


insert into t_time values (1, date '08/12/21 12:34:56',
'21:21:21', '09:32:21', '21:21:21 pst', '09:32:21 -8:00',
'2021-12-12','2022-03-12','2013-12-11 pst','2022-03-12 -8:00',
interval '2' year
);
INSERT INTO t_time VALUES (2, date '12/10/20 12:34:56',
'now', '09:32:21', '21:21:21 pst', '09:32:21 -8:00',
'today','2022-03-12','2013-12-11 pst','2022-03-12 -8:00',
interval '3' day
);

truncate table t_time;

insert into t_time values (1, date '08/12/21 12:34:56',
'21:21:21', '09:32:21', '21:21:21 -8:00', '09:32:21 pst',
'2021-12-12','2022-03-12','2013-12-11 pst','2022-03-12 -8:00',
interval '3' day
);
insert into t_time values (2, date '08/12/21 12:34:56',
'21:21:21', '09:32:21', '21:21:21 -8:00', '09:32:21 pst',
'2021-12-12','2022-03-12','2013-12-11 pst','2022-03-12 -8:00',
interval '3' day
);

update t_time set c_date_n =null,c_time=null where id=2;

delete from t_time where id=2;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_time';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_time';

select * from t_time;

case 61 "数据：枚举类型enum 建表" 0
src_sql:
drop table t_enum;

drop type mood;

CREATE TYPE mood AS ENUM ('sad', 'ok', 'happy');

CREATE TABLE t_enum (id integer primary key, name text, current_mood mood);

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_enum';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_enum';

case 62 "数据：枚举类型enum 插入数据" 0
src_sql:
drop table t_enum;

drop type mood;

CREATE TYPE mood AS ENUM ('sad', 'ok', 'happy');

CREATE TABLE t_enum (id integer primary key, name text, current_mood mood);

INSERT INTO t_enum VALUES (1,'Moe', 'happy');
INSERT INTO t_enum VALUES (2,'Moe', 'happy');
INSERT INTO t_enum VALUES (3,'Moe', 'happy');
INSERT INTO t_enum VALUES (4,'Moe', 'happy');

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_enum';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_enum';

select * from t_enum;

case 63 "数据：枚举类型enum 修改数据" 0
src_sql:
drop table t_enum;

drop type mood;

CREATE TYPE mood AS ENUM ('sad', 'ok', 'happy');

CREATE TABLE t_enum (id integer primary key, name text, current_mood mood);

INSERT INTO t_enum VALUES (1,'Moe', 'happy');
INSERT INTO t_enum VALUES (2,'Moe', 'happy');
INSERT INTO t_enum VALUES (3,'Moe', 'happy');
INSERT INTO t_enum VALUES (4,'Moe', 'happy');

update t_enum set name ='joy',current_mood= 'ok' where id =2;

delete from t_enum where id < 2;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_enum';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_enum';

select * from t_enum;

case 64 "数据：枚举类型enum 重命名表" 0
src_sql:
drop table t_enum;

drop type mood;

CREATE TYPE mood AS ENUM ('sad', 'ok', 'happy');

CREATE TABLE t_enum (id integer primary key, name text, current_mood mood);

INSERT INTO t_enum VALUES (2,'Moe', 'happy');
INSERT INTO t_enum VALUES (3,'Moe', 'happy');

alter table t_enum rename to c_t_enum;

INSERT INTO c_t_enum VALUES(1,'Moe', 'happy');

update c_t_enum set name ='joy',current_mood= 'ok' where id =3;

delete from c_t_enum where id=1;

alter table c_t_enum rename to t_enum;

INSERT INTO t_enum VALUES(1,'Moe', 'happy');

update t_enum set name ='joy',current_mood= 'ok' where id =3;

delete from t_enum where id=1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_enum';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_enum';

select * from t_enum;

case 65 "数据：枚举类型enum 添加列" 0
src_sql:
drop table t_enum;

drop type mood;

CREATE TYPE mood AS ENUM ('sad', 'ok', 'happy');

CREATE TABLE t_enum (id integer primary key, name text, current_mood mood);

INSERT INTO t_enum VALUES (2,'Moe', 'happy');
INSERT INTO t_enum VALUES (3,'Moe', 'happy');

alter table t_enum add test1 char;

INSERT INTO t_enum VALUES(1,'Moe', 'happy','t');

update t_enum set test1='r' where id=1;

delete from t_enum where id=1;

alter table t_enum add test2 character(6),add test3 character varying;

INSERT INTO t_enum VALUES(1,'Moe', 'happy','t','info','soft');

update t_enum set test2='',test3=null where id=1;

delete from t_enum where id=1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_enum';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_enum';

select * from t_enum;

case 66 "数据：枚举类型enum 删除列" 0
src_sql:
drop table t_enum;

drop type mood;

CREATE TYPE mood AS ENUM ('sad', 'ok', 'happy');

CREATE TABLE t_enum (id integer primary key, name text, current_mood mood,test1 char,test2 character(6),test3 character varying);

INSERT INTO t_enum VALUES (2,'Moe', 'happy','t','info','soft');
INSERT INTO t_enum VALUES (3,'Moe', 'happy','t','info','soft');

alter table t_enum drop test1;

INSERT INTO t_enum VALUES(1,'Moe', 'happy','info','soft');

update t_enum set test2='',test3=null where id=1;

delete from t_enum where id=1;

alter table t_enum drop test2,drop test3;

INSERT INTO t_enum VALUES(1,'Moe', 'happy');

update t_enum set name ='joy' where id=1;

delete from t_enum where id=1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_enum';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_enum';

select * from t_enum;

case 67 "数据：枚举类型enum 修改列属性" 0
src_sql:
drop table t_enum;

drop type mood;

CREATE TYPE mood AS ENUM ('sad', 'ok', 'happy');

CREATE TABLE t_enum (id integer primary key, name text, current_mood mood);

INSERT INTO t_enum VALUES (2,'Moe', 'happy');
INSERT INTO t_enum VALUES (3,'Moe', 'happy');

alter table t_enum alter column name type varchar(20);

INSERT INTO t_enum VALUES(1,'Moe', 'happy');

update t_enum set name ='joy' where id=1;

delete from t_enum where id=1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_enum';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_enum';

select * from t_enum;

case 68 "数据：枚举类型enum 重命名列" 0
src_sql:
drop table t_enum;

drop type mood;

CREATE TYPE mood AS ENUM ('sad', 'ok', 'happy');

CREATE TABLE t_enum (id integer primary key, name text, current_mood mood);

INSERT INTO t_enum VALUES (2,'Moe', 'happy');
INSERT INTO t_enum VALUES (3,'Moe', 'happy');

alter table t_enum rename column name to name1;

INSERT INTO t_enum VALUES(1,'Moe', 'happy');

update t_enum set name1 ='joy' where id=1;

delete from t_enum where id=1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_enum';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_enum';

select * from t_enum;

case 69 "数据：枚举类型enum 添加默认值" 0
src_sql:
drop table t_enum;

drop type mood;

CREATE TYPE mood AS ENUM ('sad', 'ok', 'happy');

CREATE TABLE t_enum (id integer primary key, name1 text, current_mood mood);

INSERT INTO t_enum VALUES (2,'Moe', 'happy');
INSERT INTO t_enum VALUES (3,'Moe', 'happy');

alter table t_enum alter column current_mood set default 'ok';

INSERT INTO t_enum VALUES(1,'Moe', 'happy');

update t_enum set current_mood ='happy' where id=1;

delete from t_enum where id=1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_enum';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_enum';

select * from t_enum;

case 70 "数据：枚举类型enum truncate表" 0
src_sql:
drop table t_enum;

drop type mood;

CREATE TYPE mood AS ENUM ('sad', 'ok', 'happy');

CREATE TABLE t_enum (id integer primary key, name1 text, current_mood mood);

INSERT INTO t_enum VALUES (2,'Moe', 'happy');
INSERT INTO t_enum VALUES (3,'Moe', 'happy');

truncate table t_enum;

INSERT INTO t_enum VALUES(1,'Moe', 'happy');
INSERT INTO t_enum VALUES(2,'Moe', 'happy');

update t_enum set name1 ='joy' where id=1;

delete from t_enum where id=1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_enum';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_enum';

select * from t_enum;

case 71 "数据：几何类型/网络地址类型 建表" 0
src_sql:
drop table t_other;

create table t_other(id integer primary key,c1 point,c2 lseg,c3 box,c4 path,c5 polygon,c6 circle,c7 cidr,c8 inet,c9 macaddr);

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_other';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_other';

case 72 "数据：几何类型/网络地址类型 插入数据" 0
src_sql:
drop table t_other;

create table t_other(id integer primary key,c1 point,c2 lseg,c3 box,c4 path,c5 polygon,c6 circle,c7 cidr,c8 inet,c9 macaddr);

insert into t_other values(1,'(1,2)','((2,3),(2,5))', '(3,4),(5,6)', '((1,5),(2,6))',
'( 4 , 5 ) ,( 6 , 8) ', '( ( 3 , 6 ) , 2 )', '10.1.2', '::ffff:10.4.3.2', '08:00:2b:01:02:03');
insert into t_other values(2,'(1,2)','((2,3),(2,5))', '(3,4),(5,6)', '((1,5),(2,6))',
'( 4 , 5 ) ,( 6 , 8) ', '<( 3 , 6 ) , 2 >', '10.1.2', '::ffff:10.4.3.2', '08:00:2b:01:02:03');
insert into t_other values(3,'(1,2)','((2,3),(2,5))', '(3,4),(5,6)', '((1,5),(2,6))',
'( 4 , 5 ) ,( 6 , 8) ', '( ( 3 , 6 ) , 2 )', '10.1.2', '::ffff:10.4.3.2', '08:00:2b:01:02:03');


tgt_sql:
select count(*) from information_schema.columns where  table_name='t_other';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_other';

select * from t_other;

case 73 "数据：几何类型/网络地址类型 修改数据" 0
src_sql:
drop table t_other;

create table t_other(id integer primary key,c1 point,c2 lseg,c3 box,c4 path,c5 polygon,c6 circle,c7 cidr,c8 inet,c9 macaddr);

insert into t_other values(1,'(1,2)','((2,3),(2,5))', '(3,4),(5,6)', '((1,5),(2,6))',
'( 4 , 5 ) ,( 6 , 8) ', '( ( 3 , 6 ) , 2 )', '10.1.2', '::ffff:10.4.3.2', '08:00:2b:01:02:03');
insert into t_other values(2,'(1,2)','((2,3),(2,5))', '(3,4),(5,6)', '((1,5),(2,6))',
'( 4 , 5 ) ,( 6 , 8) ', '<( 3 , 6 ) , 2 >', '10.1.2', '::ffff:10.4.3.2', '08:00:2b:01:02:03');
insert into t_other values(3,'(1,2)','((2,3),(2,5))', '(3,4),(5,6)', '((1,5),(2,6))',
'( 4 , 5 ) ,( 6 , 8) ', '( ( 3 , 6 ) , 2 )', '10.1.2', '::ffff:10.4.3.2', '08:00:2b:01:02:03');

update t_other set c1='(3,9)',c7='198.17.0.1' where id =2;
update t_other set c1=null,c7=null where id =3;

delete from t_other where id =1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_other';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_other';

select * from t_other;

case 74 "数据：几何类型/网络地址类型 重命名表" 0
src_sql:
drop table t_other;

create table t_other(id integer primary key,c1 point,c2 lseg,c3 box,c4 path,c5 polygon,c6 circle,c7 cidr,c8 inet,c9 macaddr);

insert into t_other values(2,'(1,2)','((2,3),(2,5))', '(3,4),(5,6)', '((1,5),(2,6))',
'( 4 , 5 ) ,( 6 , 8) ', '<( 3 , 6 ) , 2 >', '10.1.2', '::ffff:10.4.3.2', '08:00:2b:01:02:03');
insert into t_other values(3,'(1,2)','((2,3),(2,5))', '(3,4),(5,6)', '((1,5),(2,6))',
'( 4 , 5 ) ,( 6 , 8) ', '( ( 3 , 6 ) , 2 )', '10.1.2', '::ffff:10.4.3.2', '08:00:2b:01:02:03');

alter table t_other rename to c_t_other;

INSERT INTO c_t_other VALUES(1,'(1,2)','((2,3),(2,5))', '(3,4),(5,6)', '((1,5),(2,6))',
'( 4 , 5 ) ,( 6 , 8) ', '( ( 3 , 6 ) , 2 )', '10.1.2', '::ffff:10.4.3.2', '08:00:2b:01:02:03');

update c_t_other set c1=null,c7=null where id =3;

delete from c_t_other where id =1;

alter table c_t_other rename to t_other;

INSERT INTO t_other VALUES(1,'(1,2)','((2,3),(2,5))', '(3,4),(5,6)', '((1,5),(2,6))',
'( 4 , 5 ) ,( 6 , 8) ', '( ( 3 , 6 ) , 2 )', '10.1.2', '::ffff:10.4.3.2', '08:00:2b:01:02:03');

update t_other set c1=null,c7=null where id =3;

delete from t_other where id =1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_other';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_other';

select * from t_other;

case 76 "数据：几何类型/网络地址类型 添加列" 0
src_sql:
drop table t_other;

create table t_other(id integer primary key,c1 point,c2 lseg,c3 box,c4 path,c5 polygon,c6 circle,c7 cidr,c8 inet,c9 macaddr);

insert into t_other values(2,'(1,2)','((2,3),(2,5))', '(3,4),(5,6)', '((1,5),(2,6))',
'( 4 , 5 ) ,( 6 , 8) ', '<( 3 , 6 ) , 2 >', '10.1.2', '::ffff:10.4.3.2', '08:00:2b:01:02:03');
insert into t_other values(3,'(1,2)','((2,3),(2,5))', '(3,4),(5,6)', '((1,5),(2,6))',
'( 4 , 5 ) ,( 6 , 8) ', '( ( 3 , 6 ) , 2 )', '10.1.2', '::ffff:10.4.3.2', '08:00:2b:01:02:03');

alter table t_other add test1 char;

INSERT INTO t_other VALUES(1,'(1,2)','((2,3),(2,5))', '(3,4),(5,6)', '((1,5),(2,6))',
'( 4 , 5 ) ,( 6 , 8) ', '( ( 3 , 6 ) , 2 )', '10.1.2', '::ffff:10.4.3.2', '08:00:2b:01:02:03','M');

update t_other set test1=null where id=1;

delete from t_other where id=1;

alter table t_other add test2 character(6),add test3 character varying;

INSERT INTO t_other VALUES(1,'(1,2)','((2,3),(2,5))', '(3,4),(5,6)', '((1,5),(2,6))',
'( 4 , 5 ) ,( 6 , 8) ', '( ( 3 , 6 ) , 2 )', '10.1.2', '::ffff:10.4.3.2', '08:00:2b:01:02:03','M', 'happy','soft');

update t_other set test2=null,test3=null where id=1;

delete from t_other where id=1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_other';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_other';

select * from t_other;

case 76 "数据：几何类型/网络地址类型 删除列" 0
src_sql:
drop table t_other;

create table t_other(id integer primary key,c1 point,c2 lseg,c3 box,c4 path,c5 polygon,c6 circle,c7 cidr,c8 inet,c9 macaddr,test1 char,test2 character(6),test3 character varying);

insert into t_other values(2,'(1,2)','((2,3),(2,5))', '(3,4),(5,6)', '((1,5),(2,6))',
'( 4 , 5 ) ,( 6 , 8) ', '<( 3 , 6 ) , 2 >', '10.1.2', '::ffff:10.4.3.2', '08:00:2b:01:02:03','M', 'happy','soft');
insert into t_other values(3,'(1,2)','((2,3),(2,5))', '(3,4),(5,6)', '((1,5),(2,6))',
'( 4 , 5 ) ,( 6 , 8) ', '( ( 3 , 6 ) , 2 )', '10.1.2', '::ffff:10.4.3.2', '08:00:2b:01:02:03','M', 'happy','soft');

alter table t_other drop test1;

INSERT INTO t_other VALUES(1,'(1,2)','((2,3),(2,5))', '(3,4),(5,6)', '((1,5),(2,6))',
'( 4 , 5 ) ,( 6 , 8) ', '( ( 3 , 6 ) , 2 )', '10.1.2', '::ffff:10.4.3.2', '08:00:2b:01:02:03', 'happy','soft');

update t_other set test2=null,test3=null where id=1;

delete from t_other where id=1;

alter table t_other drop test2,drop test3;

INSERT INTO t_other VALUES(1,'(1,2)','((2,3),(2,5))', '(3,4),(5,6)', '((1,5),(2,6))',
'( 4 , 5 ) ,( 6 , 8) ', '( ( 3 , 6 ) , 2 )', '10.1.2', '::ffff:10.4.3.2', '08:00:2b:01:02:03');

update t_other set c1=null,c7=null where id=1;

delete from t_other where id=1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_other';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_other';

select * from t_other;

case 77 "数据：几何类型/网络地址类型 修改列属性" 0
src_sql:
drop table t_other;

create table t_other(id integer primary key,c1 point,c2 lseg,c3 box,c4 path,c5 polygon,c6 circle,c7 cidr,c8 inet,c9 macaddr);

insert into t_other values(2,'(1,2)','((2,3),(2,5))', '(3,4),(5,6)', '((1,5),(2,6))',
'( 4 , 5 ) ,( 6 , 8) ', '<( 3 , 6 ) , 2 >', '10.1.2', '::ffff:10.4.3.2', '08:00:2b:01:02:03');
insert into t_other values(3,'(1,2)','((2,3),(2,5))', '(3,4),(5,6)', '((1,5),(2,6))',
'( 4 , 5 ) ,( 6 , 8) ', '( ( 3 , 6 ) , 2 )', '10.1.2', '::ffff:10.4.3.2', '08:00:2b:01:02:03');

alter table t_other alter column c2 type text;

INSERT INTO t_other VALUES(1,'(1,2)','((2,3),(2,5))', '(3,4),(5,6)', '((1,5),(2,6))',
'( 4 , 5 ) ,( 6 , 8) ', '( ( 3 , 6 ) , 2 )', '10.1.2', '::ffff:10.4.3.2', '08:00:2b:01:02:03');

update t_other set c2=null,c7=null where id=1;

delete from t_other where id=1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_other';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_other';

select * from t_other;

case 78 "数据：几何类型/网络地址类型 重命名列" 0
src_sql:
drop table t_other;

create table t_other(id integer primary key,c1 point,c2 lseg,c3 box,c4 path,c5 polygon,c6 circle,c7 cidr,c8 inet,c9 macaddr);

insert into t_other values(2,'(1,2)','((2,3),(2,5))', '(3,4),(5,6)', '((1,5),(2,6))',
'( 4 , 5 ) ,( 6 , 8) ', '<( 3 , 6 ) , 2 >', '10.1.2', '::ffff:10.4.3.2', '08:00:2b:01:02:03');
insert into t_other values(3,'(1,2)','((2,3),(2,5))', '(3,4),(5,6)', '((1,5),(2,6))',
'( 4 , 5 ) ,( 6 , 8) ', '( ( 3 , 6 ) , 2 )', '10.1.2', '::ffff:10.4.3.2', '08:00:2b:01:02:03');

alter table t_other rename column c1 to c1_n;

INSERT INTO t_other VALUES(1,'(1,2)','((2,3),(2,5))', '(3,4),(5,6)', '((1,5),(2,6))',
'( 4 , 5 ) ,( 6 , 8) ', '( ( 3 , 6 ) , 2 )', '10.1.2', '::ffff:10.4.3.2', '08:00:2b:01:02:03');

update t_other set c1_n=null,c7=null where id=1;

delete from t_other where id=1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_other';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_other';

select * from t_other;

case 79 "数据：几何类型/网络地址类型 添加默认值" 0
src_sql:
drop table t_other;

create table t_other(id integer primary key,c1_n point,c2 lseg,c3 box,c4 path,c5 polygon,c6 circle,c7 cidr,c8 inet,c9 macaddr);

insert into t_other values(2,'(1,2)','((2,3),(2,5))', '(3,4),(5,6)', '((1,5),(2,6))',
'( 4 , 5 ) ,( 6 , 8) ', '<( 3 , 6 ) , 2 >', '10.1.2', '::ffff:10.4.3.2', '08:00:2b:01:02:03');
insert into t_other values(3,'(1,2)','((2,3),(2,5))', '(3,4),(5,6)', '((1,5),(2,6))',
'( 4 , 5 ) ,( 6 , 8) ', '( ( 3 , 6 ) , 2 )', '10.1.2', '::ffff:10.4.3.2', '08:00:2b:01:02:03');

alter table t_other alter column c1_n set default '(1,3)';

INSERT INTO t_other VALUES(1,default,'((2,3),(2,5))', '(3,4),(5,6)', '((1,5),(2,6))',
'( 4 , 5 ) ,( 6 , 8) ', '( ( 3 , 6 ) , 2 )', '10.1.2', '::ffff:10.4.3.2', '08:00:2b:01:02:03');

update t_other set c1_n=null,c7=null where id=1;

delete from t_other where id=1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_other';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_other';

select * from t_other;

case 80 "数据：几何类型/网络地址类型 truncate表" 0
src_sql:
drop table t_other;

create table t_other(id integer primary key,c1_n point,c2 lseg,c3 box,c4 path,c5 polygon,c6 circle,c7 cidr,c8 inet,c9 macaddr);

insert into t_other values(2,'(1,2)','((2,3),(2,5))', '(3,4),(5,6)', '((1,5),(2,6))',
'( 4 , 5 ) ,( 6 , 8) ', '<( 3 , 6 ) , 2 >', '10.1.2', '::ffff:10.4.3.2', '08:00:2b:01:02:03');
insert into t_other values(3,'(1,2)','((2,3),(2,5))', '(3,4),(5,6)', '((1,5),(2,6))',
'( 4 , 5 ) ,( 6 , 8) ', '( ( 3 , 6 ) , 2 )', '10.1.2', '::ffff:10.4.3.2', '08:00:2b:01:02:03');

truncate table t_other;

insert into t_other values(1,'(1,2)','((2,3),(2,5))', '(3,4),(5,6)', '((1,5),(2,6))',
'( 4 , 5 ) ,( 6 , 8) ', '( ( 3 , 6 ) , 2 )', '10.1.2', '::ffff:10.4.3.2', '08:00:2b:01:02:03');
insert into t_other values(2,'(1,2)','((2,3),(2,5))', '(3,4),(5,6)', '((1,5),(2,6))',
'( 4 , 5 ) ,( 6 , 8) ', '<( 3 , 6 ) , 2 >', '10.1.2', '::ffff:10.4.3.2', '08:00:2b:01:02:03');
insert into t_other values(3,'(1,2)','((2,3),(2,5))', '(3,4),(5,6)', '((1,5),(2,6))',
'( 4 , 5 ) ,( 6 , 8) ', '( ( 3 , 6 ) , 2 )', '10.1.2', '::ffff:10.4.3.2', '08:00:2b:01:02:03');

update t_other set c1_n=null,c7=null where id=1;

delete from t_other where id=3;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_other';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_other';

select * from t_other;

case 81 "数据：位串类型 建表" 0
src_sql:
drop table t_bit;

create table t_bit ( id integer  primary key, c1 bit(3), c2 bit varying(5) ) ;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_bit';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_bit';

case 82 "数据：位串类型 插入数据" 0
src_sql:
drop table t_bit;

create table t_bit ( id integer  primary key, c1 bit(3), c2 bit varying(5) ) ;

insert into t_bit values(1, b'101', b'00');
insert into t_bit values(2, b'10'::bit(3), b'101');
insert into t_bit values(3, b'101', b'00');

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_bit';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_bit';

select * from t_bit;

case 83 "数据：位串类型 修改数据" 0
src_sql:
drop table t_bit;

create table t_bit ( id integer  primary key, c1 bit(3), c2 bit varying(5) ) ;

insert into t_bit values(1, b'101', b'00');
insert into t_bit values(2, b'10'::bit(3), b'101');
insert into t_bit values(3, b'101', b'00');

update t_bit set c1 = null ,c2 = null where id = 2;

delete from t_bit where id = 1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_bit';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_bit';

select * from t_bit;

case 84 "数据：位串类型 重命名表" 0
src_sql:
drop table t_bit;

create table t_bit ( id integer  primary key, c1 bit(3), c2 bit varying(5) ) ;

insert into t_bit values(2, b'10'::bit(3), b'101');
insert into t_bit values(3, b'101', b'00');

alter table t_bit rename to c_t_bit;

INSERT INTO c_t_bit VALUES(1, b'101', b'00');

update c_t_bit set c1 = b'100' ,c2 = b'001' where id = 3;

delete from c_t_bit where id =1;

alter table c_t_bit rename to t_bit;

INSERT INTO t_bit VALUES(1, b'101', b'00');

update t_bit set c1 = b'100' ,c2 = b'001' where id = 3;

delete from t_bit where id =1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_bit';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_bit';

select * from t_bit;

case 85 "数据：位串类型 添加列" 0
src_sql:
drop table t_bit;

create table t_bit ( id integer  primary key, c1 bit(3), c2 bit varying(5) ) ;

insert into t_bit values(2, b'10'::bit(3), b'101');
insert into t_bit values(3, b'101', b'00');

alter table t_bit add test1 bit(3);

INSERT INTO t_bit VALUES(1, b'101', b'00',b'101');

update t_bit set test1=null where id=1;

delete from t_bit where id=1;

alter table t_bit add test2 bit(6),add test3  bit varying(5);

INSERT INTO t_bit VALUES(1, b'101', b'00',b'101', b'100000',b'00');

update t_bit set test2=null,test3=null where id=1;

delete from t_bit where id=1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_bit';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_bit';

select * from t_bit;

case 86 "数据：位串类型 删除列" 0
src_sql:
drop table t_bit;

create table t_bit ( id integer  primary key, c1 bit(3), c2 bit varying(5),test1 bit(3),test2 bit(6),test3 bit varying(5) ) ;

insert into t_bit values(2, b'10'::bit(3), b'101',b'101', b'100000',b'00');
insert into t_bit values(3, b'101', b'00',b'101', b'100000',b'00');

alter table t_bit drop test1;

INSERT INTO t_bit VALUES(1, b'101', b'00', b'100000',b'00');

update t_bit set test2=null,test3=null where id=1;

delete from t_bit where id=1;

alter table t_bit drop test2,drop test3;

INSERT INTO t_bit VALUES(1, b'101', b'00');

update t_bit set c1=null where id=1;

delete from t_bit where id=1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_bit';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_bit';

select * from t_bit;

case 87 "数据：位串类型 修改列属性" 0
src_sql:
drop table t_bit;

create table t_bit ( id integer  primary key, c1 bit(3), c2 bit varying(5) ) ;

insert into t_bit values(2, b'10'::bit(3), b'101');
insert into t_bit values(3, b'101', b'00');

alter table t_bit alter column c2 type text;

INSERT INTO t_bit VALUES(1, b'101', b'00');

update t_bit set c2=null where id=1;

delete from t_bit where id=1;	

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_bit';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_bit';

select * from t_bit;

case 88 "数据：位串类型 重命名列" 0
src_sql:
drop table t_bit;

create table t_bit ( id integer  primary key, c1 bit(3), c2 bit varying(5) ) ;

insert into t_bit values(2, b'10'::bit(3), b'101');
insert into t_bit values(3, b'101', b'00');

alter table t_bit rename column c1 to c1_n;

INSERT INTO t_bit VALUES(1, b'101', b'00');

update t_bit set c1_n=null where id=1;

delete from t_bit where id=1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_bit';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_bit';

select * from t_bit;

case 89 "数据：位串类型 添加默认值" 0
src_sql:
drop table t_bit;

create table t_bit ( id integer  primary key, c1_n bit(3), c2 bit varying(5) ) ;

insert into t_bit values(2, b'10'::bit(3), b'101');
insert into t_bit values(3, b'101', b'00');

alter table t_bit alter column c1_n set default b'111';

INSERT INTO t_bit VALUES(1, default, b'00');

update t_bit set c1_n=null where id=1;

delete from t_bit where id=1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_bit';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_bit';

select * from t_bit;

case 90 "数据：位串类型 truncate表" 0
src_sql:
drop table t_bit;

create table t_bit ( id integer  primary key, c1_n bit(3), c2 bit varying(5) ) ;

insert into t_bit values(2, b'10'::bit(3), b'101');
insert into t_bit values(3, b'101', b'00');

truncate table t_bit;

INSERT INTO t_bit VALUES(1, default, b'00');
INSERT INTO t_bit VALUES(2, b'101', b'00');

update t_bit set c1_n=null where id=1;

delete from t_bit where id=1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_bit';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_bit';

select * from t_bit;

case 91 "数据：文本搜索类型 建表" 0
src_sql:
drop table t_ts;

create table t_ts(id integer primary key,c1 tsvector,c2 tsquery);

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_ts';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_ts';

case 92 "数据：文本搜索类型 插入数据" 0
src_sql:
drop table t_ts;

create table t_ts(id integer primary key,c1 tsvector,c2 tsquery);

insert into t_ts values(1,'The Fat Rats'::tsvector,'fat & rat'::tsquery);
insert into t_ts values(2,to_tsvector('english', 'The Fat Rats'),'super:*'::tsquery);
insert into t_ts values(3,'The Fat Rats'::tsvector,'fat & rat'::tsquery);

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_ts';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_ts';

select * from t_ts;

case 93 "数据：文本搜索类型 修改数据" 0
src_sql:
drop table t_ts;

create table t_ts(id integer primary key,c1 tsvector,c2 tsquery);

insert into t_ts values(1,'The Fat Rats'::tsvector,'fat & rat'::tsquery);
insert into t_ts values(2,to_tsvector('english', 'The Fat Rats'),'super:*'::tsquery);
insert into t_ts values(3,'The Fat Rats'::tsvector,'fat & rat'::tsquery);

update t_ts set c1='I need to test this product'::tsvector,c2='test & product'::tsquery where id =2;

delete from t_ts where id =1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_ts';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_ts';

select * from t_ts;

case 94 "数据：文本搜索类型 重命名表" 0
src_sql:
drop table t_ts;

create table t_ts(id integer primary key,c1 tsvector,c2 tsquery);

insert into t_ts values(2,to_tsvector('english', 'The Fat Rats'),'super:*'::tsquery);
insert into t_ts values(3,'The Fat Rats'::tsvector,'fat & rat'::tsquery);

alter table t_ts rename to c_t_ts;

INSERT INTO c_t_ts VALUES(1, 'The Fat Rats'::tsvector,'fat & rat'::tsquery);

update c_t_ts set c1=null ,c2=null where id=3;

delete from c_t_ts where id =1;

alter table c_t_ts rename to t_ts;

INSERT INTO t_ts VALUES(1, 'The Fat Rats'::tsvector,'fat & rat'::tsquery);

update t_ts set c1=null ,c2=null where id=3;

delete from t_ts where id =1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_ts';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_ts';

select * from t_ts;

case 95 "数据：文本搜索类型 添加列" 0
src_sql:
drop table t_ts;

create table t_ts(id integer primary key,c1 tsvector,c2 tsquery);

insert into t_ts values(2,to_tsvector('english', 'The Fat Rats'),'super:*'::tsquery);
insert into t_ts values(3,'The Fat Rats'::tsvector,'fat & rat'::tsquery);

alter table t_ts add test1 tsvector;

INSERT INTO t_ts VALUES(1,'The Fat Rats'::tsvector,'fat & rat'::tsquery, 'I need to test this product'::tsvecto);

update t_ts set test1=null where id=1;
delete from t_ts where id=1;


alter table t_ts add test2 tsvector,add test3 tsquery;

INSERT INTO t_ts VALUES(1,'The Fat Rats'::tsvector,'fat & rat'::tsquery, 'I need to test this product'::tsvector,'The Fat Rats'::tsvector,'fat & rat'::tsquery);

update t_ts set test2=null,test3=null where id=1;

delete from t_ts where id=1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_ts';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_ts';

select * from t_ts;

case 96 "数据：文本搜索类型 删除列" 0
src_sql:
drop table t_ts;

create table t_ts(id integer primary key,c1 tsvector,c2 tsquery,test1 tsvector,test2 tsvector,test3 tsquery);

insert into t_ts values(2,to_tsvector('english', 'The Fat Rats'),'super:*'::tsquery, 'I need to test this product'::tsvector,'The Fat Rats'::tsvector,'fat & rat'::tsquery);
insert into t_ts values(3,'The Fat Rats'::tsvector,'fat & rat'::tsquery, 'I need to test this product'::tsvector,'The Fat Rats'::tsvector,'fat & rat'::tsquery);

alter table t_ts drop test1;

INSERT INTO t_ts VALUES(1,'The Fat Rats'::tsvector,'fat & rat'::tsquery,'The Fat Rats'::tsvector,'fat & rat'::tsquery);

update t_ts set test2=null,test3=null where id=1;

delete from t_ts where id=1;

alter table t_ts drop test2,drop test3;

INSERT INTO t_ts VALUES(1,'The Fat Rats'::tsvector,'fat & rat'::tsquery);

update t_ts set c1=null where id=1;

delete from t_ts where id=1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_ts';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_ts';

select * from t_ts;

case 97 "数据：文本搜索类型 修改列属性" 0
src_sql:
drop table t_ts;

create table t_ts(id integer primary key,c1 tsvector,c2 tsquery);

insert into t_ts values(2,to_tsvector('english', 'The Fat Rats'),'super:*'::tsquery);
insert into t_ts values(3,'The Fat Rats'::tsvector,'fat & rat'::tsquery);

alter table t_ts alter column c2 type text;

INSERT INTO t_ts VALUES(1,'The Fat Rats'::tsvector,'fat & rat'::tsquery);

update t_ts set c2=null where id=1;

delete from t_ts where id=1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_ts';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_ts';

select * from t_ts;

case 98 "数据：文本搜索类型 重命名列" 0
src_sql:
drop table t_ts;

create table t_ts(id integer primary key,c1 tsvector,c2 tsquery);

insert into t_ts values(2,to_tsvector('english', 'The Fat Rats'),'super:*'::tsquery);
insert into t_ts values(3,'The Fat Rats'::tsvector,'fat & rat'::tsquery);

alter table t_ts rename column c1 to c1_n;

INSERT INTO t_ts VALUES(1,'The Fat Rats'::tsvector,'fat & rat'::tsquery);

update t_ts set c1_n=null where id=1;

delete from t_ts where id=1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_ts';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_ts';

select * from t_ts;

case 99 "数据：文本搜索类型 添加默认值" 0
src_sql:
drop table t_ts;

create table t_ts(id integer primary key,c1_n tsvector,c2 tsquery);

insert into t_ts values(2,to_tsvector('english', 'The Fat Rats'),'super:*'::tsquery);
insert into t_ts values(3,'The Fat Rats'::tsvector,'fat & rat'::tsquery);

alter table t_ts alter column c1_n set default 'The Fat Rats'::tsvector;

INSERT INTO t_ts VALUES(1,default,'fat & rat'::tsquery);

update t_ts set c1_n=null where id=1;

delete from t_ts where id=1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_ts';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_ts';

select * from t_ts;

case 100 "数据：文本搜索类型 truncate表" 0
src_sql:
drop table t_ts;

create table t_ts(id integer primary key,c1_n tsvector,c2 tsquery);

insert into t_ts values(2,to_tsvector('english', 'The Fat Rats'),'super:*'::tsquery);
insert into t_ts values(3,'The Fat Rats'::tsvector,'fat & rat'::tsquery);

truncate table t_ts;

INSERT INTO t_ts VALUES(1,'The Fat Rats'::tsvector,'fat & rat'::tsquery);
INSERT INTO t_ts VALUES(2,default,'fat & rat'::tsquery);

update t_ts set c1_n=null where id=1;

delete from t_ts where id=1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_ts';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_ts';

select * from t_ts;

case 101 "数据：UUID类型& xml类型 建表" 0
src_sql:
drop table t_xml;

create table t_xml (id integer primary key,c1 uuid,c2 xml);

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_xml';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_xml';

case 102 "数据：UUID类型& xml类型 插入数据" 0
src_sql:
drop table t_xml;

create table t_xml (id integer primary key,c1 uuid,c2 xml);

insert into t_xml values(1,'a0eebc999c0b4ef8bb6d6bb9bd380a11','<title> hello world</title>');
insert into t_xml select 2,'a0eebc999c0b4ef8bb6d6bb9bd380a11', xml'<title> 英方软件</title>';
insert into t_xml values(3,'a0eebc999c0b4ef8bb6d6bb9bd380a11','<title>测试123</title>');

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_xml';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_xml';

select * from t_xml;

case 103 "数据：UUID类型& xml类型 修改数据" 0
src_sql:
drop table t_xml;

create table t_xml (id integer primary key,c1 uuid,c2 xml);

insert into t_xml values(1,'a0eebc999c0b4ef8bb6d6bb9bd380a11','<title> hello world</title>');
insert into t_xml select 2,'a0eebc999c0b4ef8bb6d6bb9bd380a11', xml'<title> 英方软件</title>';
insert into t_xml values(3,'a0eebc999c0b4ef8bb6d6bb9bd380a11','<title>测试123</title>');

update t_xml set c1 = 'a22e-bc99-9c0b-4ef8-bb6d-6bb9-bd38-0a22', c2 = '<to>George</to>' where id=2;
update t_xml set c1 = 'a22e-bc99-9c0b-4ef8-bb6d-6bb9-bd38-0a33', c2 = '<from>John</from>' where id=3;

delete from t_xml where id=1;
truncate table t_xml

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_xml';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_xml';

select * from t_xml;

case 104 "数据：UUID类型& xml类型 重命名表" 0
src_sql:
drop table t_xml;

create table t_xml (id integer primary key,c1 uuid,c2 xml);

insert into t_xml select 2,'a0eebc999c0b4ef8bb6d6bb9bd380a11', xml'<title> 英方软件</title>';
insert into t_xml values(3,'a0eebc999c0b4ef8bb6d6bb9bd380a11','<title>测试123</title>');

alter table t_xml rename to c_t_xml;

INSERT INTO c_t_xml VALUES(1,'a0eebc999c0b4ef8bb6d6bb9bd380a11','<title> hello world</title>');

update c_t_xml set c1=null ,c2=null where id=3;

delete from c_t_xml where id =1;

alter table c_t_xml rename to t_xml;

INSERT INTO t_xml VALUES(1,'a0eebc999c0b4ef8bb6d6bb9bd380a11','<title> hello world</title>');

update t_xml set c1=null ,c2=null where id=3;

delete from t_xml where id =1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_xml';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_xml';

select * from t_xml;

case 105 "数据：UUID类型& xml类型 添加列" 0
src_sql:
drop table t_xml;

create table t_xml (id integer primary key,c1 uuid,c2 xml);

insert into t_xml select 2,'a0eebc999c0b4ef8bb6d6bb9bd380a11', xml'<title> 英方软件</title>';
insert into t_xml values(3,'a0eebc999c0b4ef8bb6d6bb9bd380a11','<title>测试123</title>');

alter table t_xml add test1 uuid;

INSERT INTO t_xml VALUES(1,'a0eebc999c0b4ef8bb6d6bb9bd380a11','<title> hello world</title>','a0eebc999c0b4ef8bb6d6bb9bd380a11');

update t_xml set test1=null where id=1;

delete from t_xml where id=1;


alter table t_xml add test2 uuid,add test3 xml;

INSERT INTO t_xml VALUES(1,'a0eebc999c0b4ef8bb6d6bb9bd380a11','<title> hello world</title>','a0eebc999c0b4ef8bb6d6bb9bd380a11','a0eebc999c0b4ef8bb6d6bb9bd380a11','<title> hello world</title>');

update t_xml set test2=null,test3=null where id=1;

delete from t_xml where id=1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_xml';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_xml';

select * from t_xml;

case 106 "数据：UUID类型& xml类型 删除列" 0
src_sql:
drop table t_xml;

create table t_xml (id integer primary key,c1 uuid,c2 xml,test1 uuid,test2 uuid,test3 xml);

insert into t_xml select 2,'a0eebc999c0b4ef8bb6d6bb9bd380a11', xml'<title> 英方软件</title>','a0eebc999c0b4ef8bb6d6bb9bd380a11','a0eebc999c0b4ef8bb6d6bb9bd380a11','<title> hello world</title>';
insert into t_xml values(3,'a0eebc999c0b4ef8bb6d6bb9bd380a11','<title>测试123</title>','a0eebc999c0b4ef8bb6d6bb9bd380a11','a0eebc999c0b4ef8bb6d6bb9bd380a11','<title> hello world</title>');

alter table t_xml drop test1;

INSERT INTO t_xml VALUES(1,'a0eebc999c0b4ef8bb6d6bb9bd380a11','<title> hello world</title>','a0eebc999c0b4ef8bb6d6bb9bd380a11','<title> hello world</title>');

update t_xml set test2=null,test3=null where id=1;

delete from t_xml where id=1;

alter table t_xml drop test2,drop test3;

INSERT INTO t_xml VALUES(1,'a0eebc999c0b4ef8bb6d6bb9bd380a11','<title> hello world</title>');

update t_xml set c1=null where id=1;

delete from t_xml where id=1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_xml';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_xml';

select * from t_xml;

case 107 "数据：UUID类型& xml类型 修改列属性" 0
src_sql:
drop table t_xml;

create table t_xml (id integer primary key,c1 uuid,c2 xml);

insert into t_xml select 2,'a0eebc999c0b4ef8bb6d6bb9bd380a11', xml'<title> 英方软件</title>';
insert into t_xml values(3,'a0eebc999c0b4ef8bb6d6bb9bd380a11','<title>测试123</title>');

alter table t_xml alter column c2 type text;

INSERT INTO t_xml VALUES(1,'a0eebc999c0b4ef8bb6d6bb9bd380a11','<title> hello world</title>');

update t_xml set c2=null where id=1;

delete from t_xml where id=1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_xml';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_xml';

select * from t_xml;

case 108 "数据：UUID类型& xml类型 重命名列" 0
src_sql:
drop table t_xml;

create table t_xml (id integer primary key,c1 uuid,c2 xml);

insert into t_xml select 2,'a0eebc999c0b4ef8bb6d6bb9bd380a11', xml'<title> 英方软件</title>';
insert into t_xml values(3,'a0eebc999c0b4ef8bb6d6bb9bd380a11','<title>测试123</title>');

alter table t_xml rename column c1 to c1_n;

INSERT INTO t_xml VALUES(1,'a0eebc999c0b4ef8bb6d6bb9bd380a11','<title> hello world</title>');

update t_xml set c1_n=null where id=1;

delete from t_xml where id=1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_xml';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_xml';

select * from t_xml;

case 109 "数据：UUID类型& xml类型 添加默认值" 0
src_sql:
drop table t_xml;

create table t_xml (id integer primary key,c1_n uuid,c2 xml);

insert into t_xml select 2,'a0eebc999c0b4ef8bb6d6bb9bd380a11', xml'<title> 英方软件</title>';
insert into t_xml values(3,'a0eebc999c0b4ef8bb6d6bb9bd380a11','<title>测试123</title>');

alter table t_xml alter column c1_n set default 'a0eebc999c0b4ef8bb6d6bb9bd380a11';

INSERT INTO t_xml VALUES(1,default,'<title> hello world</title>');

update t_xml set c1_n=null where id=1;

delete from t_xml where id=1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_xml';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_xml';

select * from t_xml;

case 110 "数据：UUID类型& xml类型 truncate表" 0
src_sql:
drop table t_xml;

create table t_xml (id integer primary key,c1_n uuid,c2 xml);

insert into t_xml select 2,'a0eebc999c0b4ef8bb6d6bb9bd380a11', xml'<title> 英方软件</title>';
insert into t_xml values(3,'a0eebc999c0b4ef8bb6d6bb9bd380a11','<title>测试123</title>');

truncate table t_xml;

INSERT INTO t_xml VALUES(1,'a0eebc999c0b4ef8bb6d6bb9bd380a11','<title> hello world</title>');
INSERT INTO t_xml VALUES(2,default,'<title> hello world</title>');

update t_xml set c1_n=null where id=1;

delete from t_xml where id=1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_xml';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_xml';

select * from t_xml;

case 111 "数据：json类型 建表" 0
src_sql:
drop table t_json;

create table t_json (id integer primary key,c1 char(8),c2 json,c3 jsonb);

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_json';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_json';

case 112 "数据：json类型 插入数据" 0
src_sql:
drop table t_json;

create table t_json (id integer primary key,c1 char(8),c2 json,c3 jsonb);

insert into t_json values(1,'kk','{
"time": "2021-01-20 10:50:59",
"action": "测试1",
"result": "pass",
"flag": 0,
"array": [11,11],
"other": {"make1":"测试1","make2":"测试1"}}',
'{"price":189,"packagename":"成人票0","stock":100}');
insert into t_json values(2,'hh','{
"time": "2021-01-20 10:50:59",
"action": "测试2",
"result": "fail",
"flag": 1,
"array": [11,12],
"other": {"make3":"测试3"}}',
'{"price":189,"packagename":"成人票1","stock":100}');
insert into t_json values(3,'dd','{
"time": "2021-01-20 10:50:59",
"action": "测试3",
"flag":0,
"array":[11,13]}',
'{"price":189,"packagename":"成人票2","stock":100}');

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_json';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_json';

select * from t_json;

case 113 "数据：json类型 修改数据" 0
src_sql:
drop table t_json;

create table t_json (id integer primary key,c1 char(8),c2 json,c3 jsonb);

insert into t_json values(1,'kk','{
"time": "2021-01-20 10:50:59",
"action": "测试1",
"result": "pass",
"flag": 0,
"array": [11,11],
"other": {"make1":"测试1","make2":"测试1"}}',
'{"price":189,"packagename":"成人票0","stock":100}');
insert into t_json values(2,'hh','{
"time": "2021-01-20 10:50:59",
"action": "测试2",
"result": "fail",
"flag": 1,
"array": [11,12],
"other": {"make3":"测试3"}}',
'{"price":189,"packagename":"成人票1","stock":100}');
insert into t_json values(3,'dd','{
"time": "2021-01-20 10:50:59",
"action": "测试3",
"flag":0,
"array":[11,13]}',
'{"price":189,"packagename":"成人票2","stock":100}');

update t_json set c2='{
"time": "2021-01-23 11:11:11",
"action": "测试",
"result": "tongguo",
"flag": 0,
"array": [666,666],
"qita": {"make":"测试"}
}' where id <3;

delete from t_json where id >2;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_json';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_json';

select * from t_json;

case 114 "数据：json类型 重命名表" 0
src_sql:
drop table t_json;

create table t_json (id integer primary key,c1 char(8),c2 json,c3 jsonb);

insert into t_json values(1,'kk','{
"time": "2021-01-20 10:50:59",
"action": "测试1",
"result": "pass",
"flag": 0,
"array": [11,11],
"other": {"make1":"测试1","make2":"测试1"}}',
'{"price":189,"packagename":"成人票0","stock":100}');
insert into t_json values(2,'hh','{
"time": "2021-01-20 10:50:59",
"action": "测试2",
"result": "fail",
"flag": 1,
"array": [11,12],
"other": {"make3":"测试3"}}',
'{"price":189,"packagename":"成人票1","stock":100}');

alter table t_json rename to c_t_json;

INSERT INTO c_t_json VALUES(3,'kk','{
"time": "2021-01-20 10:50:59",
"action": "测试1",
"result": "pass",
"flag": 0,
"array": [11,11],
"other": {"make1":"测试1","make2":"测试1"}}',
'{"price":189,"packagename":"成人票0","stock":100}');

update c_t_json set c1=null ,c2=null where id=3;

delete from c_t_json where id =3;

alter table c_t_json rename to t_json;

INSERT INTO t_json VALUES(3,'kk','{
"time": "2021-01-20 10:50:59",
"action": "测试1",
"result": "pass",
"flag": 0,
"array": [11,11],
"other": {"make1":"测试1","make2":"测试1"}}',
'{"price":189,"packagename":"成人票0","stock":100}');

update t_json set c1=null ,c2=null where id=3;

delete from t_json where id =3;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_json';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_json';

select * from t_json;

case 115 "数据：json类型 添加列" 0
src_sql:
drop table t_json;

create table t_json (id integer primary key,c1 char(8),c2 json,c3 jsonb);

insert into t_json values(1,'kk','{
"time": "2021-01-20 10:50:59",
"action": "测试1",
"result": "pass",
"flag": 0,
"array": [11,11],
"other": {"make1":"测试1","make2":"测试1"}}',
'{"price":189,"packagename":"成人票0","stock":100}');
insert into t_json values(2,'hh','{
"time": "2021-01-20 10:50:59",
"action": "测试2",
"result": "fail",
"flag": 1,
"array": [11,12],
"other": {"make3":"测试3"}}',
'{"price":189,"packagename":"成人票1","stock":100}');

alter table t_json add test1 char(5);

INSERT INTO t_json VALUES(3,'kk','{
"time": "2021-01-20 10:50:59",
"action": "测试1",
"result": "pass",
"flag": 0,
"array": [11,11],
"other": {"make1":"测试1","make2":"测试1"}}',
'{"price":189,"packagename":"成人票0","stock":100}',
'kk');

update t_json set test1=null where id=1;

delete from t_json where id=1;

alter table t_json add test2 json,add test3 jsonb;

INSERT INTO t_json VALUES(3,'kk','{
"time": "2021-01-20 10:50:59",
"action": "测试1",
"result": "pass",
"flag": 0,
"array": [11,11],
"other": {"make1":"测试1","make2":"测试1"}}',
'{"price":189,"packagename":"成人票0","stock":100}',
'kk','{
"time": "2021-01-20 10:50:59",
"action": "测试1",
"result": "pass",
"flag": 0,
"array": [11,11],
"other": {"make1":"测试1","make2":"测试1"}}',
'{"price":189,"packagename":"成人票0","stock":100}');

update t_json set test2=null,test3=null where id=1;

delete from t_json where id=1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_json';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_json';

select * from t_json;

case 116 "数据：json类型 删除列" 0
src_sql:
drop table t_json;

create table t_json (id integer primary key,c1 char(8),c2 json,c3 jsonb,test1 char(5),test2 json,test3 jsonb);

insert into t_json values(1,'kk','{
"time": "2021-01-20 10:50:59",
"action": "测试1",
"result": "pass",
"flag": 0,
"array": [11,11],
"other": {"make1":"测试1","make2":"测试1"}}',
'{"price":189,"packagename":"成人票0","stock":100}',
'kk','{
"time": "2021-01-20 10:50:59",
"action": "测试1",
"result": "pass",
"flag": 0,
"array": [11,11],
"other": {"make1":"测试1","make2":"测试1"}}',
'{"price":189,"packagename":"成人票0","stock":100}');
insert into t_json values(2,'hh','{
"time": "2021-01-20 10:50:59",
"action": "测试2",
"result": "fail",
"flag": 1,
"array": [11,12],
"other": {"make3":"测试3"}}',
'{"price":189,"packagename":"成人票1","stock":100}',
'kk','{
"time": "2021-01-20 10:50:59",
"action": "测试1",
"result": "pass",
"flag": 0,
"array": [11,11],
"other": {"make1":"测试1","make2":"测试1"}}',
'{"price":189,"packagename":"成人票0","stock":100}');

alter table t_json drop test1;

INSERT INTO t_json VALUES(3,'kk','{
"time": "2021-01-20 10:50:59",
"action": "测试1",
"result": "pass",
"flag": 0,
"array": [11,11],
"other": {"make1":"测试1","make2":"测试1"}}',
'{"price":189,"packagename":"成人票0","stock":100}','{
"time": "2021-01-20 10:50:59",
"action": "测试1",
"result": "pass",
"flag": 0,
"array": [11,11],
"other": {"make1":"测试1","make2":"测试1"}}',
'{"price":189,"packagename":"成人票0","stock":100}');

update t_json set test2=null,test3=null where id=1;

delete from t_json where id=1;

alter table t_json drop test2,drop test3;

INSERT INTO t_json VALUES(1,'kk','{
"time": "2021-01-20 10:50:59",
"action": "测试1",
"result": "pass",
"flag": 0,
"array": [11,11],
"other": {"make1":"测试1","make2":"测试1"}}',
'{"price":189,"packagename":"成人票0","stock":100}');

update t_json set c1=null where id=1;

delete from t_json where id=1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_json';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_json';

select * from t_json;

case 117 "数据：json类型 修改列属性" 0
src_sql:
drop table t_json;

create table t_json (id integer primary key,c1 char(8),c2 json,c3 jsonb);

insert into t_json values(1,'kk','{
"time": "2021-01-20 10:50:59",
"action": "测试1",
"result": "pass",
"flag": 0,
"array": [11,11],
"other": {"make1":"测试1","make2":"测试1"}}',
'{"price":189,"packagename":"成人票0","stock":100}');
insert into t_json values(2,'hh','{
"time": "2021-01-20 10:50:59",
"action": "测试2",
"result": "fail",
"flag": 1,
"array": [11,12],
"other": {"make3":"测试3"}}',
'{"price":189,"packagename":"成人票1","stock":100}');

alter table t_json alter column c2 type text;

INSERT INTO t_json VALUES(1,'kk','{
"time": "2021-01-20 10:50:59",
"action": "测试1",
"result": "pass",
"flag": 0,
"array": [11,11],
"other": {"make1":"测试1","make2":"测试1"}}',
'{"price":189,"packagename":"成人票0","stock":100}');

update t_json set c2=null where id=1;

delete from t_json where id=1;	

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_json';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_json';

select * from t_json;

case 118 "数据：json类型 重命名列" 0
src_sql:
drop table t_json;

create table t_json (id integer primary key,c1 char(8),c2 json,c3 jsonb);

insert into t_json values(1,'kk','{
"time": "2021-01-20 10:50:59",
"action": "测试1",
"result": "pass",
"flag": 0,
"array": [11,11],
"other": {"make1":"测试1","make2":"测试1"}}',
'{"price":189,"packagename":"成人票0","stock":100}');
insert into t_json values(2,'hh','{
"time": "2021-01-20 10:50:59",
"action": "测试2",
"result": "fail",
"flag": 1,
"array": [11,12],
"other": {"make3":"测试3"}}',
'{"price":189,"packagename":"成人票1","stock":100}');

alter table t_json rename column c1 to c1_n;

INSERT INTO t_json VALUES(1,'kk','{
"time": "2021-01-20 10:50:59",
"action": "测试1",
"result": "pass",
"flag": 0,
"array": [11,11],
"other": {"make1":"测试1","make2":"测试1"}}',
'{"price":189,"packagename":"成人票0","stock":100}');

update t_json set c1_n=null where id=1;

delete from t_json where id=1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_json';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_json';

select * from t_json;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_json';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_json';

select * from t_json;

case 119 "数据：json类型 添加默认值" 0
src_sql:
drop table t_json;

create table t_json (id integer primary key,c1_n char(8),c2 json,c3 jsonb);

insert into t_json values(1,'kk','{
"time": "2021-01-20 10:50:59",
"action": "测试1",
"result": "pass",
"flag": 0,
"array": [11,11],
"other": {"make1":"测试1","make2":"测试1"}}',
'{"price":189,"packagename":"成人票0","stock":100}');
insert into t_json values(2,'hh','{
"time": "2021-01-20 10:50:59",
"action": "测试2",
"result": "fail",
"flag": 1,
"array": [11,12],
"other": {"make3":"测试3"}}',
'{"price":189,"packagename":"成人票1","stock":100}');

alter table t_json alter column c1_n set default 'kk';

INSERT INTO t_json VALUES(1,default,'{
"time": "2021-01-20 10:50:59",
"action": "测试1",
"result": "pass",
"flag": 0,
"array": [11,11],
"other": {"make1":"测试1","make2":"测试1"}}',
'{"price":189,"packagename":"成人票0","stock":100}');

update t_json set c1_n=null where id=1;

delete from t_json where id=1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_json';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_json';

select * from t_json;

case 120 "数据：json类型 truncate表" 0
src_sql:
drop table t_json;

create table t_json (id integer primary key,c1_n char(8),c2 json,c3 jsonb);

insert into t_json values(1,'kk','{
"time": "2021-01-20 10:50:59",
"action": "测试1",
"result": "pass",
"flag": 0,
"array": [11,11],
"other": {"make1":"测试1","make2":"测试1"}}',
'{"price":189,"packagename":"成人票0","stock":100}');
insert into t_json values(2,'hh','{
"time": "2021-01-20 10:50:59",
"action": "测试2",
"result": "fail",
"flag": 1,
"array": [11,12],
"other": {"make3":"测试3"}}',
'{"price":189,"packagename":"成人票1","stock":100}');

truncate table t_json;

INSERT INTO t_json VALUES(1,default,'{
"time": "2021-01-20 10:50:59",
"action": "测试1",
"result": "pass",
"flag": 0,
"array": [11,11],
"other": {"make1":"测试1","make2":"测试1"}}',
'{"price":189,"packagename":"成人票0","stock":100}');

INSERT INTO t_json VALUES(2,'qq','{
"time": "2021-01-20 10:50:59",
"action": "测试1",
"result": "pass",
"flag": 0,
"array": [11,11],
"other": {"make1":"测试1","make2":"测试1"}}',
'{"price":189,"packagename":"成人票0","stock":100}');

update t_json set c1_n=null where id=1;

delete from t_json where id=1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_json';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_json';

select * from t_json;

case 121 "数据：数组类型 建表" 0
src_sql:
drop table t_text;

create table t_text (id integer primary key,c1 integer[],c2 text[],c3 text[][], c4 integer[][]);

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_text';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_text';

case 122 "数据：数组类型 插入数据" 0
src_sql:
drop table t_text;

create table t_text (id integer primary key,c1 integer[],c2 text[],c3 text[][], c4 integer[][]);

insert into t_text values(1,'{10000, 10000, 10000}','{"info1", "soft4"}',
  '{{"meeting", "lunch"}, {"training", "pres"}}','{{333,444},{111,222}}');
insert into t_text values(2,'{20000, 10000, 10000}','{"info2", "soft3"}',
  '{{"meeting", "lunch"}, {"training", "pres"}}','{{333,444},{111,222}}');
insert into t_text values(3,'{10000, 30000, 10000}','{"info3", "soft2"}',
  '{{"meeting", "lunch"}, {"training", "pres"}}','{{335,446},{122,233}}');
insert into t_text values(4,'{10000, 10000, 40000}','{"info4", "soft1"}',
  '{{"meeting", "lunch"}, {"training", "pres"}}','{{345,443},{121,282}}');

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_text';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_text';

select * from t_text;

case 123 "数据：数组类型 插入数据" 0
src_sql:
drop table t_text;

create table t_text (id integer primary key,c1 integer[],c2 text[],c3 text[][], c4 integer[][]);

insert into t_text values(1,'{10000, 10000, 10000}','{"info1", "soft4"}',
  '{{"meeting", "lunch"}, {"training", "pres"}}','{{333,444},{111,222}}');
insert into t_text values(2,'{20000, 10000, 10000}','{"info2", "soft3"}',
  '{{"meeting", "lunch"}, {"training", "pres"}}','{{333,444},{111,222}}');
insert into t_text values(3,'{10000, 30000, 10000}','{"info3", "soft2"}',
  '{{"meeting", "lunch"}, {"training", "pres"}}','{{335,446},{122,233}}');
insert into t_text values(4,'{10000, 10000, 40000}','{"info4", "soft1"}',
  '{{"meeting", "lunch"}, {"training", "pres"}}','{{345,443},{121,282}}');
  
update t_text set c1='{56000, 89000}',c3='{{"meeting1", "lunch"}, {"train", "pres"}}' where id =2;

delete from t_text where id < 2;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_text';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_text';

select * from t_text;

case 124 "数据：数组类型 重命名表" 0
src_sql:
drop table t_text;

create table t_text (id integer primary key,c1 integer[],c2 text[],c3 text[][], c4 integer[][]);

insert into t_text values(2,'{20000, 10000, 10000}','{"info2", "soft3"}',
  '{{"meeting", "lunch"}, {"training", "pres"}}','{{333,444},{111,222}}');
insert into t_text values(3,'{10000, 30000, 10000}','{"info3", "soft2"}',
  '{{"meeting", "lunch"}, {"training", "pres"}}','{{335,446},{122,233}}');
  
alter table t_text rename to c_t_text;

INSERT INTO c_t_text VALUES(1,'{10000, 10000, 10000}','{"info1", "soft4"}',
  '{{"meeting", "lunch"}, {"training", "pres"}}','{{333,444},{111,222}}');
  
update c_t_text set c1=null ,c2=null where id=3;

delete from c_t_text where id =1;

alter table c_t_text rename to t_text;

INSERT INTO t_text VALUES(1,'{10000, 10000, 10000}','{"info1", "soft4"}',
  '{{"meeting", "lunch"}, {"training", "pres"}}','{{333,444},{111,222}}');
  
update t_text set c1=null ,c2=null where id=3;

delete from t_text where id =1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_text';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_text';

select * from t_text;

case 125 "数据：数组类型 添加列" 0
src_sql:
drop table t_text;

create table t_text (id integer primary key,c1 integer[],c2 text[],c3 text[][], c4 integer[][]);

insert into t_text values(2,'{20000, 10000, 10000}','{"info2", "soft3"}',
  '{{"meeting", "lunch"}, {"training", "pres"}}','{{333,444},{111,222}}');
insert into t_text values(3,'{10000, 30000, 10000}','{"info3", "soft2"}',
  '{{"meeting", "lunch"}, {"training", "pres"}}','{{335,446},{122,233}}');

alter table t_text add test1 integer[];

INSERT INTO t_text VALUES(1,'{10000, 10000, 10000}','{"info1", "soft4"}',
  '{{"meeting", "lunch"}, {"training", "pres"}}','{{333,444},{111,222}}','{10000, 10000, 10000}','{"info1", "soft4"}');

update t_text set test1=null where id=1;

delete from t_text where id=1;

alter table t_text add test2 text[],add test3 text[][];

INSERT INTO t_text VALUES(1,'{10000, 10000, 10000}','{"info1", "soft4"}',
  '{{"meeting", "lunch"}, {"training", "pres"}}','{{333,444},{111,222}}','{10000, 10000, 10000}','{"info1", "soft4"}',
  '{{"meeting", "lunch"}, {"training", "pres"}}');
  
update t_text set test2=null,test3 where id=1;

delete from t_text where id=1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_text';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_text';

select * from t_text;

case 126 "数据：数组类型 删除列" 0
src_sql:
drop table t_text;

create table t_text (id integer primary key,c1 integer[],c2 text[],c3 text[][], c4 integer[][],test1 integer[],test2 text[],test3 text[][]);

insert into t_text values(2,'{20000, 10000, 10000}','{"info2", "soft3"}',
  '{{"meeting", "lunch"}, {"training", "pres"}}','{{333,444},{111,222}}','{"info1", "soft4"}',
  '{{"meeting", "lunch"}, {"training", "pres"}}');
insert into t_text values(3,'{10000, 30000, 10000}','{"info3", "soft2"}',
  '{{"meeting", "lunch"}, {"training", "pres"}}','{{335,446},{122,233}}','{"info1", "soft4"}',
  '{{"meeting", "lunch"}, {"training", "pres"}}');
  
  alter table t_text drop test1;
  
INSERT INTO t_text VALUES(1,'{10000, 10000, 10000}','{"info1", "soft4"}',
  '{{"meeting", "lunch"}, {"training", "pres"}}','{{333,444},{111,222}}','{10000, 10000, 10000}','{{"meeting", "lunch"}, {"training", "pres"}}');

update t_text set test2=null,test3 where id=1;

delete from t_text where id=1;

alter table t_text drop test2,drop test3;

INSERT INTO t_text VALUES(1,'{10000, 10000, 10000}','{"info1", "soft4"}',
  '{{"meeting", "lunch"}, {"training", "pres"}}','{{333,444},{111,222}}');
  
update t_text set c1=null where id=1;

delete from t_text where id=1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_text';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_text';

select * from t_text;

case 127 "数据：数组类型 修改列属性" 0
src_sql:
drop table t_text;

create table t_text (id integer primary key,c1 integer[],c2 text[],c3 text[][], c4 integer[][]);

insert into t_text values(2,'{20000, 10000, 10000}','{"info2", "soft3"}',
  '{{"meeting", "lunch"}, {"training", "pres"}}','{{333,444},{111,222}}');
insert into t_text values(3,'{10000, 30000, 10000}','{"info3", "soft2"}',
  '{{"meeting", "lunch"}, {"training", "pres"}}','{{335,446},{122,233}}');
  
alter table t_text alter column c2 type text;

INSERT INTO t_text VALUES(1,'{10000, 10000, 10000}','{"info1", "soft4"}',
  '{{"meeting", "lunch"}, {"training", "pres"}}','{{333,444},{111,222}}');
  
update t_text set c2=null where id=1;

delete from t_text where id=1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_text';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_text';

select * from t_text;

case 128 "数据：数组类型 重命名列" 0
src_sql:
drop table t_text;

create table t_text (id integer primary key,c1 integer[],c2 text[],c3 text[][], c4 integer[][]);

insert into t_text values(2,'{20000, 10000, 10000}','{"info2", "soft3"}',
  '{{"meeting", "lunch"}, {"training", "pres"}}','{{333,444},{111,222}}');
insert into t_text values(3,'{10000, 30000, 10000}','{"info3", "soft2"}',
  '{{"meeting", "lunch"}, {"training", "pres"}}','{{335,446},{122,233}}');
  
alter table t_text rename column c1 to c1_n;

INSERT INTO t_text VALUES(1,'{10000, 10000, 10000}','{"info1", "soft4"}',
  '{{"meeting", "lunch"}, {"training", "pres"}}','{{333,444},{111,222}}');
  
update t_text set c1_n=null where id=1;

delete from t_text where id=1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_text';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_text';

select * from t_text;

case 129 "数据：数组类型 添加默认值" 0
src_sql:
drop table t_text;

create table t_text (id integer primary key,c1_n integer[],c2 text[],c3 text[][], c4 integer[][]);

insert into t_text values(2,'{20000, 10000, 10000}','{"info2", "soft3"}',
  '{{"meeting", "lunch"}, {"training", "pres"}}','{{333,444},{111,222}}');
insert into t_text values(3,'{10000, 30000, 10000}','{"info3", "soft2"}',
  '{{"meeting", "lunch"}, {"training", "pres"}}','{{335,446},{122,233}}');
  
alter table t_text alter column c1_n set default '{10000, 10000, 10000}';

INSERT INTO t_text VALUES(1,default,'{"info1", "soft4"}',
  '{{"meeting", "lunch"}, {"training", "pres"}}','{{333,444},{111,222}}');
  
update t_text set c1_n=null where id=1;

delete from t_text where id=1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_text';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_text';

select * from t_text;

case 130 "数据：数组类型 truncate表" 0
src_sql:
drop table t_text;

create table t_text (id integer primary key,c1_n integer[],c2 text[],c3 text[][], c4 integer[][]);

insert into t_text values(2,'{20000, 10000, 10000}','{"info2", "soft3"}',
  '{{"meeting", "lunch"}, {"training", "pres"}}','{{333,444},{111,222}}');
insert into t_text values(3,'{10000, 30000, 10000}','{"info3", "soft2"}',
  '{{"meeting", "lunch"}, {"training", "pres"}}','{{335,446},{122,233}}');
  
truncate table t_text;

INSERT INTO t_text VALUES(1,default,'{"info1", "soft4"}',
  '{{"meeting", "lunch"}, {"training", "pres"}}','{{333,444},{111,222}}');
  
INSERT INTO t_text VALUES(2,'{10000, 10000, 10000}','{"info1", "soft4"}',
  '{{"meeting", "lunch"}, {"training", "pres"}}','{{333,444},{111,222}}');
  
update t_text set c1_n=null where id=1;

delete from t_text where id=1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_text';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_text';

select * from t_text;

case 131 "数据：复合类型 建表" 0
src_sql:
drop table t_com;

drop type complex;

create type complex as (
    name            text,
    supplier_id     integer,
    price           numeric
);

create table t_com (id integer primary key,item complex,c integer);

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_com';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_com';

case 132 "数据：复合类型 插入数据" 0
src_sql:
drop table t_com;

drop type complex;

create type complex as (
    name            text,
    supplier_id     integer,
    price           numeric
);

create table t_com (id integer primary key,item complex,c integer);

insert into t_com values(1,ROW('fuzzy dice', 42, 1.99), 1000);
insert into t_com values(2,ROW('tt', 42, 1.99), 1000);
insert into t_com values(3,ROW('yy', 42, 1.99), 1000);
insert into t_com values(4,ROW('hh', 42, 1.99), 1000);

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_com';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_com';

select * from t_com;

case 133 "数据：复合类型 修改数据" 0
src_sql:
drop table t_com;

drop type complex;

create type complex as (
    name            text,
    supplier_id     integer,
    price           numeric
);

create table t_com (id integer primary key,item complex,c integer);

insert into t_com values(1,ROW('fuzzy dice', 42, 1.99), 1000);
insert into t_com values(2,ROW('tt', 42, 1.99), 1000);
insert into t_com values(3,ROW('yy', 42, 1.99), 1000);
insert into t_com values(4,ROW('hh', 42, 1.99), 1000);

update t_com set item=null,c=null where id =2;
update t_com set item=row('ww qq',66,2.88),c=4560 where id =3;

delete from t_com where id < 2;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_com';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_com';

select * from t_com;

case 134 "数据：复合类型 重命名表" 0
src_sql:
drop table t_com;

drop type complex;

create type complex as (
    name            text,
    supplier_id     integer,
    price           numeric
);

create table t_com (id integer primary key,item complex,c integer);

insert into t_com values(2,ROW('tt', 42, 1.99), 1000);
insert into t_com values(3,ROW('yy', 42, 1.99), 1000);

alter table t_com rename to c_t_com;

INSERT INTO c_t_com VALUES(1,ROW('fuzzy dice', 42, 1.99), 1000);

update c_t_com set c=null where id=3;

delete from c_t_com where id =1;

alter table c_t_com rename to t_com;

INSERT INTO t_com VALUES(1,ROW('fuzzy dice', 42, 1.99), 1000);

update t_com set c=null where id=3;

delete from t_com where id =1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_com';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_com';

select * from t_com;

case 135 "数据：复合类型 添加列" 0
src_sql:
drop table t_com;

drop type complex;

create type complex as (
    name            text,
    supplier_id     integer,
    price           numeric
);

create table t_com (id integer primary key,item complex,c integer);

insert into t_com values(2,ROW('tt', 42, 1.99), 1000);
insert into t_com values(3,ROW('yy', 42, 1.99), 1000);

alter table t_com add test1 complex;

INSERT INTO t_com VALUES(1,ROW('fuzzy dice', 42, 1.99), 1000,ROW('fuzzy dice', 42, 1.99));

update t_com set test1=null where id=1;

delete from t_com where id=1;

alter table t_com add test2 char,add test3 character;

INSERT INTO t_com VALUES(1,ROW('fuzzy dice', 42, 1.99), 1000,ROW('fuzzy dice', 42, 1.99),'q','q');

update t_com set test2=null,test3=null where id=1;

delete from t_com where id=1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_com';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_com';

select * from t_com;

case 136 "数据：复合类型 删除列" 0
src_sql:
drop table t_com;

drop type complex;

create type complex as (
    name            text,
    supplier_id     integer,
    price           numeric
);

create table t_com (id integer primary key,item complex,c integer,test1 complex,test2 char,test3 character);

insert into t_com values(2,ROW('tt', 42, 1.99), 1000,ROW('fuzzy dice', 42, 1.99),'q','q');
insert into t_com values(3,ROW('yy', 42, 1.99), 1000,ROW('fuzzy dice', 42, 1.99),'q','q');

alter table t_com drop test1;

INSERT INTO t_com VALUES(1,ROW('fuzzy dice', 42, 1.99), 1000,'q','q');

update t_com set test2=null,test3=null where id=1;

delete from t_com where id=1;

alter table t_com drop test2,drop test3;

INSERT INTO t_com VALUES(1,ROW('fuzzy dice', 42, 1.99), 1000);

update t_com set c=null where id=1;

delete from t_com where id=1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_com';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_com';

select * from t_com;

case 137 "数据：复合类型 修改列属性" 0
src_sql:
drop table t_com;

drop type complex;

create type complex as (
    name            text,
    supplier_id     integer,
    price           numeric
);

create table t_com (id integer primary key,item complex,c integer);

insert into t_com values(2,ROW('tt', 42, 1.99), 1000);
insert into t_com values(3,ROW('yy', 42, 1.99), 1000);

alter table t_com alter column c type char(50);

INSERT INTO t_com VALUES(1,ROW('fuzzy dice', 42, 1.99), 1000);

update t_com set c=null where id=1;

delete from t_com where id=1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_com';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_com';

select * from t_com;

case 138 "数据：复合类型 重命名列" 0
src_sql:
drop table t_com;

drop type complex;

create type complex as (
    name            text,
    supplier_id     integer,
    price           numeric
);

create table t_com (id integer primary key,item complex,c integer);

insert into t_com values(2,ROW('tt', 42, 1.99), 1000);
insert into t_com values(3,ROW('yy', 42, 1.99), 1000);

alter table t_com rename column c to c_n;

INSERT INTO t_com VALUES(1,ROW('fuzzy dice', 42, 1.99), 1000);

update t_com set c_n=null where id=1;

delete from t_com where id=1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_com';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_com';

select * from t_com;

case 139 "数据：复合类型 添加默认值" 0
src_sql:
drop table t_com;

drop type complex;

create type complex as (
    name            text,
    supplier_id     integer,
    price           numeric
);

create table t_com (id integer primary key,item complex,c_n integer);

insert into t_com values(2,ROW('tt', 42, 1.99), 1000);
insert into t_com values(3,ROW('yy', 42, 1.99), 1000);

alter table t_com alter column item set default ROW('fuzzy dice', 42, 1.99);

INSERT INTO t_com VALUES(1,default, 1000);

update t_com set item=null where id=1;

delete from t_com where id=1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_com';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_com';

select * from t_com;

case 140 "数据：复合类型 truncate表" 0
src_sql:
drop table t_com;

drop type complex;

create type complex as (
    name            text,
    supplier_id     integer,
    price           numeric
);

create table t_com (id integer primary key,item complex,c_n integer);

insert into t_com values(2,ROW('tt', 42, 1.99), 1000);
insert into t_com values(3,ROW('yy', 42, 1.99), 1000);

truncate table t_com; 

INSERT INTO t_com VALUES(1,ROW('fuzzy dice', 42, 1.99), 1000);
INSERT INTO t_com VALUES(2,default, 1000);

update t_com set item=null where id=1;

delete from t_com where id=1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_com';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_com';

select * from t_com;

case 141 "数据：范围类型 建表" 0
src_sql:
drop table t_range;

create table t_range (id integer primary key,c1 int4range,c2 int8range,c3 numrange, c4 tsrange,c5 tstzrange,c6 daterange);

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_range';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_range';

case 142 "数据：范围类型 插入数据" 0
src_sql:
drop table t_range;

create table t_range (id integer primary key,c1 int4range,c2 int8range,c3 numrange, c4 tsrange,c5 tstzrange,c6 daterange);

insert into t_range values(1,'(10, 20)','(1000, 2000)','(10.12, 20.3)','[2010-01-01 14:30, 2010-01-01 15:30)','[2013-12-11 pst, 2015-12-11 pst)','(2012-10-20 12:34:56,2018-10-20 12:34:56)');
insert into t_range values(2,'(10, 20)','(1000, 2000)','(10.12, 20.3)','[2010-01-01 14:30, 2010-01-01 15:30)',
                    '[2013-12-11 pst, 2015-12-11 pst)','(2012-10-20 12:34:56,2018-10-20 12:34:56)');
insert into t_range values(3,'(10, 20)','(1000, 2000)','(10.12, 20.3)','[2010-01-01 14:30, 2010-01-01 15:30)',
                    '[2013-12-11 pst, 2015-12-11 pst)','(2012-10-20 12:34:56,2018-10-20 12:34:56)');
insert into t_range values(4,'(10, 20)','(1000, 2000)','(10.12, 20.3)','[2010-01-01 14:30, 2010-01-01 15:30)',
                    '[2013-12-11 pst, 2015-12-11 pst)','(2012-10-20 12:34:56,2018-10-20 12:34:56)');

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_range';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_range';

select * from t_range;

case 143 "数据：范围类型 修改数据" 0
src_sql:
drop table t_range;

create table t_range (id integer primary key,c1 int4range,c2 int8range,c3 numrange, c4 tsrange,c5 tstzrange,c6 daterange);

insert into t_range values(1,'(10, 20)','(1000, 2000)','(10.12, 20.3)','[2010-01-01 14:30, 2010-01-01 15:30)','[2013-12-11 pst, 2015-12-11 pst)','(2012-10-20 12:34:56,2018-10-20 12:34:56)');
insert into t_range values(2,'(10, 20)','(1000, 2000)','(10.12, 20.3)','[2010-01-01 14:30, 2010-01-01 15:30)',
                    '[2013-12-11 pst, 2015-12-11 pst)','(2012-10-20 12:34:56,2018-10-20 12:34:56)');
insert into t_range values(3,'(10, 20)','(1000, 2000)','(10.12, 20.3)','[2010-01-01 14:30, 2010-01-01 15:30)',
                    '[2013-12-11 pst, 2015-12-11 pst)','(2012-10-20 12:34:56,2018-10-20 12:34:56)');
insert into t_range values(4,'(10, 20)','(1000, 2000)','(10.12, 20.3)','[2010-01-01 14:30, 2010-01-01 15:30)',
                    '[2013-12-11 pst, 2015-12-11 pst)','(2012-10-20 12:34:56,2018-10-20 12:34:56)');

update t_range set c1=null,c3=null,c5=null,c6=null where id =2;

delete from t_range where id < 2;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_range';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_range';

select * from t_range;

case 144 "数据：范围类型 重命名表" 0
src_sql:
drop table t_range;

create table t_range (id integer primary key,c1 int4range,c2 int8range,c3 numrange, c4 tsrange,c5 tstzrange,c6 daterange);

insert into t_range values(2,'(10, 20)','(1000, 2000)','(10.12, 20.3)','[2010-01-01 14:30, 2010-01-01 15:30)',
                    '[2013-12-11 pst, 2015-12-11 pst)','(2012-10-20 12:34:56,2018-10-20 12:34:56)');
insert into t_range values(3,'(10, 20)','(1000, 2000)','(10.12, 20.3)','[2010-01-01 14:30, 2010-01-01 15:30)',
                    '[2013-12-11 pst, 2015-12-11 pst)','(2012-10-20 12:34:56,2018-10-20 12:34:56)');

alter table t_range rename to c_t_range;

INSERT INTO c_t_range VALUES(1,'(10, 20)','(1000, 2000)','(10.12, 20.3)','[2010-01-01 14:30, 2010-01-01 15:30)',
                    '[2013-12-11 pst, 2015-12-11 pst)','(2012-10-20 12:34:56,2018-10-20 12:34:56)');

update c_t_range set c1='(101, 202)',c3='(100.46, 204.20)',c5='[2019-10-11 pst, 2023-12-11 pst)' where id =3;

delete from c_t_range where id =1;

alter table c_t_range rename to t_range;

INSERT INTO t_range VALUES(1,'(10, 20)','(1000, 2000)','(10.12, 20.3)','[2010-01-01 14:30, 2010-01-01 15:30)',
                    '[2013-12-11 pst, 2015-12-11 pst)','(2012-10-20 12:34:56,2018-10-20 12:34:56)');

update t_range set c1='(101, 202)',c3='(100.46, 204.20)',c5='[2019-10-11 pst, 2023-12-11 pst)' where id =3;

delete from t_range where id =1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_range';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_range';

select * from t_range;

case 145 "数据：范围类型 添加列" 0
src_sql:
drop table t_range;

create table t_range (id integer primary key,c1 int4range,c2 int8range,c3 numrange, c4 tsrange,c5 tstzrange,c6 daterange);

insert into t_range values(2,'(10, 20)','(1000, 2000)','(10.12, 20.3)','[2010-01-01 14:30, 2010-01-01 15:30)',
                    '[2013-12-11 pst, 2015-12-11 pst)','(2012-10-20 12:34:56,2018-10-20 12:34:56)');
insert into t_range values(3,'(10, 20)','(1000, 2000)','(10.12, 20.3)','[2010-01-01 14:30, 2010-01-01 15:30)',
                    '[2013-12-11 pst, 2015-12-11 pst)','(2012-10-20 12:34:56,2018-10-20 12:34:56)');
					
alter table t_range add test1 int8range;

INSERT INTO t_range VALUES(1,'(10, 20)','(1000, 2000)','(10.12, 20.3)','[2010-01-01 14:30, 2010-01-01 15:30)',
                    '[2013-12-11 pst, 2015-12-11 pst)','(2012-10-20 12:34:56,2018-10-20 12:34:56)','(1000, 2000)');

update t_range set test1=null where id=1;

delete from t_range where id=1;

alter table t_range add test2 numrange,add test3 tsrange;

INSERT INTO t_range VALUES(1,'(10, 20)','(1000, 2000)','(10.12, 20.3)','[2010-01-01 14:30, 2010-01-01 15:30)',
                    '[2013-12-11 pst, 2015-12-11 pst)','(2012-10-20 12:34:56,2018-10-20 12:34:56)','(1000, 2000)','(10.12, 20.3)','[2010-01-01 14:30, 2010-01-01 15:30)');

update t_range set test2=null,test3=null where id=1;

delete from t_range where id=1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_range';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_range';

select * from t_range;

case 146 "数据：范围类型 删除列" 0
src_sql:
drop table t_range;

create table t_range (id integer primary key,c1 int4range,c2 int8range,c3 numrange, c4 tsrange,c5 tstzrange,c6 daterange,test1 int8range,test2 numrange,test3 tsrange);

insert into t_range values(2,'(10, 20)','(1000, 2000)','(10.12, 20.3)','[2010-01-01 14:30, 2010-01-01 15:30)',
                    '[2013-12-11 pst, 2015-12-11 pst)','(2012-10-20 12:34:56,2018-10-20 12:34:56)','(1000, 2000)','(10.12, 20.3)','[2010-01-01 14:30, 2010-01-01 15:30)');
insert into t_range values(3,'(10, 20)','(1000, 2000)','(10.12, 20.3)','[2010-01-01 14:30, 2010-01-01 15:30)',
                    '[2013-12-11 pst, 2015-12-11 pst)','(2012-10-20 12:34:56,2018-10-20 12:34:56)','(1000, 2000)','(10.12, 20.3)','[2010-01-01 14:30, 2010-01-01 15:30)');

alter table t_range drop test1;

INSERT INTO t_range VALUES(1,'(10, 20)','(1000, 2000)','(10.12, 20.3)','[2010-01-01 14:30, 2010-01-01 15:30)',
                    '[2013-12-11 pst, 2015-12-11 pst)','(2012-10-20 12:34:56,2018-10-20 12:34:56)','(10.12, 20.3)','[2010-01-01 14:30, 2010-01-01 15:30)');

update t_range set test2=null,test3=null where id=1;

delete from t_range where id=1;


alter table t_range drop test2,drop test3;

INSERT INTO t_range VALUES(1,'(10, 20)','(1000, 2000)','(10.12, 20.3)','[2010-01-01 14:30, 2010-01-01 15:30)',
                    '[2013-12-11 pst, 2015-12-11 pst)','(2012-10-20 12:34:56,2018-10-20 12:34:56)');

update t_range set c1=null where id=1;

delete from t_range where id=1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_range';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_range';

select * from t_range;

case 147 "数据：范围类型 修改列属性" 0
src_sql:
drop table t_range;

create table t_range (id integer primary key,c1 int4range,c2 int8range,c3 numrange, c4 tsrange,c5 tstzrange,c6 daterange);

insert into t_range values(2,'(10, 20)','(1000, 2000)','(10.12, 20.3)','[2010-01-01 14:30, 2010-01-01 15:30)',
                    '[2013-12-11 pst, 2015-12-11 pst)','(2012-10-20 12:34:56,2018-10-20 12:34:56)');
insert into t_range values(3,'(10, 20)','(1000, 2000)','(10.12, 20.3)','[2010-01-01 14:30, 2010-01-01 15:30)',
                    '[2013-12-11 pst, 2015-12-11 pst)','(2012-10-20 12:34:56,2018-10-20 12:34:56)');

alter table t_range alter column c2 type text;

INSERT INTO t_range VALUES(1,'(10, 20)','(1000, 2000)','(10.12, 20.3)','[2010-01-01 14:30, 2010-01-01 15:30)',
                    '[2013-12-11 pst, 2015-12-11 pst)','(2012-10-20 12:34:56,2018-10-20 12:34:56)');

update t_range set c2=null where id=1;

delete from t_range where id=1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_range';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_range';

select * from t_range;

case 148 "数据：范围类型 重命名列" 0
src_sql:
drop table t_range;

create table t_range (id integer primary key,c1 int4range,c2 int8range,c3 numrange, c4 tsrange,c5 tstzrange,c6 daterange);

insert into t_range values(2,'(10, 20)','(1000, 2000)','(10.12, 20.3)','[2010-01-01 14:30, 2010-01-01 15:30)',
                    '[2013-12-11 pst, 2015-12-11 pst)','(2012-10-20 12:34:56,2018-10-20 12:34:56)');
insert into t_range values(3,'(10, 20)','(1000, 2000)','(10.12, 20.3)','[2010-01-01 14:30, 2010-01-01 15:30)',
                    '[2013-12-11 pst, 2015-12-11 pst)','(2012-10-20 12:34:56,2018-10-20 12:34:56)');

alter table t_range rename column c1 to c1_n;

INSERT INTO t_range VALUES(1,'(10, 20)','(1000, 2000)','(10.12, 20.3)','[2010-01-01 14:30, 2010-01-01 15:30)',
                    '[2013-12-11 pst, 2015-12-11 pst)','(2012-10-20 12:34:56,2018-10-20 12:34:56)');

update t_range set c1_n=null where id=1;

delete from t_range where id=1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_range';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_range';

select * from t_range;

case 149 "数据：范围类型 添加默认值" 0
src_sql:
drop table t_range;

create table t_range (id integer primary key,c1_n int4range,c2 int8range,c3 numrange, c4 tsrange,c5 tstzrange,c6 daterange);

insert into t_range values(2,'(10, 20)','(1000, 2000)','(10.12, 20.3)','[2010-01-01 14:30, 2010-01-01 15:30)',
                    '[2013-12-11 pst, 2015-12-11 pst)','(2012-10-20 12:34:56,2018-10-20 12:34:56)');
insert into t_range values(3,'(10, 20)','(1000, 2000)','(10.12, 20.3)','[2010-01-01 14:30, 2010-01-01 15:30)',
                    '[2013-12-11 pst, 2015-12-11 pst)','(2012-10-20 12:34:56,2018-10-20 12:34:56)');

alter table t_range alter column c1_n set default '(10, 20)';

INSERT INTO t_range VALUES(1,default,'(1000, 2000)','(10.12, 20.3)','[2010-01-01 14:30, 2010-01-01 15:30)',
                    '[2013-12-11 pst, 2015-12-11 pst)','(2012-10-20 12:34:56,2018-10-20 12:34:56)');

update t_range set c1_n=null where id=1;

delete from t_range where id=1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_range';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_range';

select * from t_range;

case 150 "数据：范围类型 truncate表" 0
src_sql:
drop table t_range;

create table t_range (id integer primary key,c1_n int4range,c2 int8range,c3 numrange, c4 tsrange,c5 tstzrange,c6 daterange);

insert into t_range values(2,'(10, 20)','(1000, 2000)','(10.12, 20.3)','[2010-01-01 14:30, 2010-01-01 15:30)',
                    '[2013-12-11 pst, 2015-12-11 pst)','(2012-10-20 12:34:56,2018-10-20 12:34:56)');
insert into t_range values(3,'(10, 20)','(1000, 2000)','(10.12, 20.3)','[2010-01-01 14:30, 2010-01-01 15:30)',
                    '[2013-12-11 pst, 2015-12-11 pst)','(2012-10-20 12:34:56,2018-10-20 12:34:56)');

truncate table t_range; 

INSERT INTO t_range VALUES(1,default,'(1000, 2000)','(10.12, 20.3)','[2010-01-01 14:30, 2010-01-01 15:30)',
                    '[2013-12-11 pst, 2015-12-11 pst)','(2012-10-20 12:34:56,2018-10-20 12:34:56)');
INSERT INTO t_range VALUES(2,default,'(1000, 2000)','(10.12, 20.3)','[2010-01-01 14:30, 2010-01-01 15:30)',
                    '[2013-12-11 pst, 2015-12-11 pst)','(2012-10-20 12:34:56,2018-10-20 12:34:56)');

update t_range set c1_n=null where id=1;

delete from t_range where id=1;	

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_range';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_range';

select * from t_range;

case 151 "数据：对象标识符类型 建表" 0
src_sql:
drop table t_id;

create table t_id (id integer primary key,c1 oid,c2 regproc,c3 regprocedure,c4 regoper,c5 regoperator,c6 regclass,c7 regtype,c8 regconfig,c9 regdictionary);

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_id';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_id';

case 152 "数据：对象标识符类型 插入数据" 0
src_sql:
drop table t_id;

create table t_id (id integer primary key,c1 oid,c2 regproc,c3 regprocedure,c4 regoper,c5 regoperator,c6 regclass,c7 regtype,c8 regconfig,c9 regdictionary);

insert into t_id values(1,1111,'sin','sum(int4)',null,'*(integer,integer)','pg_type','integer','english','simple');
insert into t_id values(2,2222,'cos','sum(int4)',null,'*(integer,integer)','pg_type','integer','english','simple');
insert into t_id values(3,3333,'tan','sum(int4)',null,'*(integer,integer)','pg_type','integer','english','simple');

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_id';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_id';

select * from t_id;

case 153 "数据：对象标识符类型 修改数据" 0
src_sql:
drop table t_id;

create table t_id (id integer primary key,c1 oid,c2 regproc,c3 regprocedure,c4 regoper,c5 regoperator,c6 regclass,c7 regtype,c8 regconfig,c9 regdictionary);

insert into t_id values(1,1111,'sin','sum(int4)',null,'*(integer,integer)','pg_type','integer','english','simple');
insert into t_id values(2,2222,'cos','sum(int4)',null,'*(integer,integer)','pg_type','integer','english','simple');
insert into t_id values(3,3333,'tan','sum(int4)',null,'*(integer,integer)','pg_type','integer','english','simple');

update t_id set c1 =56789 ,c2='acos',c5='-(NONE,integer)' where id = 2;
update t_id set c1 = null,c2 = null where id = 3;

delete from t_id where id = 1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_id';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_id';

select * from t_id;

case 154 "数据：对象标识符类型 重命名表" 0
src_sql:
drop table t_id;

create table t_id (id integer primary key,c1 oid,c2 regproc,c3 regprocedure,c4 regoper,c5 regoperator,c6 regclass,c7 regtype,c8 regconfig,c9 regdictionary);

insert into t_id values(2,2222,'cos','sum(int4)',null,'*(integer,integer)','pg_type','integer','english','simple');
insert into t_id values(3,3333,'tan','sum(int4)',null,'*(integer,integer)','pg_type','integer','english','simple');

alter table t_id rename to c_t_id;

INSERT INTO c_t_id VALUES(1,1111,'sin','sum(int4)',null,'*(integer,integer)','pg_type','integer','english','simple');

update c_t_id set c1=null,c3=null,c5=null where id =3;

delete from c_t_id where id =1;

alter table c_t_id rename to t_id;

INSERT INTO t_id VALUES(1,1111,'sin','sum(int4)',null,'*(integer,integer)','pg_type','integer','english','simple');

update t_id set c1=null,c3=null,c5=null where id =3;

delete from t_id where id =1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_id';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_id';

select * from t_id;

case 155 "数据：对象标识符类型 添加列" 0
src_sql:
drop table t_id;

create table t_id (id integer primary key,c1 oid,c2 regproc,c3 regprocedure,c4 regoper,c5 regoperator,c6 regclass,c7 regtype,c8 regconfig,c9 regdictionary);

insert into t_id values(2,2222,'cos','sum(int4)',null,'*(integer,integer)','pg_type','integer','english','simple');
insert into t_id values(3,3333,'tan','sum(int4)',null,'*(integer,integer)','pg_type','integer','english','simple');

alter table t_id add test1 oid;

INSERT INTO t_id VALUES(1,1111,'sin','sum(int4)',null,'*(integer,integer)','pg_type','integer','english','simple',1111);

update t_id set test1=null where id=1;

delete from t_id where id=1;

alter table t_id add test2 regproc,add test3 regprocedure;

INSERT INTO t_id VALUES(1,1111,'sin','sum(int4)',null,'*(integer,integer)','pg_type','integer','english','simple',1111,'sin','sum(int4)');

update t_id set test2=null,test3=null where id=1;

delete from t_id where id=1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_id';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_id';

select * from t_id;

case 156 "数据：对象标识符类型 删除列" 0
src_sql:
drop table t_id;

create table t_id (id integer primary key,c1 oid,c2 regproc,c3 regprocedure,c4 regoper,c5 regoperator,c6 regclass,c7 regtype,c8 regconfig,c9 regdictionary,test1 oid,test2 regproc,test3 regprocedure);

insert into t_id values(2,2222,'cos','sum(int4)',null,'*(integer,integer)','pg_type','integer','english','simple',1111,'sin','sum(int4)');
insert into t_id values(3,3333,'tan','sum(int4)',null,'*(integer,integer)','pg_type','integer','english','simple',1111,'sin','sum(int4)');

alter table t_id drop test1;

INSERT INTO t_id VALUES(1,1111,'sin','sum(int4)',null,'*(integer,integer)','pg_type','integer','english','simple''sin','sum(int4)');

update t_id set test2=null,test3=null where id=1;

delete from t_id where id=1;

alter table t_id drop test2,drop test3;

INSERT INTO t_id VALUES(1,1111,'sin','sum(int4)',null,'*(integer,integer)','pg_type','integer','english','simple');

update t_id set c1=null where id=1;

delete from t_id where id=1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_id';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_id';

select * from t_id;

case 157 "数据：对象标识符类型 修改列属性" 0
src_sql:
drop table t_id;

create table t_id (id integer primary key,c1 oid,c2 regproc,c3 regprocedure,c4 regoper,c5 regoperator,c6 regclass,c7 regtype,c8 regconfig,c9 regdictionary);

insert into t_id values(2,2222,'cos','sum(int4)',null,'*(integer,integer)','pg_type','integer','english','simple');
insert into t_id values(3,3333,'tan','sum(int4)',null,'*(integer,integer)','pg_type','integer','english','simple');

alter table t_id alter column c2 type text;

INSERT INTO t_id VALUES(1,1111,'sin','sum(int4)',null,'*(integer,integer)','pg_type','integer','english','simple');

update t_id set c2=null where id=1;

delete from t_id where id=1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_id';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_id';

select * from t_id;

case 158 "数据：对象标识符类型 重命名列" 0
src_sql:
drop table t_id;

create table t_id (id integer primary key,c1 oid,c2 regproc,c3 regprocedure,c4 regoper,c5 regoperator,c6 regclass,c7 regtype,c8 regconfig,c9 regdictionary);

insert into t_id values(2,2222,'cos','sum(int4)',null,'*(integer,integer)','pg_type','integer','english','simple');
insert into t_id values(3,3333,'tan','sum(int4)',null,'*(integer,integer)','pg_type','integer','english','simple');

alter table t_id rename column c1 to c1_n;

INSERT INTO t_id VALUES(1,1111,'sin','sum(int4)',null,'*(integer,integer)','pg_type','integer','english','simple');

update t_id set c1_n=null where id=1;

delete from t_id where id=1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_id';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_id';

select * from t_id;

case 159 "数据：对象标识符类型 添加默认值" 0
src_sql:
drop table t_id;

create table t_id (id integer primary key,c1_n oid,c2 regproc,c3 regprocedure,c4 regoper,c5 regoperator,c6 regclass,c7 regtype,c8 regconfig,c9 regdictionary);

insert into t_id values(2,2222,'cos','sum(int4)',null,'*(integer,integer)','pg_type','integer','english','simple');
insert into t_id values(3,3333,'tan','sum(int4)',null,'*(integer,integer)','pg_type','integer','english','simple');

alter table t_id alter column c1_n set default 2222;

INSERT INTO t_id VALUES(1,default,'sin','sum(int4)',null,'*(integer,integer)','pg_type','integer','english','simple');

update t_id set c1_n=null where id=1;

delete from t_id where id=1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_id';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_id';

select * from t_id;

case 160 "数据：对象标识符类型 truncate表" 0
src_sql:
drop table t_id;

create table t_id (id integer primary key,c1_n oid,c2 regproc,c3 regprocedure,c4 regoper,c5 regoperator,c6 regclass,c7 regtype,c8 regconfig,c9 regdictionary);

insert into t_id values(2,2222,'cos','sum(int4)',null,'*(integer,integer)','pg_type','integer','english','simple');
insert into t_id values(3,3333,'tan','sum(int4)',null,'*(integer,integer)','pg_type','integer','english','simple');

truncate table t_id;

INSERT INTO t_id VALUES(1,default,'sin','sum(int4)',null,'*(integer,integer)','pg_type','integer','english','simple');
INSERT INTO t_id VALUES(2,1111,'sin','sum(int4)',null,'*(integer,integer)','pg_type','integer','english','simple');

update t_id set c1_n=null where id=1;

delete from t_id where id=1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_id';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_id';

select * from t_id;

case 161 "数据：域类型 建表" 0
src_sql:
drop table t_pos;

drop domain posint;

CREATE DOMAIN posint AS integer CHECK (VALUE > 0);

CREATE TABLE t_pos (id posint,c1 char);

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_pos';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_pos';

case 162 "数据：域类型 插入数据" 0
src_sql:
drop table t_pos;

drop domain posint;

CREATE DOMAIN posint AS integer CHECK (VALUE > 0);

CREATE TABLE t_pos (id posint,c1 char);

INSERT INTO t_pos VALUES(1,'p');   -- works
INSERT INTO t_pos VALUES(-1,'p');  -- fails
insert into t_pos values(2,'p');
insert into t_pos values(3,'p');
insert into t_pos values(4,'p');

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_pos';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_pos';

select * from t_pos;

case 163 "数据：域类型 修改数据" 0
src_sql:
drop table t_pos;

drop domain posint;

CREATE DOMAIN posint AS integer CHECK (VALUE > 0);

CREATE TABLE t_pos (id posint,c1 char);

INSERT INTO t_pos VALUES(1,'p');   -- works
--INSERT INTO t_pos VALUES(-1,'p');  -- fails
insert into t_pos values(2,'p');
insert into t_pos values(3,'p');
insert into t_pos values(4,'p');

update t_pos set c1='l' where id=3;

delete from t_pos where id=4;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_pos';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_pos';

select * from t_pos;


case 164 "数据：域类型 重命名表" 0
src_sql:
drop table t_pos;

drop domain posint;

CREATE DOMAIN posint AS integer CHECK (VALUE > 0);

CREATE TABLE t_pos (id posint,c1 char);

INSERT INTO t_pos VALUES(1,'p');   -- works
INSERT INTO t_pos VALUES(-1,'p');  -- fails
insert into t_pos values(2,'p');
insert into t_pos values(3,'p');

alter table t_pos rename to c_t_pos;

INSERT INTO c_t_pos VALUES(4,'p');

update c_t_pos set c1='k' where id =4;

delete from c_t_pos where id =4;

alter table c_t_pos rename to t_pos;

INSERT INTO t_pos VALUES(4,'p');

update t_pos set c1='k' where id =4;

delete from t_pos where id =4;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_pos';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_pos';

select * from t_pos;


case 165 "数据：域类型 添加列" 0
src_sql:
drop table t_pos;

drop domain posint;

CREATE DOMAIN posint AS integer CHECK (VALUE > 0);

CREATE TABLE t_pos (id posint,c1 char);

INSERT INTO t_pos VALUES(1,'p');   -- works
INSERT INTO t_pos VALUES(-1,'p');  -- fails
insert into t_pos values(2,'p');
insert into t_pos values(3,'p');

alter table t_pos add test1 posint;

INSERT INTO t_pos VALUES(4,'p',4);

update t_pos set test1='k' where id =4;

delete from t_pos where id =4;

alter table t_pos add test2 varchar(5),add test3 posint;

INSERT INTO t_pos VALUES(4,'p',4,'info2',4);

update t_pos set test2='',test3=null where id =4;

delete from t_pos where id =4;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_pos';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_pos';

select * from t_pos;


case 166 "数据：域类型 删除列" 0
src_sql:
drop table t_pos;

drop domain posint;

CREATE DOMAIN posint AS integer CHECK (VALUE > 0);

CREATE TABLE t_pos (id posint,c1 char,test1 posint,test2 varchar(5),test3 posint);

INSERT INTO t_pos VALUES(1,'p',4,'info2',4);   -- works
INSERT INTO t_pos VALUES(-1,'p',4,'info2',4);  -- fails
insert into t_pos values(2,'p',4,'info2',4);
insert into t_pos values(3,'p',4,'info2',4);

alter table t_pos drop test1
;
INSERT INTO t_pos VALUES(4,'p','info2',4);

update t_pos set test2='',test3=3 where id =4;

delete from t_pos where id =4;

alter table t_pos drop test2,drop test3;

INSERT INTO t_pos VALUES(4,'p');

update t_pos set c1='k' where id =4;

delete from t_pos where id =4;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_pos';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_pos';

select * from t_pos;

case 167 "数据：域类型 修改列属性" 0
src_sql:
drop table t_pos;

drop domain posint;

CREATE DOMAIN posint AS integer CHECK (VALUE > 0);

CREATE TABLE t_pos (id posint,c1 char);

INSERT INTO t_pos VALUES(1,'p');   -- works
INSERT INTO t_pos VALUES(-1,'p');  -- fails
insert into t_pos values(2,'p');
insert into t_pos values(3,'p');

alter table t_pos alter column c1 type varchar(5);

INSERT INTO t_pos VALUES(4,'p');

update t_pos set c1='k' where id =4;

delete from t_pos where id =4;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_pos';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_pos';

select * from t_pos;

case 168 "数据：域类型 重命名列" 0
src_sql:
drop table t_pos;

drop domain posint;

CREATE DOMAIN posint AS integer CHECK (VALUE > 0);

CREATE TABLE t_pos (id posint,c1 char);

INSERT INTO t_pos VALUES(1,'p');   -- works
INSERT INTO t_pos VALUES(-1,'p');  -- fails
insert into t_pos values(2,'p');
insert into t_pos values(3,'p');

alter table t_pos rename column c1 to c1_n;

INSERT INTO t_pos VALUES(4,'p');

update t_pos set c1_n='k' where id =4;

delete from t_pos where id =4;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_pos';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_pos';

select * from t_pos;

case 169 "数据：域类型 添加默认值" 0
src_sql:
drop table t_pos;

drop domain posint;

CREATE DOMAIN posint AS integer CHECK (VALUE > 0);

CREATE TABLE t_pos (id posint,c1_n char);

INSERT INTO t_pos VALUES(1,'p');   -- works
INSERT INTO t_pos VALUES(-1,'p');  -- fails
insert into t_pos values(2,'p');
insert into t_pos values(3,'p');

alter table t_pos alter column c1_n set default 'info2';

INSERT INTO t_pos VALUES(4,default);

update t_pos set c1_n='k' where id =4;

delete from t_pos where id =4;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_pos';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_pos';

select * from t_pos;

case 170 "数据：域类型 truncate表" 0
src_sql:
drop table t_pos;

drop domain posint;

CREATE DOMAIN posint AS integer CHECK (VALUE > 0);

CREATE TABLE t_pos (id posint,c1_n char);

INSERT INTO t_pos VALUES(1,'p');   -- works
INSERT INTO t_pos VALUES(-1,'p');  -- fails
insert into t_pos values(2,'p');
insert into t_pos values(3,'p');

truncate table t_pos;

insert into t_pos values(1,'p');
insert into t_pos values(2,'张杰');
insert into t_pos values(3,'wsde');
INSERT INTO t_pos VALUES(4,default);

update t_pos set c1_n='kkkkk' where id =3;

delete from t_pos where id =4;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_pos';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_pos';

select * from t_pos;

case 171 "数据：二进制数据类型 建表" 0
src_sql:
drop table t_by;

create table t_by (id int primary key,c1 bytea,c2 bytea);

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_by';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_by';

case 172 "数据：二进制数据类型 插入数据" 0
src_sql:
drop table t_by;

create table t_by (id int primary key,c1 bytea,c2 bytea);

insert into t_by values(1,'hex','01');
insert into t_by values(2,'dgh','02');
insert into t_by values(3,'kop','03');

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_by';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_by';

select * from t_by;

case 173 "数据：二进制数据类型 修改数据" 0
src_sql:
drop table t_by;

create table t_by (id int primary key,c1 bytea,c2 bytea);

insert into t_by values(1,'hex','01');
insert into t_by values(2,'dgh','02');
insert into t_by values(3,'kop','03');

update t_by set c1=null,c2=null where id=2;

delete from t_by where id=3;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_by';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_by';

select * from t_by;

case 174 "数据：二进制数据类型 重命名表" 0
src_sql:
drop table t_by;

create table t_by (id int primary key,c1 bytea,c2 bytea);

insert into t_by values(1,'hex','01');
insert into t_by values(2,'dgh','02');

alter table t_by rename to c_t_by;

insert into t_by values(3,'kop','03');

update t_by set c1=null,c2=null where id=3;

delete from t_by where id=3;

alter table c_t_by rename to t_by;

insert into t_by values(3,'kop','03');

update t_by set c1=null,c2=null where id=3;

delete from t_by where id=3;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_by';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_by';

select * from t_by;

case 175 "数据：二进制数据类型 添加列" 0
src_sql:
drop table t_by;

create table t_by (id int primary key,c1 bytea,c2 bytea);

insert into t_by values(1,'hex','01');
insert into t_by values(2,'dgh','02');

alter table t_by add test1 bytea;

insert into t_by values(3,'kop','03','lol');

update t_by set test11=null where id=3;

delete from t_by where id=3;

alter table t_by add test2 varchar(5),add test3 bytea;

insert into t_by values(3,'kop','03','lol','info2','fgh');

update t_by set test3=null,test2=null where id=3;

delete from t_by where id=3;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_by';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_by';

select * from t_by;

case 176 "数据：二进制数据类型 删除列" 0
src_sql:
drop table t_by;

create table t_by (id int primary key,c1 bytea,c2 bytea,test1 bytea,test2 varchar(5),test3 bytea);

insert into t_by values(1,'hex','01','lol','info2','fgh');
insert into t_by values(2,'dgh','02','lol','info2','fgh');

alter table t_by drop test1;

insert into t_by values(3,'kop','03','info2','fgh');

update t_by set test3=null,test2=null where id=3;

delete from t_by where id=3;

alter table t_by drop test2,drop test3;

insert into t_by values(3,'kop','03');

update t_by set c1=null,c2=null where id=3;

delete from t_by where id=3;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_by';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_by';

select * from t_by;

case 177 "数据：二进制数据类型 修改列属性" 0
src_sql:
drop table t_by;

create table t_by (id int primary key,c1 bytea,c2 bytea);

insert into t_by values(1,'hex','01');
insert into t_by values(2,'dgh','02');

alter table t_by alter column c1 type varchar;

insert into t_by values(3,'k','03');

update t_by set c1=null,c2=null where id=3;

delete from t_by where id=3;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_by';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_by';

select * from t_by;

case 178 "数据：二进制数据类型 重命名列" 0
src_sql:
drop table t_by;

create table t_by (id int primary key,c1 bytea,c2 bytea);

insert into t_by values(1,'hex','01');
insert into t_by values(2,'dgh','02');

alter table t_by rename column c1 to c1_n;

insert into t_by values(3,'k','03');

update t_by set c1_n=null,c2=null where id=3;

delete from t_by where id=3;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_by';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_by';

select * from t_by;

case 179 "数据：二进制数据类型 添加默认值" 0
src_sql:
drop table t_by;

create table t_by (id int primary key,c1_n bytea,c2 bytea);

insert into t_by values(1,'hex','01');
insert into t_by values(2,'dgh','02');

alter table t_by alter column c1_n set default 'A';

insert into t_by values(3,default,'03');

update t_by set c1=null,c2=null where id=3;

delete from t_by where id=3;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_by';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_by';

select * from t_by;

case 180 "数据：二进制数据类型 truncate表" 0
src_sql:
drop table t_by;

create table t_by (id int primary key,c1_n bytea,c2 bytea);

insert into t_by values(1,'hex','01');
insert into t_by values(2,'dgh','02');

truncate table t_by;

insert into t_by values(2,default,'03');
insert into t_by values(3,'k','03');

update t_by set c1=null,c2=null where id=3;

delete from t_by where id=3;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_by';

select table_name,column_name,data_type from information_schema.columns where  table_name='t_by';

select * from t_by;