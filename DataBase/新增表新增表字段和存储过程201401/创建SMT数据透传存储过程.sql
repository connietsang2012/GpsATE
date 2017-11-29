USE [GPSTest]
GO
/****** Object:  StoredProcedure [dbo].[UpdateGpsTcData]    Script Date: 01/23/2014 14:05:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[UpdateGpsSMT_TcData] 
@cChipRid	varchar(32),
@cFixMode	varchar(20),
@iGpsDb0	integer,
@iGpsDb1	integer,
@iGpsDb2	integer,
@iGpsDb3	integer,
@iGpsDb4	integer,
@iGpsDb5	integer,
@iGpsDb6	integer,
@iGpsDb7	integer,
@iGpsDb8	integer,
@iGpsDb9	integer,
@iGpsDb10	integer,
@iGpsDb11	integer,
@UpdateResult	integer output
AS
BEGIN

	SELECT * FROM GpsSMT_TcData WHERE SN=@cChipRid
	
	IF(@@ROWCOUNT <1)
		INSERT GpsSMT_TcData (SN,FixMode,GpsDb_0,GpsDb_1,GpsDb_2,GpsDb_3,GpsDb_4,GpsDb_5,GpsDb_6,GpsDb_7,GpsDb_8,GpsDb_9,GpsDb_10,GpsDb_11)
		VALUES(@cChipRid,@cFixMode,@iGpsDb0,@iGpsDb1,@iGpsDb2,@iGpsDb3,@iGpsDb4,@iGpsDb5,@iGpsDb6,@iGpsDb7,@iGpsDb8,@iGpsDb9,@iGpsDb10,@iGpsDb11)
	ELSE
		UPDATE GpsSMT_TcData SET FixMode=@cFixMode,GpsDb_0=@iGpsDb0,GpsDb_1=@iGpsDb1,GpsDb_2=@iGpsDb2,GpsDb_3=@iGpsDb3,GpsDb_4=@iGpsDb4,GpsDb_5=@iGpsDb5,
			GpsDb_6=@iGpsDb6,GpsDb_7=@iGpsDb7,GpsDb_8=@iGpsDb8,GpsDb_9=@iGpsDb9,GpsDb_10=@iGpsDb10,GpsDb_11=@iGpsDb11 WHERE SN=@cChipRid 

END
