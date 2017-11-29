use GPSTest;
--drop table GpsSMT_TcData;

Create table GpsSMT_TcData(
   Id int identity(1,1)  primary key not null,
   SN varchar(32)not null,
   FixMode varchar(30) not null,
   GpsDb_0 int null,
   GpsDb_1 int null,
   GpsDb_2 int null,
   GpsDb_3 int null,
   GpsDb_4 int null,
   GpsDb_5 int null,
   GpsDb_6 int null,
   GpsDb_7 int null,
   GpsDb_8 int null,
   GpsDb_9 int null,
   GpsDb_10 int null,
   GpsDb_11 int null
);