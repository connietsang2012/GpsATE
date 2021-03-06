USE [GPSTest]
GO
/****** Object:  StoredProcedure [dbo].[GetSoftModelByTime]    Script Date: 11/23/2017 11:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<根据日期获得当天测试机型号>
-- =============================================
CREATE PROCEDURE [dbo].[GetSoftModelByTime] 
    @SearchTime Datetime
AS
BEGIN

	SELECT distinct b.totalmodel as softmodel from Gps_AutoTest_Result a,Gps_VersionModel b
	where (a.SoftModel<>'') and (a.SoftModel = b.Model) and (b.TotalModel is not null)
	and a.TestTime < @SearchTime+1 and a.TestTime>@SearchTime
END
GO
