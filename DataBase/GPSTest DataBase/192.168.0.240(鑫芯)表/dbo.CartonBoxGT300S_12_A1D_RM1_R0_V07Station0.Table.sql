USE [GPSTest]
GO
/****** Object:  Table [dbo].[CartonBoxGT300S_12_A1D_RM1_R0_V07Station0]    Script Date: 11/23/2017 11:48:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CartonBoxGT300S_12_A1D_RM1_R0_V07Station0](
	[BoxNo] [varchar](50) NOT NULL,
	[IMEI] [varchar](50) NOT NULL,
	[ZhiDan] [varchar](100) NOT NULL,
	[SoftModel] [varchar](20) NOT NULL,
	[Version] [varchar](150) NOT NULL,
	[ProductCode] [varchar](100) NULL,
	[Color] [varchar](50) NULL,
	[Qty] [varchar](50) NULL,
	[Date] [varchar](50) NULL,
	[Remark3] [varchar](200) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
