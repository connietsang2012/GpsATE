USE [GPSTest]
GO
/****** Object:  Table [dbo].[Gps_TestResult]    Script Date: 11/23/2017 11:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_TestResult](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SN] [varchar](100) NOT NULL,
	[IMEI] [varchar](50) NULL,
	[SoftModel] [varchar](20) NOT NULL,
	[Version] [varchar](150) NOT NULL,
	[FunctionResult] [int] NULL,
	[GPSResult] [int] NULL,
	[CoupleResult] [int] NULL,
	[WriteImeiResult] [int] NULL,
	[ParamDownloadResult] [int] NULL,
	[AutoTestResult] [int] NULL,
	[Result]  AS (((([FunctionResult]&[GPSResult])&[CoupleResult])&[WriteImeiResult])&[ParamDownloadResult]),
	[AutoTestSMTResult] [int] NULL,
	[SMTIQCResult] [int] NULL,
	[OtherTestSign] [nvarchar](max) NULL,
	[ZhiDan] [varchar](50) NULL,
	[RecordTime] [datetime] NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_TestResult] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Gps_TestResult]  WITH CHECK ADD  CONSTRAINT [chk_AutoTestResult] CHECK  (([AutoTestResult]=(1) OR [AutoTestResult]=(0)))
GO
ALTER TABLE [dbo].[Gps_TestResult] CHECK CONSTRAINT [chk_AutoTestResult]
GO
ALTER TABLE [dbo].[Gps_TestResult]  WITH CHECK ADD  CONSTRAINT [chk_CoupleResult] CHECK  (([CoupleResult]=(1) OR [CoupleResult]=(0)))
GO
ALTER TABLE [dbo].[Gps_TestResult] CHECK CONSTRAINT [chk_CoupleResult]
GO
ALTER TABLE [dbo].[Gps_TestResult]  WITH CHECK ADD  CONSTRAINT [chk_FunctionResult] CHECK  (([FunctionResult]=(1) OR [FunctionResult]=(0)))
GO
ALTER TABLE [dbo].[Gps_TestResult] CHECK CONSTRAINT [chk_FunctionResult]
GO
ALTER TABLE [dbo].[Gps_TestResult]  WITH CHECK ADD  CONSTRAINT [chk_GPSResult] CHECK  (([GPSResult]=(1) OR [GPSResult]=(0)))
GO
ALTER TABLE [dbo].[Gps_TestResult] CHECK CONSTRAINT [chk_GPSResult]
GO
ALTER TABLE [dbo].[Gps_TestResult]  WITH CHECK ADD  CONSTRAINT [chk_ParamDownloadResut] CHECK  (([ParamDownloadResult]=(1) OR [ParamDownloadResult]=(0)))
GO
ALTER TABLE [dbo].[Gps_TestResult] CHECK CONSTRAINT [chk_ParamDownloadResut]
GO
ALTER TABLE [dbo].[Gps_TestResult]  WITH CHECK ADD  CONSTRAINT [chk_WriteImeiResult] CHECK  (([WriteImeiResult]=(1) OR [WriteImeiResult]=(0)))
GO
ALTER TABLE [dbo].[Gps_TestResult] CHECK CONSTRAINT [chk_WriteImeiResult]
GO
ALTER TABLE [dbo].[Gps_TestResult] ADD  CONSTRAINT [DF__Gps_TestR__Funct__53584DE9]  DEFAULT ((0)) FOR [FunctionResult]
GO
ALTER TABLE [dbo].[Gps_TestResult] ADD  CONSTRAINT [DF__Gps_TestR__GPSRe__544C7222]  DEFAULT ((0)) FOR [GPSResult]
GO
ALTER TABLE [dbo].[Gps_TestResult] ADD  CONSTRAINT [DF__Gps_TestR__Coupl__5540965B]  DEFAULT ((0)) FOR [CoupleResult]
GO
ALTER TABLE [dbo].[Gps_TestResult] ADD  CONSTRAINT [DF__Gps_TestR__Write__5634BA94]  DEFAULT ((0)) FOR [WriteImeiResult]
GO
ALTER TABLE [dbo].[Gps_TestResult] ADD  CONSTRAINT [DF__Gps_TestR__Param__5728DECD]  DEFAULT ((0)) FOR [ParamDownloadResult]
GO
ALTER TABLE [dbo].[Gps_TestResult] ADD  CONSTRAINT [DF__Gps_TestR__AutoT__581D0306]  DEFAULT ((0)) FOR [AutoTestResult]
GO
ALTER TABLE [dbo].[Gps_TestResult] ADD  CONSTRAINT [DF_Gps_TestResult_AutoTestResult1]  DEFAULT ((0)) FOR [AutoTestSMTResult]
GO
ALTER TABLE [dbo].[Gps_TestResult] ADD  CONSTRAINT [DF_Gps_TestResult_RecordTime]  DEFAULT (getdate()) FOR [RecordTime]
GO
