USE [GPSTest]
GO
/****** Object:  StoredProcedure [dbo].[CheckTestedBySNAndVersion]    Script Date: 11/23/2017 11:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CheckTestedBySNAndVersion] 
@cFormName 	varchar(30),
@cChipRid	varchar(32),
@cVersion	varchar(50),
@iRecordCount	integer output
AS
BEGIN
	SET @iRecordCount=1
	DECLARE  @SqlStr  NVARCHAR(1000) 
		
	SET  @SqlStr='select *  from  ['+ @cFormName + ']  where  [SN] = '''+@cChipRid+''' and Result=1' 
	EXEC(@SqlStr ) 
			    
	IF(@@ROWCOUNT <1) SET @iRecordCount=0 
END
--2014.10.29 参数下载位检测IMEI只用SN号检测，名字不改是因为不想更新服务端
--之前还得检测版本
GO
