USE [GPSTest]
GO
/****** Object:  Table [dbo].[TimeAttendance_BasicShiftSchedule]    Script Date: 11/23/2017 11:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TimeAttendance_BasicShiftSchedule](
	[BasicNo] [varchar](50) NOT NULL,
	[BasicName] [varchar](80) NOT NULL,
	[GoToWork1] [datetime] NULL,
	[GoFfoWork1] [datetime] NULL,
	[GoToWork2] [datetime] NULL,
	[GoFfoWork2] [datetime] NULL,
	[GoToWork3] [datetime] NULL,
	[GoFfoWork3] [datetime] NULL,
	[GoToWork4] [datetime] NULL,
	[GoFfoWork4] [datetime] NULL,
	[PushBackMinutes1] [int] NULL,
	[MinutesAheadOfTime1] [int] NULL,
	[OvertimeAfterPush1] [bit] NULL,
	[PositiveShiftHours1] [int] NULL,
	[OvertimeHours1] [int] NULL,
	[MinutesLate1] [int] NULL,
	[LeaveEarlyMinutes1] [int] NULL,
	[AdvanceOvertime1] [bit] NULL,
	[MinutesDeducted1] [int] NULL,
	[SupplyMinutes1] [int] NULL,
	[PushBackMinutes2] [int] NULL,
	[MinutesAheadOfTime2] [int] NULL,
	[OvertimeAfterPush2] [bit] NULL,
	[PositiveShiftHours2] [int] NULL,
	[OvertimeHours2] [int] NULL,
	[MinutesLate2] [int] NULL,
	[LeaveEarlyMinutes2] [int] NULL,
	[AdvanceOvertime2] [bit] NULL,
	[MinutesDeducted2] [int] NULL,
	[SupplyMinutes2] [int] NULL,
	[PushBackMinutes3] [int] NULL,
	[MinutesAheadOfTime3] [int] NULL,
	[OvertimeAfterPush3] [bit] NULL,
	[PositiveShiftHours3] [int] NULL,
	[OvertimeHours3] [int] NULL,
	[MinutesLate3] [int] NULL,
	[LeaveEarlyMinutes3] [int] NULL,
	[AdvanceOvertime3] [bit] NULL,
	[MinutesDeducted3] [int] NULL,
	[SupplyMinutes3] [int] NULL,
	[PushBackMinutes4] [int] NULL,
	[MinutesAheadOfTime4] [int] NULL,
	[OvertimeAfterPush4] [bit] NULL,
	[PositiveShiftHours4] [int] NULL,
	[OvertimeHours4] [int] NULL,
	[MinutesLate4] [int] NULL,
	[LeaveEarlyMinutes4] [int] NULL,
	[AdvanceOvertime4] [bit] NULL,
	[MinutesDeducted4] [int] NULL,
	[SupplyMinutes4] [int] NULL,
	[PositiveShiftHours] [int] NULL,
	[OvertimeHours] [int] NULL,
	[LateDeduction] [int] NULL,
	[LeaveEarlyToDeduct] [int] NULL,
	[note] [varchar](255) NULL,
	[createdDate] [datetime] NULL,
	[FilingMan] [varchar](50) NULL,
	[NightShift] [bit] NULL,
	[IntelligentShift] [bit] NULL,
	[AutomaticOvertime] [bit] NULL,
	[GoToWork1AndGoFfoWork2] [int] NULL,
	[GoToWork2AndGoFfoWork3] [int] NULL,
	[GoToWork3AndGoFfoWork4] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
