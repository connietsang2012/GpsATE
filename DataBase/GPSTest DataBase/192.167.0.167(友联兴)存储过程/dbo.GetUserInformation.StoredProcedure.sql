USE [GPSTest]
GO
/****** Object:  StoredProcedure [dbo].[GetUserInformation]    Script Date: 11/23/2017 11:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUserInformation] 
@cUserName varchar(20),
@cUserPwd varchar(20),
@cUserDes varchar (20) output,
@cUserType varchar (20) output,
@cUserTestPlan varchar(20) output,
@cResult integer output
AS 
	SET @cResult=1
	SELECT @cUserDes=UserDes,@cUserType=UserType,@cUserTestPlan=UserTestPlan
	FROM gps_user 
	WHERE username=@cUserName and userpwd=@cUserPwd
	

	IF @@rowcount<1 
	BEGIN		
		SET @cResult=0
		SET @cUserDes=''
		SET @cUserType=''
		SET @cUserTestPlan=''
	END
GO
