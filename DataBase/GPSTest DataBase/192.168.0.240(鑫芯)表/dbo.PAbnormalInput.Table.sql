USE [GPSTest]
GO
/****** Object:  Table [dbo].[PAbnormalInput]    Script Date: 11/23/2017 11:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PAbnormalInput](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ZhiDan] [varchar](100) NOT NULL,
	[SchoolPersonnel] [varchar](20) NOT NULL,
	[CompanyName] [varchar](80) NOT NULL,
	[LineOf] [varchar](80) NOT NULL,
	[WorkStation] [varchar](50) NOT NULL,
	[ProblemDescription] [varchar](200) NOT NULL,
	[ExceptionTypes] [varchar](80) NULL,
	[Node1] [varchar](200) NULL,
	[UpdateTime] [datetime] NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_PAbnormalInput] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
