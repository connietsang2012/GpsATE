USE [GPSTest]
GO
/****** Object:  Table [dbo].[CartonBoxGT540_22_S2SC1_B3_V01Station0]    Script Date: 11/23/2017 11:48:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CartonBoxGT540_22_S2SC1_B3_V01Station0](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BoxNo] [varchar](50) NOT NULL,
	[IMEI] [varchar](50) NOT NULL,
	[ZhiDan] [varchar](100) NOT NULL,
	[SoftModel] [varchar](20) NOT NULL,
	[Version] [varchar](150) NOT NULL,
	[ProductCode] [varchar](100) NULL,
	[Color] [varchar](50) NULL,
	[Qty] [varchar](50) NULL,
	[Weight] [varchar](50) NULL,
	[Date] [varchar](50) NULL,
	[TACInfo] [varchar](200) NULL,
	[CompanyName] [varchar](200) NULL,
	[TesterId] [varchar](20) NOT NULL,
	[TestTime] [datetime] NOT NULL,
	[Remark1] [varchar](200) NULL,
	[Remark2] [varchar](200) NULL,
	[Remark3] [varchar](200) NULL,
	[Remark4] [varchar](200) NULL,
	[Remark5] [varchar](200) NULL,
	[Computer] [varchar](100) NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
