USE [GPSTest]
GO
/****** Object:  StoredProcedure [dbo].[CheckTested]    Script Date: 11/23/2017 11:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CheckTested] 
@cFormName 	varchar(30),
@cChipRid	varchar(32),
@cSoftModel	varchar(20),
@cVersion	varchar(50),
@iRecordCount	integer output
AS
BEGIN
	SET @iRecordCount=1
	DECLARE  @SqlStr  NVARCHAR(1000) 
		
	SET  @SqlStr='select *  from  ['+ @cFormName + ']  where  [SN] = '''+@cChipRid+''' and [Version]='''+@cVersion+'''and Result=1' 
	EXEC(@SqlStr ) 
			    
	IF(@@ROWCOUNT <1) SET @iRecordCount=0 
END
GO
