USE [GPSTest]
GO
/****** Object:  StoredProcedure [dbo].[GetTempRid]    Script Date: 11/23/2017 11:35:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTempRid]
@cIMEI 		varchar(15),
@iRecordCount	integer output,
@cRid		varchar(32) output
AS
BEGIN
	SET @iRecordCount=1
	DECLARE	@TempRid char(32)
	SELECT @cRid=SN FROM Gps_TestResult WHERE IMEI=@cIMEI 
			    
	IF(@@ROWCOUNT <1) 
	BEGIN
		SET @iRecordCount=0 
		SET @cRid=''
	END
		
END
GO
