USE [GPSTest]
GO
/****** Object:  StoredProcedure [dbo].[GetHistoryAVGTestTimeBySoftModel]    Script Date: 11/23/2017 11:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Newttl
-- Create date: 2014.04.21 上午
-- Description:	根据指定型号和日期获取历史测试时间记录
-- 输入参数：   TotalModel
-- =============================================
CREATE PROCEDURE  [dbo].[GetHistoryAVGTestTimeBySoftModel] 
    @TotalModel char(50),
    @BeginTime Datetime
	
AS
BEGIN
	select distinct a.TestTime,b.totalmodel as softmodel,a.TesterId from Gps_AutoTest_Result a,Gps_VersionModel b,Gps_User c
    where (a.SoftModel<>'') and (a.SoftModel = b.Model) and (b.TotalModel is not null) and b.totalmodel=@TotalModel
          and a.TestTime < @BeginTime and (a.TestTime >= '2014-03-08 00:00:00') and a.TesterId=c.UserName 
          and b.TotalModel=@TotalModel
  --  order by a.TesterId,a.TestTime ASC
    order by a.TestTime DESC

END
GO
