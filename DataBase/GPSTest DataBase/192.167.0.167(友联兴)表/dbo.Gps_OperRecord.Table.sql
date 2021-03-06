USE [GPSTest]
GO
/****** Object:  Table [dbo].[Gps_OperRecord]    Script Date: 11/23/2017 11:46:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_OperRecord](
	[id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[OperName] [varchar](20) NULL,
	[OperContent] [varchar](3000) NULL,
	[OperTime] [datetime] NULL,
	[OperDemo] [varchar](250) NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
