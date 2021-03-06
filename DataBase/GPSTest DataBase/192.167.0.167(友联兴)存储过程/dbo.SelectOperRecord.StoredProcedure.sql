USE [GPSTest]
GO
/****** Object:  StoredProcedure [dbo].[SelectOperRecord]    Script Date: 11/23/2017 11:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[SelectOperRecord] 
@iOperName integer,
@OperName varChar(20),
@OperTimeStart datetime,
@OperTimeEnd datetime,
@cResult integer output
AS 
	SET @cResult=1
	
  if @iOperName = 1 
  begin 
	SELECT * 
	from dbo.Gps_OperRecord 
	where OperName = @OperName and OperTime between @OperTimeStart and @OperTimeEnd
  end
  else
  begin
    SELECT * 
	from dbo.Gps_OperRecord 
	where OperName like '%'+@OperName+'%' and OperTime between @OperTimeStart and @OperTimeEnd
  end

	IF @@rowcount<1 
	BEGIN		
		SET @cResult=0
	END
GO
