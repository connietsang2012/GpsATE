USE [GPSTest]
GO
/****** Object:  Table [dbo].[PStaffResume]    Script Date: 11/23/2017 11:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PStaffResume](
	[Name] [varchar](20) NOT NULL,
	[WorkNumber] [varchar](50) NOT NULL,
	[Gender] [varchar](4) NOT NULL,
	[Age] [varchar](6) NOT NULL,
	[WorkTypes] [varchar](80) NOT NULL,
	[Levels] [varchar](50) NOT NULL,
	[FactoryTime] [datetime] NOT NULL,
	[CompanyName] [varchar](120) NOT NULL,
	[UpdateTime] [datetime] NOT NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_PStaffResume] PRIMARY KEY CLUSTERED 
(
	[Name] ASC,
	[WorkNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
