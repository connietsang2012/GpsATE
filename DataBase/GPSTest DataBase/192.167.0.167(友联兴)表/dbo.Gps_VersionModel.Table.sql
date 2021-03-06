USE [GPSTest]
GO
/****** Object:  Table [dbo].[Gps_VersionModel]    Script Date: 11/23/2017 11:46:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_VersionModel](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Version] [varchar](100) NOT NULL,
	[Model] [varchar](50) NOT NULL,
	[bReadRID] [bit] NOT NULL,
	[TotalModel] [varchar](50) NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_GpsVersionModel] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Gps_VersionModel] ADD  CONSTRAINT [DF__Gps_Versi__bRead__72F0F4D3]  DEFAULT ((0)) FOR [bReadRID]
GO
