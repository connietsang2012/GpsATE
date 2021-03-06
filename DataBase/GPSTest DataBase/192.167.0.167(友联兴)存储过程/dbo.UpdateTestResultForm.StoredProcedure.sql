USE [GPSTest]
GO
/****** Object:  StoredProcedure [dbo].[UpdateTestResultForm]    Script Date: 11/23/2017 11:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--更新Gps_TestResult表
CREATE PROCEDURE [dbo].[UpdateTestResultForm] 
@cFormName 	varchar(30),
@cChipRid	varchar(32),
@cSoftModel	varchar(20),
@cVersion	varchar(50),
@cIMEI		varchar(15),
@iResult	integer,
@cTester	varchar(20),
--@cRemark	varchar(50),
@UpdateResult	integer output
AS
BEGIN

	SET @UpdateResult=1

	/*检测Gps_TestResult表中是否存在此SN，若不存在则新增一条，否则不管*/
	SELECT * FROM Gps_TestResult 
		WHERE	SN=@cChipRid AND SoftModel=@cSoftModel AND [Version]=@cVersion
    	
    	IF(@@ROWCOUNT <1)
	BEGIN    	
    		INSERT INTO Gps_TestResult 
			(SN,SoftModel,[Version],[IMEI])
		VALUES(@cChipRid,@CSoftModel,@CVersion,@cIMEI)
		
		IF(@@ROWCOUNT <1) SET @UpdateResult=0 
	END


	IF (@UpdateResult=1)
	BEGIN
		IF (@cFormName='Gps_FunctionTest_Result' )
			UPDATE Gps_TestResult SET FunctionResult=@iResult WHERE SN=@cChipRid AND [Version]=@cVersion
		ELSE IF (@cFormName='Gps_GpsTest_Result')
			UPDATE Gps_TestResult SET GPSResult=@iResult WHERE SN=@cChipRid AND [Version]=@cVersion			
		ELSE IF (@cFormName='Gps_CoupleTest_Result')
			UPDATE Gps_TestResult SET CoupleResult=@iResult WHERE SN=@cChipRid AND [Version]=@cVersion
		ELSE IF (@cFormName='Gps_WriteImei_Result')
			UPDATE Gps_TestResult SET WriteImeiResult=@iResult,IMEI=@cIMEI WHERE SN=@cChipRid AND [Version]=@cVersion	
		ELSE IF (@cFormName='Gps_ParamDownload_Result')
			UPDATE Gps_TestResult SET ParamDownloadResult=@iResult WHERE SN=@cChipRid AND [Version]=@cVersion
		ELSE IF (@cFormName='Gps_AutoTest_Result')
			UPDATE Gps_TestResult SET AutoTestResult=@iResult WHERE SN=@cChipRid AND [Version]=@cVersion
		ELSE IF (@cFormName='Gps_AutoTestSMT_Result')
			UPDATE Gps_TestResult SET AutoTestSMTResult=@iResult WHERE SN=@cChipRid AND [Version]=@cVersion
		ELSE IF (@cFormName='Gps_SMTIQC_Result')
			UPDATE Gps_TestResult SET SMTIQCResult=@iResult WHERE SN=@cChipRid AND [Version]=@cVersion
		/*ELSE IF (@cFormName='Gps_CartonBox_Result')
			UPDATE Gps_TestResult SET CartonBoxResult=CONVERT(nvarchar,@iResult,101 ) WHERE SN=@cChipRid AND Version=@cVersion */
		    
		IF(@@ROWCOUNT <1) SET @UpdateResult=0 			
	END
    	
END
GO
