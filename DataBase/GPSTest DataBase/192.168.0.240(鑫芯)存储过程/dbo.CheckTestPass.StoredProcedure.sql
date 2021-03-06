USE [GPSTest]
GO
/****** Object:  StoredProcedure [dbo].[CheckTestPass]    Script Date: 11/23/2017 11:35:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CheckTestPass]
@cIMEI varchar(15) ,
@iFunctionPass integer output,
@iGPSPass integer output,
@iCouplePass integer output,
@iWriteImeiPass integer output,
@iParamDownloadPass integer output,
@iAutoPass integer output,
@cResult integer output
AS 
	SET @cResult=1
	DECLARE @SoftModel NVARCHAR(50), @bTestFunction bit,@bTestGPS bit,@bTestCouple bit,@bTestWriteImei bit,@bTestParamDownload bit,@bTestCartonBox bit,@bTestAutoTest bit
	SELECT @SoftModel=SoftModel 
	FROM Gps_TestResult 
	WHERE	IMEI=@cIMEI and SoftModel<>'Test'

	SELECT @bTestFunction=TestFunction,
		@bTestGPS=TestGPS,
		@bTestCouple=TestCouple,
		@bTestWriteImei=TestWriteImei,
		@bTestParamDownload=TestParamDownload,
		@bTestAutoTest=TestAutoTest
		/*,
		@bTestCartonBox=TestCartonBox*/
	FROM Gps_TestPlanSet WHERE Version=@SoftModel and Version<>'Test'

	DECLARE  @SqlStr  NVARCHAR(1000)

	SET @cResult=1

	SET  @iFunctionPass=0
	SET  @iGPSPass=0
	SET  @iCouplePass=0
	SET  @iWriteImeiPass=0
	SET  @iParamDownloadPass=0
	SET  @iAutoPass=0
	
	SELECT @iFunctionPass=FunctionResult,
		@iGPSPass=GPSResult,
		@iCouplePass=CoupleResult,
		@iWriteImeiPass=WriteImeiResult,
		@iParamDownloadPass=ParamDownloadResult,
		@iAutoPass=AutoTestResult
	FROM Gps_TestResult WHERE IMEI=@cIMEI and SoftModel<>'Test'

	IF  @bTestFunction=0 SET  @iFunctionPass=1
	IF  @bTestGPS=0 SET  @iGPSPass=1
	IF  @bTestCouple=0 SET  @iCouplePass=1
	IF  @bTestWriteImei=0 SET  @iWriteImeiPass=1
	IF  @bTestParamDownload=0 SET  @iParamDownloadPass=1
	IF  @bTestAutoTest=0 SET  @iAutoPass=1

	SET @cResult=@iFunctionPass & @iGPSPass & @iCouplePass & @iWriteImeiPass & @iParamDownloadPass & @iAutoPass 

	
	
	
	/*SET @SqlStr='select * from Gps_TestResult where IMEI='''+@cIMEI+''''
	
	IF 	@bTestFunction=1 SET @SqlStr=@SqlStr+' AND FunctionResult=1'
	
	IF 	@bTestGPS=1 SET @SqlStr=@SqlStr+' AND GPSResult=1'
	
	IF 	@bTestCouple=1 SET @SqlStr=@SqlStr+' AND CoupleResult=1'
	
	IF 	@bTestWriteImei=1 SET @SqlStr=@SqlStr+' AND WriteImeiResult=1'
	
	IF 	@bTestParamDownload=1 SET @SqlStr=@SqlStr+' AND ParamDownloadResult=1'
	
	IF 	@bTestAutoTest=1 SET @SqlStr=@SqlStr+' AND AutoTestResult=1'	
	EXEC(@SqlStr ) 
	
	--SELECT * FROM Gps_TestResult 
	--WHERE IMEI=@cIMEI and  FunctionResult=@bTestFunction and GPSResult=@bTestGPS and
	--		CoupleResult=@bTestCouple and WriteImeiResult=@bTestWriteImei and ParamDownloadResult=@bTestParamDownload

	
	IF @@ROWCOUNT<1 SET @cResult=0*/
GO
