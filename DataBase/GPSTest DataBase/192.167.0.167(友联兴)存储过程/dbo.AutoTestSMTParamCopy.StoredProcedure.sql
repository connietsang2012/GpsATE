USE [GPSTest]
GO
/****** Object:  StoredProcedure [dbo].[AutoTestSMTParamCopy]    Script Date: 11/23/2017 11:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AutoTestSMTParamCopy]
@cSrcModel 		varchar(50),
@cDstModel 		varchar(50),
@iRecordCount	integer output
AS
BEGIN
	SET @iRecordCount=1
	
	SELECT * FROM Gps_AutoTestSMTItem WHERE ItemModel=@cSrcModel	
			    
	IF(@@ROWCOUNT <1) 
		SET @iRecordCount=0 
	ELSE
	BEGIN
		alter table Gps_AutoTestSMTItem disable trigger all
		INSERT INTO Gps_AutoTestSMTItem(ItemModel,ItemName) 
			SELECT @cDstModel,ItemName 
				FROM Gps_AutoTestSMTItem WHERE ItemModel=@cSrcModel
		alter table Gps_AutoTestSMTItem enable  trigger all
		
		INSERT INTO Gps_AutoTestSMT_SrcSubItem(ItemModel,ItemName) 
			SELECT @cDstModel,ItemName 
				FROM Gps_AutoTestSMTItem WHERE ItemModel=@cSrcModel
	END
	
	IF(@@ROWCOUNT <1) 
		SET @iRecordCount=0 
	ELSE
	BEGIN
		
				
		INSERT INTO Gps_AutoTestSMTSubItem(ItemModel,ItemName,SubItemName,SendAtComm,
										AtComm,ReturnText,ReSendNum,TestTimeOut,
										Compare,CompareValue,CompareRemark,
										Remark1,Remark2,Remark3,Remark4,Remark5) 
			SELECT @cDstModel,ItemName,SubItemName,SendAtComm,
					AtComm,ReturnText,ReSendNum,TestTimeOut,
					Compare,CompareValue,CompareRemark,
					Remark1,Remark2,Remark3,Remark4,Remark5 
				FROM Gps_AutoTestSMTSubItem WHERE ItemModel=@cSrcModel
			
	END
	IF(@@ROWCOUNT <1) 
		SET @iRecordCount=0
	--ELSE
	--BEGIN
	--	INSERT INTO Gps_AutoTest_SrcSubItem(ItemModel,ItemName) 
	--		SELECT @cDstModel,ItemName 
	--			FROM Gps_AutoTestSubItem WHERE ItemModel=@cSrcModel	
	--END 
END
GO
