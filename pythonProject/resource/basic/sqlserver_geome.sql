case 030 "数据：空间类型插入数据" 0
before:
drop table dbo.i2_geome001;
go
src_sql:
CREATE TABLE dbo.i2_geome001 (
    no                  int primary key,
    c_geometry          geometry,
    c_geography         geography,
    c_smallm             smallmoney
);
insert into dbo.i2_geome001 values (1,geometry::STGeomFromText('LINESTRING (100 100, 20 180, 180 180)',0),geography :: STGeomFromText('POINT(55.9271035250276 -3.29431266523898)',4326),11.0000);
insert into dbo.i2_geome001 values (2,geometry::STGeomFromText('POLYGON ((0 0, 150 0, 150 150, 0 150, 0 0))',0),geography::STGeomFromText('POLYGON((47 -22, 77 72, -47 22, 47 -22))', 4326),null);
insert into dbo.i2_geome001 values (3,geometry :: STGeomFromText('POLYGON((-122.358 47.653, -122.348 47.649, -122.348 47.658, -122.358 47.658, -122.358 47.653))',4326),geography::STGeomFromText('LINESTRING( -122.360 47.656, -122.343 47.656)', 4326),123.0099);
insert into dbo.i2_geome001(no,c_geography) values(4,geography::STGeomFromText('COMPOUNDCURVE (CIRCULARSTRING (-122.358 47.653, -122.348 47.649, -122.348 47.658), CIRCULARSTRING(-122.348 47.658, -122.358 47.658, -122.358 47.653))',4326));
go
tgt_sql: (1)
select * from dbo.i2_geome001 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_geome001');
go

case 031 "数据：空间类型更新数据" 0
before:
drop table dbo.i2_geome002;
go
src_sql:
CREATE TABLE dbo.i2_geome002 (
    no                  int primary key,
    c_geometry          geometry,
    c_geography         geography,
    c_smallm             smallmoney
);
insert into dbo.i2_geome002 values (1,geometry::STGeomFromText('LINESTRING (100 100, 20 180, 180 180)',0),geography :: STGeomFromText('POINT(55.9271035250276 -3.29431266523898)',4326),11.0000);
insert into dbo.i2_geome002 values (2,geometry::STGeomFromText('POLYGON ((0 0, 150 0, 150 150, 0 150, 0 0))',0),geography::STGeomFromText('POLYGON((47 -22, 77 72, -47 22, 47 -22))', 4326),null);
insert into dbo.i2_geome002 values (3,geometry :: STGeomFromText('POLYGON((-122.358 47.653, -122.348 47.649, -122.348 47.658, -122.358 47.658, -122.358 47.653))',4326),geography::STGeomFromText('LINESTRING( -122.360 47.656, -122.343 47.656)', 4326),123.0099);
update dbo.i2_geome002 set c_geography=geography::STGeomFromText('COMPOUNDCURVE (CIRCULARSTRING (-122.358 47.653, -122.348 47.649, -122.348 47.658), CIRCULARSTRING(-122.348 47.658, -122.358 47.658, -122.358 47.653))',4326) where no=2;
go

tgt_sql: (1)
select * from dbo.i2_geome002 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_geome002');
go

case 032 "数据：空间类型删除数据" 0
before:
drop table dbo.i2_geome003;
go
src_sql:
CREATE TABLE dbo.i2_geome003 (
    no                  int primary key,
    c_geometry          geometry,
    c_geography         geography,
    c_smallm             smallmoney
);
insert into dbo.i2_geome003 values (1,geometry::STGeomFromText('LINESTRING (100 100, 20 180, 180 180)',0),geography :: STGeomFromText('POINT(55.9271035250276 -3.29431266523898)',4326),11.0000);
insert into dbo.i2_geome003 values (2,geometry::STGeomFromText('POLYGON ((0 0, 150 0, 150 150, 0 150, 0 0))',0),geography::STGeomFromText('POLYGON((47 -22, 77 72, -47 22, 47 -22))', 4326),null);
insert into dbo.i2_geome003 values (3,geometry :: STGeomFromText('POLYGON((-122.358 47.653, -122.348 47.649, -122.348 47.658, -122.358 47.658, -122.358 47.653))',4326),geography::STGeomFromText('LINESTRING( -122.360 47.656, -122.343 47.656)', 4326),123.0099);
insert into dbo.i2_geome003(no,c_geography) values(4,geography::STGeomFromText('COMPOUNDCURVE (CIRCULARSTRING (-122.358 47.653, -122.348 47.649, -122.348 47.658), CIRCULARSTRING(-122.348 47.658, -122.358 47.658, -122.358 47.653))',4326));
delete from dbo.i2_geome003 where  no=3;
go

tgt_sql: (1)
select * from dbo.i2_geome003 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_geome003');
go

case 033 "数据：空间类型添加列 " 0
before:
drop table dbo.i2_geome004;
go
src_sql:
CREATE TABLE dbo.i2_geome004 (
    no                  int primary key,
    c_geometry          geometry,
    c_geography         geography,
    c_smallm             smallmoney
);
insert into dbo.i2_geome004 values (1,geometry::STGeomFromText('LINESTRING (100 100, 20 180, 180 180)',0),geography :: STGeomFromText('POINT(55.9271035250276 -3.29431266523898)',4326),11.0000);
insert into dbo.i2_geome004 values (2,geometry::STGeomFromText('POLYGON ((0 0, 150 0, 150 150, 0 150, 0 0))',0),geography::STGeomFromText('POLYGON((47 -22, 77 72, -47 22, 47 -22))', 4326),null);
alter table dbo.i2_geome004 add v1 geometry,v2 geography;
insert into dbo.i2_geome004 values (3,geometry :: STGeomFromText('POLYGON((-122.358 47.653, -122.348 47.649, -122.348 47.658, -122.358 47.658, -122.358 47.653))',4326),geography::STGeomFromText('LINESTRING( -122.360 47.656, -122.343 47.656)', 4326),123.0099,geometry :: STGeomFromText('POLYGON((-22.358 42.653, -22.348 42.649, -22.348 42.658, -22.358 42.658, -22.358 42.653))',4326),geography::STGeomFromText('LINESTRING( -22.360 42.656, -22.343 42.656)', 4326));
insert into dbo.i2_geome004(no,v1,v2) values(4,geometry::STGeomFromText('LINESTRING (100 100, 20 180, 180 180)',0),geography::STGeomFromText('COMPOUNDCURVE (CIRCULARSTRING (-122.358 47.653, -122.348 47.649, -122.348 47.658), CIRCULARSTRING(-122.348 47.658, -122.358 47.658, -122.358 47.653))',4326));
update dbo.i2_geome004 set v1=geometry::STGeomFromText('LINESTRING (100 100, 20 180, 180 180)', 4326),v2=geography :: STGeomFromText('POINT(65.9271035250276 -3.29431266523898)',4326) where no=2;
update dbo.i2_geome004 set c_geometry=geometry :: STGeomFromText('POLYGON((-122.358 47.653, -122.348 47.649, -122.348 47.658, -122.358 47.658, -122.358 47.653))',4326),c_geography=geography :: STGeomFromText('POINT(88.9271035250276 -8.29431266523898)',4326) where no=1;
delete from i2_geome004 where no=1;
go

tgt_sql: (1)
select * from dbo.i2_geome004 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_geome004');
go

case 034 "数据：空间类型删除列 " 0
before:
drop table dbo.i2_geome005;
go
src_sql:
CREATE TABLE dbo.i2_geome005 (
    no                  int primary key,
    c_geometry          geometry,
    c_geography         geography,
    c_smallm             smallmoney
);
insert into dbo.i2_geome005 values (1,geometry::STGeomFromText('LINESTRING (100 100, 20 180, 180 180)',0),geography :: STGeomFromText('POINT(55.9271035250276 -3.29431266523898)',4326),11.0000);
insert into dbo.i2_geome005 values (2,geometry::STGeomFromText('POLYGON ((0 0, 150 0, 150 150, 0 150, 0 0))',0),geography::STGeomFromText('POLYGON((47 -22, 77 72, -47 22, 47 -22))', 4326),null);
alter table dbo.i2_geome005 drop column c_geometry;
insert into dbo.i2_geome005 values (3,geography::STGeomFromText('LINESTRING( -122.360 47.656, -122.343 47.656)', 4326),123.0099);
insert into dbo.i2_geome005(no,c_geography) values(4,geography::STGeomFromText('COMPOUNDCURVE (CIRCULARSTRING (-122.358 47.653, -122.348 47.649, -122.348 47.658), CIRCULARSTRING(-122.348 47.658, -122.358 47.658, -122.358 47.653))',4326));
update dbo.i2_geome005 set c_geography=geography::STGeomFromText('COMPOUNDCURVE (CIRCULARSTRING (-22.358 47.653, -22.348 47.649, -22.348 47.658), CIRCULARSTRING(-22.348 47.658, -22.358 47.658, -22.358 47.653))',4326) where no=2;
delete from i2_geome005 where no=1;
go

tgt_sql: (1)
select * from dbo.i2_geome005 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_geome005');
go

case 035 "数据：空间类型重命名表 " 0
    jump
before:
drop table dbo.i2_geome006;
drop table i2_geome006_renew;
go
src_sql:
CREATE TABLE dbo.i2_geome006(
    no                  int primary key,
    c_geometry          geometry,
    c_geography         geography,
    c_smallm             smallmoney
);
sleep(3000);
insert into dbo.i2_geome006 values (1,geometry::STGeomFromText('LINESTRING (100 100, 20 180, 180 180)',0),geography :: STGeomFromText('POINT(55.9271035250276 -3.29431266523898)',4326),11.0000);
insert into dbo.i2_geome006 values (2,geometry::STGeomFromText('POLYGON ((0 0, 150 0, 150 150, 0 150, 0 0))',0),geography::STGeomFromText('POLYGON((47 -22, 77 72, -47 22, 47 -22))', 4326),null);
exec sp_rename 'i2_geome006','i2_geome006_renew';
insert into dbo.i2_geome006_renew values (3,geometry :: STGeomFromText('POLYGON((-122.358 47.653, -122.348 47.649, -122.348 47.658, -122.358 47.658, -122.358 47.653))',4326),geography::STGeomFromText('LINESTRING( -122.360 47.656, -122.343 47.656)', 4326),123.0099);
insert into dbo.i2_geome006_renew(no,c_geography) values(4,geography::STGeomFromText('COMPOUNDCURVE (CIRCULARSTRING (-122.358 47.653, -122.348 47.649, -122.348 47.658), CIRCULARSTRING(-122.348 47.658, -122.358 47.658, -122.358 47.653))',4326));
update dbo.i2_geome006_renew set c_geography=geography::STGeomFromText('COMPOUNDCURVE (CIRCULARSTRING (-22.358 47.653, -22.348 47.649, -22.348 47.658), CIRCULARSTRING(-22.348 47.658, -22.358 47.658, -22.358 47.653))',4326) where no=2;
delete from i2_geome006_renew where no=1;
go

tgt_sql: (1)
select * from dbo.i2_geome006_renew order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_geome006_renew');
go

case 143 "数据：空间类型重命名列" 0
before:
drop table dbo.i2_geome007;
go
src_sql:
CREATE TABLE dbo.i2_geome007 (
    no                  int primary key,
    c_geometry          geometry,
    c_geography         geography,
    c_smallm             smallmoney
);
insert into dbo.i2_geome007 values (1,geometry::STGeomFromText('LINESTRING (100 100, 20 180, 180 180)',0),geography :: STGeomFromText('POINT(55.9271035250276 -3.29431266523898)',4326),11.0000);
insert into dbo.i2_geome007 values (2,geometry::STGeomFromText('POLYGON ((0 0, 150 0, 150 150, 0 150, 0 0))',0),geography::STGeomFromText('POLYGON((47 -22, 77 72, -47 22, 47 -22))', 4326),null);
ALTER TABLE dbo.i2_geome007 ADD c_g1 geometry,c_g2 geography;
exec sp_rename 'dbo.i2_geome007.c_g1','c_g1_n','COLUMN';
exec sp_rename 'dbo.i2_geome007.c_g2','c_g2_n','COLUMN';
insert into dbo.i2_geome007 values (3,geometry :: STGeomFromText('POLYGON((-122.358 47.653, -122.348 47.649, -122.348 47.658, -122.358 47.658, -122.358 47.653))',4326),geography::STGeomFromText('LINESTRING( -122.360 47.656, -122.343 47.656)', 4326),123.0099,geometry :: STGeomFromText('POLYGON((-22.358 47.653, -22.348 47.649, -22.348 47.658, -22.358 47.658, -22.358 47.653))',4326),geography::STGeomFromText('LINESTRING( -22.360 47.656, -22.343 47.656)', 4326));
insert into dbo.i2_geome007(no,c_g2_n) values(4,geography::STGeomFromText('COMPOUNDCURVE (CIRCULARSTRING (-122.358 47.653, -122.348 47.649, -122.348 47.658), CIRCULARSTRING(-122.348 47.658, -122.358 47.658, -122.358 47.653))',4326));
update dbo.i2_geome007 set c_g1_n=geometry::STGeomFromText('LINESTRING (100 100, 20 180, 180 180)', 4326),c_g2_n=geography::STGeomFromText('COMPOUNDCURVE (CIRCULARSTRING (-22.358 47.653, -22.348 47.649, -22.348 47.658), CIRCULARSTRING(-22.348 47.658, -22.358 47.658, -22.358 47.653))',4326) where no=2;
delete from dbo.i2_geome007 where no=3;
go

tgt_sql: (1)
select * from dbo.i2_geome007 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_geome007');
go

case 360 "数据：空间列不在最后" 0
before:
drop table dbo.i2_geome008;
go
src_sql:
CREATE TABLE [dbo].i2_geome008(
	[c1] [char](3) primary key NOT NULL,
	[c2] [datetimeoffset](7) NULL,
	[c3] [smalldatetime] NOT NULL,
	[c4] [money] NULL,
	[c5] [geography] NULL,
	[c6] [smallmoney] NULL
	);
Insert into i2_geome008([c1], [c2], [c3], [c4], [c5], [c6]) values ('345', '2022-08-23 13:51:25.5200000 +00:00', '2022-08-23 13:51:00', 0.2000, geography::STGeomFromText('POLYGON((47.6529999999999987 -12.358000000000004, 47.6490000000000009 -12.347999999999999, 47.6580000000000013 -12.347999999999999, 47.6580000000000013 -12.358000000000004, 47.6529999999999987 -12.358000000000004))', 4326), 11.0000);
go
tgt_sql: (1)
select * from dbo.i2_geome008;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_geome008');
go