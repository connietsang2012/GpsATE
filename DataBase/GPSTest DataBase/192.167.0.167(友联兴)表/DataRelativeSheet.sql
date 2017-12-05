USE [GPSTest]
GO

/****** Object:  Table [dbo].[DataRelativeSheet]    Script Date: 11/30/2017 15:08:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[DataRelativeSheet](
	[SN] [varchar](50) NULL,
	[IMEI1] [varchar](50) NOT NULL,
	[IMEI2] [varchar](50) NULL,
	[IMEI3] [varchar](50) NULL,
	[IMEI4] [varchar](50) NULL,
	[IMEI5] [varchar](50) NULL,
	[IMEI6] [varchar](50) NULL,
	[IMEI7] [varchar](50) NULL,
	[IMEI8] [varchar](50) NULL,
	[IMEI9] [varchar](50) NULL,
	[IMEI10] [varchar](50) NULL,
	[IMEI11] [varchar](50) NULL,
	[IMEI12] [varchar](50) NULL,
	[ZhiDan] [varchar](50) NULL,
	[TestTime] [datetime] NOT NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_DataRelativeSheet] PRIMARY KEY CLUSTERED 
(
	[IMEI1] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[DataRelativeSheet] ADD  CONSTRAINT [DF_DataRelativeSheet_TestTime]  DEFAULT (getdate()) FOR [TestTime]
GO


