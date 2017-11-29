USE [GPSTest]
GO
/****** Object:  StoredProcedure [dbo].[CheckTestedParamCpd]    Script Date: 11/23/2017 11:35:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CheckTestedParamCpd] 
@cChipRid	varchar(32),
@cIMEI varchar(15),
@cVersion	varchar(50) output,
@cVersionEx varchar(50) output,
@iRecordCount	integer output
AS
BEGIN
	SET @iRecordCount=0
	IF @cIMEI<>''---此项一开始为了返工位获得新版本，后来没有用到，暂留
	BEGIN
	   select @cVersion=Version  from  Gps_ParamDownVersionCpd   WHERE IMEI=@cIMEI --and Result=1 
		IF(@@ROWCOUNT > 0) 
		BEGIN
			SET @iRecordCount=1
			--select @cVersionEx=VersionEx
		END 
	END
	ELSE----传递Id和新版本获得旧版本，新增流程，检测是否跑过下载位
	BEGIN
		select @cVersionEx=Version  from  Gps_ParamDownVersionCpd   WHERE SN=@cChipRid AND [VersionS]=@cVersion-- 如果跑过下载位，那么读到的版本号即新版本号
		IF(@@ROWCOUNT > 0) 
		BEGIN
			SET @iRecordCount=1
			--select @cVersionEx=VersionEx
		END
	END
	
			    
	/*select *  from  Gps_CoupleTest_Result   WHERE SN=@cChipRid AND [Version]=@cVersion and Result=1
	IF(@@ROWCOUNT >0) SET @iRecordCount=@iRecordCount+1 	
	select *  from  Gps_WriteImei_Result   WHERE SN=@cChipRid AND [Version]=@cVersion and Result=1
	IF(@@ROWCOUNT >0) SET @iRecordCount=@iRecordCount+1 */	
    
END
GO
