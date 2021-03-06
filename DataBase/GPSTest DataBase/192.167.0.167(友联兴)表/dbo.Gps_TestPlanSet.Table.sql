USE [GPSTest]
GO
/****** Object:  Table [dbo].[Gps_TestPlanSet]    Script Date: 11/23/2017 11:46:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_TestPlanSet](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Version] [varchar](50) NOT NULL,
	[TestFunction] [bit] NOT NULL,
	[TestGPS] [bit] NOT NULL,
	[TestCouple] [bit] NOT NULL,
	[TestWriteImei] [bit] NOT NULL,
	[TestParamDownload] [bit] NOT NULL,
	[TestCartonBox] [bit] NOT NULL,
	[TestAutoTest] [bit] NOT NULL,
	[TestAutoTestSMT] [bit] NOT NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_TestPlanSet] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Gps_TestPlanSet]  WITH CHECK ADD  CONSTRAINT [chk_TestPlanSetTestAutoTest] CHECK  (([TestCartonBox]=(1) OR [TestCartonBox]=(0)))
GO
ALTER TABLE [dbo].[Gps_TestPlanSet] CHECK CONSTRAINT [chk_TestPlanSetTestAutoTest]
GO
ALTER TABLE [dbo].[Gps_TestPlanSet]  WITH CHECK ADD  CONSTRAINT [chk_TestPlanSetTestCartonBox] CHECK  (([TestCartonBox]=(1) OR [TestCartonBox]=(0)))
GO
ALTER TABLE [dbo].[Gps_TestPlanSet] CHECK CONSTRAINT [chk_TestPlanSetTestCartonBox]
GO
ALTER TABLE [dbo].[Gps_TestPlanSet]  WITH CHECK ADD  CONSTRAINT [chk_TestPlanSetTestCouple] CHECK  (([TestCouple]=(1) OR [TestCouple]=(0)))
GO
ALTER TABLE [dbo].[Gps_TestPlanSet] CHECK CONSTRAINT [chk_TestPlanSetTestCouple]
GO
ALTER TABLE [dbo].[Gps_TestPlanSet]  WITH CHECK ADD  CONSTRAINT [chk_TestPlanSetTestFunction] CHECK  (([TestFunction]=(1) OR [TestFunction]=(0)))
GO
ALTER TABLE [dbo].[Gps_TestPlanSet] CHECK CONSTRAINT [chk_TestPlanSetTestFunction]
GO
ALTER TABLE [dbo].[Gps_TestPlanSet]  WITH CHECK ADD  CONSTRAINT [chk_TestPlanSetTestGPS] CHECK  (([TestGPS]=(1) OR [TestGPS]=(0)))
GO
ALTER TABLE [dbo].[Gps_TestPlanSet] CHECK CONSTRAINT [chk_TestPlanSetTestGPS]
GO
ALTER TABLE [dbo].[Gps_TestPlanSet]  WITH CHECK ADD  CONSTRAINT [chk_TestPlanSetTestParamDownload] CHECK  (([TestParamDownload]=(1) OR [TestParamDownload]=(0)))
GO
ALTER TABLE [dbo].[Gps_TestPlanSet] CHECK CONSTRAINT [chk_TestPlanSetTestParamDownload]
GO
ALTER TABLE [dbo].[Gps_TestPlanSet]  WITH CHECK ADD  CONSTRAINT [chk_TestPlanSetTestWriteImei] CHECK  (([TestWriteImei]=(1) OR [TestWriteImei]=(0)))
GO
ALTER TABLE [dbo].[Gps_TestPlanSet] CHECK CONSTRAINT [chk_TestPlanSetTestWriteImei]
GO
ALTER TABLE [dbo].[Gps_TestPlanSet] ADD  DEFAULT ((1)) FOR [TestFunction]
GO
ALTER TABLE [dbo].[Gps_TestPlanSet] ADD  DEFAULT ((1)) FOR [TestGPS]
GO
ALTER TABLE [dbo].[Gps_TestPlanSet] ADD  DEFAULT ((1)) FOR [TestCouple]
GO
ALTER TABLE [dbo].[Gps_TestPlanSet] ADD  DEFAULT ((1)) FOR [TestWriteImei]
GO
ALTER TABLE [dbo].[Gps_TestPlanSet] ADD  DEFAULT ((1)) FOR [TestParamDownload]
GO
ALTER TABLE [dbo].[Gps_TestPlanSet] ADD  DEFAULT ((1)) FOR [TestCartonBox]
GO
ALTER TABLE [dbo].[Gps_TestPlanSet] ADD  DEFAULT ((1)) FOR [TestAutoTest]
GO
ALTER TABLE [dbo].[Gps_TestPlanSet] ADD  CONSTRAINT [DF_Gps_TestPlanSet_TestAutoTest1]  DEFAULT ((1)) FOR [TestAutoTestSMT]
GO
