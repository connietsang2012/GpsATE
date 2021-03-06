USE [GPSTest]
GO
/****** Object:  StoredProcedure [dbo].[DeleteTestResult_Twice]    Script Date: 11/23/2017 11:35:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteTestResult_Twice] 
@cFormName 	NVARCHAR(30),
@iImeiOrRid	integer,			--1为IMEI，0为RID
@cImei		VARCHAR(15),
@cChipRid	VARCHAR(32),
@cVersion	VARCHAR(50),
@cTesterId	VARCHAR(20),
@iRecordCount	integer output
AS
begin
	DECLARE  @cFormNamebackup  NVARCHAR(40) 
    	DECLARE  @SqlStr  NVARCHAR(2000)

	set @cFormNamebackup = @cFormName +'_BackUp'

	if @iImeiOrRid=1
		set  @SqlStr='select *  from  ['+ @cFormName + ']  where  [IMEI] = '''+@cImei+'''and Version = '''+@cVersion+''''
	else
		set  @SqlStr='select *  from  ['+ @cFormName + ']  where  [SN] = '''+@cChipRid+'''and Version = '''+@cVersion+'''' 
    	exec(@SqlStr ) 
    
	if(@@rowcount <1) 
		set @iRecordCount=0 
	else
		set @iRecordCount=1

	
	
	if @iRecordCount=1
	begin
		if @iImeiOrRid=1
		begin	
			set  @SqlStr='insert  into ['+ @cFormNamebackup+'] (SN,SoftModel,Version,IMEI,Result,TesterId,Remark)'
			set  @SqlStr=@SqlStr+'	select SN,SoftModel,Version,IMEI,Result,TesterId,Remark from ['+ @cFormName+']where [IMEI] = '''+@cImei+'''and Version = '''+@cVersion+''''
			exec(@SqlStr)
			if(@@rowcount >=1)
			begin 
				set  @SqlStr='update '+ @cFormNamebackup +' set TesterId=''' + @cTesterId + '''where [IMEI] = '''+@cImei+'''and Version = '''+@cVersion+''''
				exec(@SqlStr )
			end
			if(@@rowcount >=1)
			begin
				set  @SqlStr='delete from '+@cFormName+' where [IMEI] = '''+@cImei+'''and Version = '''+@cVersion+''''
				exec(@SqlStr)
			end
		end
		else
		begin
			set  @SqlStr='insert  into ['+ @cFormNamebackup+'] (SN,SoftModel,Version,IMEI,Result,TesterId,Remark)'
			set  @SqlStr=@SqlStr+'	select SN,SoftModel,Version,IMEI,Result,TesterId,Remark from ['+ @cFormName +'] where [SN] = '''+@cChipRid+'''and Version = '''+@cVersion+''''
			exec(@SqlStr)
			if(@@rowcount >=1)
			begin 
				set  @SqlStr='update ['+ @cFormNamebackup +'] set TesterId= ''' + @cTesterId +''' where [SN] = '''+@cChipRid+'''and Version = '''+@cVersion+''''
				exec(@SqlStr )
			end
			if(@@rowcount >=1)
			begin
				set  @SqlStr='delete from ['+@cFormName+'] where [SN] = '''+@cChipRid+'''and Version = '''+@cVersion+''''
				exec(@SqlStr)
			end
			
			
		end
	end
	
	if(@@rowcount <1) 
		set @iRecordCount=0 
	else
		set @iRecordCount=1	

end
GO
