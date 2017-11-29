use GPSTest;

--drop table Gps_OperRecord;

--创建操作记录
create table Gps_OperRecord
(
     id  int identity(1,1)  primary key,		--操作记录ID 
     OperName        varchar(20)  null,
     OperContent    varchar(3000)  null,
     OperTime        datetime null,
     OperDemo       varchar(250)
)
