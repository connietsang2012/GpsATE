USE [GPSTest]
GO
/****** Object:  StoredProcedure [dbo].[CheckTestedByImei]    Script Date: 11/23/2017 11:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[CheckTestedByImei] 
@cIMEI varchar(15) ,
@iRecordCount	integer output
AS
BEGIN
	SET @iRecordCount=1
	DECLARE  @SqlStr  NVARCHAR(1000) 
		
	SET  @SqlStr='select *  from  Gps_WriteImei_Result  where  [IMEI] = '''+@cIMEI+'''and Result=1' 
	EXEC(@SqlStr ) 		    
	IF(@@ROWCOUNT <1) SET @iRecordCount=0 
END
GO
