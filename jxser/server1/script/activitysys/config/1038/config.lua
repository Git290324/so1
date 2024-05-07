Include("\\script\\activitysys\\config\\1038\\variables.lua")
Include("\\script\\activitysys\\config\\1038\\awardlist.lua")
tbConfig = {}
tbConfig[1] = 
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "H�ng Nga",
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
	szName = "click H�ng Nga",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"H�ng Nga"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{30,"",">="} },
	},
	tbActition = 
	{
		{"SetDialogTitle",	{"<npc>H�m nay l� T�t trung thu <enter>L�ng vui nh� h�i em �i r��c ��n <enter>��n c� ch�p, ��n �ng sao<enter>Mu�n m�u mu�n v� lung linh ph� ph��ng.<enter>H�y ��n ch� ta tham gia c�c ho�t ��ng Trung Thu 2021. Qu� ��i hi�p c� <color=green>c�p �� t� 30 tr� l�n<color> trong qu� tr�nh h�nh t�u giang h� s� nh�n ���c c�c v�t ph�m s� ki�n, thu th�p ��y �� v� ��n ch� ta s� nh�n nhi�u ph�n th��ng h�p d�n. Ta ph� tr�ch <color=green>Gh�p l�ng ��n<color> v� nh�n th��ng."} },			
		{"AddDialogOpt",	{"Gh�p L�ng ��n ",3} },
		{"AddDialogOpt",	{"T�ng L�ng ��n K�o Qu�n cho H�ng Nga ",30} },
		{"AddDialogOpt",	{"Nh�n ph�n th��ng ��t m�c L�ng ��n b��m b��m",15} },		
		{"AddDialogOpt",	{"Nh�n ph�n th��ng ��t m�c L�ng ��n ng�i sao",18} },		
		{"AddDialogOpt",	{"Nh�n ph�n th��ng ��t m�c L�ng ��n �ng",21} },		
		{"AddDialogOpt",	{"Nh�n ph�n th��ng ��t m�c L�ng ��n tr�n",24} },		
		{"AddDialogOpt",	{"Nh�n ph�n th��ng ��t m�c L�ng ��n c� ch�p",27} },		

	},
}

tbConfig[3] =
{
	nId = 3,
	szMessageType = "CreateDialog",
	szName = "Ghep phan thuong",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>M�i lo�i l�ng ��n s� c�n c�c nguy�n li�u kh�c nhau. H�y thu th�p ��y �� nh�.<enter>C�c h� mu�n gh�p l�ng ��n lo�i n�o?"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{30,"",">="} },
	},
	tbActition = 
	{				
		{"AddDialogOpt",	{"Gh�p L�ng ��n b��m b��m 2021",4}},
		{"AddDialogOpt",	{"Gh�p L�ng ��n ng�i sao 2021",5}},
		{"AddDialogOpt",	{"Gh�p L�ng ��n �ng 2021",6}},
		{"AddDialogOpt",	{"Gh�p L�ng ��n tr�n 2021",7}},
		{"AddDialogOpt",	{"Gh�p L�ng ��n c� ch�p 2021",8}},
		{"AddDialogOpt",	{"Gh�p L�ng ��n k�o qu�n 2021",9}},
	},
}

tbConfig[4] = 
{
	nId = 4,
	szMessageType = "CreateCompose",
	szName = "Ta mu�n Gh�p L�ng ��n b��m b��m 2021",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<color=green>L�ng ��n b��m b��m 2021<color>",1,1,1,0.04},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{30,"��ng c�p c�a ng��i kh�ng ��, l�n sau h�y ��n nh�!",">="} },
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
	szName = "Ta mu�n Gh�p L�ng ��n ng�i sao 2021",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<color=green>L�ng ��n ng�i sao 2021<color>",1,1,1,0.04},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{30,"��ng c�p c�a ng��i kh�ng ��, l�n sau h�y ��n nh�!",">="} },
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
	szName = "Ta mu�n Gh�p L�ng ��n �ng 2021",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<color=green>L�ng ��n �ng 2021<color>",1,1,1,0.04},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{30,"��ng c�p c�a ng��i kh�ng ��, l�n sau h�y ��n nh�!",">="} },
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
	szName = "Ta mu�n Gh�p L�ng ��n tr�n 2021",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<color=green>L�ng ��n tr�n 2021<color>",1,1,1,0.04},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{30,"��ng c�p c�a ng��i kh�ng ��, l�n sau h�y ��n nh�!",">="} },
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
	szName = "Ta mu�n Gh�p L�ng ��n c� ch�p 2021",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<color=green>L�ng ��n c� ch�p 2021<color>",1,1,1,0.04},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{30,"��ng c�p c�a ng��i kh�ng ��, l�n sau h�y ��n nh�!",">="} },
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
	szName = "Ta mu�n Gh�p L�ng ��n k�o qu�n 2021",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<color=yellow>L�ng ��n k�o qu�n 2021<color>",1,1,1,0.04},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{30,"��ng c�p c�a ng��i kh�ng ��, l�n sau h�y ��n nh�!",">="} },
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
	szName = "S� d�ng L�ng ��n b��m b��m",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_AWARD_1},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{30,"default",">="} },				
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_BUOMBUOM, tbBITTSK_LIMIT_USE_BUOMBUOM.nMaxValue, "S� d�ng v�t ph�m qu� gi�i h�n, kh�ng th� s� d�ng th�m", "<"}},	
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
	szName = "S� d�ng L�ng ��n ng�i sao",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_AWARD_2},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{30,"default",">="} },				
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_NGOISAO, tbBITTSK_LIMIT_USE_NGOISAO.nMaxValue, "S� d�ng v�t ph�m qu� gi�i h�n, kh�ng th� s� d�ng th�m", "<"}},	
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
	szName = "S� d�ng L�ng ��n �ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_AWARD_3},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{40,"default",">="} },				
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_ONG, tbBITTSK_LIMIT_USE_ONG.nMaxValue, "S� d�ng v�t ph�m qu� gi�i h�n, kh�ng th� s� d�ng th�m", "<"}},	
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
	szName = "S� d�ng L�ng ��n tr�n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_AWARD_4},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{50,"default",">="} },				
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_TRON, tbBITTSK_LIMIT_USE_TRON.nMaxValue, "S� d�ng v�t ph�m qu� gi�i h�n, kh�ng th� s� d�ng th�m", "<"}},	
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
	szName = "S� d�ng L�ng ��n c� ch�p",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_AWARD_5},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{4,"default"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"default",">="} },				
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_CACHEP, tbBITTSK_LIMIT_USE_CACHEP.nMaxValue, "S� d�ng v�t ph�m qu� gi�i h�n, kh�ng th� s� d�ng th�m", "<"}},	
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
	tbMessageParam = {"<npc>Khi s� d�ng <color=green>L�ng ��n b��m b��m<color> m�c 10, 100, c� th� ��n g�p ta �� nh�n th��ng. Hi�n t�i ��i hi�p �� s� d�ng <color=green><lua GetBitTask(4100, 1, 16) /><color> L�ng ��n b��m b��m"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{60,"default",">="} },			
	},
	tbActition = 
	{		
		{"AddDialogOpt",	{"Th��ng ��t m�c 10 L�ng ��n b��m b��m",16} },
		{"AddDialogOpt",	{"Th��ng ��t m�c 100 L�ng ��n b��m b��m",17} },
	},
}
tbConfig[16] = 
{
	nId = 16,
	szMessageType = "nil",
	szName = "Th��ng ��t m�c 10 L�ng ��n b��m b��m",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbBITTSK_LIMIT_USE_BUOMBUOM_COUNT,10,"Y�u c�u s� d�ng L�ng ��n b��m b��m ��t <color=red>10<color> l�n tr� l�n m�i nh�n ���c ph�n th��ng n�y.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_BUOMBUOM_MOC10,0,"Ng��i �� nh�n ph�n th��ng n�y r�i","=="} },
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
	szName = "Th��ng ��t m�c 100 L�ng ��n b��m b��m",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbBITTSK_LIMIT_USE_BUOMBUOM_COUNT,100,"Y�u c�u s� d�ng L�ng ��n b��m b��m ��t <color=red>100<color> l�n tr� l�n m�i nh�n ���c ph�n th��ng n�y.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_BUOMBUOM_MOC100,0,"Ng��i �� nh�n ph�n th��ng n�y r�i","=="} },
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
	tbMessageParam = {"<npc>Khi s� d�ng <color=green>L�ng ��n ng�i sao<color> m�c 10, 100, c� th� ��n g�p ta �� nh�n th��ng. Hi�n t�i ��i hi�p �� s� d�ng <color=green><lua GetBitTask(4101, 1, 16) /><color> L�ng ��n ng�i sao"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{60,"default",">="} },			
	},
	tbActition = 
	{		
		{"AddDialogOpt",	{"Th��ng ��t m�c 10 L�ng ��n ng�i sao",19} },
		{"AddDialogOpt",	{"Th��ng ��t m�c 100 L�ng ��n ng�i sao",20} },
	},
}
tbConfig[19] = 
{
	nId = 19,
	szMessageType = "nil",
	szName = "Th��ng ��t m�c 10 L�ng ��n ng�i sao",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbBITTSK_LIMIT_USE_NGOISAO_COUNT,10,"Y�u c�u s� d�ng L�ng ��n ng�i sao ��t <color=red>10<color> l�n tr� l�n m�i nh�n ���c ph�n th��ng n�y.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_NGOISAO_MOC10,0,"Ng��i �� nh�n ph�n th��ng n�y r�i","=="} },
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
	szName = "Th��ng ��t m�c 100 L�ng ��n ng�i sao",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbBITTSK_LIMIT_USE_NGOISAO_COUNT,100,"Y�u c�u s� d�ng L�ng ��n ng�i sao ��t <color=red>100<color> l�n tr� l�n m�i nh�n ���c ph�n th��ng n�y.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_NGOISAO_MOC100,0,"Ng��i �� nh�n ph�n th��ng n�y r�i","=="} },
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
	tbMessageParam = {"<npc>Khi s� d�ng <color=green>L�ng ��n �ng<color> m�c 10, 100, c� th� ��n g�p ta �� nh�n th��ng. Hi�n t�i ��i hi�p �� s� d�ng <color=green><lua GetBitTask(4102, 1, 16) /><color> L�ng ��n �ng"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{60,"default",">="} },			
	},
	tbActition = 
	{		
		{"AddDialogOpt",	{"Th��ng ��t m�c 10 L�ng ��n �ng",22} },
		{"AddDialogOpt",	{"Th��ng ��t m�c 100 L�ng ��n �ng",23} },
	},
}
tbConfig[22] = 
{
	nId = 22,
	szMessageType = "nil",
	szName = "Th��ng ��t m�c 10 L�ng ��n �ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbBITTSK_LIMIT_USE_ONG_COUNT,10,"Y�u c�u s� d�ng L�ng ��n �ng ��t <color=red>10<color> l�n tr� l�n m�i nh�n ���c ph�n th��ng n�y.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_ONG_MOC10,0,"Ng��i �� nh�n ph�n th��ng n�y r�i","=="} },
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
	szName = "Th��ng ��t m�c 100 L�ng ��n �ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbBITTSK_LIMIT_USE_ONG_COUNT,100,"Y�u c�u s� d�ng L�ng ��n �ng ��t <color=red>100<color> l�n tr� l�n m�i nh�n ���c ph�n th��ng n�y.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_ONG_MOC100,0,"Ng��i �� nh�n ph�n th��ng n�y r�i","=="} },
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
	tbMessageParam = {"<npc>Khi s� d�ng <color=green>L�ng ��n tr�n<color> m�c 10, 100, c� th� ��n g�p ta �� nh�n th��ng. Hi�n t�i ��i hi�p �� s� d�ng <color=green><lua GetBitTask(4103, 1, 16) /><color> L�ng ��n tr�n"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{60,"default",">="} },			
	},
	tbActition = 
	{		
		{"AddDialogOpt",	{"Th��ng ��t m�c 10 L�ng ��n tr�n",25} },
		{"AddDialogOpt",	{"Th��ng ��t m�c 100 L�ng ��n tr�n",26} },
	},
}
tbConfig[25] = 
{
	nId = 25,
	szMessageType = "nil",
	szName = "Th��ng ��t m�c 10 L�ng ��n tr�n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbBITTSK_LIMIT_USE_TRON_COUNT,10,"Y�u c�u s� d�ng L�ng ��n tr�n ��t <color=red>10<color> l�n tr� l�n m�i nh�n ���c ph�n th��ng n�y.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_TRON_MOC10,0,"Ng��i �� nh�n ph�n th��ng n�y r�i","=="} },
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
	szName = "Th��ng ��t m�c 100 L�ng ��n tr�n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbBITTSK_LIMIT_USE_TRON_COUNT,100,"Y�u c�u s� d�ng L�ng ��n tr�n ��t <color=red>100<color> l�n tr� l�n m�i nh�n ���c ph�n th��ng n�y.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_TRON_MOC100,0,"Ng��i �� nh�n ph�n th��ng n�y r�i","=="} },
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
	tbMessageParam = {"<npc>Khi s� d�ng <color=green>L�ng ��n c� ch�p<color> m�c 10, 100, c� th� ��n g�p ta �� nh�n th��ng. Hi�n t�i ��i hi�p �� s� d�ng <color=green><lua GetBitTask(4104, 1, 16) /><color> L�ng ��n c� ch�p"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{60,"default",">="} },			
	},
	tbActition = 
	{		
		{"AddDialogOpt",	{"Th��ng ��t m�c 10 L�ng ��n c� ch�p",28} },
		{"AddDialogOpt",	{"Th��ng ��t m�c 100 L�ng ��n c� ch�p",29} },
	},
}
tbConfig[28] = 
{
	nId = 28,
	szMessageType = "nil",
	szName = "Th��ng ��t m�c 10 L�ng ��n c� ch�p",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbBITTSK_LIMIT_USE_CACHEP_COUNT,10,"Y�u c�u s� d�ng L�ng ��n tr�n ��t <color=red>10<color> l�n tr� l�n m�i nh�n ���c ph�n th��ng n�y.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_CACHEP_MOC10,0,"Ng��i �� nh�n ph�n th��ng n�y r�i","=="} },
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
	szName = "Th��ng ��t m�c 100 L�ng ��n c� ch�p",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbBITTSK_LIMIT_USE_CACHEP_COUNT,100,"Y�u c�u s� d�ng L�ng ��n tr�n ��t <color=red>100<color> l�n tr� l�n m�i nh�n ���c ph�n th��ng n�y.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_CACHEP_MOC100,0,"Ng��i �� nh�n ph�n th��ng n�y r�i","=="} },
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
	szName = "T�ng L�ng ��n k�o qu�n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>T�ng <color=green>L�ng ��n k�o qu�n<color> cho H�ng Nga",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{60,"��ng c�p c�a ng��i kh�ng ��, l�n sau h�y ��n nh�!",">="} },
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

tbConfig[44] = --һ��ϸ��
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
tbConfig[45] = --һ��ϸ��
{
	nId = 45,
	szMessageType = "Chuanguan",
	szName = "K�t th�c m�i �i",
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
tbConfig[46] = --v��t �i 17
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
tbConfig[47] = --v��t �i 28
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
	szName = "S� d�ng H�p v�t li�u l�ng ��n 2021",
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

