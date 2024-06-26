Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\misc\\taskmanager.lua")


-------局部变量定义 开始---------
local nCloseDate		= 20100816
local nCloseTime		= 201008160000
local nItemUseDate		= 20100823
local nTask_LittleWord		= 1
local nTask_MiddleWord		= 2
local nTask_FightToken_ChenDu		= 3
local nTask_FightToken_DaLi		= 4
local nTask_FightToken_FengXiang		= 5
local nTask_FightToken_XiangYang		= 6
local nTask_FightToken_BianJin		= 7
local nTask_FightToken_LinAn		= 8
local nTask_FightToken_YangZhou		= 9
-------局部变量定义 结束---------

local tbConfig = {}
tbConfig[1] = --一个细节
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "Loading NPC",
	nStartDate = nil,
	nEndDate  = nCloseTime,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"lib:Include",	{"\\script\\event\\seven_city_war\\themeactivities\\support.lua"} },
	},
	tbActition = 
	{
		{"tbSevenCityWar_Theme:AddNpc",	{nCloseDate} },
	},
}
tbConfig[2] = --一个细节
{
	nId = 2,
	szMessageType = "NpcOnDeath",
	szName = "Цnh qu竔 r韙 i h� b秓 h筽",
	nStartDate = nil,
	nEndDate  = nCloseTime,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckNormalMonster",	{"10,20,30,40,50,60,70,80,90"} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{{tbProp={6,1,2403,1,0,0},nExpiredTime=nCloseDate,},1,"1.5"} },
	},
}
tbConfig[3] = --一个细节
{
	nId = 3,
	szMessageType = "FinishSongJin",
	szName = "T鑞g Kim cao c蕄 nh薾 頲 i c竧 b秓 h筽_th緉g",
	nStartDate = nil,
	nEndDate  = nCloseTime,
	tbMessageParam = {1,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{3000,">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2404,1,0,0},nExpiredTime=nCloseDate,},100,"[Ho箃 ng ch輓h PBM][T鑞g Kim cao c蕄 nh薾 頲 i c竧 b秓 h筽]"} },
	},
}
tbConfig[4] = --一个细节
{
	nId = 4,
	szMessageType = "FinishSongJin",
	szName = "T鑞g Kim cao c蕄 nh薾 頲 i c竧 b秓 h筽_h遖",
	nStartDate = nil,
	nEndDate  = nCloseTime,
	tbMessageParam = {0,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{3000,">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2404,1,0,0},nExpiredTime=nCloseDate,},100,"[Ho箃 ng ch輓h PBM][T鑞g Kim cao c蕄 nh薾 頲 i c竧 b秓 h筽]"} },
	},
}
tbConfig[5] = --一个细节
{
	nId = 5,
	szMessageType = "FinishSongJin",
	szName = "T鑞g Kim cao c蕄 nh薾 頲 i c竧 b秓 h筽_thua",
	nStartDate = nil,
	nEndDate  = nCloseTime,
	tbMessageParam = {-1,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{3000,">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2404,1,0,0},nExpiredTime=nCloseDate,},100,"[Ho箃 ng ch輓h PBM][T鑞g Kim cao c蕄 nh薾 頲 i c竧 b秓 h筽]"} },
	},
}
tbConfig[6] = --一个细节
{
	nId = 6,
	szMessageType = "Chuanguan",
	szName = "Vt 秈 cao c蕄 nh薾 頲 i c竧 b秓 h筽",
	nStartDate = nil,
	nEndDate  = nCloseTime,
	tbMessageParam = {"20"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{90,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2404,1,0,0},nExpiredTime=nCloseDate,},100,"[Ho箃 ng ch輓h PBM][Vt 秈 cao c蕄 nh薾 頲 i c竧 b秓 h筽]"} },
	},
}
tbConfig[7] = --一个细节
{
	nId = 7,
	szMessageType = "NpcOnDeath",
	szName = "Phong L╪g ч nh薾 頲 i c竧 b秓 h筽",
	nStartDate = nil,
	nEndDate  = nCloseTime,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckBoatBoss",	{nil} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2404,1,0,0},nExpiredTime=nCloseDate,},150,"[Ho箃 ng ch輓h PBM][Phong L╪g ч nh薾 頲 i c竧 b秓 h筽]"} },
	},
}
tbConfig[8] = --一个细节
{
	nId = 8,
	szMessageType = "NpcOnDeath",
	szName = "Nhi謒 v� s竧 th� nh薾 頲 i c竧 b秓 h筽",
	nStartDate = nil,
	nEndDate  = nCloseTime,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckKillerdBoss",	{90} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2404,1,0,0},nExpiredTime=nCloseDate,},120,"[Ho箃 ng ch輓h PBM][Nhi謒 v� s竧 th� nh薾 頲 i c竧 b秓 h筽]"} },
	},
}
tbConfig[9] = --一个细节
{
	nId = 9,
	szMessageType = "ItemScript",
	szName = "S� d鬾g i h� b秓 h筽",
	nStartDate = nil,
	nEndDate  = nCloseTime,
	tbMessageParam = {{tbProp={6,1,2403,1,0,0},}},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:GetAward",	{76,1,"[Ho箃 ng ch輓h PBM][S� d鬾g i h� b秓 h筽]"} },
	},
}
tbConfig[10] = --一个细节
{
	nId = 10,
	szMessageType = "ItemScript",
	szName = "S� d鬾g i c竧 b秓 h筽",
	nStartDate = nil,
	nEndDate  = nCloseTime,
	tbMessageParam = {{tbProp={6,1,2404,1,0,0},}},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:GetAward",	{77,1,"[Ho箃 ng ch輓h PBM][S� d鬾g i c竧 b秓 h筽]"} },
	},
}
tbConfig[11] = --一个细节
{
	nId = 11,
	szMessageType = "ClickNpc",
	szName = "B蕀 v祇 B秓 B秓 Ca",
	nStartDate = nil,
	nEndDate  = nCloseTime,
	tbMessageParam = {"B秓 B秓 Ca"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"SetDialogTitle",	{"<npc>Nh﹏ d辮 ch祇 m鮪g s� ki謓 ra m総 Phi猲 B秐 M韎, c竎 v� i hi謕 c� th� thu th藀 c竎 nguy猲 li謚 c莕 thi誸  i l蕐 nh鱪g b秓 v藅 qu� hi誱 c馻 ta!"} },
		{"AddDialogOpt",	{"фi ti觰 t� khung",12} },
		{"AddDialogOpt",	{"фi trung t� khung (huy襫 tinh)",13} },
		{"AddDialogOpt",	{"фi trung t� khung (Ph骳 duy猲 l�)",14} },
		{"AddDialogOpt",	{"фi trang b� phi猲 b秐 m韎",15} },
	},
}
tbConfig[12] = --一个细节
{
	nId = 12,
	szMessageType = "CreateCompose",
	szName = "фi ti觰 t� khung",
	nStartDate = nil,
	nEndDate  = nCloseTime,
	tbMessageParam = {"Ti觰 T� Khung",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Th蕋",{tbProp={6,1,2405,1,0,0},},1} },
		{"AddOneMaterial",	{"Th祅h",{tbProp={6,1,2406,1,0,0},},1} },
		{"AddOneMaterial",	{"Чi",{tbProp={6,1,2407,1,0,0},},1} },
		{"AddOneMaterial",	{"Chi課",{tbProp={6,1,2408,1,0,0},},1} },
		{"AddOneMaterial",	{"Ng﹏ lng",{nJxb=10000},1} },
		{"AddOneMaterial",	{"Ti觰 Ph骳 Duy猲 L� ",{tbProp={6,1,122,1,0,0},},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2418,1,0,0},nExpiredTime=nItemUseDate,},1,"[Ho箃 ng ch輓h PBM][фi ti觰 t� khung]"} },
	},
}
tbConfig[13] = --一个细节
{
	nId = 13,
	szMessageType = "CreateCompose",
	szName = "фi trung t� khung (huy襫 tinh)",
	nStartDate = nil,
	nEndDate  = nCloseTime,
	tbMessageParam = {"Trung T� Khung",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Th蕋",{tbProp={6,1,2405,1,0,0},},1} },
		{"AddOneMaterial",	{"Th祅h",{tbProp={6,1,2406,1,0,0},},1} },
		{"AddOneMaterial",	{"Чi",{tbProp={6,1,2407,1,0,0},},1} },
		{"AddOneMaterial",	{"Chi課",{tbProp={6,1,2408,1,0,0},},1} },
		{"AddOneMaterial",	{"Ng﹏ lng",{nJxb=60000},1} },
		{"AddOneMaterial",	{"Huy襫 Tinh c蕄 4",{tbProp={6,1,147,4,0,0},},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2419,1,0,0},nExpiredTime=nItemUseDate,},1,"[Ho箃 ng ch輓h PBM][фi trung t� khung]"} },
	},
}
tbConfig[14] = --一个细节
{
	nId = 14,
	szMessageType = "CreateCompose",
	szName = "фi trung t� khung (Ph骳 duy猲 l�)",
	nStartDate = nil,
	nEndDate  = nCloseTime,
	tbMessageParam = {"Trung T� Khung",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Th蕋",{tbProp={6,1,2405,1,0,0},},1} },
		{"AddOneMaterial",	{"Th祅h",{tbProp={6,1,2406,1,0,0},},1} },
		{"AddOneMaterial",	{"Чi",{tbProp={6,1,2407,1,0,0},},1} },
		{"AddOneMaterial",	{"Chi課",{tbProp={6,1,2408,1,0,0},},1} },
		{"AddOneMaterial",	{"Ng﹏ lng",{nJxb=40000},1} },
		{"AddOneMaterial",	{"Чi Ph骳 Duy猲 L� ",{tbProp={6,1,124,1,0,0},},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2419,1,0,0},nExpiredTime=nItemUseDate,},1,"[Ho箃 ng ch輓h PBM][фi trung t� khung]"} },
	},
}
tbConfig[15] = --一个细节
{
	nId = 15,
	szMessageType = "CreateCompose",
	szName = "фi trang b� phi猲 b秐 m韎",
	nStartDate = nil,
	nEndDate  = nCloseTime,
	tbMessageParam = {"Trang b� phi猲 b秐 m韎",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Th蕋",{tbProp={6,1,2405,1,0,0},},1} },
		{"AddOneMaterial",	{"Th祅h",{tbProp={6,1,2406,1,0,0},},1} },
		{"AddOneMaterial",	{"Чi",{tbProp={6,1,2407,1,0,0},},1} },
		{"AddOneMaterial",	{"Chi課",{tbProp={6,1,2408,1,0,0},},1} },
		{"AddOneMaterial",	{"M秐h thi猲 th�",{tbProp={6,1,2409,1,0,0},},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetAward",	{78,1,"[Ho箃 ng ch輓h PBM][фi trang b� phi猲 b秐 m韎]"} },
	},
}
tbConfig[16] = --一个细节
{
	nId = 16,
	szMessageType = "ItemScript",
	szName = "S� d鬾g ti觰 t� khung",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2418,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{50,"Nh﹏ v藅 c蕄 50 tr� l猲 m韎 c� th� s� d鬾g",">="} },
		{"ThisActivity:CheckTask",	{nTask_LittleWord,999,"M鏸 nh﹏ v藅 nhi襲 nh蕋 ch� c� th� s� d鬾g 999 ti觰 t� khung","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{nTask_LittleWord,1} },
		{"PlayerFunLib:AddExp",	{1000000,0,"[Ho箃 ng ch輓h PBM][S� d鬾g ti觰 t� khung]"} },
	},
}
tbConfig[17] = --一个细节
{
	nId = 17,
	szMessageType = "ItemScript",
	szName = "S� d鬾g ti觰 t� khung",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2419,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{50,"Nh﹏ v藅 c蕄 50 tr� l猲 m韎 c� th� s� d鬾g",">="} },
		{"ThisActivity:CheckTask",	{nTask_MiddleWord,999,"M鏸 nh﹏ v藅 nhi襲 nh蕋 ch� c� th� s� d鬾g trung t� khung, th蕋 tinh b閕, th祅h vng kh玦, i th竛h gi竝, chi課 th莕 ngoa t鎛g c閚g 999 c竔","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{nTask_MiddleWord,1} },
		{"PlayerFunLib:AddExp",	{2500000,0,"[Ho箃 ng ch輓h PBM][S� d鬾g trung t� khung]"} },
		{"PlayerFunLib:GetAward",	{79,1,"[Ho箃 ng ch輓h PBM][S� d鬾g trung t� khung]"} },
	},
}
tbConfig[18] = --一个细节
{
	nId = 18,
	szMessageType = "ItemScript",
	szName = "S� d鬾g th蕋 tinh b閕",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2420,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{50,"Nh﹏ v藅 c蕄 50 tr� l猲 m韎 c� th� s� d鬾g",">="} },
		{"ThisActivity:CheckTask",	{nTask_MiddleWord,999,"M鏸 nh﹏ v藅 nhi襲 nh蕋 ch� c� th� s� d鬾g trung t� khung, th蕋 tinh b閕, th祅h vng kh玦, i th竛h gi竝, chi課 th莕 ngoa t鎛g c閚g 999 c竔","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{2,"Ph秈  tr鑞g 2 � tr� l猲 m韎 c� th� s� d鬾g th蕋 tinh b閕, th祅h vng kh玦, i th竛h gi竝, chi課 th莕 ngoa"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{nTask_MiddleWord,1} },
		{"PlayerFunLib:AddExp",	{4000000,0,"[Ho箃 ng ch輓h PBM][S� d鬾g th蕋 tinh b閕]"} },
		{"PlayerFunLib:GetAward",	{80,1,"[Ho箃 ng ch輓h PBM][S� d鬾g th蕋 tinh b閕]"} },
	},
}
tbConfig[19] = --一个细节
{
	nId = 19,
	szMessageType = "ItemScript",
	szName = "S� d鬾g th祅h vng kh玦",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2421,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{50,"Nh﹏ v藅 c蕄 50 tr� l猲 m韎 c� th� s� d鬾g",">="} },
		{"ThisActivity:CheckTask",	{nTask_MiddleWord,999,"M鏸 nh﹏ v藅 nhi襲 nh蕋 ch� c� th� s� d鬾g trung t� khung, th蕋 tinh b閕, th祅h vng kh玦, i th竛h gi竝, chi課 th莕 ngoa t鎛g c閚g 999 c竔","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{2,"Ph秈  tr鑞g 2 � tr� l猲 m韎 c� th� s� d鬾g th蕋 tinh b閕, th祅h vng kh玦, i th竛h gi竝, chi課 th莕 ngoa"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{nTask_MiddleWord,1} },
		{"PlayerFunLib:AddExp",	{6000000,0,"[Ho箃 ng ch輓h PBM][S� d鬾g th祅h vng kh玦]"} },
		{"PlayerFunLib:GetAward",	{80,1,"[Ho箃 ng ch輓h PBM][S� d鬾g th祅h vng kh玦]"} },
	},
}
tbConfig[20] = --一个细节
{
	nId = 20,
	szMessageType = "ItemScript",
	szName = "S� d鬾g i th竛h gi竝",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2422,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{50,"Nh﹏ v藅 c蕄 50 tr� l猲 m韎 c� th� s� d鬾g",">="} },
		{"ThisActivity:CheckTask",	{nTask_MiddleWord,999,"M鏸 nh﹏ v藅 nhi襲 nh蕋 ch� c� th� s� d鬾g trung t� khung, th蕋 tinh b閕, th祅h vng kh玦, i th竛h gi竝, chi課 th莕 ngoa t鎛g c閚g 999 c竔","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{2,"Ph秈  tr鑞g 2 � tr� l猲 m韎 c� th� s� d鬾g th蕋 tinh b閕, th祅h vng kh玦, i th竛h gi竝, chi課 th莕 ngoa"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{nTask_MiddleWord,1} },
		{"PlayerFunLib:AddExp",	{8000000,0,"[Ho箃 ng ch輓h PBM][S� d鬾g i th竛h gi竝]"} },
		{"PlayerFunLib:GetAward",	{80,1,"[Ho箃 ng ch輓h PBM][S� d鬾g i th竛h gi竝]"} },
	},
}
tbConfig[21] = --一个细节
{
	nId = 21,
	szMessageType = "ItemScript",
	szName = "S� d鬾g chi課 th莕 ngoa",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2423,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{50,"Nh﹏ v藅 c蕄 50 tr� l猲 m韎 c� th� s� d鬾g",">="} },
		{"ThisActivity:CheckTask",	{nTask_MiddleWord,999,"M鏸 nh﹏ v藅 nhi襲 nh蕋 ch� c� th� s� d鬾g trung t� khung, th蕋 tinh b閕, th祅h vng kh玦, i th竛h gi竝, chi課 th莕 ngoa t鎛g c閚g 999 c竔","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{2,"Ph秈  tr鑞g 2 � tr� l猲 m韎 c� th� s� d鬾g th蕋 tinh b閕, th祅h vng kh玦, i th竛h gi竝, chi課 th莕 ngoa"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{nTask_MiddleWord,1} },
		{"PlayerFunLib:AddExp",	{10000000,0,"[Ho箃 ng ch輓h PBM][S� d鬾g chi課 th莕 ngoa]"} },
		{"PlayerFunLib:GetAward",	{80,1,"[Ho箃 ng ch輓h PBM][S� d鬾g chi課 th莕 ngoa]"} },
	},
}
tbConfig[22] = --一个细节
{
	nId = 22,
	szMessageType = "ItemScript",
	szName = "S� d鬾g th祅h  huy誸 chi課 l謓h",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2411,1,0,0},}},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{nTask_FightToken_ChenDu,20,"C飊g 1 lo筰 th祅h th� huy誸 chi課 l謓h ch� c� th� s� d鬾g 20 c竔.","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{nTask_FightToken_ChenDu,1} },
		{"PlayerFunLib:AddExp",	{10000000,0,"[Ho箃 ng ch輓h PBM][S� d鬾g th祅h  huy誸 chi課 l謓h]"} },
	},
}
tbConfig[23] = --一个细节
{
	nId = 23,
	szMessageType = "ItemScript",
	szName = "S� d鬾g i l� huy誸 chi課 l謓h",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2412,1,0,0},}},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{nTask_FightToken_DaLi,20,"C飊g 1 lo筰 th祅h th� huy誸 chi課 l謓h ch� c� th� s� d鬾g 20 c竔.","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{nTask_FightToken_DaLi,1} },
		{"PlayerFunLib:AddExp",	{10000000,0,"[Ho箃 ng ch輓h PBM][S� d鬾g i l� huy誸 chi課 l謓h]"} },
	},
}
tbConfig[24] = --一个细节
{
	nId = 24,
	szMessageType = "ItemScript",
	szName = "S� d鬾g phng tng huy誸 chi課 l謓h",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2413,1,0,0},}},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{nTask_FightToken_FengXiang,20,"C飊g 1 lo筰 th祅h th� huy誸 chi課 l謓h ch� c� th� s� d鬾g 20 c竔.","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{nTask_FightToken_FengXiang,1} },
		{"PlayerFunLib:AddExp",	{10000000,0,"[Ho箃 ng ch輓h PBM][S� d鬾g phng tng huy誸 chi課 l謓h]"} },
	},
}
tbConfig[25] = --一个细节
{
	nId = 25,
	szMessageType = "ItemScript",
	szName = "S� d鬾g tng dng huy誸 chi課 l謓h",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2414,1,0,0},}},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{nTask_FightToken_XiangYang,20,"C飊g 1 lo筰 th祅h th� huy誸 chi課 l謓h ch� c� th� s� d鬾g 20 c竔.","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{nTask_FightToken_XiangYang,1} },
		{"PlayerFunLib:AddExp",	{10000000,0,"[Ho箃 ng ch輓h PBM][S� d鬾g phng tng huy誸 chi課 l謓h]"} },
	},
}
tbConfig[26] = --一个细节
{
	nId = 26,
	szMessageType = "ItemScript",
	szName = "S� d鬾g bi謓 kinh huy誸 chi課 l謓h",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2415,1,0,0},}},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{nTask_FightToken_BianJin,20,"C飊g 1 lo筰 th祅h th� huy誸 chi課 l謓h ch� c� th� s� d鬾g 20 c竔.","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{nTask_FightToken_BianJin,1} },
		{"PlayerFunLib:AddExp",	{10000000,0,"[Ho箃 ng ch輓h PBM][S� d鬾g bi謓 kinh huy誸 chi課 l謓h]"} },
	},
}
tbConfig[27] = --一个细节
{
	nId = 27,
	szMessageType = "ItemScript",
	szName = "S� d鬾g l﹎ an huy誸 chi課 l謓h",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2416,1,0,0},}},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{nTask_FightToken_LinAn,20,"C飊g 1 lo筰 th祅h th� huy誸 chi課 l謓h ch� c� th� s� d鬾g 20 c竔.","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{nTask_FightToken_LinAn,1} },
		{"PlayerFunLib:AddExp",	{10000000,0,"[Ho箃 ng ch輓h PBM][S� d鬾g l﹎ an huy誸 chi課 l謓h]"} },
	},
}
tbConfig[28] = --一个细节
{
	nId = 28,
	szMessageType = "ItemScript",
	szName = "S� d鬾g dng ch﹗ huy誸 chi課 l謓h",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2417,1,0,0},}},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{nTask_FightToken_YangZhou,20,"C飊g 1 lo筰 th祅h th� huy誸 chi課 l謓h ch� c� th� s� d鬾g 20 c竔.","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{nTask_FightToken_YangZhou,1} },
		{"PlayerFunLib:AddExp",	{10000000,0,"[Ho箃 ng ch輓h PBM][S� d鬾g dng ch﹗ huy誸 chi課 l謓h]"} },
	},
}
tbConfig[29] = --一个细节
{
	nId = 29,
	szMessageType = "ClickNpc",
	szName = "B蕀 v祇 long nhi",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"B� Long"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"фi nh蕋 k� c祅 kh玭 ph�",30} },
		{"AddDialogOpt",	{"фi m苩 n� c� truy襫",31} },
		{"AddDialogOpt",	{"фi m苩 n� 竜 d礽",32} },
		{"AddDialogOpt",	{"фi m苩 n� qu� 秐h",33} },
		{"AddDialogOpt",	{"фi m苩 n� c鰑 m謓h",34} },
	},
}
tbConfig[30] = --一个细节
{
	nId = 30,
	szMessageType = "CreateCompose",
	szName = "фi nh蕋 k� c祅 kh玭 ph�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Nh蕋 K� C祅 Kh玭 Ph�",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Ng� H祅h K� Th筩h",{tbProp={6,1,2125,1,0,0},},300} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2126,1,0,0},nExpiredTime=43200,},1,"[Ho箃 ng ch輓h PBM][фi 1 nh蕋 k� c祅 kh玭 ph颹"} },
	},
}
tbConfig[31] = --一个细节
{
	nId = 31,
	szMessageType = "CreateCompose",
	szName = "фi m苩 n� c� truy襫",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"M苩 n� c� truy襫",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Ng� H祅h K� Th筩h",{tbProp={6,1,2125,1,0,0},},30} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,11,469,1,0,0},nExpiredTime=10080,},1,"[Ho箃 ng ch輓h PBM][фi m苩 n� c� truy襫]"} },
	},
}
tbConfig[32] = --一个细节
{
	nId = 32,
	szMessageType = "CreateCompose",
	szName = "фi m苩 n� 竜 d礽",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"M苩 n� 竜 d礽",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Ng� H祅h K� Th筩h",{tbProp={6,1,2125,1,0,0},},30} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,11,470,1,0,0},nExpiredTime=10080,},1,"[Ho箃 ng ch輓h PBM][фi m苩 n� 竜 d礽]"} },
	},
}
tbConfig[33] = --一个细节
{
	nId = 33,
	szMessageType = "CreateCompose",
	szName = "фi m苩 n� qu� 秐h",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"M苩 n� qu� 秐h",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Ng� H祅h K� Th筩h",{tbProp={6,1,2125,1,0,0},},5} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,11,455,1,0,0},nExpiredTime=10080,},1,"[Ho箃 ng ch輓h PBM][фi m苩 n� qu� 秐h]"} },
	},
}
tbConfig[34] = --一个细节
{
	nId = 34,
	szMessageType = "CreateCompose",
	szName = "фi m苩 n� c鰑 m謓h",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"M苩 n� c鰑 m謓h",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Ng� H祅h K� Th筩h",{tbProp={6,1,2125,1,0,0},},5} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,11,454,1,0,0},nExpiredTime=10080,},1,"[Ho箃 ng ch輓h PBM][фi m苩 n� c鰑 m謓h]"} },
	},
}
tbConfig[35] = --一个细节
{
	nId = 35,
	szMessageType = "ClickNpc",
	szName = "B蕀 v祇 Th萴 C﹗",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Th萴 C﹗"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"фi ng鵤",36} },
	},
}
tbConfig[36] = --一个细节
{
	nId = 36,
	szMessageType = "CreateCompose",
	szName = "фi ng鵤",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Ng鵤",0,2,3,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Th莕 H祅h To竔 Phi課",{tbProp={6,1,2410,1,0,0},},81} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetAward",	{81,1,"[Ho箃 ng ch輓h PBM][фi ng鵤]"} },
	},
}
G_ACTIVITY:RegisteActivityDetailConfig(18, tbConfig)
