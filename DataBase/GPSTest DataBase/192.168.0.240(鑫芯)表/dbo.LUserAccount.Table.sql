USE [GPSTest]
GO
/****** Object:  Table [dbo].[LUserAccount]    Script Date: 11/23/2017 11:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LUserAccount](
	[Name] [varchar](50) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[UserType] [varchar](100) NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
