Include("\\script\\activitysys\\config\\1001\\variables.lua")
tbConfig = {}
tbConfig[1] = --S� tr�n t�ng kim 2000 �i�m trong tu�n
{
	nId = 1,
	szMessageType = "FinishSongJin",
	szName = "T�ng kim cao c�p 2000 �i�m",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{2000,">="} },
	},
	tbActition = 
	{
		{"ThisActivity:VngAddWeeklyTask", {nTSK_TONGKIM_WEEKLY_MATCH_COUNT, 1}},
	},
}
tbConfig[2] =
{
	nId = 2,
	szMessageType = "Chuanguan",
	szName = "Ho�n th�nh v��t �i trong tu�n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:VngAddWeeklyTask", {nTSK_VUOTAI_WEEKLY_MATCH_COUNT, 1}},
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30162,1,0,0}, nExpiredTime=24*60,},1,"KyNang150", "VuotAi28"} },
	},
}
tbConfig[3] = --Vi�m ��
{
	nId = 3,
	szMessageType = "YDBZguoguan",
	szName = "V��t qua �i Vi�m �� th� 5",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {5},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:VngAddWeeklyTask", {nTSK_VIEMDE_WEEKLY_MATCH_COUNT, 1}},
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30163,1,0,0}, nExpiredTime=24*60,},1,"KyNang150", "VuotAiViemDe5"} },
	},
}
tbConfig[4] =		--V��t �i 17
{
	nId = 4,
	szMessageType = "Chuanguan",
	szName = "V��t qua �i 17",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30162,1,0,0}, nExpiredTime=24*60,},1,"KyNang150", "VuotAi17"} },
	},
}
tbConfig[5] = --Vi�m �� - v��t �i th� 10
{
	nId = 5,
	szMessageType = "YDBZguoguan",
	szName = "V��t qua �i Vi�m �� th� 10",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {10},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30163,1,0,0}, nExpiredTime=24*60,},1,"KyNang150", "VuotAiViemDe10"} },
	},
}

