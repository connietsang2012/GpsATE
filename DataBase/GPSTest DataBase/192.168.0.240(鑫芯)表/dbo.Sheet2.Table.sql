USE [GPSTest]
GO
/****** Object:  Table [dbo].[Sheet2]    Script Date: 11/23/2017 11:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sheet2](
	[SN] [nvarchar](255) NULL,
	[IMEI1] [nvarchar](255) NULL,
	[ZHIDAN] [nvarchar](255) NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL
) ON [PRIMARY]
GO
