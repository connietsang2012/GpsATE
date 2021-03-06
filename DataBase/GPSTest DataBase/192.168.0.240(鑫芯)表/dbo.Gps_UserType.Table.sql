USE [GPSTest]
GO
/****** Object:  Table [dbo].[Gps_UserType]    Script Date: 11/23/2017 11:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_UserType](
	[TypeId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[TypeName] [varchar](20) NOT NULL,
	[TypeDes] [varchar](20) NOT NULL,
	[TestAutoTestSMT] [bit] NOT NULL,
	[TestSMTOQC] [bit] NOT NULL,
	[TestCouple] [bit] NOT NULL,
	[TestParamDownload] [bit] NOT NULL,
	[TestAutoTest] [bit] NOT NULL,
	[TestWriteImei] [bit] NOT NULL,
	[TestTwice] [bit] NOT NULL,
	[TestIncomCheck] [bit] NOT NULL,
	[TestReadBackRom] [bit] NOT NULL,
	[TestCartonBox] [bit] NOT NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_UserType] PRIMARY KEY CLUSTERED 
(
	[TypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UN_TypeName] UNIQUE NONCLUSTERED 
(
	[TypeName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Gps_UserType] ADD  CONSTRAINT [DF_Gps_UserType_TestAutoTestSMT]  DEFAULT ((1)) FOR [TestAutoTestSMT]
GO
ALTER TABLE [dbo].[Gps_UserType] ADD  CONSTRAINT [DF_Gps_UserType_TestFunction]  DEFAULT ((1)) FOR [TestSMTOQC]
GO
ALTER TABLE [dbo].[Gps_UserType] ADD  CONSTRAINT [DF_Gps_UserType_TestCouple]  DEFAULT ((1)) FOR [TestCouple]
GO
ALTER TABLE [dbo].[Gps_UserType] ADD  CONSTRAINT [DF_Gps_UserType_TestParamDownload]  DEFAULT ((1)) FOR [TestParamDownload]
GO
ALTER TABLE [dbo].[Gps_UserType] ADD  CONSTRAINT [DF_Gps_UserType_TestAutoTest]  DEFAULT ((1)) FOR [TestAutoTest]
GO
ALTER TABLE [dbo].[Gps_UserType] ADD  CONSTRAINT [DF_Gps_UserType_TestWriteImei]  DEFAULT ((1)) FOR [TestWriteImei]
GO
ALTER TABLE [dbo].[Gps_UserType] ADD  CONSTRAINT [DF_Gps_UserType_TestTwice]  DEFAULT ((1)) FOR [TestTwice]
GO
ALTER TABLE [dbo].[Gps_UserType] ADD  CONSTRAINT [DF_Gps_UserType_TestIncomCheck]  DEFAULT ((1)) FOR [TestIncomCheck]
GO
ALTER TABLE [dbo].[Gps_UserType] ADD  CONSTRAINT [DF_Gps_UserType_TestGPS]  DEFAULT ((1)) FOR [TestReadBackRom]
GO
ALTER TABLE [dbo].[Gps_UserType] ADD  CONSTRAINT [DF_Gps_UserType_TestCartonBox]  DEFAULT ((1)) FOR [TestCartonBox]
GO
