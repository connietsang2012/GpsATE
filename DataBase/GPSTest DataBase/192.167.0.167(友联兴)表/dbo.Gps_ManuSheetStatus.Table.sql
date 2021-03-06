USE [GPSTest]
GO
/****** Object:  Table [dbo].[Gps_ManuSheetStatus]    Script Date: 12/25/2017 16:39:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_ManuSheetStatus](
	[StatusId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ManuSheetStatusNo] [varchar](20) NOT NULL,
	[ManuSheetStatusDes] [varchar](20) NOT NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_ManuSheetStatus] PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Gps_ManuSheetStatus] ON
INSERT [dbo].[Gps_ManuSheetStatus] ([StatusId], [ManuSheetStatusNo], [ManuSheetStatusDes]) VALUES (1, N'0', N'未开始')
INSERT [dbo].[Gps_ManuSheetStatus] ([StatusId], [ManuSheetStatusNo], [ManuSheetStatusDes]) VALUES (2, N'1', N'生产中')
INSERT [dbo].[Gps_ManuSheetStatus] ([StatusId], [ManuSheetStatusNo], [ManuSheetStatusDes]) VALUES (3, N'2', N'已完成')
INSERT [dbo].[Gps_ManuSheetStatus] ([StatusId], [ManuSheetStatusNo], [ManuSheetStatusDes]) VALUES (4, N'3', N'做废')
SET IDENTITY_INSERT [dbo].[Gps_ManuSheetStatus] OFF
