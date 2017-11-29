USE [GPSTest]
GO
/****** Object:  Table [dbo].[LSMTUserAccount]    Script Date: 11/23/2017 11:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSMTUserAccount](
	[Name] [varchar](50) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[UserType] [varchar](100) NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
