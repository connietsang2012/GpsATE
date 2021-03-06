USE [GPSTest]
GO
/****** Object:  Table [dbo].[PWorkSchedule]    Script Date: 11/23/2017 11:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PWorkSchedule](
	[CompanyName] [varchar](50) NOT NULL,
	[MorningOnWorkTime] [varchar](50) NOT NULL,
	[MorningUnderWorkTime] [varchar](50) NOT NULL,
	[AfternoonOnWorkTime] [varchar](50) NOT NULL,
	[AfternoonUnderWorkTime] [varchar](50) NOT NULL,
	[NightOnWorkTime] [varchar](50) NOT NULL,
	[UpdateTime] [datetime] NULL,
	[Flag] [bit] NOT NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_PWorkSchedule] PRIMARY KEY CLUSTERED 
(
	[CompanyName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[PWorkSchedule] ADD  CONSTRAINT [DF_PWorkSchedule_Flag]  DEFAULT ((0)) FOR [Flag]
GO
