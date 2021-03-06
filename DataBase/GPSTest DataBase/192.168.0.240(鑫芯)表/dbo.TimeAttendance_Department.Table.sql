USE [GPSTest]
GO
/****** Object:  Table [dbo].[TimeAttendance_Department]    Script Date: 11/23/2017 11:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TimeAttendance_Department](
	[DepartmentNo] [varchar](50) NOT NULL,
	[DepartmentName] [varchar](80) NOT NULL,
	[ParentDepartmentNo] [varchar](50) NULL,
	[ParentDepartmentName] [varchar](80) NULL,
	[NumberOfStaff] [int] NULL,
	[InTheNumberOfStaff] [int] NULL,
	[ExceedNumberOfStaff] [int] NULL,
	[note] [varchar](255) NULL,
 CONSTRAINT [PK_TimeAttendance_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
