USE [SAIBA]
GO
/****** Object:  StoredProcedure [dbo].[GIReportCustomerPartnerBroker]    Script Date: 6/2/2020 9:55:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Deepanshu>
-- Create date: <17-01-2020>
-- Description:	<Description,,>
-- =============================================
--Exec GIReportCustomerPartnerBroker ' ANd 1=1'
ALTER PROCEDURE [dbo].[GIReportCustomerPartnerBroker]
	@Cond nvarchar(Max)
AS
BEGIN
	Declare @str nVarchar(Max)
	Set @str='Select cust_master.name as CustomerName, cust_master.Auto_id as CustCode, cust_master.CustID, 
	cust_master.CustGroup, cust_master.type, BT.IndusType, cust_master.business_type, cust_master.address,
	cust_master.city, cust_master.pin, cust_master.mobile, cust_master.phone, cust_master.email, 
	cust_master.PAN, cust_master.AadhaarNo, cust_master.GSTIN, B.name as BranchName, cust_master.userid, cust_master.i_date, POSMaster.POSID,
	POSMaster.Name as CSCName, agent_master.auto_id as RMCode, agent_master.name as RMName, cust_master.CustOccupation,cust_master.XJLT,
	Main.NetworkPartnerName, Main.NetworkPartnerAddress, Main.NetworkPartnerContactName,
	Main.NetworkPartnerContactEmail, CG.IDATE,cust_master.address2,cust_master.email2,cust_master.phone2
	from cust_master as cust_master 
	Left join CustomerGroup as CG on cust_master.CustGroup=CG.GroupName
	Inner Join branch_master as B on cust_master.BranchCode=B.branchcode
	Left Join agent_master as agent_master on cust_master.RMCode=agent_master.auto_id
	Left Join POSMaster as POSMaster on cust_master.CSCCode=POSMaster.POSID
	Left Join Bus_Type as BT on cust_master.business_type=BT.Bus_Type
	Left Join (Select Distinct Cust_Code from gene_master) as GM on cust_master.Auto_id=GM.Cust_Code
	Left Join (Select * from(Select Row_Number() Over(Partition by g.Cust_Code, C.CoBroK_id Order by g.auto_id) as Sno, C.CoBroK_id, C.control_no,
	cm.Name as NetworkPartnerName, cm.address as NetworkPartnerAddress, cc.name as NetworkPartnerContactName,
	cc.EMail as NetworkPartnerContactEmail, g.cust_code
	From gene_master as g Inner Join commision_data as C on g.Control_no=C.control_no and C.instno=''0''
	Inner join cobroker_master as cm on C.CoBroK_id=cm.CoBrokerCode
	Left Join cobroker_contact as cc on cm.CoBrokerCode=cc.CoBrok_code and cc.sno=1
	WHere C.PartnerBroker=''P'' and C.instno=''0'') CD Where CD.Sno=1) as Main on cust_master.auto_id=Main.cust_code
	Where 1=1 '+@Cond
	Print (@str)
	Exec sp_executesql @str,N'@Cond nvarchar(Max)',
	@Cond=@Cond
END
