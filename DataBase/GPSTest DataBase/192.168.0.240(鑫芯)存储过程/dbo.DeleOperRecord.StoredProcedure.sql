USE [GPSTest]
GO
/****** Object:  StoredProcedure [dbo].[DeleOperRecord]    Script Date: 11/23/2017 11:35:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[DeleOperRecord] 
@iOperName integer,
@OperName varchar(20),
@OperTimeStart datetime,
@OperTimeEnd datetime
AS
BEGIN
  if @iOperName = 1   --1没有指定删除哪个操作用户,0指定操作用户
    Delete  from Gps_OperRecord where OperTime between @OperTimeStart and @OperTimeEnd
  else
	Delete  from Gps_OperRecord where OperName =@OperName and  OperTime between @OperTimeStart and @OperTimeEnd
	
END
GO
