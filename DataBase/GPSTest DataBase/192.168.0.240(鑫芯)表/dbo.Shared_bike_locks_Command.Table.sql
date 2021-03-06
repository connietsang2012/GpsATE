USE [GPSTest]
GO
/****** Object:  Table [dbo].[Shared_bike_locks_Command]    Script Date: 11/23/2017 11:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Shared_bike_locks_Command](
	[Command] [varchar](100) NOT NULL,
	[SQLstring] [varchar](8000) NOT NULL,
 CONSTRAINT [PK_Shared_bike_locks_Command] PRIMARY KEY CLUSTERED 
(
	[Command] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
