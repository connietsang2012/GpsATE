USE [GPSTest]
GO
/****** Object:  StoredProcedure [dbo].[SMTUpdateForm]    Script Date: 11/23/2017 11:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SMTUpdateForm] 
@cFormName 	varchar(30),
@cChipRid	varchar(32),
@cSoftModel	varchar(20),
@cVersion	varchar(50),
@cIMEI		varchar(15),
@iResult	integer,
@cTester	varchar(20),
@GpsDBValue varchar(10),
--@cRemark	varchar(50),
@UpdateResult	integer output
AS
BEGIN

	/*更新Gps_TestResult表*/	
	EXEC  UpdateTestResultForm @cFormName,@cChipRid,@cSoftModel,@cVersion,@cIMEI,@iResult,@cTester/*,@cRemark*/,@UpdateResult output

	/*更新相对应的测试位结果表*/
	IF @UpdateResult=1
	BEGIN
		SELECT @cIMEI=IMEI FROM GPS_TestResult WHERE SN=@cChipRid
		IF(@@ROWCOUNT <1) SET @cIMEI=''
				DECLARE  @SqlStr  NVARCHAR(1000)
		/*检测测试工位表中是否存在此SN，若不存在则新增一条，否则更新内容*/
		SET @SqlStr='select * from '+@cFormName+' where SN='''+@cChipRid+'''and Version = '''+@cVersion+''''
    		EXEC(@SqlStr )
    	IF(@@ROWCOUNT <1)
		BEGIN	
    		IF (@cFormName='Gps_AutoTestSMT_Result')
			BEGIN	
	    		SET @SqlStr='insert into '+@cFormName+'(SN,SoftModel,Version,IMEI,Result,TesterId,GpsDBValue) values ('''+@cChipRid+''','''+@cSoftModel+''','''+@CVersion+''','''+@cIMEI+''','+CONVERT(nvarchar,@iResult,101 )+','''+@cTester+''','''+@GpsDBValue+''')' 
	    		EXEC(@SqlStr)
	    	END
			ELSE
			BEGIN	
				SET @SqlStr='insert into '+@cFormName+'(SN,SoftModel,Version,IMEI,Result,TesterId) values ('''+@cChipRid+''','''+@cSoftModel+''','''+@CVersion+''','''+@cIMEI+''','+CONVERT(nvarchar,@iResult,101 )+','''+@cTester+''')' 
	    		EXEC(@SqlStr)
			END
		END
		ELSE
		BEGIN
		    IF (@cFormName='Gps_AutoTestSMT_Result')
		    BEGIN
		        SET @SqlStr='Update  '+@cFormName+' SET Result='+CONVERT(nvarchar,@iResult,101 )+',TesterId='''+ @cTester +''',IMEI='''+@cIMEI+''',GpsDBValue='''+@GpsDBValue+''' where SN='''+@cChipRid+'''and Version = '''+@cVersion+''''
				EXEC(@SqlStr)
		    END 
		    ELSE
		    BEGIN
		        SET @SqlStr='Update  '+@cFormName+' SET Result='+CONVERT(nvarchar,@iResult,101 )+',TesterId='''+ @cTester +''',IMEI='''+@cIMEI+''' where SN='''+@cChipRid+'''and Version = '''+@cVersion+''''
				EXEC(@SqlStr)
		    END 
		END
	END
	
	select @UpdateResult 

END
GO
