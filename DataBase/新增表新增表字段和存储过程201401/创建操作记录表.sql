use GPSTest;

--drop table Gps_OperRecord;

--����������¼
create table Gps_OperRecord
(
     id  int identity(1,1)  primary key,		--������¼ID 
     OperName        varchar(20)  null,
     OperContent    varchar(3000)  null,
     OperTime        datetime null,
     OperDemo       varchar(250)
)
