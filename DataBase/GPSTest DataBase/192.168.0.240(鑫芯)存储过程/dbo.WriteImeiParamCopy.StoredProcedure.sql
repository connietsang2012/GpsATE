USE [GPSTest]
GO
/****** Object:  StoredProcedure [dbo].[WriteImeiParamCopy]    Script Date: 11/23/2017 11:35:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[WriteImeiParamCopy]
@cSrcModel 		varchar(50),
@cDstModel 		varchar(50),
@iRecordCount	integer output
AS
BEGIN
	SET @iRecordCount=1
	
	SELECT * FROM Gps_WriteImei_Item WHERE ItemModel=@cSrcModel	
			    
	IF(@@ROWCOUNT <1) 
		SET @iRecordCount=0 
	ELSE
	BEGIN
		alter table Gps_WriteImei_Item disable trigger all
		INSERT INTO Gps_WriteImei_Item(ItemModel,ItemName) 
			SELECT @cDstModel,ItemName 
				FROM Gps_WriteImei_Item WHERE ItemModel=@cSrcModel
		alter table Gps_WriteImei_Item enable  trigger all
		
		INSERT INTO Gps_WriteImei_SrcSubItem(ItemModel,ItemName) 
			SELECT @cDstModel,ItemName 
				FROM Gps_WriteImei_Item WHERE ItemModel=@cSrcModel
	END
	
	IF(@@ROWCOUNT <1) 
		SET @iRecordCount=0 
	ELSE
	BEGIN
		
				
		INSERT INTO Gps_WriteImei_SubItem(ItemModel,ItemName,SubItemName,SendAtComm,
										AtComm,ReturnText,ReSendNum,TestTimeOut,
										Compare,Remark1,Remark2) 
			SELECT @cDstModel,ItemName,SubItemName,SendAtComm,
					AtComm,ReturnText,ReSendNum,TestTimeOut,
					Compare,Remark1,Remark2
				FROM Gps_WriteImei_SubItem WHERE ItemModel=@cSrcModel
			
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
