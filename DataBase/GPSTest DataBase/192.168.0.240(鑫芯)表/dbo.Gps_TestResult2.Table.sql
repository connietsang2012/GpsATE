USE [GPSTest]
GO
/****** Object:  Table [dbo].[Gps_TestResult2]    Script Date: 11/23/2017 11:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_TestResult2](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SN] [varchar](32) NOT NULL,
	[IMEI] [varchar](15) NULL,
	[SoftModel] [varchar](20) NOT NULL,
	[Version] [varchar](50) NOT NULL,
	[FunctionResult] [int] NULL,
	[GPSResult] [int] NULL,
	[CoupleResult] [int] NULL,
	[WriteImeiResult] [int] NULL,
	[ParamDownloadResult] [int] NULL,
	[AutoTestResult] [int] NULL,
	[Result]  AS (((([FunctionResult]&[GPSResult])&[CoupleResult])&[WriteImeiResult])&[ParamDownloadResult]),
	[AutoTestSMTResult] [int] NULL,
	[SMTIQCResult] [int] NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_TestResult2] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UN_TestResult2] UNIQUE NONCLUSTERED 
(
	[SN] ASC,
	[IMEI] ASC,
	[SoftModel] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Gps_TestResult2]  WITH CHECK ADD  CONSTRAINT [chk_AutoTestResult2] CHECK  (([AutoTestResult]=(1) OR [AutoTestResult]=(0)))
GO
ALTER TABLE [dbo].[Gps_TestResult2] CHECK CONSTRAINT [chk_AutoTestResult2]
GO
ALTER TABLE [dbo].[Gps_TestResult2]  WITH CHECK ADD  CONSTRAINT [chk_CoupleResult2] CHECK  (([CoupleResult]=(1) OR [CoupleResult]=(0)))
GO
ALTER TABLE [dbo].[Gps_TestResult2] CHECK CONSTRAINT [chk_CoupleResult2]
GO
ALTER TABLE [dbo].[Gps_TestResult2]  WITH CHECK ADD  CONSTRAINT [chk_FunctionResult2] CHECK  (([FunctionResult]=(1) OR [FunctionResult]=(0)))
GO
ALTER TABLE [dbo].[Gps_TestResult2] CHECK CONSTRAINT [chk_FunctionResult2]
GO
ALTER TABLE [dbo].[Gps_TestResult2]  WITH CHECK ADD  CONSTRAINT [chk_GPSResult2] CHECK  (([GPSResult]=(1) OR [GPSResult]=(0)))
GO
ALTER TABLE [dbo].[Gps_TestResult2] CHECK CONSTRAINT [chk_GPSResult2]
GO
ALTER TABLE [dbo].[Gps_TestResult2]  WITH CHECK ADD  CONSTRAINT [chk_ParamDownloadResut2] CHECK  (([ParamDownloadResult]=(1) OR [ParamDownloadResult]=(0)))
GO
ALTER TABLE [dbo].[Gps_TestResult2] CHECK CONSTRAINT [chk_ParamDownloadResut2]
GO
ALTER TABLE [dbo].[Gps_TestResult2]  WITH CHECK ADD  CONSTRAINT [chk_WriteImeiResult2] CHECK  (([WriteImeiResult]=(1) OR [WriteImeiResult]=(0)))
GO
ALTER TABLE [dbo].[Gps_TestResult2] CHECK CONSTRAINT [chk_WriteImeiResult2]
GO
ALTER TABLE [dbo].[Gps_TestResult2] ADD  DEFAULT ((0)) FOR [FunctionResult]
GO
ALTER TABLE [dbo].[Gps_TestResult2] ADD  DEFAULT ((0)) FOR [GPSResult]
GO
ALTER TABLE [dbo].[Gps_TestResult2] ADD  DEFAULT ((0)) FOR [CoupleResult]
GO
ALTER TABLE [dbo].[Gps_TestResult2] ADD  DEFAULT ((0)) FOR [WriteImeiResult]
GO
ALTER TABLE [dbo].[Gps_TestResult2] ADD  DEFAULT ((0)) FOR [ParamDownloadResult]
GO
ALTER TABLE [dbo].[Gps_TestResult2] ADD  CONSTRAINT [2DF__Gps_TestR__AutoT__581D0306]  DEFAULT ((0)) FOR [AutoTestResult]
GO
ALTER TABLE [dbo].[Gps_TestResult2] ADD  CONSTRAINT [2DF_Gps_TestResult_AutoTestResult1]  DEFAULT ((0)) FOR [AutoTestSMTResult]
GO
