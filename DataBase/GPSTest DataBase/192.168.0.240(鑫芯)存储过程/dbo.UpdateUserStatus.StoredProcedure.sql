USE [GPSTest]
GO
/****** Object:  StoredProcedure [dbo].[UpdateUserStatus]    Script Date: 11/23/2017 11:35:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateUserStatus] 

AS
BEGIN
	UPDATE Gps_User SET LoginStatus=0 WHERE LoginStatus=1
END
GO
