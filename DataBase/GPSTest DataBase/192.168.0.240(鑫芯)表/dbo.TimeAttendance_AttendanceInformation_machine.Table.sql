USE [GPSTest]
GO
/****** Object:  Table [dbo].[TimeAttendance_AttendanceInformation_machine]    Script Date: 11/23/2017 11:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TimeAttendance_AttendanceInformation_machine](
	[MachineID] [varchar](50) NOT NULL,
	[ComInterface] [varchar](50) NULL,
	[BaudRate] [varchar](50) NULL,
	[IPAddress] [varchar](50) NULL,
	[MachinePosition] [varchar](80) NULL,
	[MachineUse] [varchar](50) NULL,
 CONSTRAINT [PK_TimeAttendance_AttendanceInformation_machine] PRIMARY KEY CLUSTERED 
(
	[MachineID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
