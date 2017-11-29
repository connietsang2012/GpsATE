USE [GPSTest]
GO
/****** Object:  StoredProcedure [dbo].[CheckHaveResult]    Script Date: 11/23/2017 11:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CheckHaveResult] 
@cFormName 	varchar(30),
@cChipRid	varchar(32),
@cSoftMoel	varchar(20),
@cVersion	varchar(50),
@cIMEI		varchar(15),
@iResult	integer,
@cTester	varchar(20),
@UpdateResult	integer output
AS
BEGIN
   	DECLARE  @SqlStr  NVARCHAR(1000)

	SET @UpdateResult=1
	
	SET @SqlStr='select * from '+@cFormName+' where SN='''+@cChipRid+'''AND Version='''+@cVersion+''''		
	EXEC(@SqlStr ) 
		    
END
GO
