USE [GPSTest]
GO
/****** Object:  StoredProcedure [dbo].[InsertOperRecord]    Script Date: 01/08/2014 17:00:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[InsertOperRecord] 
	-- Add the parameters for the stored procedure here
@cOperName char(20),
@cOperContent char(250),
@cOperTime datetime,
@cOperDemo char(250)
AS
BEGIN
      INSERT INTO Gps_OperRecord(OperName,OperContent,OperTime,OperDemo)
      VALUES (@cOperName,@cOperContent,@cOperTime,@cOperDemo)
END
