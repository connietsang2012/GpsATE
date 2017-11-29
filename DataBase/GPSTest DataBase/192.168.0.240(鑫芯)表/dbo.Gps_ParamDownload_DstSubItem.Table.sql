USE [GPSTest]
GO
/****** Object:  Table [dbo].[Gps_ParamDownload_DstSubItem]    Script Date: 11/23/2017 11:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_ParamDownload_DstSubItem](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ItemModel] [varchar](20) NOT NULL,
	[ItemName] [varchar](50) NOT NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_ParamDownloadDstSubItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
