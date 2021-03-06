USE [GPSTest]
GO
/****** Object:  Table [dbo].[Gps_TestResult_Backup]    Script Date: 11/23/2017 11:46:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_TestResult_Backup](
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
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_TestResult_Backup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Gps_TestResult_Backup]  WITH CHECK ADD  CONSTRAINT [chk_AutoTestResult_Backup] CHECK  (([AutoTestResult]=(1) OR [AutoTestResult]=(0)))
GO
ALTER TABLE [dbo].[Gps_TestResult_Backup] CHECK CONSTRAINT [chk_AutoTestResult_Backup]
GO
ALTER TABLE [dbo].[Gps_TestResult_Backup]  WITH CHECK ADD  CONSTRAINT [chk_CoupleResult_Backup] CHECK  (([CoupleResult]=(1) OR [CoupleResult]=(0)))
GO
ALTER TABLE [dbo].[Gps_TestResult_Backup] CHECK CONSTRAINT [chk_CoupleResult_Backup]
GO
ALTER TABLE [dbo].[Gps_TestResult_Backup]  WITH CHECK ADD  CONSTRAINT [chk_FunctionResult_Backup] CHECK  (([FunctionResult]=(1) OR [FunctionResult]=(0)))
GO
ALTER TABLE [dbo].[Gps_TestResult_Backup] CHECK CONSTRAINT [chk_FunctionResult_Backup]
GO
ALTER TABLE [dbo].[Gps_TestResult_Backup]  WITH CHECK ADD  CONSTRAINT [chk_GPSResult_Backup] CHECK  (([GPSResult]=(1) OR [GPSResult]=(0)))
GO
ALTER TABLE [dbo].[Gps_TestResult_Backup] CHECK CONSTRAINT [chk_GPSResult_Backup]
GO
ALTER TABLE [dbo].[Gps_TestResult_Backup]  WITH CHECK ADD  CONSTRAINT [chk_ParamDownloadResut_Backup] CHECK  (([ParamDownloadResult]=(1) OR [ParamDownloadResult]=(0)))
GO
ALTER TABLE [dbo].[Gps_TestResult_Backup] CHECK CONSTRAINT [chk_ParamDownloadResut_Backup]
GO
ALTER TABLE [dbo].[Gps_TestResult_Backup]  WITH CHECK ADD  CONSTRAINT [chk_WriteImeiResult_Backup] CHECK  (([WriteImeiResult]=(1) OR [WriteImeiResult]=(0)))
GO
ALTER TABLE [dbo].[Gps_TestResult_Backup] CHECK CONSTRAINT [chk_WriteImeiResult_Backup]
GO
ALTER TABLE [dbo].[Gps_TestResult_Backup] ADD  DEFAULT ((0)) FOR [FunctionResult]
GO
ALTER TABLE [dbo].[Gps_TestResult_Backup] ADD  DEFAULT ((0)) FOR [GPSResult]
GO
ALTER TABLE [dbo].[Gps_TestResult_Backup] ADD  DEFAULT ((0)) FOR [CoupleResult]
GO
ALTER TABLE [dbo].[Gps_TestResult_Backup] ADD  DEFAULT ((0)) FOR [WriteImeiResult]
GO
ALTER TABLE [dbo].[Gps_TestResult_Backup] ADD  DEFAULT ((0)) FOR [ParamDownloadResult]
GO
ALTER TABLE [dbo].[Gps_TestResult_Backup] ADD  DEFAULT ((0)) FOR [AutoTestResult]
GO
ALTER TABLE [dbo].[Gps_TestResult_Backup] ADD  CONSTRAINT [DF_Gps_TestResult_Backup_AutoTestResult1]  DEFAULT ((0)) FOR [AutoTestSMTResult]
GO
