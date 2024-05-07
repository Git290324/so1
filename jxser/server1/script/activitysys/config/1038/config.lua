Include("\\script\\activitysys\\config\\1038\\variables.lua")
Include("\\script\\activitysys\\config\\1038\\awardlist.lua")
tbConfig = {}
tbConfig[1] = 
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "H»ng Nga",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:AddInitNpcHangNga",	{nil} },
	},
}
tbConfig[2] =
{
	nId = 2,
	szMessageType = "ClickNpc",
	szName = "click H»ng Nga",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"H»ng Nga"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{30,"",">="} },
	},
	tbActition = 
	{
		{"SetDialogTitle",	{"<npc>H«m nay lµ TÕt trung thu <enter>Lßng vui nh­ héi em ®i r­íc ®Ìn <enter>§Ìn c¸ chÐp, ®Ìn «ng sao<enter>Mu«n mµu mu«n vÎ lung linh phè ph­êng.<enter>H·y ®Õn chç ta tham gia c¸c ho¹t ®éng Trung Thu 2021. Quý ®¹i hiÖp cã <color=green>cÊp ®é tõ 30 trë lªn<color> trong qu¸ tr×nh hµnh tÈu giang hå sÏ nhËn ®­îc c¸c vËt phÈm sù kiÖn, thu thËp ®Çy ®ñ vµ ®Õn chç ta sÏ nhËn nhiÒu phÇn th­ëng hÊp dÉn. Ta phô tr¸ch <color=green>GhÐp lång ®Ìn<color> vµ nhËn th­ëng."} },			
		{"AddDialogOpt",	{"GhÐp Lång ®Ìn ",3} },
		{"AddDialogOpt",	{"TÆng Lång §Ìn KÐo Qu©n cho H»ng Nga ",30} },
		{"AddDialogOpt",	{"NhËn phÇn th­ëng ®¹t mèc Lång ®Ìn b­¬m b­ím",15} },		
		{"AddDialogOpt",	{"NhËn phÇn th­ëng ®¹t mèc Lång ®Ìn ng«i sao",18} },		
		{"AddDialogOpt",	{"NhËn phÇn th­ëng ®¹t mèc Lång ®Ìn èng",21} },		
		{"AddDialogOpt",	{"NhËn phÇn th­ëng ®¹t mèc Lång ®Ìn trßn",24} },		
		{"AddDialogOpt",	{"NhËn phÇn th­ëng ®¹t mèc Lång ®Ìn c¸ chÐp",27} },		

	},
}

tbConfig[3] =
{
	nId = 3,
	szMessageType = "CreateDialog",
	szName = "Ghep phan thuong",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Mçi lo¹i lång ®Ìn sÏ cÇn c¸c nguyªn liÖu kh¸c nhau. H·y thu thËp ®Çy ®ñ nhÐ.<enter>C¸c h¹ muèn ghÐp lång ®Ìn lo¹i nµo?"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{30,"",">="} },
	},
	tbActition = 
	{				
		{"AddDialogOpt",	{"GhÐp Lång ®Ìn b­¬m b­ím 2021",4}},
		{"AddDialogOpt",	{"GhÐp Lång ®Ìn ng«i sao 2021",5}},
		{"AddDialogOpt",	{"GhÐp Lång ®Ìn èng 2021",6}},
		{"AddDialogOpt",	{"GhÐp Lång ®Ìn trßn 2021",7}},
		{"AddDialogOpt",	{"GhÐp Lång ®Ìn c¸ chÐp 2021",8}},
		{"AddDialogOpt",	{"GhÐp Lång ®Ìn kÐo qu©n 2021",9}},
	},
}

tbConfig[4] = 
{
	nId = 4,
	szMessageType = "CreateCompose",
	szName = "Ta muèn GhÐp Lång ®Ìn b­¬m b­ím 2021",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<color=green>Lång ®Ìn b­¬m b­ím 2021<color>",1,1,1,0.04},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{30,"§¼ng cÊp cña ng­¬i kh«ng ®ñ, lÇn sau h·y ®Õn nhÐ!",">="} },
		{"AddOneMaterial",	{ITEM_MATERIAL_1.szName,ITEM_MATERIAL_1,1} }, -- 1 Tre
		{"AddOneMaterial",	{ITEM_MATERIAL_2.szName,ITEM_MATERIAL_2,1} }, -- 1 Coi
		{"AddOneMaterial",	{ITEM_MATERIAL_3.szName,ITEM_MATERIAL_3,1} }, -- 1 Nen
		{"AddOneMaterial",	{ITEM_MATERIAL_4.szName,ITEM_MATERIAL_4,2} }, -- 2 Giay kieng vang
		{"AddOneMaterial",	{MONEY.szName,MONEY,1000} },		
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_AWARD_1,1,EVENT_LOG_TITLE,"GhepLongDenBuomBuom"} },
	},
}
tbConfig[5] = 
{
	nId = 5,
	szMessageType = "CreateCompose",
	szName = "Ta muèn GhÐp Lång ®Ìn ng«i sao 2021",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<color=green>Lång ®Ìn ng«i sao 2021<color>",1,1,1,0.04},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{30,"§¼ng cÊp cña ng­¬i kh«ng ®ñ, lÇn sau h·y ®Õn nhÐ!",">="} },
		{"AddOneMaterial",	{ITEM_MATERIAL_1.szName,ITEM_MATERIAL_1,1} }, -- 1 Tre
		{"AddOneMaterial",	{ITEM_MATERIAL_2.szName,ITEM_MATERIAL_2,1} }, -- 1 Coi
		{"AddOneMaterial",	{ITEM_MATERIAL_3.szName,ITEM_MATERIAL_3,1} }, -- 1 Nen
		{"AddOneMaterial",	{ITEM_MATERIAL_5.szName,ITEM_MATERIAL_5,2} }, -- 2 Giay kieng lam
		{"AddOneMaterial",	{MONEY.szName,MONEY,2000} },		
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_AWARD_2,1,EVENT_LOG_TITLE,"GhepLongDenNgoiSao"} },
	},
}
tbConfig[6] = 
{
	nId = 6,
	szMessageType = "CreateCompose",
	szName = "Ta muèn GhÐp Lång ®Ìn èng 2021",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<color=green>Lång ®Ìn èng 2021<color>",1,1,1,0.04},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{30,"§¼ng cÊp cña ng­¬i kh«ng ®ñ, lÇn sau h·y ®Õn nhÐ!",">="} },
		{"AddOneMaterial",	{ITEM_MATERIAL_1.szName,ITEM_MATERIAL_1,1} }, -- 1 Tre
		{"AddOneMaterial",	{ITEM_MATERIAL_2.szName,ITEM_MATERIAL_2,1} }, -- 1 Coi
		{"AddOneMaterial",	{ITEM_MATERIAL_3.szName,ITEM_MATERIAL_3,1} }, -- 1 Nen
		{"AddOneMaterial",	{ITEM_MATERIAL_6.szName,ITEM_MATERIAL_6,2} }, -- 2 Giay kieng luc
		{"AddOneMaterial",	{MONEY.szName,MONEY,3000} },		
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_AWARD_3,1,EVENT_LOG_TITLE,"GhepLongDenOng"} },
	},
}
tbConfig[7] = 
{
	nId = 7,
	szMessageType = "CreateCompose",
	szName = "Ta muèn GhÐp Lång ®Ìn trßn 2021",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<color=green>Lång ®Ìn trßn 2021<color>",1,1,1,0.04},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{30,"§¼ng cÊp cña ng­¬i kh«ng ®ñ, lÇn sau h·y ®Õn nhÐ!",">="} },
		{"AddOneMaterial",	{ITEM_MATERIAL_1.szName,ITEM_MATERIAL_1,1} }, -- 1 Tre
		{"AddOneMaterial",	{ITEM_MATERIAL_2.szName,ITEM_MATERIAL_2,1} }, -- 1 Coi
		{"AddOneMaterial",	{ITEM_MATERIAL_3.szName,ITEM_MATERIAL_3,1} }, -- 1 Nen
		{"AddOneMaterial",	{ITEM_MATERIAL_7.szName,ITEM_MATERIAL_7,2} }, -- 2 Giay kieng do
		{"AddOneMaterial",	{MONEY.szName,MONEY,1000} },		
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_AWARD_4,1,EVENT_LOG_TITLE,"GhepLongDenTron"} },
	},
}
tbConfig[8] = 
{
	nId = 8,
	szMessageType = "CreateCompose",
	szName = "Ta muèn GhÐp Lång ®Ìn c¸ chÐp 2021",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<color=green>Lång ®Ìn c¸ chÐp 2021<color>",1,1,1,0.04},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{30,"§¼ng cÊp cña ng­¬i kh«ng ®ñ, lÇn sau h·y ®Õn nhÐ!",">="} },
		{"AddOneMaterial",	{ITEM_MATERIAL_1.szName,ITEM_MATERIAL_1,1} }, -- 1 Tre
		{"AddOneMaterial",	{ITEM_MATERIAL_2.szName,ITEM_MATERIAL_2,1} }, -- 1 Coi
		{"AddOneMaterial",	{ITEM_MATERIAL_3.szName,ITEM_MATERIAL_3,1} }, -- 1 Nen
		{"AddOneMaterial",	{ITEM_MATERIAL_8.szName,ITEM_MATERIAL_8,2} }, -- 2 Giay kieng cam
		{"AddOneMaterial",	{MONEY.szName,MONEY,5000} },		
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_AWARD_5,1,EVENT_LOG_TITLE,"GhepLongDenCaChep"} },
	},
}
tbConfig[9] = 
{
	nId = 9,
	szMessageType = "CreateCompose",
	szName = "Ta muèn GhÐp Lång ®Ìn kÐo qu©n 2021",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<color=yellow>Lång ®Ìn kÐo qu©n 2021<color>",1,1,1,0.04},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{30,"§¼ng cÊp cña ng­¬i kh«ng ®ñ, lÇn sau h·y ®Õn nhÐ!",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{4, ""}},
		{"AddOneMaterial",	{ITEM_MATERIAL_1.szName,ITEM_MATERIAL_1,1} }, -- 1 Tre
		{"AddOneMaterial",	{ITEM_MATERIAL_2.szName,ITEM_MATERIAL_2,1} }, -- 1 Coi
		{"AddOneMaterial",	{ITEM_MATERIAL_3.szName,ITEM_MATERIAL_3,1} }, -- 1 Nen
		{"AddOneMaterial",	{ITEM_MATERIAL_4.szName,ITEM_MATERIAL_4,2} }, -- 2 Giay kieng vang
		{"AddOneMaterial",	{ITEM_MATERIAL_5.szName,ITEM_MATERIAL_5,2} }, -- 2 Giay kieng lam
		{"AddOneMaterial",	{ITEM_MATERIAL_6.szName,ITEM_MATERIAL_6,2} }, -- 2 Giay kieng luc
		{"AddOneMaterial",	{ITEM_MATERIAL_7.szName,ITEM_MATERIAL_7,2} }, -- 2 Giay kieng do
		{"AddOneMaterial",	{ITEM_MATERIAL_8.szName,ITEM_MATERIAL_8,2} }, -- 2 Giay kieng cam
		{"AddOneMaterial",	{MONEY.szName,MONEY,1000000} },		
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_AWARD_6,1,EVENT_LOG_TITLE,"GhepLongDenKeoQuan"} },
	},
}

tbConfig[10] = 
{
	nId = 10,
	szMessageType = "ItemScript",
	szName = "Sö dông Lång ®Ìn b­¬m b­ím",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_AWARD_1},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{30,"default",">="} },				
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_BUOMBUOM, tbBITTSK_LIMIT_USE_BUOMBUOM.nMaxValue, "Sö dông vËt phÈm qu¸ giíi h¹n, kh«ng thÓ sö dông thªm", "<"}},	
		{"PlayerFunLib:CheckFreeBagCellWH",	{1,1,1,"default"} },
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_LIMIT_USE_BUOMBUOM, 1}},
		--{"PlayerFunLib:AddExp",	{50000,0,EVENT_LOG_TITLE,"SuDungLongDenBuomBuom"} },
		{"ThisActivity:UseLongDenBuomBuom",	{nil} },			
	},
}

tbConfig[11] = 
{
	nId = 11,
	szMessageType = "ItemScript",
	szName = "Sö dông Lång ®Ìn ng«i sao",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_AWARD_2},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{30,"default",">="} },				
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_NGOISAO, tbBITTSK_LIMIT_USE_NGOISAO.nMaxValue, "Sö dông vËt phÈm qu¸ giíi h¹n, kh«ng thÓ sö dông thªm", "<"}},	
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_LIMIT_USE_NGOISAO, 1}},
		--{"PlayerFunLib:AddExp",	{70000,0,EVENT_LOG_TITLE,"SuDungLongDenNgoiSao"} },
		{"ThisActivity:UseLongDenNgoiSao", 	{nil} },
	},
}

tbConfig[12] = 
{
	nId = 12,
	szMessageType = "ItemScript",
	szName = "Sö dông Lång ®Ìn èng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_AWARD_3},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{40,"default",">="} },				
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_ONG, tbBITTSK_LIMIT_USE_ONG.nMaxValue, "Sö dông vËt phÈm qu¸ giíi h¹n, kh«ng thÓ sö dông thªm", "<"}},	
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_LIMIT_USE_ONG, 1}},
		--{"PlayerFunLib:AddExp",	{90000,0,EVENT_LOG_TITLE,"SuDungLongDenOng"} },
		{"ThisActivity:UseLongDenOng", 	{nil} },

	},
}

tbConfig[13] = 
{
	nId = 13,
	szMessageType = "ItemScript",
	szName = "Sö dông Lång ®Ìn trßn",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_AWARD_4},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{50,"default",">="} },				
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_TRON, tbBITTSK_LIMIT_USE_TRON.nMaxValue, "Sö dông vËt phÈm qu¸ giíi h¹n, kh«ng thÓ sö dông thªm", "<"}},	
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_LIMIT_USE_TRON, 1}},
		--{"PlayerFunLib:AddExp",	{90000,0,EVENT_LOG_TITLE,"SuDungLongDenTron"} },
		{"ThisActivity:UseLongDenTron", 	{nil} },

	},
}
tbConfig[14] = 
{
	nId = 14,
	szMessageType = "ItemScript",
	szName = "Sö dông Lång ®Ìn c¸ chÐp",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_AWARD_5},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{4,"default"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"default",">="} },				
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_CACHEP, tbBITTSK_LIMIT_USE_CACHEP.nMaxValue, "Sö dông vËt phÈm qu¸ giíi h¹n, kh«ng thÓ sö dông thªm", "<"}},	
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_LIMIT_USE_CACHEP, 1}},
		--{"PlayerFunLib:AddExp",	{120000,0,EVENT_LOG_TITLE,"SuDungLongDenCaChep"} },
		{"ThisActivity:UseLongDenCaChep", 	{nil} },
	},
}
tbConfig[15] =
{
	nId = 15,
	szMessageType = "CreateDialog",
	szName = "Nhan thuong dat moc",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Khi sö dông <color=green>Lång ®Ìn b­¬m b­ím<color> mèc 10, 100, cã thÓ ®Õn gÆp ta ®Ó nhËn th­ëng. HiÖn t¹i ®¹i hiÖp ®· sö dông <color=green><lua GetBitTask(4100, 1, 16) /><color> Lång ®Ìn b­¬m b­ím"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{60,"default",">="} },			
	},
	tbActition = 
	{		
		{"AddDialogOpt",	{"Th­ëng ®¹t mèc 10 Lång ®Ìn b­¬m b­ím",16} },
		{"AddDialogOpt",	{"Th­ëng ®¹t mèc 100 Lång ®Ìn b­¬m b­ím",17} },
	},
}
tbConfig[16] = 
{
	nId = 16,
	szMessageType = "nil",
	szName = "Th­ëng ®¹t mèc 10 Lång ®Ìn b­¬m b­ím",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbBITTSK_LIMIT_USE_BUOMBUOM_COUNT,10,"Yªu cÇu sö dông Lång ®Ìn b­¬m b­ím ®¹t <color=red>10<color> lÇn trë lªn míi nhËn ®­îc phÇn th­ëng nµy.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_BUOMBUOM_MOC10,0,"Ng­¬i ®· nhËn phÇn th­ëng nµy råi","=="} },
		{"PlayerFunLib:CheckFreeBagCell",	{4,"default"} },
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:setBitTask",	{tbTSK_INFO_BUOMBUOM_MOC10,1} },
		{"PlayerFunLib:GetItem",	{tbAward_BuomBuom_Moc["10"],1,EVENT_LOG_TITLE,"NhanThuongLongDenBuomBuom10Lan"} },
	},
}
tbConfig[17] = 
{
	nId = 17,
	szMessageType = "nil",
	szName = "Th­ëng ®¹t mèc 100 Lång ®Ìn b­¬m b­ím",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbBITTSK_LIMIT_USE_BUOMBUOM_COUNT,100,"Yªu cÇu sö dông Lång ®Ìn b­¬m b­ím ®¹t <color=red>100<color> lÇn trë lªn míi nhËn ®­îc phÇn th­ëng nµy.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_BUOMBUOM_MOC100,0,"Ng­¬i ®· nhËn phÇn th­ëng nµy råi","=="} },
		{"PlayerFunLib:CheckFreeBagCell",	{4,"default"} },
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:setBitTask",	{tbTSK_INFO_BUOMBUOM_MOC100,1} },
		{"PlayerFunLib:GetItem",	{tbAward_BuomBuom_Moc["100"],1,EVENT_LOG_TITLE,"NhanThuongLongDenBuomBuom100Lan"} },
	},
}

--Moc 10 100 ld ngoi sao
tbConfig[18] = 
{
	nId = 18,
	szMessageType = "CreateDialog",
	szName = "Nhan thuong dat moc",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Khi sö dông <color=green>Lång ®Ìn ng«i sao<color> mèc 10, 100, cã thÓ ®Õn gÆp ta ®Ó nhËn th­ëng. HiÖn t¹i ®¹i hiÖp ®· sö dông <color=green><lua GetBitTask(4101, 1, 16) /><color> Lång ®Ìn ng«i sao"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{60,"default",">="} },			
	},
	tbActition = 
	{		
		{"AddDialogOpt",	{"Th­ëng ®¹t mèc 10 Lång ®Ìn ng«i sao",19} },
		{"AddDialogOpt",	{"Th­ëng ®¹t mèc 100 Lång ®Ìn ng«i sao",20} },
	},
}
tbConfig[19] = 
{
	nId = 19,
	szMessageType = "nil",
	szName = "Th­ëng ®¹t mèc 10 Lång ®Ìn ng«i sao",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbBITTSK_LIMIT_USE_NGOISAO_COUNT,10,"Yªu cÇu sö dông Lång ®Ìn ng«i sao ®¹t <color=red>10<color> lÇn trë lªn míi nhËn ®­îc phÇn th­ëng nµy.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_NGOISAO_MOC10,0,"Ng­¬i ®· nhËn phÇn th­ëng nµy råi","=="} },
		{"PlayerFunLib:CheckFreeBagCell",	{4,"default"} },
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:setBitTask",	{tbTSK_INFO_NGOISAO_MOC10,1} },
		{"PlayerFunLib:GetItem",	{tbAward_NgoiSao_Moc["10"],1,EVENT_LOG_TITLE,"NhanThuongLongDenNgoiSao10Lan"} },
	},
}
tbConfig[20] = 
{
	nId = 20,
	szMessageType = "nil",
	szName = "Th­ëng ®¹t mèc 100 Lång ®Ìn ng«i sao",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbBITTSK_LIMIT_USE_NGOISAO_COUNT,100,"Yªu cÇu sö dông Lång ®Ìn ng«i sao ®¹t <color=red>100<color> lÇn trë lªn míi nhËn ®­îc phÇn th­ëng nµy.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_NGOISAO_MOC100,0,"Ng­¬i ®· nhËn phÇn th­ëng nµy råi","=="} },
		{"PlayerFunLib:CheckFreeBagCell",	{4,"default"} },
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:setBitTask",	{tbTSK_INFO_NGOISAO_MOC100,1} },
		{"PlayerFunLib:GetItem",	{tbAward_NgoiSao_Moc["100"],1,EVENT_LOG_TITLE,"NhanThuongLongDenNgoiSao100Lan"} },
	},
}

--Long den Ong
tbConfig[21] = 
{
	nId = 21,
	szMessageType = "CreateDialog",
	szName = "Nhan thuong dat moc",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Khi sö dông <color=green>Lång ®Ìn èng<color> mèc 10, 100, cã thÓ ®Õn gÆp ta ®Ó nhËn th­ëng. HiÖn t¹i ®¹i hiÖp ®· sö dông <color=green><lua GetBitTask(4102, 1, 16) /><color> Lång ®Ìn èng"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{60,"default",">="} },			
	},
	tbActition = 
	{		
		{"AddDialogOpt",	{"Th­ëng ®¹t mèc 10 Lång ®Ìn èng",22} },
		{"AddDialogOpt",	{"Th­ëng ®¹t mèc 100 Lång ®Ìn èng",23} },
	},
}
tbConfig[22] = 
{
	nId = 22,
	szMessageType = "nil",
	szName = "Th­ëng ®¹t mèc 10 Lång ®Ìn èng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbBITTSK_LIMIT_USE_ONG_COUNT,10,"Yªu cÇu sö dông Lång ®Ìn èng ®¹t <color=red>10<color> lÇn trë lªn míi nhËn ®­îc phÇn th­ëng nµy.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_ONG_MOC10,0,"Ng­¬i ®· nhËn phÇn th­ëng nµy råi","=="} },
		{"PlayerFunLib:CheckFreeBagCell",	{4,"default"} },
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:setBitTask",	{tbTSK_INFO_ONG_MOC10,1} },
		{"PlayerFunLib:GetItem",	{tbAward_Ong_Moc["10"],1,EVENT_LOG_TITLE,"NhanThuongLongDenOng10Lan"} },
	},
}
tbConfig[23] = 
{
	nId = 23,
	szMessageType = "nil",
	szName = "Th­ëng ®¹t mèc 100 Lång ®Ìn èng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbBITTSK_LIMIT_USE_ONG_COUNT,100,"Yªu cÇu sö dông Lång ®Ìn èng ®¹t <color=red>100<color> lÇn trë lªn míi nhËn ®­îc phÇn th­ëng nµy.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_ONG_MOC100,0,"Ng­¬i ®· nhËn phÇn th­ëng nµy råi","=="} },
		{"PlayerFunLib:CheckFreeBagCell",	{4,"default"} },
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:setBitTask",	{tbTSK_INFO_ONG_MOC100,1} },
		{"PlayerFunLib:GetItem",	{tbAward_Ong_Moc["100"],1,EVENT_LOG_TITLE,"NhanThuongLongDenOng100Lan"} },
	},
}

--Long den Tron
tbConfig[24] = 
{
	nId = 24,
	szMessageType = "CreateDialog",
	szName = "Nhan thuong dat moc",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Khi sö dông <color=green>Lång ®Ìn trßn<color> mèc 10, 100, cã thÓ ®Õn gÆp ta ®Ó nhËn th­ëng. HiÖn t¹i ®¹i hiÖp ®· sö dông <color=green><lua GetBitTask(4103, 1, 16) /><color> Lång ®Ìn trßn"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{60,"default",">="} },			
	},
	tbActition = 
	{		
		{"AddDialogOpt",	{"Th­ëng ®¹t mèc 10 Lång ®Ìn trßn",25} },
		{"AddDialogOpt",	{"Th­ëng ®¹t mèc 100 Lång ®Ìn trßn",26} },
	},
}
tbConfig[25] = 
{
	nId = 25,
	szMessageType = "nil",
	szName = "Th­ëng ®¹t mèc 10 Lång ®Ìn trßn",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbBITTSK_LIMIT_USE_TRON_COUNT,10,"Yªu cÇu sö dông Lång ®Ìn trßn ®¹t <color=red>10<color> lÇn trë lªn míi nhËn ®­îc phÇn th­ëng nµy.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_TRON_MOC10,0,"Ng­¬i ®· nhËn phÇn th­ëng nµy råi","=="} },
		{"PlayerFunLib:CheckFreeBagCell",	{4,"default"} },
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:setBitTask",	{tbTSK_INFO_TRON_MOC10,1} },
		{"PlayerFunLib:GetItem",	{tbAward_Tron_Moc["10"],1,EVENT_LOG_TITLE,"NhanThuongLongDenTron10Lan"} },
	},
}
tbConfig[26] = 
{
	nId = 26,
	szMessageType = "nil",
	szName = "Th­ëng ®¹t mèc 100 Lång ®Ìn trßn",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbBITTSK_LIMIT_USE_TRON_COUNT,100,"Yªu cÇu sö dông Lång ®Ìn trßn ®¹t <color=red>100<color> lÇn trë lªn míi nhËn ®­îc phÇn th­ëng nµy.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_TRON_MOC100,0,"Ng­¬i ®· nhËn phÇn th­ëng nµy råi","=="} },
		{"PlayerFunLib:CheckFreeBagCell",	{4,"default"} },
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:setBitTask",	{tbTSK_INFO_TRON_MOC100,1} },
		{"PlayerFunLib:GetItem",	{tbAward_Tron_Moc["100"],1,EVENT_LOG_TITLE,"NhanThuongLongDenTron100Lan"} },
	},
}

--Long den CaChep
tbConfig[27] = 
{
	nId = 27,
	szMessageType = "CreateDialog",
	szName = "Nhan thuong dat moc",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Khi sö dông <color=green>Lång ®Ìn c¸ chÐp<color> mèc 10, 100, cã thÓ ®Õn gÆp ta ®Ó nhËn th­ëng. HiÖn t¹i ®¹i hiÖp ®· sö dông <color=green><lua GetBitTask(4104, 1, 16) /><color> Lång ®Ìn c¸ chÐp"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{60,"default",">="} },			
	},
	tbActition = 
	{		
		{"AddDialogOpt",	{"Th­ëng ®¹t mèc 10 Lång ®Ìn c¸ chÐp",28} },
		{"AddDialogOpt",	{"Th­ëng ®¹t mèc 100 Lång ®Ìn c¸ chÐp",29} },
	},
}
tbConfig[28] = 
{
	nId = 28,
	szMessageType = "nil",
	szName = "Th­ëng ®¹t mèc 10 Lång ®Ìn c¸ chÐp",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbBITTSK_LIMIT_USE_CACHEP_COUNT,10,"Yªu cÇu sö dông Lång ®Ìn trßn ®¹t <color=red>10<color> lÇn trë lªn míi nhËn ®­îc phÇn th­ëng nµy.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_CACHEP_MOC10,0,"Ng­¬i ®· nhËn phÇn th­ëng nµy råi","=="} },
		{"PlayerFunLib:CheckFreeBagCell",	{4,"default"} },
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:setBitTask",	{tbTSK_INFO_CACHEP_MOC10,1} },
		{"PlayerFunLib:GetItem",	{tbAward_CaChep_Moc["10"],1,EVENT_LOG_TITLE,"NhanThuongLongDenCaChep10Lan"} },
	},
}
tbConfig[29] = 
{
	nId = 29,
	szMessageType = "nil",
	szName = "Th­ëng ®¹t mèc 100 Lång ®Ìn c¸ chÐp",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbBITTSK_LIMIT_USE_CACHEP_COUNT,100,"Yªu cÇu sö dông Lång ®Ìn trßn ®¹t <color=red>100<color> lÇn trë lªn míi nhËn ®­îc phÇn th­ëng nµy.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_CACHEP_MOC100,0,"Ng­¬i ®· nhËn phÇn th­ëng nµy råi","=="} },
		{"PlayerFunLib:CheckFreeBagCell",	{4,"default"} },
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:setBitTask",	{tbTSK_INFO_CACHEP_MOC100,1} },
		{"PlayerFunLib:GetItem",	{tbAward_CaChep_Moc["100"],1,EVENT_LOG_TITLE,"NhanThuongLongDenCaChep100Lan"} },
	},
}

--Tang long den keo quan
tbConfig[30] = 
{
	nId = 30,
	szMessageType = "CreateCompose",
	szName = "TÆng Lång ®Ìn kÐo qu©n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>TÆng <color=green>Lång ®Ìn kÐo qu©n<color> cho H»ng Nga",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{60,"§¼ng cÊp cña ng­¬i kh«ng ®ñ, lÇn sau h·y ®Õn nhÐ!",">="} },
		{"ThisActivity:ComposeLimit", {nil}},
		{"AddOneMaterial",	{ITEM_AWARD_6.szName,ITEM_AWARD_6,1} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveBestLightCage",	{nil} },
	},
}

tbConfig[31] =
{
	nId = 31,
	szMessageType = "NpcOnDeath",
	szName = "killer boss",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckKillerdBoss",	{60} },
		{"PlayerFunLib:CheckTotalLevel",	{60,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_BOX_DROP,60,EVENT_LOG_TITLE,"HoanThanhBossST60"} },
	},
}
tbConfig[32] =
{
	nId = 32,
	szMessageType = "NpcOnDeath",
	szName = "killer boss",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckKillerdBoss",	{70} },
		{"PlayerFunLib:CheckTotalLevel",	{70,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_BOX_DROP,70,EVENT_LOG_TITLE,"HoanThanhBossST70"} },
	},
}
tbConfig[33] =
{
	nId = 3,
	szMessageType = "NpcOnDeath",
	szName = "killer boss",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckKillerdBoss",	{80} },
		{"PlayerFunLib:CheckTotalLevel",	{80,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_BOX_DROP,80,EVENT_LOG_TITLE,"HoanThanhBossST80"} },
	},
}
tbConfig[34] =
{
	nId = 34,
	szMessageType = "NpcOnDeath",
	szName = "killer boss",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckKillerdBoss",	{90} },
		{"PlayerFunLib:CheckTotalLevel",	{90,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_BOX_DROP,80,EVENT_LOG_TITLE,"HoanThanhBossST90"} },
	},
}

tbConfig[35] = --Danh quai 1x rot item
{
	nId = 35,
	szMessageType = "NpcOnDeath",
	szName = "",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{10,"",">="} },
		{"NpcFunLib:CheckNormalMonster",	{"10"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1, ""}},
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{DROP_BOX_RANDOM, 3, EVENT_LOG_TITLE, "DropItemIn1xMap"} },
	},
}
tbConfig[36] = --Danh quai 2x rot item
{
	nId = 36,
	szMessageType = "NpcOnDeath",
	szName = "",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{20,"",">="} },
		{"NpcFunLib:CheckNormalMonster",	{"20"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1, ""}},
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{DROP_BOX_RANDOM, 5, EVENT_LOG_TITLE, "DropItemIn2xMap"} },
	},
}
tbConfig[37] = --Danh quai 3x rot item
{
	nId = 37,
	szMessageType = "NpcOnDeath",
	szName = "",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{30,"",">="} },
		{"NpcFunLib:CheckNormalMonster",	{"30"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1, ""}},
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{DROP_BOX_RANDOM, 5, EVENT_LOG_TITLE, "DropItemIn3xMap"} },
	},
}
tbConfig[38] = --Danh quai 4x rot item
{
	nId = 38,
	szMessageType = "NpcOnDeath",
	szName = "",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{40,"",">="} },
		{"NpcFunLib:CheckNormalMonster",	{"40"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1, ""}},
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{DROP_BOX_RANDOM, 5, EVENT_LOG_TITLE, "DropItemIn4xMap"} },
	},
}
tbConfig[39] = --Danh quai 5x rot item
{
	nId = 39,
	szMessageType = "NpcOnDeath",
	szName = "",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{50,"",">="} },
		{"NpcFunLib:CheckNormalMonster",	{"50"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1, ""}},
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{DROP_BOX_RANDOM, 5, EVENT_LOG_TITLE, "DropItemIn5xMap"} },
	},
}
tbConfig[40] = --Danh quai 6x rot item
{
	nId = 40,
	szMessageType = "NpcOnDeath",
	szName = "",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{60,"",">="} },
		{"NpcFunLib:CheckNormalMonster",	{"60"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1, ""}},
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{DROP_BOX_RANDOM, 5, EVENT_LOG_TITLE, "DropItemIn6xMap"} },
	},
}
tbConfig[41] = --Danh quai 7x rot item
{
	nId = 41,
	szMessageType = "NpcOnDeath",
	szName = "",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{70,"",">="} },
		{"NpcFunLib:CheckNormalMonster",	{"70"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1, ""}},
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{DROP_BOX_RANDOM, 10, EVENT_LOG_TITLE, "DropItemIn7xMap"} },
	},
}
tbConfig[42] = --Danh quai 1x rot item
{
	nId = 42,
	szMessageType = "NpcOnDeath",
	szName = "",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{80,"",">="} },
		{"NpcFunLib:CheckNormalMonster",	{"80"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1, ""}},
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{DROP_BOX_RANDOM, 10, EVENT_LOG_TITLE, "DropItemIn8xMap"} },
	},
}
tbConfig[43] = --Danh quai 1x rot item
{
	nId = 43,
	szMessageType = "NpcOnDeath",
	szName = "",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{90,"",">="} },
		{"NpcFunLib:CheckNormalMonster",	{"90"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1, ""}},
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{DROP_BOX_RANDOM, 12, EVENT_LOG_TITLE, "DropItemIn9xMap"} },
	},
}

tbConfig[44] = --Ò»¸öÏ¸½Ú
{
	nId = 44,
	szMessageType = "FinishSongJin",
	szName = "songjin mark>=1000",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{60,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",1000,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_BOX_DROP,100,EVENT_LOG_TITLE,"TongKim1000"} },
	},
}
tbConfig[45] = --Ò»¸öÏ¸½Ú
{
	nId = 45,
	szMessageType = "Chuanguan",
	szName = "KÕt thóc mçi ¶i",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{120,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_BOX_DROP,10,EVENT_LOG_TITLE,"VuotquamoiAi"} },
	},
}
tbConfig[46] = --v­ît ¶i 17
{
	nId = 46,
	szMessageType = "Chuanguan",
	szName = "chuangguan_17",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{120,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_BOX_DROP,20,EVENT_LOG_TITLE,"VuotAi17"} },
	},
}
tbConfig[47] = --v­ît ¶i 28
{
	nId = 47,
	szMessageType = "Chuanguan",
	szName = "chuangguan_28",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{120,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_BOX_DROP,50,EVENT_LOG_TITLE,"VuotAi28"} },
	},
}
tbConfig[48] =
{
	nId = 48,
	szMessageType = "FinishFengLingDu",
	szName = "FinishFengLingDu",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{120,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_BOX_DROP,50,EVENT_LOG_TITLE,"HoanThanhPLD"} },
	},
}
tbConfig[49] =
{
	nId = 49,
	szMessageType = "NpcOnDeath",
	szName = "kill_boat_boss",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{120,"",">="} },
		{"NpcFunLib:CheckBoatBoss",	{nil} },		
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_BOX_DROP,50,EVENT_LOG_TITLE,"TieuDietThuyTacDauLinh"} },
	},
}
tbConfig[50] =
{
	nId = 50,
	szMessageType = "NpcOnDeath",
	szName = "kill_boat_big_boss",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckId",	{"1692"} },
		{"PlayerFunLib:CheckTotalLevel",	{120,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_BOX_DROP,50,EVENT_LOG_TITLE,"TieuDietThuyTacDaiDauLinh"} },
	},
}
tbConfig[51] =
{
	nId = 51,
	szMessageType = "YDBZguoguan",
	szName = "YanDi",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_BOX_DROP,20,EVENT_LOG_TITLE,"QuaAiViemDe"} },
	},
}
tbConfig[52] =
{
	nId = 52,
	szMessageType = "YDBZguoguan",
	szName = "YanDi 10",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {10},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_BOX_DROP,100,EVENT_LOG_TITLE,"QuaAi10ViemDe"} },
	},
}

tbConfig[53] = 
{
	nId = 53,
	szMessageType = "ItemScript",
	szName = "Sö dông Hép vËt liÖu lång ®Ìn 2021",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_MATERIAL_BOX_DROP},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{10,"default",">="} },				
		{"PlayerFunLib:CheckFreeBagCellWH",	{1,1,1,"default"} },
	},
	tbActition = 
	{		
		{"ThisActivity:UseHopVatLieuLongDen",	{nil} },			
	},
}

