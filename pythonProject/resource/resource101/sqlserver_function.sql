case 001 "创建表函数" 0
before:
drop FUNCTION func_f1;
drop table func_t1;
go
src_sql:
create table func_t1
(
    Id int identity(1,1) primary key,--编号
    CostTime datetime,--时间
    Num int--销售额
);
insert into func_t1(CostTime,Num) values('2016-09-01','50');
insert into func_t1(CostTime,Num) values('2016-09-01','100');
insert into func_t1(CostTime,Num) values('2016-09-03','200');
insert into func_t1(CostTime,Num) values('2016-09-05','2');
CREATE FUNCTION func_f1
(
    @beginTime datetime,
    @endTime datetime
)
RETURNS @returntable TABLE
(
    CostTime datetime
)
AS
BEGIN
    while(@beginTime<=@endTime)
    begin
        insert into @returntable select @beginTime
        select @beginTime=dateadd(day,1,@beginTime)
    end
    RETURN
END
go
tgt_sql:
select func_f1.CostTime,isnull(func_t1.Num,0) Num from func_f1('2016-09-01','2016-09-05') func_f1 left join (select CostTime,sum(Num) Num from func_t1 where CostTime>='2016-09-01' and CostTime<='2016-09-05' group by CostTime) func_t1 on func_f1.CostTime=func_t1.CostTime;
select routine_schema,routine_name,routine_type,data_type,routine_body,routine_definition from information_schema.ROUTINES where routine_name='func_f1';
go


case 002 "创建标量函数" 0
before:
drop table func_t2;
drop function func_f2;
go
src_sql:
create table func_t2(
    id int primary key,
    name varchar(10),
    birthDay datetime
);
insert into func_t2 values(1,'张三','1998-02-01');
insert into func_t2 values(2,'李四','1981-10-1');
insert into func_t2 values(3,'王五','1985-5-2');
create function func_f2(@birthDay datetime)
returns int
as
begin
declare @age int
set @age = datediff(yy,@birthDay,getdate())
return @age
end
go

tgt_sql:
select name as 姓名,dbo.func_f2(birthDay) as 年龄 from func_t2;
select routine_schema,routine_name,routine_type,data_type,routine_body,routine_definition from information_schema.ROUTINES where routine_name='func_f2';
go