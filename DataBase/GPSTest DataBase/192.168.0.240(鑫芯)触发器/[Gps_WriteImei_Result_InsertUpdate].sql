USE [GPSTest]
GO
/****** Object:  Trigger [dbo].[Gps_WriteImei_Result_InsertUpdate]    Script Date: 11/23/2017 14:49:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Gps_WriteImei_Result_InsertUpdate] ON [dbo].[Gps_WriteImei_Result] 
FOR INSERT--, UPDATE, DELETE 
AS
BEGIN
	DECLARE @cSN NVARCHAR(32),@cImei NVARCHAR(15),@cSoftModel NVARCHAR(20),@cVersion NVARCHAR(50)

	SELECT  @cSN=SN,
		@cImei=IMEI,
		@cSoftModel=SoftModel,
		@cVersion=Version
	FROM Inserted--Gps_WriteImei_Result

	UPDATE Gps_TestResult SET IMEI=@cImei WHERE SN=@cSN AND SoftModel=@cSoftModel AND Version=@cVersion

	UPDATE Gps_FunctionTest_Result SET IMEI=@cImei WHERE SN=@cSN AND SoftModel=@cSoftModel AND Version=@cVersion

	UPDATE Gps_GpsTest_Result SET IMEI=@cImei WHERE SN=@cSN AND SoftModel=@cSoftModel AND Version=@cVersion

	UPDATE Gps_CoupleTest_Result SET IMEI=@cImei WHERE SN=@cSN AND SoftModel=@cSoftModel AND Version=@cVersion

	UPDATE Gps_ParamDownload_Result SET IMEI=@cImei WHERE SN=@cSN AND SoftModel=@cSoftModel AND Version=@cVersion
	
	UPDATE Gps_AutoTest_Result SET IMEI=@cImei WHERE SN=@cSN AND SoftModel=@cSoftModel AND Version=@cVersion
	
	UPDATE Gps_AutoTestSMT_Result SET IMEI=@cImei WHERE SN=@cSN AND SoftModel=@cSoftModel AND Version=@cVersion
	
	UPDATE Gps_SMTIQC_Result SET IMEI=@cImei WHERE SN=@cSN AND SoftModel=@cSoftModel AND Version=@cVersion
END
