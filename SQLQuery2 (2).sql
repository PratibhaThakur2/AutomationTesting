USE [SAIBA]
GO
/****** Object:  StoredProcedure [dbo].[GICustContactDetail]    Script Date: 6/2/2020 9:54:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Deepanshu>
-- Create date: <23-10-2018>
-- Description:	<Description,,>
-- =============================================
--Exec GICustContactDetail '' and ( Upper(C.type)=''1234'' OR Upper(C.type)=''12345'' OR Upper(C.type)=''ABC'' OR Upper(C.type)=''ACCOUNTS'' OR Upper(C.type)=''ACZ'' OR Upper(C.type)=''ALL'')'
ALTER PROCEDURE [dbo].[GICustContactDetail]
	@Cond varchar(max)
AS
BEGIN
	Declare @Str varchar(Max)
	Set @Str='SELECT RM.auto_id as RMCode, RM.name as [RM Name], B.Branchcode, B.name as [Branch Name], P.POSID, P.Name as [CSC Name],
	ref.Auto_id as RefCode,  ref.name as [Ref.Name], C.name as [CustomerName], C.CustId as [CustShortName],
	C.DOB, C.auto_id as [CustCode], C.CustGroup, C.type as Vertical, C.business_type as [Industry Segment],
	C.org_type as [Form of Org], C.MandateStatus as [Mandate Status], C.MandateDate as [Mandate Valid From],
	C.MandateToDate as [Mandate Valid To], C.MultiBranch as [Multi Branch],  C.Category as [Customer Category],
	C.Address, C.City, C.Pin as [Pincode],C.Mobile, C.Phone, C.Email,C.PAN, C.AadhaarNo as [Aadhar No.],C.GSTIN,
	C.CustOccupation,CG.IDATE as [Group Insert Date],c.address2,c.email2,c.phone2,

    STUFF((SELECT '', '' + CAST(name AS VARCHAR(1000)) 
    FROM Cust_Contact WHERE Sno=1 and 
	cust_code = C.auto_id FOR XML PATH(''''), TYPE).value(''.'',''NVARCHAR(MAX)''),1,2,'' '') ContactPerson1,
	STUFF((SELECT '', '' + CAST(relation AS VARCHAR(1000)) FROM Cust_Contact WHERE Sno=1 and cust_code = C.auto_id
	FOR XML PATH(''''), TYPE).value(''.'',''NVARCHAR(MAX)''),1,2,'' '') [Desg./Relation1],
	STUFF((SELECT '', '' + CAST(CMobile AS VARCHAR(1000)) FROM Cust_Contact WHERE Sno=1 and cust_code = C.auto_id
	FOR XML PATH(''''), TYPE).value(''.'',''NVARCHAR(MAX)''),1,2,'' '') [Mobile1],
	STUFF((SELECT '', '' + CAST(cmail AS VARCHAR(1000)) FROM Cust_Contact WHERE Sno=1 and cust_code = C.auto_id
	FOR XML PATH(''''), TYPE).value(''.'',''NVARCHAR(MAX)''),1,2,'' '') [ContactEmail1], 

	STUFF((SELECT '', '' + CAST(name AS VARCHAR(1000)) 
    FROM Cust_Contact WHERE Sno=2 and 
	cust_code = C.auto_id FOR XML PATH(''''), TYPE).value(''.'',''NVARCHAR(MAX)''),1,2,'' '') ContactPerson2,
	STUFF((SELECT '', '' + CAST(relation AS VARCHAR(1000)) FROM Cust_Contact WHERE Sno=2 and cust_code = C.auto_id
	FOR XML PATH(''''), TYPE).value(''.'',''NVARCHAR(MAX)''),1,2,'' '') [Desg./Relation2],
	STUFF((SELECT '', '' + CAST(CMobile AS VARCHAR(1000)) FROM Cust_Contact WHERE Sno=2 and cust_code = C.auto_id
	FOR XML PATH(''''), TYPE).value(''.'',''NVARCHAR(MAX)''),1,2,'' '') [Mobile2],
	STUFF((SELECT '', '' + CAST(cmail AS VARCHAR(1000)) FROM Cust_Contact WHERE Sno=2 and cust_code = C.auto_id
	FOR XML PATH(''''), TYPE).value(''.'',''NVARCHAR(MAX)''),1,2,'' '') [ContactEmail2], 

	STUFF((SELECT '', '' + CAST(name AS VARCHAR(1000)) 
    FROM Cust_Contact WHERE Sno=3 and 
	cust_code = C.auto_id FOR XML PATH(''''), TYPE).value(''.'',''NVARCHAR(MAX)''),1,2,'' '') ContactPerson3,
	STUFF((SELECT '', '' + CAST(relation AS VARCHAR(1000)) FROM Cust_Contact WHERE Sno=3 and cust_code = C.auto_id
	FOR XML PATH(''''), TYPE).value(''.'',''NVARCHAR(MAX)''),1,2,'' '') [Desg./Relation3],
	STUFF((SELECT '', '' + CAST(CMobile AS VARCHAR(1000)) FROM Cust_Contact WHERE Sno=3 and cust_code = C.auto_id
	FOR XML PATH(''''), TYPE).value(''.'',''NVARCHAR(MAX)''),1,2,'' '') [Mobile3],
	STUFF((SELECT '', '' + CAST(cmail AS VARCHAR(1000)) FROM Cust_Contact WHERE Sno=3 and cust_code = C.auto_id
	FOR XML PATH(''''), TYPE).value(''.'',''NVARCHAR(MAX)''),1,2,'' '') [ContactEmail3],
	C.UserId as IUser, C.I_Date as [IDate], C.XJLT
	FROM cust_master C
	Left Join CustomerGroup as CG on C.CustGroup=CG.GroupName
	Left join Branch_master as B on C.BranchCode=B.branchcode
	Left join POSMaster as P on C.CSCCode=P.POSID
	left join agent_master as RM on c.RMCode=Rm.auto_id
	left join agent_master as ref on C.RefCode=ref.auto_id
	WHere 1=1 '+@Cond+''
	--Print (@Str)
	Exec (@Str)
END


