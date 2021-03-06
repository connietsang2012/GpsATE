USE [GPSTest]
GO
/****** Object:  StoredProcedure [dbo].[CheckTestPass_WriteIMEI]    Script Date: 11/23/2017 11:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CheckTestPass_WriteIMEI]
@cChipRid		varchar(32) ,
@cSoftModel		varchar(50) ,
@cVersion		varchar(100),
@iFunctionPass integer output,
@iGPSPass integer output,
@iCouplePass integer output,
@iParamDownloadPass integer output,
@iAutoPass integer output,
@cResult integer output
AS 
	SET @cResult=1
	DECLARE @bTestFunction bit,@bTestGPS bit,@bTestCouple bit,@bTestParamDownload bit,@bTestCartonBox bit,@bTestAutoTest bit
	
	/*SELECT @SoftModel=SoftModel 
	FROM Gps_TestResult 
	WHERE	SN=@cChipRid and SoftModel=@cSoftModel and Version=@cVersion*/

	SELECT @bTestFunction=TestFunction,
		@bTestGPS=TestGPS,
		@bTestCouple=TestCouple,
		@bTestParamDownload=TestParamDownload,
		@bTestAutoTest=TestAutoTest
	FROM Gps_TestPlanSet WHERE Version=@cSoftModel

	SET @cResult=1

	SET  @iFunctionPass=0
	SET  @iGPSPass=0
	SET  @iCouplePass=0
	SET  @iParamDownloadPass=0
	SET  @iAutoPass=0
	
	SELECT @iFunctionPass=FunctionResult,
		@iGPSPass=GPSResult,
		@iCouplePass=CoupleResult,
		@iParamDownloadPass=ParamDownloadResult,
		@iAutoPass=AutoTestResult
	FROM Gps_TestResult WHERE SN=@cChipRid and SoftModel=@cSoftModel and Version=@cVersion

	IF  @bTestFunction=0 SET  @iFunctionPass=1
	IF  @bTestGPS=0 SET  @iGPSPass=1
	IF  @bTestCouple=0 SET  @iCouplePass=1
	--IF  @bTestParamDownload=0 SET  @iParamDownloadPass=1
	SET  @iParamDownloadPass=1
	IF  @bTestAutoTest=0 SET  @iAutoPass=1

	SET @cResult=@iFunctionPass & @iGPSPass & @iCouplePass  & @iParamDownloadPass & @iAutoPass
GO
