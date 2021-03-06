USE [GPSTest]
GO
/****** Object:  StoredProcedure [dbo].[GetCountQCAvgTestTimeByMonth]    Script Date: 11/23/2017 11:35:45 ******/
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
CREATE PROCEDURE [dbo].[GetCountQCAvgTestTimeByMonth]
     @softmodel nvarchar(50),
     @months int
AS
BEGIN
	declare @beginTime datetime
	declare @endTime datetime
	select @beginTime = CONVERT(varchar(100), GETDATE(), 23);
	select @endTime=CONVERT(varchar(100), DATEADD(D,-(30*@months),GETDATE()), 23); --获取当前系统查找时间
	
SET NOCOUNT ON;	
    select testerid,softmodel, (AVG(differvalue) ) as VerySoftModelAVGTime from Gps_GetQCDifferValue
    where softmodel=@softmodel and ( testtime>=@endTime and testtime<=@beginTime)
    group by testerid,softmodel
	order by testerid,softmodel

select testerid,softmodel, (AVG(differvalue) ) as VerySoftModelAVGTime  from Gps_GetQCWhiteCardDifferValue
where softmodel=@softmodel and ( testtime>=@endTime and testtime<=@beginTime)
group by testerid,softmodel
order by testerid,softmodel	
	
select testerid,softmodel, (AVG(differvalue) ) as VerySoftModelAVGTime  from Gps_GetQCImeiDifferValue
where softmodel=@softmodel and ( testtime>=@endTime and testtime<=@beginTime)
group by testerid,softmodel
order by testerid,softmodel	


select testerid,softmodel, (AVG(differvalue) ) as VerySoftModelAVGTime  from Gps_GetQCParamDownloadDifferValue
where softmodel=@softmodel and ( testtime>=@endTime and testtime<=@beginTime) and @@ROWCOUNT>50
group by testerid,softmodel
order by testerid,softmodel	
	
END
GO
