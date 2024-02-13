case 124 "创建序列" 0
before:
drop sequence test_seq1;
drop sequence test_seqa;
drop sequence test_seqb;
drop sequence test_seqc;
drop sequence test_seqd;
drop sequence test_seqe;
drop sequence test_seqf;
drop sequence test_seqg;
drop type dt_int;
drop type dt_bigint;
drop type dt_smallint;
go
src_sql:
create type dt_int from int not null;
create type dt_bigint from bigint not null;
create type dt_smallint from smallint not null;
CREATE SEQUENCE dbo.test_seq1
AS int
START WITH -2147483648
INCREMENT BY 1
MINVALUE -2147483648
MAXVALUE 2147483647
CACHE
go
CREATE SEQUENCE dbo.test_seqa
AS tinyint
START WITH 1
INCREMENT BY 1
MINVALUE 0
MAXVALUE 255
CACHE
go

CREATE SEQUENCE dbo.test_seqb
AS bigint
START WITH -9223372036854775808
INCREMENT BY 1
MINVALUE -9223372036854775808
MAXVALUE 9223372036854775807
CACHE
go

CREATE SEQUENCE dbo.test_seqc
AS smallint
START WITH -32768
INCREMENT BY 1
MINVALUE -32768
MAXVALUE 32767
CACHE
go

CREATE SEQUENCE dbo.test_seqd
AS dt_int
START WITH -2147483648
INCREMENT BY 1
MINVALUE -2147483648
MAXVALUE 2147483647
CACHE
go

CREATE SEQUENCE dbo.test_seqe
AS dt_bigint
START WITH -9223372036854775808
INCREMENT BY 1
MINVALUE -9223372036854775808
MAXVALUE 9223372036854775807
CACHE
go

CREATE SEQUENCE dbo.test_seqf
AS dt_smallint
START WITH -32768
INCREMENT BY 1
MINVALUE -32768
MAXVALUE 32767
CACHE
go

CREATE SEQUENCE dbo.test_seqg
AS decimal(15,0)
START WITH 1
INCREMENT BY 1
MINVALUE -372036854799999
MAXVALUE 372036854799999
CACHE
go

tgt_sql:
SELECT name,convert(varchar(200),start_value),convert(varchar(200),increment),convert(varchar(200),minimum_value),convert(varchar(200),maximum_value),is_cycling,is_cached,cache_size,convert(varchar(200),current_value) FROM sys.sequences where name='test_seq1';
SELECT name,convert(varchar(200),start_value),convert(varchar(200),increment),convert(varchar(200),minimum_value),convert(varchar(200),maximum_value),is_cycling,is_cached,cache_size,convert(varchar(200),current_value) FROM sys.sequences where name='test_seqa';
SELECT name,convert(varchar(200),start_value),convert(varchar(200),increment),convert(varchar(200),minimum_value),convert(varchar(200),maximum_value),is_cycling,is_cached,cache_size,convert(varchar(200),current_value) FROM sys.sequences where name='test_seqb';
SELECT name,convert(varchar(200),start_value),convert(varchar(200),increment),convert(varchar(200),minimum_value),convert(varchar(200),maximum_value),is_cycling,is_cached,cache_size,convert(varchar(200),current_value) FROM sys.sequences where name='test_seqc';
SELECT name,convert(varchar(200),start_value),convert(varchar(200),increment),convert(varchar(200),minimum_value),convert(varchar(200),maximum_value),is_cycling,is_cached,cache_size,convert(varchar(200),current_value) FROM sys.sequences where name='test_seqd';
SELECT name,convert(varchar(200),start_value),convert(varchar(200),increment),convert(varchar(200),minimum_value),convert(varchar(200),maximum_value),is_cycling,is_cached,cache_size,convert(varchar(200),current_value) FROM sys.sequences where name='test_seqe';
SELECT name,convert(varchar(200),start_value),convert(varchar(200),increment),convert(varchar(200),minimum_value),convert(varchar(200),maximum_value),is_cycling,is_cached,cache_size,convert(varchar(200),current_value) FROM sys.sequences where name='test_seqf';
SELECT name,convert(varchar(200),start_value),convert(varchar(200),increment),convert(varchar(200),minimum_value),convert(varchar(200),maximum_value),is_cycling,is_cached,cache_size,convert(varchar(200),current_value) FROM sys.sequences where name='test_seqg';
go

case 125 "修改序列" 0
before:
drop sequence dbo.test_seq3;
drop sequence dbo.test_seq3a;
drop sequence dbo.test_seq3b;
drop sequence dbo.test_seq3c;
drop sequence dbo.test_seq3d;
drop sequence dbo.test_seq3e;
drop sequence dbo.test_seq3f;
drop sequence dbo.test_seq3g;
go
src_sql:
CREATE SEQUENCE dbo.test_seq3
AS int
START WITH 100
INCREMENT BY 1
MINVALUE -1000
MAXVALUE 500000
CACHE
go
ALTER SEQUENCE dbo.test_seq3
INCREMENT BY 3
cycle
cache 150
go

CREATE SEQUENCE dbo.test_seq3a
AS tinyint
START WITH 1
INCREMENT BY 1
MINVALUE 0
MAXVALUE 255
CACHE
go
ALTER SEQUENCE dbo.test_seq3a
INCREMENT BY 3
cycle
cache 11
go

CREATE SEQUENCE dbo.test_seq3b
AS bigint
START WITH -9223372036854775808
INCREMENT BY 1
MINVALUE -9223372036854775808
MAXVALUE 9223372036854775807
CACHE
go
ALTER SEQUENCE dbo.test_seq3b
INCREMENT BY 100
cycle
cache 22
go

CREATE SEQUENCE dbo.test_seq3c
AS smallint
START WITH -32768
INCREMENT BY 1
MINVALUE -32768
MAXVALUE 32767
CACHE
go
ALTER SEQUENCE dbo.test_seq3c
INCREMENT BY 30
cycle
cache 33
go

CREATE SEQUENCE dbo.test_seq3d
AS dt_int
START WITH -2147483648
INCREMENT BY 1
MINVALUE -2147483648
MAXVALUE 2147483647
CACHE
go
ALTER SEQUENCE dbo.test_seq3d
INCREMENT BY 5
cycle
cache 50
go

CREATE SEQUENCE dbo.test_seq3e
AS dt_bigint
START WITH -9223372036854775808
INCREMENT BY 1
MINVALUE -9223372036854775808
MAXVALUE 9223372036854775807
CACHE
go
ALTER SEQUENCE dbo.test_seq3e
INCREMENT BY 50
cycle
cache 50
go

CREATE SEQUENCE dbo.test_seq3f
AS dt_smallint
START WITH -32768
INCREMENT BY 1
MINVALUE -32768
MAXVALUE 32767
CACHE
go
ALTER SEQUENCE dbo.test_seq3f
INCREMENT BY 20
cycle
cache 20
go

CREATE SEQUENCE dbo.test_seq3g
AS decimal(15,0)
START WITH 1
INCREMENT BY 1
MINVALUE -372036854799999
MAXVALUE 372036854799999
CACHE
go
ALTER SEQUENCE dbo.test_seq3g
INCREMENT BY 99
cycle
cache 9
go

tgt_sql:
SELECT name,convert(varchar(200),start_value),convert(varchar(200),increment),convert(varchar(200),minimum_value),convert(varchar(200),maximum_value),is_cycling,is_cached,cache_size,convert(varchar(200),current_value) FROM sys.sequences where name='test_seq3';
SELECT name,convert(varchar(200),start_value),convert(varchar(200),increment),convert(varchar(200),minimum_value),convert(varchar(200),maximum_value),is_cycling,is_cached,cache_size,convert(varchar(200),current_value) FROM sys.sequences where name='test_seq3a';
SELECT name,convert(varchar(200),start_value),convert(varchar(200),increment),convert(varchar(200),minimum_value),convert(varchar(200),maximum_value),is_cycling,is_cached,cache_size,convert(varchar(200),current_value) FROM sys.sequences where name='test_seq3b';
SELECT name,convert(varchar(200),start_value),convert(varchar(200),increment),convert(varchar(200),minimum_value),convert(varchar(200),maximum_value),is_cycling,is_cached,cache_size,convert(varchar(200),current_value) FROM sys.sequences where name='test_seq3c';
SELECT name,convert(varchar(200),start_value),convert(varchar(200),increment),convert(varchar(200),minimum_value),convert(varchar(200),maximum_value),is_cycling,is_cached,cache_size,convert(varchar(200),current_value) FROM sys.sequences where name='test_seq3d';
SELECT name,convert(varchar(200),start_value),convert(varchar(200),increment),convert(varchar(200),minimum_value),convert(varchar(200),maximum_value),is_cycling,is_cached,cache_size,convert(varchar(200),current_value) FROM sys.sequences where name='test_seq3e';
SELECT name,convert(varchar(200),start_value),convert(varchar(200),increment),convert(varchar(200),minimum_value),convert(varchar(200),maximum_value),is_cycling,is_cached,cache_size,convert(varchar(200),current_value) FROM sys.sequences where name='test_seq3f';
SELECT name,convert(varchar(200),start_value),convert(varchar(200),increment),convert(varchar(200),minimum_value),convert(varchar(200),maximum_value),is_cycling,is_cached,cache_size,convert(varchar(200),current_value) FROM sys.sequences where name='test_seq3g';
go
