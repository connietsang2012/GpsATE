USE [GPSTest]
GO
/****** Object:  StoredProcedure [dbo].[TestParamCopyFormAutoTest]    Script Date: 11/23/2017 11:35:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--从自动测试位复制测试参数到其他工位,表格式按以下规定设置
CREATE PROCEDURE [dbo].[TestParamCopyFormAutoTest]
@cFormName      varchar(50),
@cSrcModel 		varchar(50),
@cDstModel 		varchar(50),
@iRecordCount	integer output
AS
BEGIN
	SET @iRecordCount=1
	DECLARE  @SqlStr  NVARCHAR(1000)
	DECLARE  @cFormNameSub  VARCHAR(40)
	DECLARE  @cFormNameItem  VARCHAR(40)  
	SET @cFormNameSub = @cFormName +'_SubItem'--指令表
	SET @cFormNameItem = @cFormName +'_Item'--包含所有指令项表
	
	SELECT * FROM Gps_AutoTestItem WHERE ItemModel=@cSrcModel	
			    
	IF(@@ROWCOUNT <1) 
		SET @iRecordCount=0 
	ELSE
	BEGIN    			
	    SET @SqlStr='insert into '+@cFormNameItem+'(ItemModel,ItemName)'
	    SET  @SqlStr=@SqlStr+' select ItemModel='''+@cDstModel+''',ItemName from Gps_AutoTestItem where ItemModel='''+@cSrcModel+'''' 
	    EXEC(@SqlStr) 
	END
	
	IF(@@ROWCOUNT <1) 
		SET @iRecordCount=0 
	ELSE
	BEGIN
		SET @SqlStr='INSERT INTO '+ @cFormNameSub+'(ItemModel,ItemName,SubItemName,SendAtComm,
										AtComm,ReturnText,ReSendNum,TestTimeOut,
										Compare,CompareValue,CompareRemark,
										Remark1,Remark2,Remark3,Remark4,Remark5)'
		SET @SqlStr=@SqlStr+'SELECT ItemModel='''+@cDstModel+''',ItemName,SubItemName,SendAtComm,
										AtComm,ReturnText,ReSendNum,TestTimeOut,
										Compare,CompareValue,CompareRemark,
										Remark1,Remark2,Remark3,Remark4,Remark5 FROM Gps_AutoTestSubItem WHERE ItemModel='''+@cSrcModel+''''		
		EXEC(@SqlStr) 
	END
	IF(@@ROWCOUNT <1) 
		SET @iRecordCount=0
END
GO
