Include("\\script\\activitysys\\config\\1031\\head.lua")
Include("\\script\\lib\\log.lua")

pActivity.EVENT_LOG_TITLE = "Shangyuetuanyuan"
local nEndDate = floor(pActivity.nEndDate / 10000)
local ITEM = {}
local AWARD = {}

pActivity.ITEM = ITEM
pActivity.AWARD = AWARD
pActivity.MIN_LEVEL = 30

pActivity.TASK = {
	LvDouMoonCake = 1,
	LianZiMoonCake = 2,
	JiRouMoonCake = 3,
}

pActivity.MaxLvDouMoonCake = 68
pActivity.MaxLianZiMoonCake = 68
pActivity.MaxJiRouMoonCake = 68


local pAnnouce1 = function(tbItem, nCount)
	local szMsg = format("Ch�c m�ng hi�p s� %s h� k�t ti�n duy�n, � %s g�p Th� Ng�c Ti�n T�, Th� Ng�c Ti�n T� th�y hi�p s� r�t %s quen m�t, ��c bi�t t�ng %d ti�n v�n!", GetName(), SubWorldName(SubWorld), GetName(), tbItem.nCount)
	AddGlobalNews(szMsg)
end

local pAnnouce2 = function(tbItem, nCount)
	local szMsg = format("Ch�c m�ng hi�p s� %s h� k�t ti�n duy�n, t�i %s g�p g� Th� Ng�c Ti�n T�, nh�n ���c qu� t�ng c�a Th� Ti�n %d ti�n v�n.", GetName(), SubWorldName(SubWorld), tbItem.nCount)
	AddGlobalNews(szMsg)
end

local pLog = function(tbItem, nCount)
	%tbLog:PlayerActionLog(tbItem.EVENT_LOG_TITLE, tbItem.szLog)
end

pActivity.tbYuTu = {
	Param_Id = 1,
	Param_Finish = 2,
	nTime = 600 * 18,
	szName = "Th� Ng�c Ti�n t�",
	nId = 2132,
	
	Question = {
		{
			szQuestion = "<npc> V� L�m Truy�n K� n�m n�o c� m�t � Vi�t Nam?",
			Candidate = {"A. N�m 2004", "B. N�m 2005", "C. N�m 2006"},
			nAnswer = 2,
		},
		{
			szQuestion = "<npc> V� L�m Truy�n K� c� t�t c� bao nhi�u m�n ph�i?",
			Candidate = {"A. 9", "B. 8", "C. 10"},
			nAnswer = 3,
		},
		{
			szQuestion = "<npc> Trong V� L�m Truy�n K�, hai m�n ph�i n�o thu�c h� h�a?",
			Candidate = {"A. C�i Bang v� Thi�n V��ng", "B. C�i Bang v� Thi�n Nh�n ", "C. C�n L�n v� Thi�n Nh�n "},
			nAnswer = 2,
		},
	},
	tbTooLate = {
		szTitle = "<npc> V� hi�p s� n�y �� ch�m m�t b��c, �� c� hi�p s� may m�n tr� l�i ��ng c�u h�i c�a ta v� nh�n ���c ph�n th��ng r�i.",
		tbOpt = {{" ��ng"}},
	},
	tbWrongAnswer = {
		szTitle = "<npc> V� hi�p s� n�y tr� l�i kh�ng ��ng r�i! H�y ngh� c�n th�n r�i tr� l�i ta nh�!",
		tbOpt = {{" ��ng"}},
	},
}


ITEM.TienThaoLoDB = {szName="Ti�n Th�o L� ��c bi�t", tbProp={6,1,1181,1,0,0}}
ITEM.LvDouMoonCake = {szName="B�nh ��u xanh 2023", tbProp={6,1,4408,1,0,0}}
ITEM.LianZiMoonCake = {szName="B�nh h�t sen 2023", tbProp={6,1,4409,1,0,0}}
ITEM.JiRouMoonCake = {szName="B�nh Trung Thu g� n��ng 2023", tbProp={6,1,4410,1,0,0}}
ITEM.Fen = {szName="B�t 2023", tbProp={6,1,4404,1,0,0}}
ITEM.Tang = {szName=" ���ng tinh 2023", tbProp={6,1,4405,1,0,0}}
ITEM.Egg = {szName=" Tr�ng g� 2023", tbProp={6,1,4406,1,0,0}}
ITEM.LvDou = {szName="��u xanh 2023", tbProp={6,1,4407,1,0,0}}
ITEM.MOON_BAG = {szName="T�i nguy�n li�u 2023", tbProp={6,1,4412,1,0,0}}



AWARD["5xMap"] = {
	{szName=ITEM.Fen.szName,	tbProp=ITEM.Fen.tbProp,		 nCount=1, nRate=5.4},
	{szName=ITEM.Tang.szName,	tbProp=ITEM.Tang.tbProp,	 nCount=1, nRate=5.2},
	{szName=ITEM.Egg.szName,	tbProp=ITEM.Egg.tbProp,		 nCount=1, nRate=5.1},
}

AWARD["6xMap"] = {
	{szName=ITEM.Fen.szName,	tbProp=ITEM.Fen.tbProp,		 nCount=1, nRate=6.4},
	{szName=ITEM.Tang.szName,	tbProp=ITEM.Tang.tbProp,	 nCount=1, nRate=6.2},
	{szName=ITEM.Egg.szName,	tbProp=ITEM.Egg.tbProp,		 nCount=1, nRate=6.1},
}

AWARD["7xMap"] = {
	{szName=ITEM.Fen.szName,	tbProp=ITEM.Fen.tbProp,		 nCount=1, nRate=7.5},
	{szName=ITEM.Tang.szName,	tbProp=ITEM.Tang.tbProp,	 nCount=1, nRate=7.3},
	{szName=ITEM.Egg.szName,	tbProp=ITEM.Egg.tbProp,		 nCount=1, nRate=7.2},
}

AWARD["8xMap"] = {
	{szName=ITEM.Fen.szName,	tbProp=ITEM.Fen.tbProp,		 nCount=1, nRate=8.8},
	{szName=ITEM.Tang.szName,	tbProp=ITEM.Tang.tbProp,	 nCount=1, nRate=8.6},
	{szName=ITEM.Egg.szName,	tbProp=ITEM.Egg.tbProp,		 nCount=1, nRate=8.5},
}

AWARD["9xMap"] = {
	{szName=ITEM.Fen.szName,	tbProp=ITEM.Fen.tbProp,		 nCount=1, nRate=9.5},
	{szName=ITEM.Tang.szName,	tbProp=ITEM.Tang.tbProp,	 nCount=1, nRate=9.2},
	{szName=ITEM.Egg.szName,	tbProp=ITEM.Egg.tbProp,		 nCount=1, nRate=9.0},
}

AWARD["CompseLvDouMoonCake"] = {
	{tbProp=ITEM.LvDouMoonCake.tbProp,		 nCount=1, nRate=100.0},
}

AWARD["CompseLianZiMoonCake"] = {
	{tbProp=ITEM.LvDouMoonCake.tbProp,		 nCount=1,  nRate=30.0},
	{
		nRate=70.0;
		{tbProp=ITEM.LianZiMoonCake.tbProp,		 nCount=1},
		{pFun=pLog, szLog="Chenggongshengjilianziyuebing", EVENT_LOG_TITLE=pActivity.EVENT_LOG_TITLE},
	},
			
}

AWARD["CompseJiRouMoonCake"] = {
	{tbProp=ITEM.LianZiMoonCake.tbProp,		 nCount=1, nRate=55.0},
	{
		nRate=45.0;
		{tbProp=ITEM.JiRouMoonCake.tbProp,		 nCount=1},
		{pFun=pLog, szLog="Chenggongshengjikaojiyuebing", EVENT_LOG_TITLE=pActivity.EVENT_LOG_TITLE},
	},
}

AWARD["UseLvDouMoonCake"] = {
	{nExp=20000, nRate=100},
}

AWARD["UseLianZiMoonCake"] = {
	{nExp=40000, nRate=95.0},
	{tbProp={6,1,1097,1,0,0}, nRate=5.0},
}

AWARD["UseJiRouMoonCake"] = {
	{nExp=100000, nRate=85.0},
	{nExp=150000, nRate=14.9},
	{tbProp={6,1,1817,1,0,0}, nRate=0.1},
}



tbBITTSK_LIMIT_USE_BANHDAUXANH = {nTaskID = 6000,nStartBit = 1,nBitCount = 16,nMaxValue = 5000} -- Gi�i h�n d�ng BANH DAU XANH
tbBITTSK_LIMIT_USE_BANHDAUXANH_COUNT = {nTaskID = 7000,nStartBit = 1,nBitCount = 16,nMaxValue = 5000} -- DEM SO LAN DUNG BANH DAU XANH
tbTSK_INFO_BANHDAUXANH_MOC100 = {nTaskID = 6000,nStartBit = 25,nBitCount = 1,nMaxValue = 1}--M�c 100 SU DUNG BANH DAU XANH
tbTSK_INFO_BANHDAUXANH_MOC500 = {nTaskID = 6000,nStartBit = 26,nBitCount = 1,nMaxValue = 1}--M�c 500 SU DUNG BANH DAU XANH
tbTSK_INFO_BANHDAUXANH_MOC1000 = {nTaskID = 6000,nStartBit = 26,nBitCount = 1,nMaxValue = 1}--M�c 1000 SU DUNG BANH DAU XANH
tbTSK_INFO_BANHDAUXANH_MOC5000 = {nTaskID = 6000,nStartBit = 26,nBitCount = 1,nMaxValue = 1}--M�c 5000 SU DUNG BANH DAU XANH

bBITTSK_LIMIT_USE_BANHHATSEN = {nTaskID = 6001,nStartBit = 1,nBitCount = 16,nMaxValue = 5000} -- Gi�i h�n d�ng BANHHATSEN
tbBITTSK_LIMIT_USE_BANHHATSEN_COUNT = {nTaskID = 7001,nStartBit = 1,nBitCount = 16,nMaxValue = 5000} -- DEM SO LAN DUNG BANHHATSEN
tbTSK_INFO_BANHHATSEN_MOC100 = {nTaskID = 6001,nStartBit = 25,nBitCount = 1,nMaxValue = 1}--M�c 100 SU DUNG BANHHATSEN
tbTSK_INFO_BANHHATSEN_MOC500 = {nTaskID = 6001,nStartBit = 26,nBitCount = 1,nMaxValue = 1}--M�c 500 SU DUNG BANHHATSEN
tbTSK_INFO_BANHHATSEN_MOC1000 = {nTaskID = 6001,nStartBit = 26,nBitCount = 1,nMaxValue = 1}--M�c 1000 SU DUNG BANHHATSEN
tbTSK_INFO_BANHHATSEN_MOC5000 = {nTaskID = 6001,nStartBit = 26,nBitCount = 1,nMaxValue = 1}--M�c 5000 SU DUNG BANHHATSEN


bBITTSK_LIMIT_USE_BANHGANUONG = {nTaskID = 6002,nStartBit = 1,nBitCount = 16,nMaxValue = 5000} -- Gi�i h�n d�ng BANHGANUONG
tbBITTSK_LIMIT_USE_BANHGANUONG_COUNT = {nTaskID = 7002,nStartBit = 1,nBitCount = 16,nMaxValue = 5000} -- DEM SO LAN DUNG BANHGANUONG
tbTSK_INFO_BANHGANUONG_MOC100 = {nTaskID = 6002,nStartBit = 25,nBitCount = 1,nMaxValue = 1}--M�c 100 SU DUNG BANHGANUONG
tbTSK_INFO_BANHGANUONG_MOC500 = {nTaskID = 6002,nStartBit = 26,nBitCount = 1,nMaxValue = 1}--M�c 500 SU DUNG BANHGANUONG
tbTSK_INFO_BANHGANUONG_MOC1000 = {nTaskID = 6002,nStartBit = 26,nBitCount = 1,nMaxValue = 1}--M�c 1000 SU DUNG BANHGANUONG
tbTSK_INFO_BANHGANUONG_MOC5000 = {nTaskID = 6002,nStartBit = 26,nBitCount = 1,nMaxValue = 1}--M�c 5000 SU DUNG BANHGANUONG

