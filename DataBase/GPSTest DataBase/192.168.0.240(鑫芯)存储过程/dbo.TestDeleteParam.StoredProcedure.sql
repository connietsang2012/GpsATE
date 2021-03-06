USE [GPSTest]
GO
/****** Object:  StoredProcedure [dbo].[TestDeleteParam]    Script Date: 11/23/2017 11:35:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TestDeleteParam] 
@cFormName 	VARCHAR(30),
@cChipRid	VARCHAR(32),
@cVersion	VARCHAR(50),
@cTesterId	VARCHAR(20),
@iRecordCount	integer output
AS
begin
	DECLARE  @cFormNamebackup  VARCHAR(40) 
    	DECLARE  @SqlStr  NVARCHAR(2000)

	SET @iRecordCount=1	
	IF (@iRecordCount=1)
		BEGIN
			IF (@cFormName='Gps_FunctionTest_Result' )
				UPDATE Gps_TestResult SET FunctionResult=0 WHERE [SN] =@cChipRid
			ELSE IF (@cFormName='Gps_GpsTest_Result')
				UPDATE Gps_TestResult SET GPSResult=0 WHERE [SN] =@cChipRid			
			ELSE IF (@cFormName='Gps_CoupleTest_Result')
				UPDATE Gps_TestResult SET CoupleResult=0 WHERE [SN] =@cChipRid
			ELSE IF (@cFormName='Gps_WriteImei_Result')
				UPDATE Gps_TestResult SET WriteImeiResult=0 WHERE [SN] =@cChipRid	
			ELSE IF (@cFormName='Gps_ParamDownload_Result')
				UPDATE Gps_TestResult SET ParamDownloadResult=0 WHERE [SN] =@cChipRid
			ELSE IF (@cFormName='Gps_AutoTest_Result')
				UPDATE Gps_TestResult SET AutoTestResult=0 WHERE [SN] =@cChipRid
			ELSE IF (@cFormName='Gps_SMTIQC_Result')
				UPDATE Gps_TestResult SET SMTIQCResult=0 WHERE [SN] =@cChipRid
			
			IF(@@ROWCOUNT <1) SET @iRecordCount=0 			
		END
	IF (@cFormName='Gps_ParamDownload_Result')
	BEGIN
		IF @cVersion=''
		BEGIN
			SET  @SqlStr='insert  into [Gps_ParamDownVersionCpd_BackUp] (SN,Softmodel,[Version],VersionEx,IMEI,Result,TesterId,Remark)'
			SET  @SqlStr=@SqlStr+'	select SN,Softmodel,[Version],VersionEx,IMEI,Result,TesterId,Remark from [Gps_ParamDownVersionCpd] where [SN] = '''+@cChipRid+''''
			EXEC(@SqlStr)
			--IF(@@rowcount <1) SET @iRecordCount=0
			
			SET  @SqlStr='delete from Gps_ParamDownVersionCpd where [SN] = '''+@cChipRid+''''
			EXEC(@SqlStr)
			--IF(@@rowcount <1) SET @iRecordCount=0
		END 
		ELSE
		BEGIN
		    SET  @SqlStr='insert  into [Gps_ParamDownVersionCpd_BackUp] (SN,Softmodel,[Version],VersionEx,IMEI,Result,TesterId,Remark)'
			SET  @SqlStr=@SqlStr+'	select SN,Softmodel,[Version],VersionEx,IMEI,Result,TesterId,Remark from [Gps_ParamDownVersionCpd] where [SN] = '''+@cChipRid+'''and VersionEx = '''+@cVersion+''''
			EXEC(@SqlStr)
			--IF(@@rowcount <1) SET @iRecordCount=0 
			
				SET  @SqlStr='delete from Gps_ParamDownVersionCpd where [SN] = '''+@cChipRid+'''and VersionEx = '''+@cVersion+''''
			EXEC(@SqlStr)
			--IF(@@rowcount <1) SET @iRecordCount=0
		END 
	END
	
	
		
END
GO
