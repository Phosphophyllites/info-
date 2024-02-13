case 001 "创建表空间" 0
before:
    drop table dbo.News;
		DROP PARTITION SCHEME Ps_Range;
		DROP PARTITION FUNCTION Pt_Range;
		go
		drop table dbo.mytable;
		DROP PARTITION SCHEME ps_for_myTable;
		DROP PARTITION FUNCTION pf_for_myTable;
		go
    ALTER DATABASE yh001 REMOVE FILE fg1_f001;
    ALTER DATABASE yh001 REMOVE FILE fg2_f001;
    ALTER DATABASE yh001 REMOVE FILE fg3_f001;
    ALTER DATABASE yh001 REMOVE FILE fg4_f001;
    go
    ALTER DATABASE yh001 REMOVE FILEGROUP fg1_yh001;
    ALTER DATABASE yh001 REMOVE FILEGROUP fg2_yh001;
    ALTER DATABASE yh001 REMOVE FILEGROUP fg3_yh001;
    ALTER DATABASE yh001 REMOVE FILEGROUP fg4_yh001;
    go
src_sql:
    alter database yh001 add filegroup fg1_yh001;
    alter database yh001 add filegroup fg2_yh001;
    alter database yh001 add filegroup fg3_yh001;
    alter database yh001 add filegroup fg4_yh001;
    go
    alter database yh001 add file (Name=fg1_f001,filename='D:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\fg1_f001.ndf',size=30,filegrowth=5%) to filegroup fg1_yh001;
    alter database yh001 add file (Name=fg2_f001,filename='D:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\fg2_f001.ndf',size=30,filegrowth=5%) to filegroup fg2_yh001;
    alter database yh001 add file (Name=fg3_f001,filename='D:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\fg3_f001.ndf',size=30,filegrowth=5%) to filegroup fg3_yh001;
    alter database yh001 add file (Name=fg4_f001,filename='D:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\fg4_f001.ndf',size=30,filegrowth=5%) to filegroup fg4_yh001;
    go
tgt_sql:
    select name,data_space_id,type,type_desc from sys.filegroups where name !='PRIMARY' order by data_space_id;
    select file_id,type,type_desc,data_space_id,name from sys.database_files where type_desc !='LOG' and name not like '%dat' order by file_id;
    go

case 002 "创建时间类型分区表" 0
	before:
		drop table dbo.mytable;
		DROP PARTITION SCHEME ps_for_myTable;
		DROP PARTITION FUNCTION pf_for_myTable;
		go
	src_sql:
		create partition function pf_for_myTable(datetime) as range right for values('2014-01-01','2015-01-01');
		create partition scheme ps_for_myTable as partition pf_for_myTable to (fg1_yh001,fg2_yh001,fg3_yh001);
		create table myTable (DT datetime primary key,DataValue nvarchar(30)) on ps_for_myTable(DT);
		insert into myTable values('2016-12-31','英方测试A');
		insert into myTable values('2014-12-31','英方测试B');
		insert into myTable values('2013-12-31','英方测试C');
		insert into myTable values('2015-12-31','英方测试D');
		insert into myTable values('2014-1-31','英方测试E');
		insert into myTable values('2019-10-31','英方测试F');
		go
	tgt_sql:
		SELECT $PARTITION.pf_for_myTable(DT) AS 分区编号, COUNT(1) AS 记录数 FROM myTable GROUP BY $PARTITION.pf_for_myTable(DT);
		SELECT $PARTITION.pf_for_myTable(DT) AS 分区编号, DT AS 记录数 FROM myTable;
		select name,type,type_desc from sys.partition_functions where name='pf_for_myTable';
	 	select boundary_id,parameter_id,convert(varchar(200),value) from sys.partition_range_values order by function_id,boundary_id;
	  select name,type,type_desc from sys.partition_schemes where name='ps_for_myTable';
		go

case 003 "创建int类型分区表" 0
	before:
    drop table dbo.News;
		DROP PARTITION SCHEME Ps_Range;
		DROP PARTITION FUNCTION Pt_Range;
		go
	src_sql:
		CREATE PARTITION FUNCTION [Pt_Range](BIGINT) AS RANGE RIGHT FOR VALUES (10,20);
		CREATE PARTITION SCHEME Ps_Range
		AS PARTITION Pt_Range
		TO (fg1_yh001,fg2_yh001,fg3_yh001);
		CREATE TABLE [dbo].[News](
			[id] [bigint] NOT NULL,
			[status] [int] NULL,
		 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED
		(
			[id] ASC
		)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Ps_Range](id)
		) ON [Ps_Range](id);
    go
		insert into dbo.News values(5,1);
		insert into dbo.News values(10,0);
		insert into dbo.News values(18,1);
		insert into dbo.News values(23,0);
		insert into dbo.News values(34,1);
		insert into dbo.News values(51,0);
		go
		--alter partition scheme Ps_Range next used fg4_zh133;
	  --alter partition function Pt_Range() split range (30);
		--go
	tgt_sql:
		SELECT $PARTITION.Pt_Range(id) AS 分区编号, COUNT(1) AS 记录数 FROM dbo.News GROUP BY $PARTITION.Pt_Range(id);
		SELECT $PARTITION.Pt_Range(id) AS 分区编号, id AS 记录 FROM dbo.News;
		select name,type,type_desc from sys.partition_functions where name='Pt_Range';
	 	select boundary_id,parameter_id,convert(varchar(200),value) from sys.partition_range_values order by function_id,boundary_id;
	  select name,type,type_desc from sys.partition_schemes where name='Ps_Range';
		go

case 004 "分裂分区" 0
	src_sql:
		alter partition scheme ps_for_myTable next used fg4_zh134;
		alter partition function pf_for_myTable() split range ('2016-01-01');
		go
	tgt_sql:
		SELECT $PARTITION.pf_for_myTable(DT) AS 分区编号, COUNT(1) AS 记录数 FROM myTable GROUP BY $PARTITION.pf_for_myTable(DT)
		go
		SELECT $PARTITION.pf_for_myTable(DT) AS 分区编号, DT AS 记录数 FROM myTable
		go

case 005 "合并分区" 0
	src_sql:
		alter partition function pf_for_myTable() merge range('2015-01-01');
		alter partition function Pt_Range() merge range(20);
		go
	tgt_sql:
		SELECT $PARTITION.Pt_Range(id) AS 分区编号, COUNT(1) AS 记录数 FROM dbo.News GROUP BY $PARTITION.Pt_Range(id);
		SELECT $PARTITION.Pt_Range(id) AS 分区编号, id AS 记录 FROM dbo.News;
		SELECT $PARTITION.pf_for_myTable(DT) AS 分区编号, COUNT(1) AS 记录数 FROM myTable GROUP BY $PARTITION.pf_for_myTable(DT);
		SELECT $PARTITION.pf_for_myTable(DT) AS 分区编号, DT AS 记录数 FROM myTable
		go