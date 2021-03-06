USE [GPSTest]
GO
/****** Object:  Table [dbo].[ProductionType]    Script Date: 11/23/2017 11:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductionType](
	[ProductType] [varchar](20) NOT NULL,
	[Command] [varchar](50) NULL,
	[Command1] [varchar](50) NULL,
	[Command2] [varchar](50) NULL,
	[OnWorkTimeType] [varchar](50) NULL,
	[Command3] [varchar](50) NULL,
	[OnWorkTimeTypeNight] [varchar](50) NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
