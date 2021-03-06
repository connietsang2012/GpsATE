USE [GPSTest]
GO
/****** Object:  StoredProcedure [dbo].[GetCountAvgTestTime]    Script Date: 11/23/2017 11:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Newttl
-- Create date: 2014.03.28
-- Description:	获取每种机型的测试用时平均时间，提供应用程序调用
-- 但须在存储过程CountAvgTestTime执行(每天凌晨1点)之后才可得到最新的数据
-- =============================================
CREATE PROCEDURE [dbo].[GetCountAvgTestTime] 
AS
BEGIN
	SET NOCOUNT ON;
	select SoftModel,(AVG(DifferValue) ) as VerySoftModelAVGTime from Gps_GetCountDifferVaue
	group by SoftModel
	order by SoftModel
END
GO
