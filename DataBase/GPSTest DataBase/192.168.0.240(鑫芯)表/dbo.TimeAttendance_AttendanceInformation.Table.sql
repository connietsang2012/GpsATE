USE [GPSTest]
GO
/****** Object:  Table [dbo].[TimeAttendance_AttendanceInformation]    Script Date: 11/23/2017 11:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TimeAttendance_AttendanceInformation](
	[UserID] [varchar](80) NOT NULL,
	[UserName] [varchar](80) NULL,
	[iMachineNumber] [int] NULL,
	[InputDate] [datetime] NULL,
	[workDates] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
