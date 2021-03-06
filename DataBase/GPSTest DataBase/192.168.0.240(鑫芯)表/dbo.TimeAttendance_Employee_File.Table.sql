USE [GPSTest]
GO
/****** Object:  Table [dbo].[TimeAttendance_Employee_File]    Script Date: 11/23/2017 11:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TimeAttendance_Employee_File](
	[JobNumber] [varchar](50) NOT NULL,
	[ChineseName] [varchar](80) NULL,
	[Gender] [varchar](50) NULL,
	[Education] [varchar](50) NULL,
	[Post] [varchar](50) NULL,
	[EmployeeCategory] [varchar](50) NULL,
	[EntryDate] [datetime] NULL,
	[DepartmentNo] [varchar](50) NULL,
	[DepartmentName] [varchar](80) NULL,
	[GroupNo] [varchar](50) NULL,
	[GroupName] [varchar](80) NULL,
	[Line_No] [varchar](50) NULL,
	[LineName] [varchar](80) NULL,
	[IDNumber] [varchar](80) NULL,
	[IssuingAuthority] [varchar](255) NULL,
	[DateOfIssue] [datetime] NULL,
	[IDTermOfValidity] [varchar](50) NULL,
	[BirthDay] [datetime] NULL,
	[PlaceOrigin] [varchar](50) NOT NULL,
	[Nation] [varchar](50) NULL,
	[HomeAddress] [varchar](255) NULL,
	[AttendanceData] [datetime] NULL,
	[AttendanceRegulations] [varchar](50) NULL,
	[CompletionData] [datetime] NULL,
	[ProbationPeriod] [bit] NULL,
	[SalaryCategory] [varchar](50) NULL,
	[Introducer] [varchar](50) NULL,
	[PositionsGrade] [varchar](50) NULL,
	[Rank] [varchar](50) NULL,
	[LogicalCardNumber] [varchar](50) NULL,
	[PhysicalCardNumber] [varchar](50) NULL,
	[PhoneNumber] [varchar](50) NULL,
	[EmergencyContact] [varchar](50) NULL,
	[EmergencyContactPhone] [varchar](50) NULL,
	[EmErgencyContactAddress] [varchar](255) NULL,
	[PaymentMode] [varchar](50) NULL,
	[Height] [varchar](50) NULL,
	[Weight] [varchar](50) NULL,
	[LeftEyeVision] [varchar](50) NULL,
	[RightEyeVision] [varchar](50) NULL,
	[note] [varchar](255) NULL,
	[ContractNumber] [varchar](50) NULL,
	[ContractSigning] [datetime] NULL,
	[ExpirationContract] [datetime] NULL,
	[IDCardPeriod] [datetime] NULL,
	[Job] [bit] NULL,
	[leaveDate] [datetime] NULL,
	[TurnoverType] [varchar](50) NULL,
	[ReasonsForLeaving] [varchar](255) NULL,
	[Blacklist] [bit] NULL,
	[married] [bit] NULL,
	[FreeCard] [bit] NULL,
	[OvertimeApplication] [bit] NULL,
	[createddate] [datetime] NULL,
	[FilingMan] [varchar](50) NULL,
	[modificationDate] [datetime] NULL,
	[Modifier] [varchar](50) NULL,
	[workType] [varchar](50) NULL,
	[workGrade] [varchar](50) NULL,
	[Photo] [bit] NULL,
	[MinimalSector] [varchar](50) NULL,
 CONSTRAINT [PK_TimeAttendance_Employee_File] PRIMARY KEY CLUSTERED 
(
	[JobNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
