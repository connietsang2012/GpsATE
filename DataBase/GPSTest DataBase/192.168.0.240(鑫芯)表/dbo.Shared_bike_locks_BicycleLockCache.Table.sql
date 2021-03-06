USE [GPSTest]
GO
/****** Object:  Table [dbo].[Shared_bike_locks_BicycleLockCache]    Script Date: 11/23/2017 11:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Shared_bike_locks_BicycleLockCache](
	[SN] [varchar](80) NOT NULL,
	[IMEI] [varchar](80) NOT NULL,
	[ID] [varchar](80) NULL,
	[Version] [varchar](150) NULL,
	[Uploaded] [bit] NOT NULL,
	[updateTime] [datetime] NULL,
	[BTVersion] [varchar](150) NULL,
 CONSTRAINT [PK_Shared_bike_locks_BicycleLockCache] PRIMARY KEY CLUSTERED 
(
	[IMEI] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
