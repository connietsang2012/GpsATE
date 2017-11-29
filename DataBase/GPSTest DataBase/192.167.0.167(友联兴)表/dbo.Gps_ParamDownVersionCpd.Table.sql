USE [GPSTest]
GO
/****** Object:  Table [dbo].[Gps_ParamDownVersionCpd]    Script Date: 11/23/2017 11:46:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_ParamDownVersionCpd](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SN] [varchar](32) NOT NULL,
	[IMEI] [varchar](15) NULL,
	[SoftModel] [varchar](20) NOT NULL,
	[Version] [varchar](50) NOT NULL,
	[VersionS] [varchar](50) NULL,
	[Result] [int] NOT NULL,
	[TesterId] [varchar](20) NOT NULL,
	[TestTime] [datetime] NOT NULL,
	[Remark] [varchar](200) NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_Gps_ParamDownUpdate_Backup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Gps_ParamDownVersionCpd] ADD  CONSTRAINT [DF_Gps_ParamDownUpdate_Backup_Result]  DEFAULT ((0)) FOR [Result]
GO
ALTER TABLE [dbo].[Gps_ParamDownVersionCpd] ADD  CONSTRAINT [DF_Gps_ParamDownUpdate_Backup_TestTime]  DEFAULT (getdate()) FOR [TestTime]
GO
