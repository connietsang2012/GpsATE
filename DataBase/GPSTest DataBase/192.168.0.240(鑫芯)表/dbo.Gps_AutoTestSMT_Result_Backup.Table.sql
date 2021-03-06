USE [GPSTest]
GO
/****** Object:  Table [dbo].[Gps_AutoTestSMT_Result_Backup]    Script Date: 11/23/2017 11:48:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_AutoTestSMT_Result_Backup](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SN] [varchar](32) NOT NULL,
	[IMEI] [varchar](15) NULL,
	[SoftModel] [varchar](20) NOT NULL,
	[Version] [varchar](50) NOT NULL,
	[Result] [int] NOT NULL,
	[TesterId] [varchar](20) NOT NULL,
	[TestTime] [datetime] NOT NULL,
	[GpsDBValue] [int] NULL,
	[Remark] [varchar](200) NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_AutoTestSMT_Result_Backup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Gps_AutoTestSMT_Result_Backup] ADD  CONSTRAINT [DF__Gps_AutoT__Resul__34F3C25A]  DEFAULT ((0)) FOR [Result]
GO
ALTER TABLE [dbo].[Gps_AutoTestSMT_Result_Backup] ADD  CONSTRAINT [DF__Gps_AutoT__TestT__35E7E693]  DEFAULT (getdate()) FOR [TestTime]
GO
