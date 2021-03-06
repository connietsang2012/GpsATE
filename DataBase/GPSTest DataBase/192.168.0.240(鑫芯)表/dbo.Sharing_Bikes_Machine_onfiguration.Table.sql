USE [GPSTest]
GO
/****** Object:  Table [dbo].[Sharing_Bikes_Machine_onfiguration]    Script Date: 11/23/2017 11:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sharing_Bikes_Machine_onfiguration](
	[ZhiDan] [varchar](50) NOT NULL,
	[Version] [varchar](150) NOT NULL,
	[SoftModel] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Sharing_Bikes_Machine_onfiguration] PRIMARY KEY CLUSTERED 
(
	[ZhiDan] ASC,
	[Version] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
