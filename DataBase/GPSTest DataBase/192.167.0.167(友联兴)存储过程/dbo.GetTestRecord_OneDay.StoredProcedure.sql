USE [GPSTest]
GO
/****** Object:  StoredProcedure [dbo].[GetTestRecord_OneDay]    Script Date: 11/23/2017 11:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetTestRecord_OneDay] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT     a.TesterId AS 测试员, a.passcount AS 通过数, b.failcount AS 失败数, c.test_time AS 测试时间
			FROM         (SELECT   TesterId,COUNT(*) AS passcount
                       FROM          Gps_AutoTest_Result
                       WHERE      (Result = 1) and DateDiff(dd,TestTime,getdate())=0
                       GROUP BY TesterId) AS a LEFT JOIN
            (SELECT    TesterId,COUNT(*) AS failcount
                            FROM          Gps_AutoTest_Result AS Gps_AutoTestSMT_Result_1
                            WHERE      (Result = 0) and DateDiff(dd,TestTime,getdate())=0
                            GROUP BY TesterId) AS b ON a.TesterId = b.TesterId LEFT JOIN
            (SELECT    TesterId, CONVERT(VARCHAR(8),DATEADD(ss,datediff(ss,
										 (select top 1  testtime from Gps_AutoTest_Result
																	WHERE      DateDiff(dd,TestTime,getdate())=0
																	GROUP BY TesterId,testtime order by testtime asc),
										 (select top 1  testtime from Gps_AutoTest_Result
																	WHERE      DateDiff(dd,TestTime,getdate())=0
																	GROUP BY TesterId,testtime order by testtime desc) 
										                            
										 ),'1900-01-01 00:00:00'),108) as test_time
										 
                            FROM          Gps_AutoTest_Result AS Gps_AutoTestSMT_Result_1
                            WHERE       DateDiff(dd,TestTime,getdate())=0
                            GROUP BY TesterId)AS c ON a.TesterId = c.TesterId
END
GO
