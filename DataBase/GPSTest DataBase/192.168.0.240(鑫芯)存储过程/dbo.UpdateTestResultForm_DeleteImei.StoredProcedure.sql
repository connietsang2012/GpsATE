USE [GPSTest]
GO
/****** Object:  StoredProcedure [dbo].[UpdateTestResultForm_DeleteImei]    Script Date: 11/23/2017 11:35:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateTestResultForm_DeleteImei]
@cChipRid	varchar(32),
@cIMEI		varchar(15),
@cVersion	varchar(50),
@UpdateResult	integer output
AS
begin
   	DECLARE  @SqlStr  NVARCHAR(1000)

	set @UpdateResult=0
	
	--SELECT * FROM Gps_WriteImei_Result
	--WHERE SN=@cChipRid AND IMEI=@cIMEI AND Version=@cVersion
	
	
	--删除Gps_WriteImei_Result的相关记录
	DELETE FROM Gps_WriteImei_Result
	WHERE SN=@cChipRid AND IMEI=@cIMEI AND [Version]=@cVersion

	

	SELECT * FROM Gps_TestResult
	WHERE  SN=@cChipRid AND IMEI=@cIMEI AND [Version]=@cVersion
	
	IF (@@ROWCOUNT < 1) SET @UpdateResult=1
    	
	
	IF (@UpdateResult=0)
	BEGIN
		UPDATE Gps_TestResult SET IMEI='' WHERE   SN=@cChipRid AND [Version]=@cVersion
		
		IF(@@ROWCOUNT<1)  SET @UpdateResult=1   

	END
   	
END
GO
