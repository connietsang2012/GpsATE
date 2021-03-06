USE [GPSTest]
GO
/****** Object:  StoredProcedure [dbo].[OQCParamCopy]    Script Date: 11/23/2017 11:35:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OQCParamCopy]
@cSrcModel 		varchar(50),
@cDstModel 		varchar(50),
@iRecordCount	integer output
AS
BEGIN
	SET @iRecordCount=1
	
	SELECT * FROM Gps_OQC_Item WHERE ItemModel=@cSrcModel	
			    
	IF(@@ROWCOUNT <1) 
		SET @iRecordCount=0 
	ELSE
	BEGIN
		alter table Gps_OQC_Item disable trigger all
		INSERT INTO Gps_OQC_Item(ItemModel,ItemName) 
			SELECT @cDstModel,ItemName 
				FROM Gps_OQC_Item WHERE ItemModel=@cSrcModel
		alter table Gps_OQC_Item enable  trigger all
		
		INSERT INTO Gps_OQC_SrcSubItem(ItemModel,ItemName) 
			SELECT @cDstModel,ItemName 
				FROM Gps_OQC_Item WHERE ItemModel=@cSrcModel
	END
	
	IF(@@ROWCOUNT <1) 
		SET @iRecordCount=0 
	ELSE
	BEGIN
		
				
		INSERT INTO Gps_OQC_SubItem(ItemModel,ItemName,SubItemName,SendAtComm,
										AtComm,ReturnText,ReSendNum,TestTimeOut,
										Compare,CompareValue,CompareRemark,
										Remark1,Remark2,Remark3,Remark4,Remark5) 
			SELECT @cDstModel,ItemName,SubItemName,SendAtComm,
					AtComm,ReturnText,ReSendNum,TestTimeOut,
					Compare,CompareValue,CompareRemark,
					Remark1,Remark2,Remark3,Remark4,Remark5
				FROM Gps_OQC_SubItem WHERE ItemModel=@cSrcModel
			
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
