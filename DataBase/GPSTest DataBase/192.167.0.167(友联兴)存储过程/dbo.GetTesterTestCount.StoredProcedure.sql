USE [GPSTest]
GO
/****** Object:  StoredProcedure [dbo].[GetTesterTestCount]    Script Date: 11/23/2017 11:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetTesterTestCount] 

AS
BEGIN

	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT     a.TesterId AS 测试员, a.passcount AS 通过数, b.failcount AS 失败数, c.test_time AS 测试时间
FROM         (SELECT   TesterId,COUNT(*) AS passcount
                       FROM          Gps_AutoTest_Result
                       WHERE      (Result = 1) and DateDiff(dd,TestTime,getdate())=0
                       GROUP BY TesterId) AS a INNER JOIN
            (SELECT    TesterId,COUNT(*) AS failcount
                            FROM          Gps_AutoTest_Result AS Gps_AutoTestSMT_Result_1
                            WHERE      (Result = 0) and DateDiff(dd,TestTime,getdate())=0
                            GROUP BY TesterId) AS b ON a.TesterId = b.TesterId INNER JOIN
            (SELECT    TesterId,datediff(ss,
										 (select top 1  testtime from Gps_AutoTest_Result
																	WHERE      (Result = 0) and DateDiff(dd,TestTime,getdate())=0
																	GROUP BY TesterId,testtime order by testtime asc),
										 (select top 1  testtime from Gps_AutoTest_Result
																	WHERE      (Result = 0) and DateDiff(dd,TestTime,getdate())=0
																	GROUP BY TesterId,testtime order by testtime desc) 
										                            
										 ) as test_time
										 
                            FROM          Gps_AutoTest_Result AS Gps_AutoTestSMT_Result_1
                            WHERE       DateDiff(dd,TestTime,getdate())=0
                            GROUP BY TesterId)AS c ON a.TesterId = c.TesterId
    
END
GO
