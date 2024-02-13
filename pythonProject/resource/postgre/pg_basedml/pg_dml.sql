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

case 23 "数据：数值类型:浮点类型 修改数据" 0
before:
drop table t_int3;
src_sql:
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

case 33 "数据：货币类型&布尔类型 修改数据" 0
before:
drop table t_bool;
src_sql:
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

case 43 "数据：字符类型 修改数据" 0
before:
drop table t_char;
src_sql:
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
case 53 "数据：日期/时间类型 修改数据" 0
before:
drop table t_time;
src_sql:
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

case 63 "数据：枚举类型enum 修改数据" 0
before:
drop table t_enum;

drop type mood;
src_sql:
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
case 73 "数据：几何类型/网络地址类型 修改数据" 0
before:
drop table t_other;
src_sql:
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
case 83 "数据：位串类型 修改数据" 0
before:
drop table t_bit;
src_sql:
create table t_bit ( id integer  primary key, c1 bit(3), c2 bit varying(5) ) ;

insert into t_bit values(1, b'101', b'00');
insert into t_bit values(2, b'10'::bit(3), b'101');
insert into t_bit values(3, b'101', b'00');

update t_bit set c1 = null ,c2 = null where id = 2;

delete from t_bit where id = 1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_bit';

case 93 "数据：文本搜索类型 修改数据" 0
before:
drop table t_ts;
src_sql:
create table t_ts(id integer primary key,c1 tsvector,c2 tsquery);

insert into t_ts values(1,'The Fat Rats'::tsvector,'fat & rat'::tsquery);
insert into t_ts values(2,to_tsvector('english', 'The Fat Rats'),'super:*'::tsquery);
insert into t_ts values(3,'The Fat Rats'::tsvector,'fat & rat'::tsquery);

update t_ts set c1='I need to test this product'::tsvector,c2='test & product'::tsquery where id =2;

delete from t_ts where id =1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_ts';
case 103 "数据：UUID类型& xml类型 修改数据" 0
before:
drop table t_xml;
src_sql:
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
case 113 "数据：json类型 修改数据" 0
before:
drop table t_json;
src_sql:
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

case 133 "数据：复合类型 修改数据" 0
before:
drop table t_com;

drop type complex;
src_sql:
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
case 143 "数据：范围类型 修改数据" 0
before:
drop table t_range;
src_sql:
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
case 153 "数据：对象标识符类型 修改数据" 0
before:
drop table t_id;
src_sql:
create table t_id (id integer primary key,c1 oid,c2 regproc,c3 regprocedure,c4 regoper,c5 regoperator,c6 regclass,c7 regtype,c8 regconfig,c9 regdictionary);

insert into t_id values(1,1111,'sin','sum(int4)',null,'*(integer,integer)','pg_type','integer','english','simple');
insert into t_id values(2,2222,'cos','sum(int4)',null,'*(integer,integer)','pg_type','integer','english','simple');
insert into t_id values(3,3333,'tan','sum(int4)',null,'*(integer,integer)','pg_type','integer','english','simple');

update t_id set c1 =56789 ,c2='acos',c5='-(NONE,integer)' where id = 2;
update t_id set c1 = null,c2 = null where id = 3;

delete from t_id where id = 1;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_id';
case 163 "数据：域类型 修改数据" 0
before:
drop table t_pos;

drop domain posint;
src_sql:
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
case 173 "数据：二进制数据类型 修改数据" 0
before:
drop table t_by;
src_sql:
create table t_by (id int primary key,c1 bytea,c2 bytea);

insert into t_by values(1,'hex','01');
insert into t_by values(2,'dgh','02');
insert into t_by values(3,'kop','03');

update t_by set c1=null,c2=null where id=2;

delete from t_by where id=3;

tgt_sql:
select count(*) from information_schema.columns where  table_name='t_by';