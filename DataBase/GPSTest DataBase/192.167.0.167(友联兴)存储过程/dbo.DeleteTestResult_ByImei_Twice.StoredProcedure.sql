USE [GPSTest]
GO
/****** Object:  StoredProcedure [dbo].[DeleteTestResult_ByImei_Twice]    Script Date: 11/23/2017 11:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteTestResult_ByImei_Twice] 
@cFormName 	VARCHAR(30),
@cImei		VARCHAR(15),
@cVersion	VARCHAR(50),
@cTesterId	VARCHAR(20),
@iRecordCount	integer output
AS
BEGIN
	DECLARE  @cFormNamebackup  VARCHAR(40) 
    DECLARE  @SqlStr  NVARCHAR(2000)

	SET @iRecordCount=1
	SET @cFormNamebackup = @cFormName +'_BackUp'
	
	IF @cVersion=''
	BEGIN
		/*SET  @SqlStr='select *  from  ['+ @cFormName + ']  where  [IMEI] = '''+@cImei+''''
	    	EXEC(@SqlStr )	    
		IF(@@rowcount <1) SET @iRecordCount=0*/		
		IF (@iRecordCount=1)
		BEGIN
			IF (@cFormName='Gps_FunctionTest_Result' )
				UPDATE Gps_TestResult SET FunctionResult=0 WHERE [IMEI] =@cImei
			ELSE IF (@cFormName='Gps_GpsTest_Result')
				UPDATE Gps_TestResult SET GPSResult=0 WHERE [IMEI] =@cImei			
			ELSE IF (@cFormName='Gps_CoupleTest_Result')
				UPDATE Gps_TestResult SET CoupleResult=0 WHERE [IMEI] =@cImei
				
			ELSE IF (@cFormName='Gps_ParamDownload_Result')
				UPDATE Gps_TestResult SET ParamDownloadResult=0 WHERE [IMEI] =@cImei
			ELSE IF (@cFormName='Gps_AutoTest_Result')
				UPDATE Gps_TestResult SET AutoTestResult=0 WHERE [IMEI] =@cImei
			ELSE IF (@cFormName='Gps_WriteImei_Result')
				UPDATE Gps_TestResult SET WriteImeiResult=0WHERE [IMEI] =@cImei	
			ELSE IF (@cFormName='Gps_SMTIQC_Result')
				UPDATE Gps_TestResult SET SMTIQCResult=0 WHERE [IMEI] =@cImei	
			
			IF @cFormName='Gps_WriteImei_Result'
				UPDATE Gps_TestResult SET [IMEI]='' WHERE [IMEI] =@cImei
			    
			--IF(@@ROWCOUNT <1) SET @iRecordCount=0 			
		END
		IF @iRecordCount=1
		BEGIN
	
			SET  @SqlStr='insert  into ['+ @cFormNamebackup+'] (SN,[Version],IMEI,SoftModel,Result,TesterId,Remark)'
			SET  @SqlStr=@SqlStr+'	select SN,[Version],IMEI,SoftModel,Result,TesterId,TestTime from ['+ @cFormName+'] where [IMEI] = '''+@cImei+''''
			EXEC(@SqlStr)
			IF(@@rowcount >=1) 
			BEGIN
				SET  @SqlStr='update '+ @cFormNamebackup +' set TesterId=''' + @cTesterId + ''' where [IMEI] = '''+@cImei+''''
				EXEC(@SqlStr )
			END
			
			IF(@@rowcount >=1) 
			BEGIN
				SET  @SqlStr='delete from '+@cFormName+' where [IMEI] = '''+@cImei+''''
				EXEC(@SqlStr)
			END
			
			IF(@@rowcount <1) SET @iRecordCount=0

			
			
		END
		
	END
	ELSE
	BEGIN
	    	/*SET  @SqlStr='select *  from  ['+ @cFormName + ']  where  [IMEI] = '''+@cImei+'''and Version = '''+@cVersion+''''
	    	EXEC(@SqlStr )	    
		IF(@@rowcount <1) SET @iRecordCount=0*/		
		IF (@iRecordCount=1)
		BEGIN
			IF (@cFormName='Gps_FunctionTest_Result' )
				UPDATE Gps_TestResult SET FunctionResult=0 WHERE [IMEI] =@cImei
			ELSE IF (@cFormName='Gps_GpsTest_Result')
				UPDATE Gps_TestResult SET GPSResult=0 WHERE [IMEI] =@cImei			
			ELSE IF (@cFormName='Gps_CoupleTest_Result')
				UPDATE Gps_TestResult SET CoupleResult=0 WHERE [IMEI] =@cImei
			ELSE IF (@cFormName='Gps_WriteImei_Result')
				UPDATE Gps_TestResult SET WriteImeiResult=0 WHERE [IMEI] =@cImei	
			ELSE IF (@cFormName='Gps_ParamDownload_Result')
				UPDATE Gps_TestResult SET ParamDownloadResult=0 WHERE [IMEI] =@cImei
			ELSE IF (@cFormName='Gps_AutoTest_Result')
				UPDATE Gps_TestResult SET AutoTestResult=0 WHERE [IMEI] =@cImei
			    
			IF(@@ROWCOUNT <1) SET @iRecordCount=0 			
		END
		IF @iRecordCount=1
		BEGIN
	
			SET  @SqlStr='insert  into ['+ @cFormNamebackup+'] (SN,[Version],IMEI,SoftModel,Result,TesterId,Remark)'
			SET  @SqlStr=@SqlStr+'	select SN,[Version],IMEI,SoftModel,Result,TesterId,TestTime from ['+ @cFormName+'] where [IMEI] = '''+@cImei+'''and Version = '''+@cVersion+''''
			EXEC(@SqlStr)

			SET  @SqlStr='update '+ @cFormNamebackup +' set TesterId=''' + @cTesterId + ''' where [IMEI] = '''+@cImei+'''and Version = '''+@cVersion+''''
			EXEC(@SqlStr )

			SET  @SqlStr='delete from '+@cFormName+' where [IMEI] = '''+@cImei+'''and Version = '''+@cVersion+''''
			EXEC(@SqlStr)
			
			IF(@@rowcount <1) SET @iRecordCount=0 

			IF @cFormName='Gps_WriteImei_Result'
				UPDATE Gps_TestResult SET [IMEI]='' WHERE [IMEI] =@cImei AND Version=@cVersion
			Commit
			
		END
		
	END
	
	IF (@cFormName='Gps_ParamDownload_Result')
	BEGIN
		IF @cVersion=''
		BEGIN
			SET  @SqlStr='insert  into [Gps_ParamDownVersionCpd_BackUp] (SN,Softmodel,[Version],VersionS,IMEI,Result,TesterId,Remark)'
			SET  @SqlStr=@SqlStr+'	select SN,Softmodel,[Version],VersionS,IMEI,Result,TesterId,TestTime from [Gps_ParamDownVersionCpd] where [IMEI] = '''+@cImei+''''
			EXEC(@SqlStr)
			--IF(@@rowcount <1) SET @iRecordCount=0
			
			SET  @SqlStr='delete from Gps_ParamDownVersionCpd where [IMEI] = '''+@cImei+''''
			EXEC(@SqlStr)
			--IF(@@rowcount <1) SET @iRecordCount=0
		END 
		ELSE
		BEGIN
		    SET  @SqlStr='insert  into [Gps_ParamDownVersionCpd_BackUp] (SN,Softmodel,[Version],VersionS,IMEI,Result,TesterId,Remark)'
			SET  @SqlStr=@SqlStr+'	select SN,Softmodel,[Version],VersionS,IMEI,Result,TesterId,TestTime from [Gps_ParamDownVersionCpd] where [IMEI] = '''+@cImei+'''and Version = '''+@cVersion+''''
			EXEC(@SqlStr)
			--IF(@@rowcount <1) SET @iRecordCount=0 
			
				SET  @SqlStr='delete from Gps_ParamDownVersionCpd where [IMEI] = '''+@cImei+'''and Version = '''+@cVersion+''''
			EXEC(@SqlStr)
			--IF(@@rowcount <1) SET @iRecordCount=0
		END 
	END
		
END
GO
