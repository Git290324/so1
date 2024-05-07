Include("\\script\\activitysys\\config\\1010\\variables.lua")
Include("\\script\\activitysys\\config\\1010\\award_ext.lua")
tbConfig = {}
tbConfig[1] =
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "Khi khëi ®éng server",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:AddInitNpc",	{nil} },
	},
}
tbConfig[2] =
{
	nId = 2,
	szMessageType = "NpcOnDeath",
	szName = "B¶n ®å ®¸nh qu¸i nhËn Bét M×",
	nStartDate = 201206030000,
	nEndDate  = 201206302400,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckInMap",	{"340,321,322,225,226,227,75"} },
	},
	tbActition = 
	{
		{"ThisActivity:DropItemRandom",	{nil} },
	},
}
tbConfig[3] = --Tèng kim 1000 ®iÓm
{
	nId = 3,
	szMessageType = "FinishSongJin",
	szName = "Tèng kim cao cÊp 1000 ®iÓm",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"}, -- cao cap
	tbCondition = 
	{
		-- {"PlayerFunLib:CheckTask",	{"751",100,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",5000,"",">="} },
		-- {"PlayerFunLib:CheckTask",	{"751",3000,"","<"} },
		{"PlayerFunLib:CheckTotalLevel",	{120,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{20000000,1,EVENT_LOG_TITLE,"TongKim1000"} },
		{"PlayerFunLib:GetItem",	{manhanbang,1,EVENT_LOG_TITLE,"TongKim1000"} },		
		{"PlayerFunLib:GetItem",	{quehoatuu,1,EVENT_LOG_TITLE,"TongKim1000"} },		
	},
}
tbConfig[4] = --Tèng kim 3000 ®iÓm
{
	nId = 4,
	szMessageType = "FinishSongJin",
	szName = "Tèng kim cao cÊp 3000 ®iÓm",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"2"}, -- trung cap
	tbCondition = 
	{
		-- {"PlayerFunLib:CheckTask",	{"751",100,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",5000,"",">="} },
		{"PlayerFunLib:CheckTotalLevel",	{80,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{10000000,1,EVENT_LOG_TITLE,"TongKim1000"} },
		{"PlayerFunLib:GetItem",	{manhanbang,1,EVENT_LOG_TITLE,"TongKim1000"} },		
		{"PlayerFunLib:GetItem",	{quehoatuu,1,EVENT_LOG_TITLE,"TongKim1000"} },		
	},
}
tbConfig[5] =		--V­ît ¶i 17
{
	nId = 5,
	szMessageType = "Chuanguan",
	szName = "V­ît qua ¶i 17",
	nStartDate = 201206030000,
	nEndDate  = 201206302400,
	tbMessageParam = {"17"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{90,"",">="} },
	},
	tbActition = 
	{	
		{"PlayerFunLib:GetItem",	{ITEM_MILK,10,EVENT_LOG_TITLE,"VuotAi17"} },		
	},
}
tbConfig[6] =		--V­ît ¶i 17
{
	nId = 6,
	szMessageType = "Chuanguan",
	szName = "V­ît qua ¶i 28",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{90,"",">="} },
	},
	tbActition = 
	{		
		{"PlayerFunLib:AddExp",	{5000000,1,EVENT_LOG_TITLE,"TongKim1000"} },
		{"PlayerFunLib:GetItem",	{quehoatuu,1,EVENT_LOG_TITLE,"TongKim1000"} },	
	},
}
tbConfig[7] = --Thñy tÆc ®Çu lÜnh
{
	nId = 7,
	szMessageType = "NpcOnDeath",
	szName = "GiÕt chÕt 1 thñy tÆc ®Çu lÜnh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckBoatBoss",	{nil} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{5000000,1,EVENT_LOG_TITLE,"TongKim1000"} },
		{"PlayerFunLib:GetItem",	{manhanbang,1,EVENT_LOG_TITLE,"TongKim1000"} },		
		{"PlayerFunLib:GetItem",	{quehoatuu,1,EVENT_LOG_TITLE,"TongKim1000"} },				
	},
}
tbConfig[8] = --thuû tÆc ®¹i ®Çu lÜnh
{
	nId = 8,
	szMessageType = "NpcOnDeath",
	szName = "Tiªu diÖt thuû tÆc ®¹i ®Çu lÜnh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckId",	{"1692"} },
		{"NpcFunLib:CheckInMap",	{"337,338,339"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{5000000,1,EVENT_LOG_TITLE,"TongKim1000"} },
		{"PlayerFunLib:GetItem",	{manhanbang,1,EVENT_LOG_TITLE,"TongKim1000"} },		
		{"PlayerFunLib:GetItem",	{quehoatuu,1,EVENT_LOG_TITLE,"TongKim1000"} },			
	},
}
tbConfig[9] = --Viªm ®Õ - v­ît ¶i thø 10
{
	nId = 9,
	szMessageType = "YDBZguoguan",
	szName = "V­ît qua ¶i Viªm §Õ thø 6",
	nStartDate = 201206030000,
	nEndDate  = 201206302400,
	tbMessageParam = {6},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MILK,15,EVENT_LOG_TITLE,"VuotAiViemDe6"} },				
	},
}
tbConfig[10] = --Boss Hoµng Kim
{
	nId = 10,
	szMessageType = "NpcOnDeath",
	szName = "Tiªu diÖt boss Hoµng Kim",
	nStartDate = 201206030000,
	nEndDate  = 201206302400,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckWorldBoss",	{nil} },
		{"PlayerFunLib:CheckTotalLevel",	{90,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{20000000,1,EVENT_LOG_TITLE,"TongKim1000"} },			
	},
}
tbConfig[11] = --boss s¸t thñ
{
	nId = 11,
	szMessageType = "NpcOnDeath",
	szName = "NhiÖm vô s¸t thñ cÊp 90",
	nStartDate = 201206030000,
	nEndDate  = 201206302400,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckKillerdBoss",	{90} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{3000000,1,EVENT_LOG_TITLE,"TongKim1000"} },		
	},
}
--§èi tho¹i Npc
tbConfig[12] = --Ò»¸öÏ¸½Ú
{
	nId = 12,
	szMessageType = "ClickNpc",
	szName = "click npc name lingfan",
	nStartDate = 201206030000,
	nEndDate  = 201206302400,
	tbMessageParam = {"Hµng rong"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Mua nguyªn liÖu ghĞp b¸nh sinh nhËt",21} },
	},
}
