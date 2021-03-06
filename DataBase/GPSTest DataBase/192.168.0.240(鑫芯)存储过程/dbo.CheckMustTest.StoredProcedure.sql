USE [GPSTest]
GO
/****** Object:  StoredProcedure [dbo].[CheckMustTest]    Script Date: 11/23/2017 11:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CheckMustTest]
@cSoftModel 	varchar(20) ,
@cFormName 	varchar(30),
@cResult integer output
AS 
	SET @cResult=1
	DECLARE  @bTestFunction bit,@bTestGPS bit,@bTestCouple bit,@bTestWriteImei bit,@bTestParamDownload bit,@bTestCartonBox bit,@bTestAutoTest bit

	SELECT @bTestFunction=TestFunction,
		@bTestGPS=TestGPS,
		@bTestCouple=TestCouple,
		@bTestWriteImei=TestWriteImei,
		@bTestParamDownload=TestParamDownload,
		@bTestAutoTest=TestAutoTest
	FROM Gps_TestPlanSet WHERE Version=@cSoftModel
	
	IF @cFormName='Gps_FunctionTest_Result' SET @cResult=@bTestFunction
	
	ELSE IF @cFormName='Gps_GpsTest_Result' SET @cResult=@bTestGPS

	ELSE IF @cFormName='Gps_CoupleTest_Result' SET @cResult=@bTestCouple

	ELSE IF @cFormName='Gps_WriteImei_Result' SET @cResult=@bTestWriteImei

	ELSE IF @cFormName='Gps_ParamDownload_Result' SET @cResult=@bTestParamDownload

	ELSE IF @cFormName='Gps_AutoTest_Result' SET @cResult=@bTestAutoTest

	ELSE IF @cFormName='Gps_CartonBox_Result' SET @cResult=1
	
	IF @cResult IS NULL SET @cResult=0
GO
