USE [GPSTest]
GO
/****** Object:  Table [dbo].[Gps_ParamDownloadSubItem]    Script Date: 11/23/2017 11:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_ParamDownloadSubItem](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ItemModel] [varchar](20) NOT NULL,
	[ItemName] [varchar](50) NOT NULL,
	[SubItemName] [varchar](50) NOT NULL,
	[SendAtComm] [bit] NOT NULL,
	[AtComm] [varchar](100) NOT NULL,
	[ReturnText] [varchar](100) NOT NULL,
	[ReSendNum] [int] NOT NULL,
	[TestTimeOut] [int] NOT NULL,
	[Compare] [bit] NOT NULL,
	[CompareValue] [varchar](100) NULL,
	[CompareRemark] [varchar](200) NULL,
	[Remark1] [varchar](200) NULL,
	[Remark2] [varchar](200) NULL,
	[Remark3] [varchar](200) NULL,
	[Remark4] [varchar](200) NULL,
	[Remark5] [varchar](200) NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_Gps_ParamDownloadSubItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Gps_ParamDownloadSubItem]  WITH CHECK ADD  CONSTRAINT [chk_ParamDownloadSubItemCompare] CHECK  (([Compare]=(1) OR [Compare]=(0)))
GO
ALTER TABLE [dbo].[Gps_ParamDownloadSubItem] CHECK CONSTRAINT [chk_ParamDownloadSubItemCompare]
GO
ALTER TABLE [dbo].[Gps_ParamDownloadSubItem]  WITH CHECK ADD  CONSTRAINT [chk_ParamDownloadSubItemSendAtComm] CHECK  (([SendAtComm]=(1) OR [SendAtComm]=(0)))
GO
ALTER TABLE [dbo].[Gps_ParamDownloadSubItem] CHECK CONSTRAINT [chk_ParamDownloadSubItemSendAtComm]
GO
ALTER TABLE [dbo].[Gps_ParamDownloadSubItem] ADD  DEFAULT ((1)) FOR [SendAtComm]
GO
ALTER TABLE [dbo].[Gps_ParamDownloadSubItem] ADD  DEFAULT ((3)) FOR [ReSendNum]
GO
ALTER TABLE [dbo].[Gps_ParamDownloadSubItem] ADD  DEFAULT ((3)) FOR [TestTimeOut]
GO
ALTER TABLE [dbo].[Gps_ParamDownloadSubItem] ADD  DEFAULT ((0)) FOR [Compare]
GO
