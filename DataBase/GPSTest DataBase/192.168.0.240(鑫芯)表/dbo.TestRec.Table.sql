USE [GPSTest]
GO
/****** Object:  Table [dbo].[TestRec]    Script Date: 11/23/2017 11:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TestRec](
	[testerid] [varchar](50) NULL,
	[softmodel] [varchar](50) NULL,
	[AVG] [int] NULL,
	[month] [int] NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
