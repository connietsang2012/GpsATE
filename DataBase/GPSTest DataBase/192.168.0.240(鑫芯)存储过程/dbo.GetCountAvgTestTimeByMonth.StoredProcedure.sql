USE [GPSTest]
GO
/****** Object:  StoredProcedure [dbo].[GetCountAvgTestTimeByMonth]    Script Date: 11/23/2017 11:35:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Newttl
-- Create date: 2014.05.24
-- Description:	获取每种机型的测试用时平均时间，提供应用程序调用
-- 但须在存储过程CountAvgTestTime执行(每天凌晨1点)之后才可得到最新的数据
-- 加入一个参数：选择月数，开始时间是昨天，如果传进来3，则从时间从5.24－2.24
-- =============================================
CREATE PROCEDURE [dbo].[GetCountAvgTestTimeByMonth] 
     @months int
AS
BEGIN
	declare @beginTime datetime
	declare @endTime datetime
	select @beginTime = CONVERT(varchar(100), GETDATE(), 23);
	select @endTime=CONVERT(varchar(100), DATEADD(D,-(30*@months),GETDATE()), 23); --获取当前系统查找时间
	
	SET NOCOUNT ON;
	--功能位
	select softmodel,(AVG(differvalue) ) as VerySoftModelAVGTime  from Gps_GetDifferValue
	--select softmodel,(AVG(differvalue) ) as DiffVerySoftModelAVGTime into a  from Gps_GetDifferValue
	where testtime>=@endTime and testtime<=@beginTime
	group by softmodel
	order by softmodel 
	--白卡
	select softmodel,(AVG(differvalue) ) as VerySoftModelAVGTime from Gps_GetCoupleDifferValue
	--select softmodel,(AVG(differvalue) ) as CoupleVerySoftModelAVGTime into b from Gps_GetCoupleDifferValue
	where testtime>=@endTime and testtime<=@beginTime
	group by softmodel
	order by softmodel
	--IMEI
	select softmodel,(AVG(differvalue) ) as VerySoftModelAVGTime from Gps_GetImeiDifferValue
	--select softmodel,(AVG(differvalue) ) as ImeiVerySoftModelAVGTime into c  from  Gps_GetImeiDifferValue
	where testtime>=@endTime and testtime<=@beginTime
	group by softmodel
	order by softmodel
	--参数下载
	select softmodel,(AVG(differvalue) ) as VerySoftModelAVGTime from Gps_GetParamDownloadDifferValue
	--select softmodel,(AVG(differvalue) ) as ParamVerySoftModelAVGTime into d  from Gps_GetParamDownloadDifferValue
	where testtime>=@endTime and testtime<=@beginTime
	group by softmodel
	order by softmodel
	
	--select a.softmodel, a.DiffVerySoftModelAVGTime, b.CoupleVerySoftModelAVGTime, c.ImeiVerySoftModelAVGTime, d.ParamVerySoftModelAVGTime
	--from a left join b on A.softmodel = b.softmodel
	--left join c on b.softmodel=c.softmodel
	--left join d on c.softmodel=d.softmodel
	--where a.softmodel=b.softmodel and a.softmodel=c.softmodel and a.softmodel=d.softmodel
	
	--drop table a
	--drop table b
	--drop table c
	--drop table d

END
GO
