Include("\\script\\activitysys\\config\\1031\\variables.lua")
Include("\\script\\activitysys\\config\\1031\\awardlist.lua")

tbConfig = {}
tbConfig[1] =
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "Khi kh�i ��ng server s� t�i Th�ng Cu�i",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:AddInitNpcTrungThu", {nil} },
	},
}
-----��i tho�i v�i Npc
tbConfig[2] =
{
	nId = 2,
	szMessageType = "ClickNpc",
	szName = "B�m v�o Th� b�nh A N��ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Th� b�nh A N��ng"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"SetDialogTitle",	{"<npc>Trung Thu, ng��i nguy�t �o�n vi�n. T�t Trung Thu l�i ��n, ta ch�c c�c v� hi�p s� h�p gia hoan t� l�c �o�n vi�n! Trong th�i gian di�n ra ho�t ��ng, c�c v� ��i hi�p c� th� tham gia hai ho�t ��ng Th��ng Nguy�t �o�n Vi�n v� Th� Ti�n K�t Duy�n."}},
		{"AddDialogOpt",	{"Gi�i thi�u ho�t ��ng",	3} },
		{"AddDialogOpt",	{"Ta mu�n gh�p b�nh Trung Thu  ��u xanh",	10} },
		{"AddDialogOpt",	{"Ta mu�n th�ng c�p b�nh Trung Thu h�t sen",	11} },
		{"AddDialogOpt",	{"Ta mu�n th�ng c�p b�nh Trung Thu g� n��ng ",	12} },
		{"AddDialogOpt",	{"Ta mu�n mua ��u xanh ",	6} },
		{"AddDialogOpt",	{"Nh�n ph�n th��ng ��t m�c s� d�ng b�nh Trung Thu",	18} },
	},
}



tbConfig[3] = 
{
	nId = 3,
	szMessageType = "CreateDialog",
	szName = "",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc> Ho�t ��ng l�n n�y c� Th��ng Nguy�t �o�n Vi�n v� Th� Ti�n K�t Duy�n, hi�p s� mu�n tham gia ho�t ��ng n�o?"},
	tbCondition = 
	{
	},
	tbActition = {
		{"AddDialogOpt",	{"Th��ng Nguy�t �o�n Vi�n ",	4} },
--		{"AddDialogOpt",	{"Th� Ti�n K�t Duy�n ",	5} },
	},
}

tbConfig[4] = 
{
	nId = 4,
	szMessageType = "CreateDialog",
	szName = "",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc> Trong th�i gian di�n ra ho�t ��ng, hi�p s� ��n b�n �� c�p 5x ��nh qu�i s� c� m�t l��ng b�t m�, ���ng tr�ng v� tr�ng r�i ra, NPC Th�ng Cu�i b�n ��u xanh, s� d�ng 5 t�i ���ng tr�ng, 5 t�i b�t m�, 5 qu� tr�ng v� 1 t�i ��u xanh, c� th� ��n ch� NPC Th�ng Cu�i gh�p b�nh Trung Thu ��u xanh, s� d�ng b�nh Trung Thu ��u xanh c� th� nh�n th��ng. C� th� � ch� NPC Th�ng Cu�i s� d�ng 3 b�nh Trung Thu ��u xanh �� th�ng c�p th�nh b�nh Trung Thu h�t sen, s� d�ng 3 b�nh Trung Thu h�t sen th�ng c�p th�nh b�nh Trung Thu g� n��ng, s� d�ng b�nh Trung Thu h�t sen c� th� nh�n ���c ph�n th��ng h�p d�n, s� d�ng b�nh Trung Thu g� n��ng c� th� nh�n ���c ph�n th��ng c� gi� tr�. Th�ng c�p c� x�c su�t th�t b�i, c�c hi�p s� ph�i c�n th�n. "},
	tbCondition = 
	{
	},
	tbActition =
	{
	},
}

tbConfig[5] = 
{
	nId = 5,
	szMessageType = "nil",
	szName = "nil",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[6] = --һ��ϸ��
{
	nId = 6,
	szMessageType = "CreateCompose",
	szName = "",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Mua ��u xanh ",1,1,1,0.004,0,250},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{pActivity.MIN_LEVEL,"default",">="} },
		{"AddOneMaterial",	{"Ng�n l��ng",		{nJxb=5000},	1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{pActivity.ITEM.LvDou, 1, pActivity.EVENT_LOG_TITLE, "Goumailvdou"} },
	},
}
tbConfig[7] = --һ��ϸ��
{
	nId = 7,
	szMessageType = "NpcOnDeath",
	szName = "",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{pActivity.MIN_LEVEL,"",">="} },
		{"NpcFunLib:CheckNormalMonster",	{"70"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1, ""}},
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{pActivity.AWARD["7xMap"], 1, pActivity.EVENT_LOG_TITLE, "DropItemIn7xMap"} },
	},
}

tbConfig[8] = --һ��ϸ��
{
	nId = 8,
	szMessageType = "NpcOnDeath",
	szName = "",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{pActivity.MIN_LEVEL,"",">="} },
		{"NpcFunLib:CheckNormalMonster",	{"80"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1, ""}},
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{pActivity.AWARD["8xMap"], 1, pActivity.EVENT_LOG_TITLE, "DropItemIn8xMap"} },
	},
}

tbConfig[9] = --һ��ϸ��
{
	nId = 9,
	szMessageType = "NpcOnDeath",
	szName = "",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{pActivity.MIN_LEVEL,"",">="} },
		{"NpcFunLib:CheckNormalMonster",	{"90"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1, ""}},
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{pActivity.AWARD["9xMap"], 1, pActivity.EVENT_LOG_TITLE, "DropItemIn9xMap"} },
	},
}

tbConfig[10] = --һ��ϸ��
{
	nId = 10,
	szMessageType = "CreateCompose",
	szName = "",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {pActivity.ITEM.LvDouMoonCake.szName,1,1,1,0.004,0,250},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{pActivity.MIN_LEVEL,"default",">="} },
		{"AddOneMaterial",	{pActivity.ITEM.Tang.szName,	{tbProp = pActivity.ITEM.Tang.tbProp},	5} },
		{"AddOneMaterial",	{pActivity.ITEM.Fen.szName,		{tbProp = pActivity.ITEM.Fen.tbProp},	5} },
		{"AddOneMaterial",	{pActivity.ITEM.Egg.szName,		{tbProp = pActivity.ITEM.Egg.tbProp},	5} },
		{"AddOneMaterial",	{pActivity.ITEM.LvDou.szName,	{tbProp = pActivity.ITEM.LvDou.tbProp},	1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{pActivity.AWARD["CompseLvDouMoonCake"], 1, pActivity.EVENT_LOG_TITLE, "Hechenglvdouyuebing"} },
	},
}

tbConfig[11] = --һ��ϸ��
{
	nId = 11,
	szMessageType = "CreateCompose",
	szName = "",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {pActivity.ITEM.LianZiMoonCake.szName,1,1,1,0.004,0,250},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{pActivity.MIN_LEVEL,"default",">="} },
		{"AddOneMaterial",	{pActivity.ITEM.LvDouMoonCake.szName,	{tbProp = pActivity.ITEM.LvDouMoonCake.tbProp},	3} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{pActivity.AWARD["CompseLianZiMoonCake"], 1, pActivity.EVENT_LOG_TITLE, "Shengjilianziyuebing"} },
	},
}

tbConfig[12] = --һ��ϸ��
{
	nId = 12,
	szMessageType = "CreateCompose",
	szName = "",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {pActivity.ITEM.JiRouMoonCake.szName,1,1,1,0.004,0,250},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{pActivity.MIN_LEVEL,"default",">="} },
		{"AddOneMaterial",	{pActivity.ITEM.LianZiMoonCake.szName,	{tbProp = pActivity.ITEM.LianZiMoonCake.tbProp},	3} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{pActivity.AWARD["CompseJiRouMoonCake"], 1, pActivity.EVENT_LOG_TITLE, "Shengjikaojiyuebing"} },
	},
}

tbConfig[13] = --һ��ϸ��
{
	nId = 13,
	szMessageType = "ItemScript",
	szName = "LvDouMoonCake",
	nStartDate = pActivity.nStartDate,
	nEndDate  = pActivity.nEndDate,
	tbMessageParam = {pActivity.ITEM.LvDouMoonCake},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{pActivity.MIN_LEVEL, "default", ">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{2,"default"} },
		{"ThisActivity:CheckTask",	{pActivity.TASK.LvDouMoonCake, pActivity.MaxLvDouMoonCake, "�� ��t ��n gi�i h�n, kh�ng th� s� d�ng ti�p","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{pActivity.TASK.LvDouMoonCake, 1} },
		{"PlayerFunLib:GetItem",	{pActivity.AWARD["UseLvDouMoonCake"], 1, pActivity.EVENT_LOG_TITLE, "Lingqvlvdouyuebingjiangli"} },
	},
}

tbConfig[14] = --һ��ϸ��
{
	nId = 14,
	szMessageType = "ItemScript",
	szName = "LianZiMoonCake",
	nStartDate = pActivity.nStartDate,
	nEndDate  = pActivity.nEndDate,
	tbMessageParam = {pActivity.ITEM.LianZiMoonCake},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{pActivity.MIN_LEVEL, "default", ">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{2,"default"} },
		{"ThisActivity:CheckTask",	{pActivity.TASK.LianZiMoonCake, pActivity.MaxLianZiMoonCake, "�� ��t ��n gi�i h�n, kh�ng th� s� d�ng ti�p","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{pActivity.TASK.LianZiMoonCake, 1} },
		{"PlayerFunLib:GetItem",	{pActivity.AWARD["UseLianZiMoonCake"], 1, pActivity.EVENT_LOG_TITLE, "Lingqvlianziyuebingjiangli"} },
	},
}

tbConfig[15] = --һ��ϸ��
{
	nId = 15,
	szMessageType = "ItemScript",
	szName = "JiRouMoonCake",
	nStartDate = pActivity.nStartDate,
	nEndDate  = pActivity.nEndDate,
	tbMessageParam = {pActivity.ITEM.JiRouMoonCake},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{pActivity.MIN_LEVEL, "default",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{2,"default"} },
		{"ThisActivity:CheckTask",	{pActivity.TASK.JiRouMoonCake, pActivity.MaxJiRouMoonCake, "�� ��t ��n gi�i h�n, kh�ng th� s� d�ng ti�p","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{pActivity.TASK.JiRouMoonCake, 1} },
		{"PlayerFunLib:GetItem",	{pActivity.AWARD["UseJiRouMoonCake"], 1, pActivity.EVENT_LOG_TITLE, "Lingqvkaojiyuebingjiangli"} },
	},
}
tbConfig[16] = --һ��ϸ��
{
	nId = 16,
	szMessageType = "NpcOnDeath",
	szName = "",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{pActivity.MIN_LEVEL,"",">="} },
		{"NpcFunLib:CheckNormalMonster",	{"50"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1, ""}},
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{pActivity.AWARD["5xMap"], 1, pActivity.EVENT_LOG_TITLE, "DropItemIn5xMap"} },
	},
}

tbConfig[17] = --һ��ϸ��
{
	nId = 17,
	szMessageType = "NpcOnDeath",
	szName = "",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{pActivity.MIN_LEVEL,"",">="} },
		{"NpcFunLib:CheckNormalMonster",	{"60"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1, ""}},
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{pActivity.AWARD["6xMap"], 1, pActivity.EVENT_LOG_TITLE, "DropItemIn6xMap"} },
	},
}

tbConfig[18] =
{
	nId = 18,
	szMessageType = "CreateDialog",
	szName = "click Th� b�nh A N��ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Qu� nh�n s� v� l�m �� v� �ang chung vui <color=green>h�i Trung Thu<color> n�m nay s� c� c� h�i nh�n ���c th�m nh�ng ph�n th��ng h�p d�n khi ��t c�t m�t s� d�ng c�c lo�i B�nh trung thu."},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{30,"",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Nh�n ph�n th��ng ��t m�c B�nh ��u xanh 2021",19} },		
		{"AddDialogOpt",	{"Nh�n ph�n th��ng ��t m�c B�nh h�t sen 2021",24} },		
		{"AddDialogOpt",	{"Nh�n ph�n th��ng ��t m�c B�nh Trung Thu g� n��ng 2021",29} },		
	},
}

--Banh dau xanh
tbConfig[19] =
{
	nId = 19,
	szMessageType = "CreateDialog",
	szName = "Nhan thuong dat moc",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Khi s� d�ng <color=green>B�nh ��u xanh 2021<color> m�c 100, 500, 1000, c� th� ��n g�p ta �� nh�n th��ng. Hi�n t�i ��i hi�p �� s� d�ng <color=green><lua GetBitTask(7000, 1, 16) /><color> B�nh d�u xanh 2021"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{60,"default",">="} },			
	},
	tbActition = 
	{		
		{"AddDialogOpt",	{"Th��ng ��t m�c 100 B�nh ��u xanh 2021",20} },
		{"AddDialogOpt",	{"Th��ng ��t m�c 500 B�nh ��u xanh 2021",21} },
		{"AddDialogOpt",	{"Th��ng ��t m�c 1000 B�nh ��u xanh 2021",22} },
		{"AddDialogOpt",	{"Th��ng ��t m�c 5000 B�nh ��u xanh 2021",23} },

	},
}
tbConfig[20] = 
{
	nId = 20,
	szMessageType = "nil",
	szName = "Th��ng ��t m�c 100 B�nh ��u xanh 2021",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbBITTSK_LIMIT_USE_BANHDAUXANH_COUNT,5000,"Y�u c�u s� d�ng L�ng ��n b��m b��m ��t <color=red>10<color> l�n tr� l�n m�i nh�n ���c ph�n th��ng n�y.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_BANHDAUXANH_MOC100,0,"Ng��i �� nh�n ph�n th��ng n�y r�i","=="} },
		{"PlayerFunLib:CheckFreeBagCell",	{4,"default"} },
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:setBitTask",	{tbTSK_INFO_BANHDAUXANH_MOC100,1} },
		{"PlayerFunLib:GetItem",	{tbAward_General_Exp["100"],1,EVENT_LOG_TITLE,"NhanThuongSuDungBanhDauXanh100Lan"} },
		{"PlayerFunLib:GetItem",	{tbAward_BanhDauXanh_Moc["100"],1,EVENT_LOG_TITLE,"NhanThuongSuDungBanhDauXanh100Lan"} },
	},
}
tbConfig[21] = 
{
	nId = 21,
	szMessageType = "nil",
	szName = "Th��ng ��t m�c 500 B�nh ��u xanh 2021",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbBITTSK_LIMIT_USE_BANHDAUXANH_COUNT,5000,"Y�u c�u s� d�ng L�ng ��n b��m b��m ��t <color=red>10<color> l�n tr� l�n m�i nh�n ���c ph�n th��ng n�y.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_BANHDAUXANH_MOC500,0,"Ng��i �� nh�n ph�n th��ng n�y r�i","=="} },
		{"PlayerFunLib:CheckFreeBagCell",	{4,"default"} },
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:setBitTask",	{tbTSK_INFO_BANHDAUXANH_MOC500,1} },
		{"PlayerFunLib:GetItem",	{tbAward_General_Exp["500"],1,EVENT_LOG_TITLE,"NhanThuongSuDungBanhDauXanh500Lan"} },
		{"PlayerFunLib:GetItem",	{tbAward_BanhDauXanh_Moc["500"],1,EVENT_LOG_TITLE,"NhanThuongSuDungBanhDauXanh500Lan"} },
	},
}

tbConfig[22] = 
{
	nId = 22,
	szMessageType = "nil",
	szName = "Th��ng ��t m�c 1000 B�nh ��u xanh 2021",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbBITTSK_LIMIT_USE_BANHDAUXANH_COUNT,5000,"Y�u c�u s� d�ng L�ng ��n b��m b��m ��t <color=red>10<color> l�n tr� l�n m�i nh�n ���c ph�n th��ng n�y.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_BANHDAUXANH_MOC1000,0,"Ng��i �� nh�n ph�n th��ng n�y r�i","=="} },
		{"PlayerFunLib:CheckFreeBagCell",	{4,"default"} },
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:setBitTask",	{tbTSK_INFO_BANHDAUXANH_MOC1000,1} },
		{"PlayerFunLib:GetItem",	{tbAward_General_Exp["1000"],1,EVENT_LOG_TITLE,"NhanThuongSuDungBanhDauXanh1000Lan"} },
		{"PlayerFunLib:GetItem",	{tbAward_BanhDauXanh_Moc["1000"],1,EVENT_LOG_TITLE,"NhanThuongSuDungBanhDauXanh1000Lan"} },
	},
}

tbConfig[23] = 
{
	nId = 23,
	szMessageType = "nil",
	szName = "Th��ng ��t m�c 5000 B�nh ��u xanh 2021",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbBITTSK_LIMIT_USE_BANHDAUXANH_COUNT,5000,"Y�u c�u s� d�ng L�ng ��n b��m b��m ��t <color=red>10<color> l�n tr� l�n m�i nh�n ���c ph�n th��ng n�y.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_BANHDAUXANH_MOC5000,0,"Ng��i �� nh�n ph�n th��ng n�y r�i","=="} },
		{"PlayerFunLib:CheckFreeBagCell",	{4,"default"} },
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:setBitTask",	{tbTSK_INFO_BANHDAUXANH_MOC5000,1} },
		{"PlayerFunLib:GetItem",	{tbAward_General_Exp["5000"],1,EVENT_LOG_TITLE,"NhanThuongSuDungBanhDauXanh5000Lan"} },
		{"PlayerFunLib:GetItem",	{tbAward_BanhDauXanh_Moc["5000"],1,EVENT_LOG_TITLE,"NhanThuongSuDungBanhDauXanh5000Lan"} },
	},
}
--Banh Hat sen
tbConfig[24] =
{
	nId = 19,
	szMessageType = "CreateDialog",
	szName = "Nhan thuong dat moc",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Khi s� d�ng <color=green>B�nh h�t sen 2021<color> m�c 100, 500, 1000, c� th� ��n g�p ta �� nh�n th��ng. Hi�n t�i ��i hi�p �� s� d�ng <color=green><lua GetBitTask(7001, 1, 16) /><color> B�nh h�t sen 2021"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{60,"default",">="} },			
	},
	tbActition = 
	{		
		{"AddDialogOpt",	{"Th��ng ��t m�c 100 B�nh h�t sen 2021",25} },
		{"AddDialogOpt",	{"Th��ng ��t m�c 500 B�nh h�t sen 2021",26} },
		{"AddDialogOpt",	{"Th��ng ��t m�c 1000 B�nh h�t sen 2021",27} },
		{"AddDialogOpt",	{"Th��ng ��t m�c 5000 B�nh h�t sen 2021",28} },

	},
}

tbConfig[25] = 
{
	nId = 25,
	szMessageType = "nil",
	szName = "Th��ng ��t m�c 100 B�nh h�t sen 2021",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbBITTSK_LIMIT_USE_BANHHATSEN_COUNT,5000,"Y�u c�u s� d�ng L�ng ��n b��m b��m ��t <color=red>10<color> l�n tr� l�n m�i nh�n ���c ph�n th��ng n�y.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_BANHHATSEN_MOC100,0,"Ng��i �� nh�n ph�n th��ng n�y r�i","=="} },
		{"PlayerFunLib:CheckFreeBagCell",	{4,"default"} },
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:setBitTask",	{tbTSK_INFO_BANHHATSEN_MOC100,1} },
		{"PlayerFunLib:GetItem",	{tbAward_General_Exp["100"],1,EVENT_LOG_TITLE,"NhanThuongSuDungBANHHATSEN100Lan"} },
		{"PlayerFunLib:GetItem",	{tbAward_BanhHatSen_Moc["100"],1,EVENT_LOG_TITLE,"NhanThuongSuDungBANHHATSEN100Lan"} },
	},
}
tbConfig[26] = 
{
	nId = 26,
	szMessageType = "nil",
	szName = "Th��ng ��t m�c 500 B�nh h�t sen 2021",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbBITTSK_LIMIT_USE_BANHHATSEN_COUNT,5000,"Y�u c�u s� d�ng L�ng ��n b��m b��m ��t <color=red>10<color> l�n tr� l�n m�i nh�n ���c ph�n th��ng n�y.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_BANHHATSEN_MOC500,0,"Ng��i �� nh�n ph�n th��ng n�y r�i","=="} },
		{"PlayerFunLib:CheckFreeBagCell",	{4,"default"} },
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:setBitTask",	{tbTSK_INFO_BANHHATSEN_MOC500,1} },
		{"PlayerFunLib:GetItem",	{tbAward_General_Exp["500"],1,EVENT_LOG_TITLE,"NhanThuongSuDungBANHHATSEN500Lan"} },
		{"PlayerFunLib:GetItem",	{tbAward_BanhHatSen_Moc["500"],1,EVENT_LOG_TITLE,"NhanThuongSuDungBANHHATSEN500Lan"} },
	},
}

tbConfig[27] = 
{
	nId = 27,
	szMessageType = "nil",
	szName = "Th��ng ��t m�c 1000 B�nh h�t sen 2021",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbBITTSK_LIMIT_USE_BANHHATSEN_COUNT,5000,"Y�u c�u s� d�ng L�ng ��n b��m b��m ��t <color=red>10<color> l�n tr� l�n m�i nh�n ���c ph�n th��ng n�y.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_BANHHATSEN_MOC1000,0,"Ng��i �� nh�n ph�n th��ng n�y r�i","=="} },
		{"PlayerFunLib:CheckFreeBagCell",	{4,"default"} },
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:setBitTask",	{tbTSK_INFO_BANHHATSEN_MOC1000,1} },
		{"PlayerFunLib:GetItem",	{tbAward_General_Exp["1000"],1,EVENT_LOG_TITLE,"NhanThuongSuDungBANHHATSEN1000Lan"} },
		{"PlayerFunLib:GetItem",	{tbAward_BanhHatSen_Moc["1000"],1,EVENT_LOG_TITLE,"NhanThuongSuDungBANHHATSEN1000Lan"} },
	},
}

tbConfig[28] = 
{
	nId = 28,
	szMessageType = "nil",
	szName = "Th��ng ��t m�c 5000 B�nh h�t sen 2021",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbBITTSK_LIMIT_USE_BANHHATSEN_COUNT,5000,"Y�u c�u s� d�ng L�ng ��n b��m b��m ��t <color=red>10<color> l�n tr� l�n m�i nh�n ���c ph�n th��ng n�y.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_BANHHATSEN_MOC5000,0,"Ng��i �� nh�n ph�n th��ng n�y r�i","=="} },
		{"PlayerFunLib:CheckFreeBagCell",	{4,"default"} },
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:setBitTask",	{tbTSK_INFO_BANHHATSEN_MOC5000,1} },
		{"PlayerFunLib:GetItem",	{tbAward_General_Exp["5000"],1,EVENT_LOG_TITLE,"NhanThuongSuDungBANHHATSEN5000Lan"} },
		{"PlayerFunLib:GetItem",	{tbAward_BanhHatSen_Moc["5000"],1,EVENT_LOG_TITLE,"NhanThuongSuDungBANHHATSEN5000Lan"} },
	},
}


--Banh Trung thu ga nuong
tbConfig[29] =
{
	nId = 29,
	szMessageType = "CreateDialog",
	szName = "Nhan thuong dat moc",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Khi s� d�ng <color=green>B�nh Trung Thu g� n��ng 2021<color> m�c 100, 500, 1000, c� th� ��n g�p ta �� nh�n th��ng. Hi�n t�i ��i hi�p �� s� d�ng <color=green><lua GetBitTask(7002, 1, 16) /><color> B�nh Trung Thu g� n��ng 2021"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{60,"default",">="} },			
	},
	tbActition = 
	{		
		{"AddDialogOpt",	{"Th��ng ��t m�c 100 B�nh Trung Thu g� n��ng 2021 2021",30} },
		{"AddDialogOpt",	{"Th��ng ��t m�c 500 B�nh Trung Thu g� n��ng 2021",31} },
		{"AddDialogOpt",	{"Th��ng ��t m�c 1000 B�nh Trung Thu g� n��ng 2021",32} },
		{"AddDialogOpt",	{"Th��ng ��t m�c 5000 B�nh Trung Thu g� n��ng 2021",33} },

	},
}

tbConfig[30] = 
{
	nId = 30,
	szMessageType = "nil",
	szName = "Th��ng ��t m�c 100 B�nh g� n��ng 2021",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbBITTSK_LIMIT_USE_BANHGANUONG_COUNT,5000,"Y�u c�u s� d�ng L�ng ��n b��m b��m ��t <color=red>10<color> l�n tr� l�n m�i nh�n ���c ph�n th��ng n�y.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_BanhGaNuong_MOC100,0,"Ng��i �� nh�n ph�n th��ng n�y r�i","=="} },
		{"PlayerFunLib:CheckFreeBagCell",	{4,"default"} },
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:setBitTask",	{tbTSK_INFO_BANHGANUONG_MOC100,1} },
		{"PlayerFunLib:GetItem",	{tbAward_General_Exp["100"],1,EVENT_LOG_TITLE,"NhanThuongSuDungBANHGANUONG100Lan"} },
		{"PlayerFunLib:GetItem",	{tbAward_BanhGaNuong_Moc["100"],1,EVENT_LOG_TITLE,"NhanThuongSuDungBANHGANUONG100Lan"} },
	},
}
tbConfig[31] = 
{
	nId = 31,
	szMessageType = "nil",
	szName = "Th��ng ��t m�c 500 B�nh g� n��ng 2021",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbBITTSK_LIMIT_USE_BANHGANUONG_COUNT,5000,"Y�u c�u s� d�ng L�ng ��n b��m b��m ��t <color=red>10<color> l�n tr� l�n m�i nh�n ���c ph�n th��ng n�y.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_BANHGANUONG_MOC500,0,"Ng��i �� nh�n ph�n th��ng n�y r�i","=="} },
		{"PlayerFunLib:CheckFreeBagCell",	{4,"default"} },
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:setBitTask",	{tbTSK_INFO_BANHGANUONG_MOC500,1} },
		{"PlayerFunLib:GetItem",	{tbAward_General_Exp["500"],1,EVENT_LOG_TITLE,"NhanThuongSuDungBANHGANUONG500Lan"} },
		{"PlayerFunLib:GetItem",	{tbAward_BanhGaNuong_Moc["500"],1,EVENT_LOG_TITLE,"NhanThuongSuDungBANHGANUONG500Lan"} },
	},
}

tbConfig[32] = 
{
	nId = 32,
	szMessageType = "nil",
	szName = "Th��ng ��t m�c 1000 B�nh g� n��ng 2021",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbBITTSK_LIMIT_USE_BANHGANUONG_COUNT,5000,"Y�u c�u s� d�ng L�ng ��n b��m b��m ��t <color=red>10<color> l�n tr� l�n m�i nh�n ���c ph�n th��ng n�y.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_BANHGANUONG_MOC1000,0,"Ng��i �� nh�n ph�n th��ng n�y r�i","=="} },
		{"PlayerFunLib:CheckFreeBagCell",	{4,"default"} },
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:setBitTask",	{tbTSK_INFO_BANHGANUONG_MOC1000,1} },
		{"PlayerFunLib:GetItem",	{tbAward_General_Exp["1000"],1,EVENT_LOG_TITLE,"NhanThuongSuDungBANHGANUONG1000Lan"} },
		{"PlayerFunLib:GetItem",	{tbAward_BanhGaNuong_Moc["1000"],1,EVENT_LOG_TITLE,"NhanThuongSuDungBANHGANUONG1000Lan"} },
	},
}

tbConfig[33] = 
{
	nId = 33,
	szMessageType = "nil",
	szName = "Th��ng ��t m�c 5000 B�nh g� n��ng 2021",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbBITTSK_LIMIT_USE_BANHGANUONG_COUNT,5000,"Y�u c�u s� d�ng L�ng ��n b��m b��m ��t <color=red>10<color> l�n tr� l�n m�i nh�n ���c ph�n th��ng n�y.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_BANHGANUONG_MOC5000,0,"Ng��i �� nh�n ph�n th��ng n�y r�i","=="} },
		{"PlayerFunLib:CheckFreeBagCell",	{4,"default"} },
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:setBitTask",	{tbTSK_INFO_BANHGANUONG_MOC5000,1} },
		{"PlayerFunLib:GetItem",	{tbAward_General_Exp["5000"],1,EVENT_LOG_TITLE,"NhanThuongSuDungBANHGANUONG5000Lan"} },
		{"PlayerFunLib:GetItem",	{tbAward_BanhGaNuong_Moc["5000"],1,EVENT_LOG_TITLE,"NhanThuongSuDungBANHGANUONG5000Lan"} },
	},
}

tbConfig[34] = --һ��ϸ��
{
	nId = 34,
	szMessageType = "FinishSongJin",
	szName = "�i�m t�ch l�y T�ng Kim cao c�p l�n h�n 1000 th�p h�n 3000 nh�n ���c T�i Nguy�n li�u",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",1000,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",3000,"","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{pActivity.ITEM_MOON_CAKE,10,EVENT_LOG_TITLE,"TongKim1000NhanTuiNguyenLieu"} },
	},
}
tbConfig[35] = --һ��ϸ��
{
	nId = 35,
	szMessageType = "FinishSongJin",
	szName = "�i�m t�ch l�y T�ng Kim cao c�p 3000 nh�n ���c T�i Nguy�n li�u",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",3000,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{pActivity.ITEM_MOON_CAKE,30,EVENT_LOG_TITLE,"TongKim3000NhanTuiNguyenLieu"} },
	},
}
tbConfig[36] = --һ��ϸ��
{
	nId = 36,
	szMessageType = "Chuanguan",
	szName = "V��t qua �i th� 17 nh�n ���c T�i Nguy�n li�u",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{pActivity.ITEM_MOON_CAKE,10,EVENT_LOG_TITLE,"VuotAi17NhanTuiNguyenLieu"} },
	},
}
tbConfig[37] = --һ��ϸ��
{
	nId = 37,
	szMessageType = "Chuanguan",
	szName = "V��t qua �i th� 28 nh�n ���c T�i Nguy�n li�u",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{pActivity.ITEM_MOON_CAKE,10,EVENT_LOG_TITLE,"VuotAi28NhanTuiNguyenLieu"} },
	},
}
tbConfig[38] = --һ��ϸ��
{
	nId = 38,
	szMessageType = "NpcOnDeath",
	szName = "Th�y T�c ��u L�nh Phong L�ng �� nh�n ���c T�i Nguy�n li�u",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckBoatBoss",	{nil} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{pActivity.ITEM_MOON_CAKE,10,EVENT_LOG_TITLE,"TieuDietThuyTacDauLinhNhanTuiNguyenLieu"} },
	},
}
tbConfig[39] = --һ��ϸ��
{
	nId = 39,
	szMessageType = "NpcOnDeath",
	szName = "Th�y T�c ��i ��u L�nh Phong L�ng �� nh�n ���c T�i Nguy�n li�u",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckId",	{"1692"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{pActivity.ITEM_MOON_CAKE,20,EVENT_LOG_TITLE,"TieuDietThuyTacDaiDauLinhNhanTuiNguyenLieu"} },
	},
}
tbConfig[40] = --һ��ϸ��
{
	nId = 40,
	szMessageType = "YDBZguoguan",
	szName = "Vi�m �� v��t qua �i th� 10 nh�n ���c T�i Nguy�n li�u",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {10},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{pActivity.ITEM_MOON_CAKE,15,EVENT_LOG_TITLE,"VuotAiViemDe10NhanTuiNguyenLieu"} },
	},
}
tbConfig[41] = --һ��ϸ��
{
	nId = 41,
	szMessageType = "NpcOnDeath",
	szName = "Ti�u di�t Boss Ho�ng Kim",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckWorldBoss",	{nil} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{pActivity.ITEM_MOON_CAKE,50,EVENT_LOG_TITLE,"TieuDietBossTheGioiNhanTuiNguyenLieu"} },
	},
}
tbConfig[42] = --һ��ϸ��
{
	nId = 42,
	szMessageType = "NpcOnDeath",
	szName = "Ti�u di�t Boss S�t Th�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckKillerdBoss",	{90} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{pActivity.ITEM_MOON_CAKE,10,EVENT_LOG_TITLE,"TieuDietBossSatThuNhanTuiNguyenLieu"} },
	},
}

