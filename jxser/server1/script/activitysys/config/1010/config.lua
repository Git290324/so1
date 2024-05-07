Include("\\script\\activitysys\\config\\1010\\variables.lua")
Include("\\script\\activitysys\\config\\1010\\award_ext.lua")
tbConfig = {}
tbConfig[1] =
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "Khi kh�i ��ng server",
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
	szName = "B�n �� ��nh qu�i nh�n B�t M�",
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
tbConfig[3] = --T�ng kim 1000 �i�m
{
	nId = 3,
	szMessageType = "FinishSongJin",
	szName = "T�ng kim cao c�p 1000 �i�m",
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
tbConfig[4] = --T�ng kim 3000 �i�m
{
	nId = 4,
	szMessageType = "FinishSongJin",
	szName = "T�ng kim cao c�p 3000 �i�m",
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
tbConfig[5] =		--V��t �i 17
{
	nId = 5,
	szMessageType = "Chuanguan",
	szName = "V��t qua �i 17",
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
tbConfig[6] =		--V��t �i 17
{
	nId = 6,
	szMessageType = "Chuanguan",
	szName = "V��t qua �i 28",
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
tbConfig[7] = --Th�y t�c ��u l�nh
{
	nId = 7,
	szMessageType = "NpcOnDeath",
	szName = "Gi�t ch�t 1 th�y t�c ��u l�nh",
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
tbConfig[8] = --thu� t�c ��i ��u l�nh
{
	nId = 8,
	szMessageType = "NpcOnDeath",
	szName = "Ti�u di�t thu� t�c ��i ��u l�nh",
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
tbConfig[9] = --Vi�m �� - v��t �i th� 10
{
	nId = 9,
	szMessageType = "YDBZguoguan",
	szName = "V��t qua �i Vi�m �� th� 6",
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
tbConfig[10] = --Boss Ho�ng Kim
{
	nId = 10,
	szMessageType = "NpcOnDeath",
	szName = "Ti�u di�t boss Ho�ng Kim",
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
tbConfig[11] = --boss s�t th�
{
	nId = 11,
	szMessageType = "NpcOnDeath",
	szName = "Nhi�m v� s�t th� c�p 90",
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
--��i tho�i Npc
tbConfig[12] = --һ��ϸ��
{
	nId = 12,
	szMessageType = "ClickNpc",
	szName = "click npc name lingfan",
	nStartDate = 201206030000,
	nEndDate  = 201206302400,
	tbMessageParam = {"H�ng rong"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Mua nguy�n li�u gh�p b�nh sinh nh�t",21} },
	},
}
