USE [GPSTest]
GO
/****** Object:  Table [dbo].[Gps_CartonBoxTen_Result]    Script Date: 11/23/2017 11:46:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_CartonBoxTen_Result](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[BoxNo] [varchar](50) NOT NULL,
	[IMEI] [varchar](15) NOT NULL,
	[Color] [varchar](50) NULL,
	[Weight] [varchar](50) NULL,
	[TACInfo] [varchar](200) NULL,
	[OtherInfo] [varchar](200) NULL,
	[TesterId] [varchar](20) NOT NULL,
	[TestTime] [datetime] NOT NULL,
	[Remark1] [varchar](200) NULL,
	[Remark2] [varchar](200) NULL,
	[Remark3] [varchar](200) NULL,
	[Remark4] [varchar](200) NULL,
	[Remark5] [varchar](200) NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_Gps_CartonBoxTwenty_Result] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_Gps_CartonBoxTwenty_Result] UNIQUE NONCLUSTERED 
(
	[BoxNo] ASC,
	[IMEI] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Gps_CartonBoxTen_Result] ADD  CONSTRAINT [DF_Gps_CartonBoxTwenty_Result_TestTime]  DEFAULT (getdate()) FOR [TestTime]
GO
