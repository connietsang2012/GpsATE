USE [GPSTest]
GO
/****** Object:  Table [dbo].[LSMTMaterialPos]    Script Date: 11/23/2017 11:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSMTMaterialPos](
	[MaterialNumber] [varchar](50) NOT NULL,
	[MaterialName] [varchar](50) NOT NULL,
	[MaterialModel] [varchar](max) NULL,
	[StoreHouse] [varchar](50) NULL,
	[Region] [varchar](50) NULL,
	[Row] [varchar](50) NULL,
	[Layer] [varchar](50) NULL,
	[SerialNumber] [varchar](50) NULL,
	[RecordTime] [datetime] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[LSMTMaterialPos] ADD  CONSTRAINT [DF_LSMTMaterialPos_RecordTime]  DEFAULT (getdate()) FOR [RecordTime]
GO
