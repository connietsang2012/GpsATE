USE [GPSTest]
GO
/****** Object:  Table [dbo].[Gps_CoupleTest_Result]    Script Date: 11/23/2017 11:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_CoupleTest_Result](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SN] [varchar](100) NOT NULL,
	[IMEI] [varchar](15) NULL,
	[ZhiDan] [varchar](100) NULL,
	[SoftModel] [varchar](20) NOT NULL,
	[Version] [varchar](150) NOT NULL,
	[Result] [int] NOT NULL,
	[TesterId] [varchar](20) NOT NULL,
	[Computer] [varchar](100) NULL,
	[TestSetting] [varchar](max) NULL,
	[TestTime] [datetime] NOT NULL,
	[Remark] [varchar](200) NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_CoupleTest_Result] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UN_CoupleTest_SN] UNIQUE NONCLUSTERED 
(
	[SN] ASC,
	[IMEI] ASC,
	[SoftModel] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Gps_CoupleTest_Result] ADD  CONSTRAINT [DF_Gps_CoupleTest_Result_IMEI]  DEFAULT (str(round(rand()*(10000000000.),(0)),(15),(0))) FOR [IMEI]
GO
ALTER TABLE [dbo].[Gps_CoupleTest_Result] ADD  CONSTRAINT [DF__Gps_Coupl__Resul__6F00685E]  DEFAULT ((0)) FOR [Result]
GO
ALTER TABLE [dbo].[Gps_CoupleTest_Result] ADD  CONSTRAINT [DF__Gps_Coupl__TestT__6FF48C97]  DEFAULT (getdate()) FOR [TestTime]
GO
