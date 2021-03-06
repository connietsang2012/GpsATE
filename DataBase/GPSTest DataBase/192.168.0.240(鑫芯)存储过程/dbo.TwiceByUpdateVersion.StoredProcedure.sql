USE [GPSTest]
GO
/****** Object:  StoredProcedure [dbo].[TwiceByUpdateVersion]    Script Date: 11/23/2017 11:35:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TwiceByUpdateVersion]
@cSn		VARCHAR(32), 
@cImei		VARCHAR(15),
@cVersion	VARCHAR(50),
@cTesterId	VARCHAR(20),
@iRecordCount	integer output
AS
	SET @iRecordCount=1;	
	
	INSERT INTO Gps_WriteImei_Result_Backup (SN,SoftModel,[Version],IMEI,Result,TesterId,Remark)
		SELECT SN,SoftModel,[Version],IMEI,Result,@cTesterId,Remark FROM Gps_WriteImei_Result WHERE SN=@cSn AND IMEI=@cImei AND Version=@cVersion

	DELETE Gps_WriteImei_Result WHERE SN=@cSn AND IMEI=@cImei AND [Version]=@cVersion
	--IF @@ROWCOUNT<1 SET @iRecordCount=0;
	UPDATE Gps_FunctionTest_Result SET IMEI='' WHERE SN=@cSn /*AND IMEI=@cImei*/ AND [Version]=@cVersion
	--IF @@ROWCOUNT<1 SET @iRecordCount=0;
	UPDATE Gps_GpsTest_Result SET IMEI='' WHERE SN=@cSn /*AND IMEI=@cImei*/ AND [Version]=@cVersion
	--IF @@ROWCOUNT<1 SET @iRecordCount=0;
	UPDATE Gps_CoupleTest_Result SET IMEI='' WHERE SN=@cSn /*AND IMEI=@cImei*/ AND [Version]=@cVersion
	--IF @@ROWCOUNT<1 SET @iRecordCount=0;
	UPDATE Gps_ParamDownload_Result SET IMEI='' WHERE SN=@cSn /*AND IMEI=@cImei*/ AND [Version]=@cVersion
	--IF @@ROWCOUNT<1 SET @iRecordCount=0;
	UPDATE Gps_AutoTest_Result SET IMEI='' WHERE SN=@cSn /*AND IMEI=@cImei*/ AND [Version]=@cVersion

	UPDATE Gps_TestResult SET IMEI='' WHERE SN=@cSn /*AND IMEI=@cImei*/ AND [Version]=@cVersion
GO
