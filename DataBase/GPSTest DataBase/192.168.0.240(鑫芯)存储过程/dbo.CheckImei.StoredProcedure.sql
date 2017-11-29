USE [GPSTest]
GO
/****** Object:  StoredProcedure [dbo].[CheckImei]    Script Date: 11/23/2017 11:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CheckImei]
@cIMEI 		varchar(15),
@iRecordCount	integer output
AS
BEGIN
	SET @iRecordCount=1
	
	SELECT * FROM Gps_WriteImei_Result WHERE IMEI=@cIMEI AND Result=1	
			    
	IF(@@ROWCOUNT <1) SET @iRecordCount=0 
END
GO
