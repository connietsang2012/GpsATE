USE [GPSTest]
GO
/****** Object:  StoredProcedure [dbo].[UpdateOrder]    Script Date: 11/23/2017 11:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		许志强
-- Create date: 2014.10.28
-- Description:	参数配置添加订单
-- =============================================
CREATE PROCEDURE [dbo].[UpdateOrder]
@cOrderNum 	nvarchar(50),
@cImeiStart nvarchar(30),
@cImeiEnd 	nvarchar(30),
@cItemModel nvarchar(30),
@cCount    Integer,
@cTestedCount Integer,
--@cOrderTime datetime,
@Status Integer,
@UpdateResult	integer output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    SET @UpdateResult=1
    DECLARE  @SqlStr  NVARCHAR(1000)
	--SET @SqlStr='SELECT * FROM Gps_ParamConfigOrder where OrderNum='''+@cOrderNum+'''AND IMEISTART=''' +@cImeiStart+'''AND IMEIEND= ''' +@cImeiEnd+''''
	SET @SqlStr='SELECT * FROM Gps_ParamConfigOrder where OrderNum='''+@cOrderNum+''''
	
	EXEC(@SqlStr)
	IF @@ROWCOUNT < 1
	BEGIN
	   --SET @SqlStr='INSERT INTO Gps_ParamConfigOrder(OrderNum,IMEISTART,IMEIEND,ItemModel,Count,TestedCount,OrderTime,Status) values('''+@cOrderNum+''','''+@cImeiStart+''','''+@cImeiEnd+''','''+@cItemModel+','+@cCount+','+@cTestedCount+','+@Status+''')' 
	   INSERT INTO Gps_ParamConfigOrder 
			(OrderNum,IMEISTART,IMEIEND,ItemModel,Count,TestedCount,Status)
		VALUES(@cOrderNum,@cImeiStart,@cImeiEnd,@cItemModel,@cCount,@cTestedCount,@Status)
		IF(@@ROWCOUNT <1) SET @UpdateResult=0 
	END
	ELSE
	BEGIN
	    --UPDATE Gps_ParamConfigOrder SET TestedCount=TestedCount+1 WHERE OrderNum=@cOrderNum AND IMEISTART=@cImeiStart AND IMEIEND=@cImeiEnd
	    --IF(@@ROWCOUNT <1) SET @UpdateResult=0 
	    SET @UpdateResult=0 
	END
	--SELECT	'Return Value' = @UpdateResult
END
GO
