Include("\\script\\activitysys\\config\\1031\\variables.lua")
Include("\\script\\activitysys\\config\\1031\\awardlist.lua")

tbConfig = {}
tbConfig[1] =
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "Khi khëi ®éng server sÏ t¶i Th»ng Cuéi",
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
-----§èi tho¹i víi Npc
tbConfig[2] =
{
	nId = 2,
	szMessageType = "ClickNpc",
	szName = "BÊm vµo Thî b¸nh A N­¬ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Thî b¸nh A N­¬ng"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"SetDialogTitle",	{"<npc>Trung Thu, ng­êi nguyÖt ®oµn viªn. TÕt Trung Thu l¹i ®Õn, ta chóc c¸c vÞ hiÖp sÜ hîp gia hoan tô l¹c ®oµn viªn! Trong thêi gian diÔn ra ho¹t ®éng, c¸c vÞ ®¹i hiÖp cã thÓ tham gia hai ho¹t ®éng Th­ëng NguyÖt §oµn Viªn vµ Thá Tiªn KÕt Duyªn."}},
		{"AddDialogOpt",	{"Giíi thiÖu ho¹t ®éng",	3} },
		{"AddDialogOpt",	{"Ta muèn ghÐp b¸nh Trung Thu  ®Ëu xanh",	10} },
		{"AddDialogOpt",	{"Ta muèn th¨ng cÊp b¸nh Trung Thu h¹t sen",	11} },
		{"AddDialogOpt",	{"Ta muèn th¨ng cÊp b¸nh Trung Thu gµ n­íng ",	12} },
		{"AddDialogOpt",	{"Ta muèn mua ®Ëu xanh ",	6} },
		{"AddDialogOpt",	{"NhËn phÇn th­ëng ®¹t mèc sö dông b¸nh Trung Thu",	18} },
	},
}



tbConfig[3] = 
{
	nId = 3,
	szMessageType = "CreateDialog",
	szName = "",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc> Ho¹t ®éng lÇn nµy cã Th­ëng NguyÖt §oµn Viªn vµ Thá Tiªn KÕt Duyªn, hiÖp sÜ muèn tham gia ho¹t ®éng nµo?"},
	tbCondition = 
	{
	},
	tbActition = {
		{"AddDialogOpt",	{"Th­ëng NguyÖt §oµn Viªn ",	4} },
--		{"AddDialogOpt",	{"Thá Tiªn KÕt Duyªn ",	5} },
	},
}

tbConfig[4] = 
{
	nId = 4,
	szMessageType = "CreateDialog",
	szName = "",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc> Trong thêi gian diÔn ra ho¹t ®éng, hiÖp sÜ ®Õn b¶n ®å cÊp 5x ®¸nh qu¸i sÏ cã mét l­îng bét mú, ®­êng tr¨ng vµ trøng r¬i ra, NPC Th»ng Cuéi b¸n ®Ëu xanh, sö dông 5 tói ®­êng tr¾ng, 5 tói bét mú, 5 qu¶ trøng vµ 1 tói ®Ëu xanh, cã thÓ ®Õn chç NPC Th»ng Cuéi ghÐp b¸nh Trung Thu ®Ëu xanh, sö dông b¸nh Trung Thu ®Ëu xanh cã thÓ nhËn th­ëng. Cã thÓ ë chç NPC Th»ng Cuéi sö dông 3 b¸nh Trung Thu ®Ëu xanh ®Ó th¨ng cÊp thµnh b¸nh Trung Thu h¹t sen, sö dông 3 b¸nh Trung Thu h¹t sen th¨ng cÊp thµnh b¸nh Trung Thu gµ n­íng, sö dông b¸nh Trung Thu h¹t sen cã thÓ nhËn ®­îc phÇn th­ëng hÊp dÉn, sö dông b¸nh Trung Thu gµ n­íng cã thÓ nhËn ®­îc phÇn th­ëng cã gi¸ trÞ. Th¨ng cÊp cã x¸c suÊt thÊt b¹i, c¸c hiÖp sÜ ph¶i cÈn thËn. "},
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
tbConfig[6] = --Ò»¸öÏ¸½Ú
{
	nId = 6,
	szMessageType = "CreateCompose",
	szName = "",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Mua ®Ëu xanh ",1,1,1,0.004,0,250},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{pActivity.MIN_LEVEL,"default",">="} },
		{"AddOneMaterial",	{"Ng©n l­îng",		{nJxb=5000},	1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{pActivity.ITEM.LvDou, 1, pActivity.EVENT_LOG_TITLE, "Goumailvdou"} },
	},
}
tbConfig[7] = --Ò»¸öÏ¸½Ú
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

tbConfig[8] = --Ò»¸öÏ¸½Ú
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

tbConfig[9] = --Ò»¸öÏ¸½Ú
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

tbConfig[10] = --Ò»¸öÏ¸½Ú
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

tbConfig[11] = --Ò»¸öÏ¸½Ú
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

tbConfig[12] = --Ò»¸öÏ¸½Ú
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

tbConfig[13] = --Ò»¸öÏ¸½Ú
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
		{"ThisActivity:CheckTask",	{pActivity.TASK.LvDouMoonCake, pActivity.MaxLvDouMoonCake, "§· ®¹t ®Õn giíi h¹n, kh«ng thÓ sö dông tiÕp","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{pActivity.TASK.LvDouMoonCake, 1} },
		{"PlayerFunLib:GetItem",	{pActivity.AWARD["UseLvDouMoonCake"], 1, pActivity.EVENT_LOG_TITLE, "Lingqvlvdouyuebingjiangli"} },
	},
}

tbConfig[14] = --Ò»¸öÏ¸½Ú
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
		{"ThisActivity:CheckTask",	{pActivity.TASK.LianZiMoonCake, pActivity.MaxLianZiMoonCake, "§· ®¹t ®Õn giíi h¹n, kh«ng thÓ sö dông tiÕp","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{pActivity.TASK.LianZiMoonCake, 1} },
		{"PlayerFunLib:GetItem",	{pActivity.AWARD["UseLianZiMoonCake"], 1, pActivity.EVENT_LOG_TITLE, "Lingqvlianziyuebingjiangli"} },
	},
}

tbConfig[15] = --Ò»¸öÏ¸½Ú
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
		{"ThisActivity:CheckTask",	{pActivity.TASK.JiRouMoonCake, pActivity.MaxJiRouMoonCake, "§· ®¹t ®Õn giíi h¹n, kh«ng thÓ sö dông tiÕp","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{pActivity.TASK.JiRouMoonCake, 1} },
		{"PlayerFunLib:GetItem",	{pActivity.AWARD["UseJiRouMoonCake"], 1, pActivity.EVENT_LOG_TITLE, "Lingqvkaojiyuebingjiangli"} },
	},
}
tbConfig[16] = --Ò»¸öÏ¸½Ú
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

tbConfig[17] = --Ò»¸öÏ¸½Ú
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
	szName = "click Thî b¸nh A N­¬ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Quý nh©n sÜ vâ l©m ®· vµ ®ang chung vui <color=green>héi Trung Thu<color> n¨m nay sÏ cã c¬ héi nhËn ®­îc thªm nh÷ng phÇn th­ëng hÊp dÉn khi ®¹t cét mèt sö dông c¸c lo¹i B¸nh trung thu."},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{30,"",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"NhËn phÇn th­ëng ®¹t mèc B¸nh ®Ëu xanh 2021",19} },		
		{"AddDialogOpt",	{"NhËn phÇn th­ëng ®¹t mèc B¸nh h¹t sen 2021",24} },		
		{"AddDialogOpt",	{"NhËn phÇn th­ëng ®¹t mèc B¸nh Trung Thu gµ n­íng 2021",29} },		
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
	tbMessageParam = {"<npc>Khi sö dông <color=green>B¸nh ®Ëu xanh 2021<color> mèc 100, 500, 1000, cã thÓ ®Õn gÆp ta ®Ó nhËn th­ëng. HiÖn t¹i ®¹i hiÖp ®· sö dông <color=green><lua GetBitTask(7000, 1, 16) /><color> B¸nh dËu xanh 2021"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{60,"default",">="} },			
	},
	tbActition = 
	{		
		{"AddDialogOpt",	{"Th­ëng ®¹t mèc 100 B¸nh ®Ëu xanh 2021",20} },
		{"AddDialogOpt",	{"Th­ëng ®¹t mèc 500 B¸nh ®Ëu xanh 2021",21} },
		{"AddDialogOpt",	{"Th­ëng ®¹t mèc 1000 B¸nh ®Ëu xanh 2021",22} },
		{"AddDialogOpt",	{"Th­ëng ®¹t mèc 5000 B¸nh ®Ëu xanh 2021",23} },

	},
}
tbConfig[20] = 
{
	nId = 20,
	szMessageType = "nil",
	szName = "Th­ëng ®¹t mèc 100 B¸nh ®Ëu xanh 2021",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbBITTSK_LIMIT_USE_BANHDAUXANH_COUNT,5000,"Yªu cÇu sö dông Lång ®Ìn b­¬m b­ím ®¹t <color=red>10<color> lÇn trë lªn míi nhËn ®­îc phÇn th­ëng nµy.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_BANHDAUXANH_MOC100,0,"Ng­¬i ®· nhËn phÇn th­ëng nµy råi","=="} },
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
	szName = "Th­ëng ®¹t mèc 500 B¸nh ®Ëu xanh 2021",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbBITTSK_LIMIT_USE_BANHDAUXANH_COUNT,5000,"Yªu cÇu sö dông Lång ®Ìn b­¬m b­ím ®¹t <color=red>10<color> lÇn trë lªn míi nhËn ®­îc phÇn th­ëng nµy.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_BANHDAUXANH_MOC500,0,"Ng­¬i ®· nhËn phÇn th­ëng nµy råi","=="} },
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
	szName = "Th­ëng ®¹t mèc 1000 B¸nh ®Ëu xanh 2021",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbBITTSK_LIMIT_USE_BANHDAUXANH_COUNT,5000,"Yªu cÇu sö dông Lång ®Ìn b­¬m b­ím ®¹t <color=red>10<color> lÇn trë lªn míi nhËn ®­îc phÇn th­ëng nµy.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_BANHDAUXANH_MOC1000,0,"Ng­¬i ®· nhËn phÇn th­ëng nµy råi","=="} },
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
	szName = "Th­ëng ®¹t mèc 5000 B¸nh ®Ëu xanh 2021",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbBITTSK_LIMIT_USE_BANHDAUXANH_COUNT,5000,"Yªu cÇu sö dông Lång ®Ìn b­¬m b­ím ®¹t <color=red>10<color> lÇn trë lªn míi nhËn ®­îc phÇn th­ëng nµy.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_BANHDAUXANH_MOC5000,0,"Ng­¬i ®· nhËn phÇn th­ëng nµy råi","=="} },
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
	tbMessageParam = {"<npc>Khi sö dông <color=green>B¸nh h¹t sen 2021<color> mèc 100, 500, 1000, cã thÓ ®Õn gÆp ta ®Ó nhËn th­ëng. HiÖn t¹i ®¹i hiÖp ®· sö dông <color=green><lua GetBitTask(7001, 1, 16) /><color> B¸nh h¹t sen 2021"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{60,"default",">="} },			
	},
	tbActition = 
	{		
		{"AddDialogOpt",	{"Th­ëng ®¹t mèc 100 B¸nh h¹t sen 2021",25} },
		{"AddDialogOpt",	{"Th­ëng ®¹t mèc 500 B¸nh h¹t sen 2021",26} },
		{"AddDialogOpt",	{"Th­ëng ®¹t mèc 1000 B¸nh h¹t sen 2021",27} },
		{"AddDialogOpt",	{"Th­ëng ®¹t mèc 5000 B¸nh h¹t sen 2021",28} },

	},
}

tbConfig[25] = 
{
	nId = 25,
	szMessageType = "nil",
	szName = "Th­ëng ®¹t mèc 100 B¸nh h¹t sen 2021",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbBITTSK_LIMIT_USE_BANHHATSEN_COUNT,5000,"Yªu cÇu sö dông Lång ®Ìn b­¬m b­ím ®¹t <color=red>10<color> lÇn trë lªn míi nhËn ®­îc phÇn th­ëng nµy.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_BANHHATSEN_MOC100,0,"Ng­¬i ®· nhËn phÇn th­ëng nµy råi","=="} },
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
	szName = "Th­ëng ®¹t mèc 500 B¸nh h¹t sen 2021",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbBITTSK_LIMIT_USE_BANHHATSEN_COUNT,5000,"Yªu cÇu sö dông Lång ®Ìn b­¬m b­ím ®¹t <color=red>10<color> lÇn trë lªn míi nhËn ®­îc phÇn th­ëng nµy.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_BANHHATSEN_MOC500,0,"Ng­¬i ®· nhËn phÇn th­ëng nµy råi","=="} },
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
	szName = "Th­ëng ®¹t mèc 1000 B¸nh h¹t sen 2021",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbBITTSK_LIMIT_USE_BANHHATSEN_COUNT,5000,"Yªu cÇu sö dông Lång ®Ìn b­¬m b­ím ®¹t <color=red>10<color> lÇn trë lªn míi nhËn ®­îc phÇn th­ëng nµy.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_BANHHATSEN_MOC1000,0,"Ng­¬i ®· nhËn phÇn th­ëng nµy råi","=="} },
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
	szName = "Th­ëng ®¹t mèc 5000 B¸nh h¹t sen 2021",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbBITTSK_LIMIT_USE_BANHHATSEN_COUNT,5000,"Yªu cÇu sö dông Lång ®Ìn b­¬m b­ím ®¹t <color=red>10<color> lÇn trë lªn míi nhËn ®­îc phÇn th­ëng nµy.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_BANHHATSEN_MOC5000,0,"Ng­¬i ®· nhËn phÇn th­ëng nµy råi","=="} },
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
	tbMessageParam = {"<npc>Khi sö dông <color=green>B¸nh Trung Thu gµ n­íng 2021<color> mèc 100, 500, 1000, cã thÓ ®Õn gÆp ta ®Ó nhËn th­ëng. HiÖn t¹i ®¹i hiÖp ®· sö dông <color=green><lua GetBitTask(7002, 1, 16) /><color> B¸nh Trung Thu gµ n­íng 2021"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{60,"default",">="} },			
	},
	tbActition = 
	{		
		{"AddDialogOpt",	{"Th­ëng ®¹t mèc 100 B¸nh Trung Thu gµ n­íng 2021 2021",30} },
		{"AddDialogOpt",	{"Th­ëng ®¹t mèc 500 B¸nh Trung Thu gµ n­íng 2021",31} },
		{"AddDialogOpt",	{"Th­ëng ®¹t mèc 1000 B¸nh Trung Thu gµ n­íng 2021",32} },
		{"AddDialogOpt",	{"Th­ëng ®¹t mèc 5000 B¸nh Trung Thu gµ n­íng 2021",33} },

	},
}

tbConfig[30] = 
{
	nId = 30,
	szMessageType = "nil",
	szName = "Th­ëng ®¹t mèc 100 B¸nh gµ n­íng 2021",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbBITTSK_LIMIT_USE_BANHGANUONG_COUNT,5000,"Yªu cÇu sö dông Lång ®Ìn b­¬m b­ím ®¹t <color=red>10<color> lÇn trë lªn míi nhËn ®­îc phÇn th­ëng nµy.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_BanhGaNuong_MOC100,0,"Ng­¬i ®· nhËn phÇn th­ëng nµy råi","=="} },
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
	szName = "Th­ëng ®¹t mèc 500 B¸nh gµ n­íng 2021",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbBITTSK_LIMIT_USE_BANHGANUONG_COUNT,5000,"Yªu cÇu sö dông Lång ®Ìn b­¬m b­ím ®¹t <color=red>10<color> lÇn trë lªn míi nhËn ®­îc phÇn th­ëng nµy.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_BANHGANUONG_MOC500,0,"Ng­¬i ®· nhËn phÇn th­ëng nµy råi","=="} },
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
	szName = "Th­ëng ®¹t mèc 1000 B¸nh gµ n­íng 2021",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbBITTSK_LIMIT_USE_BANHGANUONG_COUNT,5000,"Yªu cÇu sö dông Lång ®Ìn b­¬m b­ím ®¹t <color=red>10<color> lÇn trë lªn míi nhËn ®­îc phÇn th­ëng nµy.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_BANHGANUONG_MOC1000,0,"Ng­¬i ®· nhËn phÇn th­ëng nµy råi","=="} },
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
	szName = "Th­ëng ®¹t mèc 5000 B¸nh gµ n­íng 2021",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbBITTSK_LIMIT_USE_BANHGANUONG_COUNT,5000,"Yªu cÇu sö dông Lång ®Ìn b­¬m b­ím ®¹t <color=red>10<color> lÇn trë lªn míi nhËn ®­îc phÇn th­ëng nµy.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_BANHGANUONG_MOC5000,0,"Ng­¬i ®· nhËn phÇn th­ëng nµy råi","=="} },
		{"PlayerFunLib:CheckFreeBagCell",	{4,"default"} },
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:setBitTask",	{tbTSK_INFO_BANHGANUONG_MOC5000,1} },
		{"PlayerFunLib:GetItem",	{tbAward_General_Exp["5000"],1,EVENT_LOG_TITLE,"NhanThuongSuDungBANHGANUONG5000Lan"} },
		{"PlayerFunLib:GetItem",	{tbAward_BanhGaNuong_Moc["5000"],1,EVENT_LOG_TITLE,"NhanThuongSuDungBANHGANUONG5000Lan"} },
	},
}

tbConfig[34] = --Ò»¸öÏ¸½Ú
{
	nId = 34,
	szMessageType = "FinishSongJin",
	szName = "§iÓm tÝch lòy Tèng Kim cao cÊp lín h¬n 1000 thÊp h¬n 3000 nhËn ®­îc Tói Nguyªn liÖu",
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
tbConfig[35] = --Ò»¸öÏ¸½Ú
{
	nId = 35,
	szMessageType = "FinishSongJin",
	szName = "§iÓm tÝch lòy Tèng Kim cao cÊp 3000 nhËn ®­îc Tói Nguyªn liÖu",
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
tbConfig[36] = --Ò»¸öÏ¸½Ú
{
	nId = 36,
	szMessageType = "Chuanguan",
	szName = "V­ît qua ¶i thø 17 nhËn ®­îc Tói Nguyªn liÖu",
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
tbConfig[37] = --Ò»¸öÏ¸½Ú
{
	nId = 37,
	szMessageType = "Chuanguan",
	szName = "V­ît qua ¶i thø 28 nhËn ®­îc Tói Nguyªn liÖu",
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
tbConfig[38] = --Ò»¸öÏ¸½Ú
{
	nId = 38,
	szMessageType = "NpcOnDeath",
	szName = "Thñy TÆc §Çu LÜnh Phong L¨ng §é nhËn ®­îc Tói Nguyªn liÖu",
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
tbConfig[39] = --Ò»¸öÏ¸½Ú
{
	nId = 39,
	szMessageType = "NpcOnDeath",
	szName = "Thñy TÆc §¹i §Çu LÜnh Phong L¨ng §é nhËn ®­îc Tói Nguyªn liÖu",
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
tbConfig[40] = --Ò»¸öÏ¸½Ú
{
	nId = 40,
	szMessageType = "YDBZguoguan",
	szName = "Viªm §Õ v­ît qua ¶i thø 10 nhËn ®­îc Tói Nguyªn liÖu",
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
tbConfig[41] = --Ò»¸öÏ¸½Ú
{
	nId = 41,
	szMessageType = "NpcOnDeath",
	szName = "Tiªu diÖt Boss Hoµng Kim",
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
tbConfig[42] = --Ò»¸öÏ¸½Ú
{
	nId = 42,
	szMessageType = "NpcOnDeath",
	szName = "Tiªu diÖt Boss S¸t Thñ",
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

