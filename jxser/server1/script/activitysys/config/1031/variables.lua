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
	local szMsg = format("Chóc mõng hiÖp sÜ %s hû kÕt tiªn duyªn, ë %s gÆp Thá Ngäc Tiªn Tö, Thá Ngäc Tiªn Tö thÊy hiÖp sÜ rÊt %s quen m¾t, ®Æc biÖt tÆng %d tiÒn v¹n!", GetName(), SubWorldName(SubWorld), GetName(), tbItem.nCount)
	AddGlobalNews(szMsg)
end

local pAnnouce2 = function(tbItem, nCount)
	local szMsg = format("Chóc mõng hiÖp sÜ %s hû kÕt tiªn duyªn, t¹i %s gÆp gì Thá Ngäc Tiªn Tö, nhËn ®­îc quµ tÆng cña Thá Tiªn %d tiÒn v¹n.", GetName(), SubWorldName(SubWorld), tbItem.nCount)
	AddGlobalNews(szMsg)
end

local pLog = function(tbItem, nCount)
	%tbLog:PlayerActionLog(tbItem.EVENT_LOG_TITLE, tbItem.szLog)
end

pActivity.tbYuTu = {
	Param_Id = 1,
	Param_Finish = 2,
	nTime = 600 * 18,
	szName = "Thá Ngäc Tiªn tö",
	nId = 2132,
	
	Question = {
		{
			szQuestion = "<npc> Vâ L©m TruyÒn Kú n¨m nµo cã mÆt ë ViÖt Nam?",
			Candidate = {"A. N¨m 2004", "B. N¨m 2005", "C. N¨m 2006"},
			nAnswer = 2,
		},
		{
			szQuestion = "<npc> Vâ L©m TruyÒn Kú cã tÊt c¶ bao nhiªu m«n ph¸i?",
			Candidate = {"A. 9", "B. 8", "C. 10"},
			nAnswer = 3,
		},
		{
			szQuestion = "<npc> Trong Vâ L©m TruyÒn Kú, hai m«n ph¸i nµo thuéc hÖ háa?",
			Candidate = {"A. C¸i Bang vµ Thiªn V­¬ng", "B. C¸i Bang vµ Thiªn NhÉn ", "C. C«n L«n vµ Thiªn NhÉn "},
			nAnswer = 2,
		},
	},
	tbTooLate = {
		szTitle = "<npc> VÞ hiÖp sÜ nµy ®· chËm mét b­íc, ®· cã hiÖp sÜ may m¾n tr¶ lêi ®óng c©u hái cña ta vµ nhËn ®­îc phÇn th­ëng råi.",
		tbOpt = {{" §ãng"}},
	},
	tbWrongAnswer = {
		szTitle = "<npc> VÞ hiÖp sÜ nµy tr¶ lêi kh«ng ®óng råi! H·y nghÜ cÈn thËn råi tr¶ lêi ta nhÐ!",
		tbOpt = {{" §ãng"}},
	},
}


ITEM.TienThaoLoDB = {szName="Tiªn Th¶o Lé ®Æc biÖt", tbProp={6,1,1181,1,0,0}}
ITEM.LvDouMoonCake = {szName="B¸nh ®Ëu xanh 2023", tbProp={6,1,4408,1,0,0}}
ITEM.LianZiMoonCake = {szName="B¸nh h¹t sen 2023", tbProp={6,1,4409,1,0,0}}
ITEM.JiRouMoonCake = {szName="B¸nh Trung Thu gµ n­íng 2023", tbProp={6,1,4410,1,0,0}}
ITEM.Fen = {szName="Bét 2023", tbProp={6,1,4404,1,0,0}}
ITEM.Tang = {szName=" §­êng tinh 2023", tbProp={6,1,4405,1,0,0}}
ITEM.Egg = {szName=" Trøng gµ 2023", tbProp={6,1,4406,1,0,0}}
ITEM.LvDou = {szName="§Ëu xanh 2023", tbProp={6,1,4407,1,0,0}}
ITEM.MOON_BAG = {szName="Tói nguyªn liÖu 2023", tbProp={6,1,4412,1,0,0}}



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



tbBITTSK_LIMIT_USE_BANHDAUXANH = {nTaskID = 6000,nStartBit = 1,nBitCount = 16,nMaxValue = 5000} -- Giíi h¹n dïng BANH DAU XANH
tbBITTSK_LIMIT_USE_BANHDAUXANH_COUNT = {nTaskID = 7000,nStartBit = 1,nBitCount = 16,nMaxValue = 5000} -- DEM SO LAN DUNG BANH DAU XANH
tbTSK_INFO_BANHDAUXANH_MOC100 = {nTaskID = 6000,nStartBit = 25,nBitCount = 1,nMaxValue = 1}--Mèc 100 SU DUNG BANH DAU XANH
tbTSK_INFO_BANHDAUXANH_MOC500 = {nTaskID = 6000,nStartBit = 26,nBitCount = 1,nMaxValue = 1}--Mèc 500 SU DUNG BANH DAU XANH
tbTSK_INFO_BANHDAUXANH_MOC1000 = {nTaskID = 6000,nStartBit = 26,nBitCount = 1,nMaxValue = 1}--Mèc 1000 SU DUNG BANH DAU XANH
tbTSK_INFO_BANHDAUXANH_MOC5000 = {nTaskID = 6000,nStartBit = 26,nBitCount = 1,nMaxValue = 1}--Mèc 5000 SU DUNG BANH DAU XANH

bBITTSK_LIMIT_USE_BANHHATSEN = {nTaskID = 6001,nStartBit = 1,nBitCount = 16,nMaxValue = 5000} -- Giíi h¹n dïng BANHHATSEN
tbBITTSK_LIMIT_USE_BANHHATSEN_COUNT = {nTaskID = 7001,nStartBit = 1,nBitCount = 16,nMaxValue = 5000} -- DEM SO LAN DUNG BANHHATSEN
tbTSK_INFO_BANHHATSEN_MOC100 = {nTaskID = 6001,nStartBit = 25,nBitCount = 1,nMaxValue = 1}--Mèc 100 SU DUNG BANHHATSEN
tbTSK_INFO_BANHHATSEN_MOC500 = {nTaskID = 6001,nStartBit = 26,nBitCount = 1,nMaxValue = 1}--Mèc 500 SU DUNG BANHHATSEN
tbTSK_INFO_BANHHATSEN_MOC1000 = {nTaskID = 6001,nStartBit = 26,nBitCount = 1,nMaxValue = 1}--Mèc 1000 SU DUNG BANHHATSEN
tbTSK_INFO_BANHHATSEN_MOC5000 = {nTaskID = 6001,nStartBit = 26,nBitCount = 1,nMaxValue = 1}--Mèc 5000 SU DUNG BANHHATSEN


bBITTSK_LIMIT_USE_BANHGANUONG = {nTaskID = 6002,nStartBit = 1,nBitCount = 16,nMaxValue = 5000} -- Giíi h¹n dïng BANHGANUONG
tbBITTSK_LIMIT_USE_BANHGANUONG_COUNT = {nTaskID = 7002,nStartBit = 1,nBitCount = 16,nMaxValue = 5000} -- DEM SO LAN DUNG BANHGANUONG
tbTSK_INFO_BANHGANUONG_MOC100 = {nTaskID = 6002,nStartBit = 25,nBitCount = 1,nMaxValue = 1}--Mèc 100 SU DUNG BANHGANUONG
tbTSK_INFO_BANHGANUONG_MOC500 = {nTaskID = 6002,nStartBit = 26,nBitCount = 1,nMaxValue = 1}--Mèc 500 SU DUNG BANHGANUONG
tbTSK_INFO_BANHGANUONG_MOC1000 = {nTaskID = 6002,nStartBit = 26,nBitCount = 1,nMaxValue = 1}--Mèc 1000 SU DUNG BANHGANUONG
tbTSK_INFO_BANHGANUONG_MOC5000 = {nTaskID = 6002,nStartBit = 26,nBitCount = 1,nMaxValue = 1}--Mèc 5000 SU DUNG BANHGANUONG

