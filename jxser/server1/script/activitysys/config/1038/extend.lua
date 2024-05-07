Include("\\script\\activitysys\\config\\1038\\head.lua")
Include("\\script\\activitysys\\config\\1038\\variables.lua")
Include("\\script\\activitysys\\config\\1038\\awardlist.lua");
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\droptemplet.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\log.lua")
pActivity.nPak = curpack()

function pActivity:AddInitNpcHangNga()
	local tbNpcPos = {		
		[1] = {37,1714,3123,},--Hang Nga - BK
		[2] = {11,3149,5082,},--Hang Nga - TD	
		[3] = {78,1594,3228,},--Hang Nga - TuongD
		[4] = {1,1595,3216,},--Hang Nga - PT
		[5] = {162,1619,3186,}, --Hang Nga - DL
		[6] = {80,1776,3041,},--Hang Nga - DC
		[7] = {176,1583,2946,},--Hang Nga - LA
	}
	local tbNpc = {		
		[1] = {
			szName = "H»ng Nga", 
			nLevel = 95,
			nNpcId = 1867,
			nIsboss = 0,
			szScriptPath = "\\script\\activitysys\\npcdailog.lua",
			}
	}
	for i=1,getn(tbNpcPos) do
		local nMapId, nPosX, nPosY = unpack(tbNpcPos[i])
		basemission_CallNpc(tbNpc[1], nMapId, nPosX * 32, nPosY * 32)	
	end
end

function pActivity:UseLongDenBuomBuom()
	if not tbVNG_BitTask_Lib:CheckBitTaskValue(%tbBITTSK_LIMIT_USE_BUOMBUOM,%tbBITTSK_LIMIT_USE_BUOMBUOM.nMaxValue,"§· ®¹t ®Õn giíi h¹n, kh«ng thÓ sö dông tiÕp","<") then
		return
	end

	
	local rtotal = 10000000	
	local rcur=random(1,rtotal);
	local rstep=0;
	local tbItem = %tbAward_BuomBuom_Exp
	local nRandResult = 0
	for i=1,getn(tbItem) do
		rstep=rstep+floor(tbItem[i].nRate*rtotal/100);
		--so sanh neu exp so sanh nho hon exp trong bang thi lay exp trong bang
		if(rcur <= rstep) then
			nRandResult = tbItem[i].nExp
			break
		end
	end
	local nCurTskVal = tbVNG_BitTask_Lib:getBitTask(%tbBITTSK_LIMIT_USE_BUOMBUOM)
	local nNextExp = nRandResult
	-- Lan su dung cuoi cung vuot qua gioi han
	if floor(nNextExp/1e6) + nCurTskVal > %tbBITTSK_LIMIT_USE_BUOMBUOM.nMaxValue then
		nNextExp = (%tbBITTSK_LIMIT_USE_BUOMBUOM.nMaxValue - nCurTskVal)*1e6
	end
	
	tbVNG_BitTask_Lib:addTask(%tbBITTSK_LIMIT_USE_BUOMBUOM, floor(nNextExp/1e6))
	tbVNG_BitTask_Lib:addTask(%tbBITTSK_LIMIT_USE_BUOMBUOM_COUNT, 1)
	tbAwardTemplet:Give({szName = "§iÓm kinh nghiÖm", nExp=nNextExp}, 1, {%EVENT_LOG_TITLE, "SuDungBanhLongDenBuomBuomNhanExp"})
	nCurTskVal = tbVNG_BitTask_Lib:getBitTask(%tbBITTSK_LIMIT_USE_BUOMBUOM)
	Msg2Player(format("B¹n võa nhËn ®­îc <color=yellow>%s<color> exp tõ vËt phÈm %s", nNextExp, "<color=green>ITEM_AWARD_1.szName<color>" ))	
end

function pActivity:UseLongDenNgoiSao()
	if not tbVNG_BitTask_Lib:CheckBitTaskValue(%tbBITTSK_LIMIT_USE_NGOISAO,%tbBITTSK_LIMIT_USE_NGOISAO.nMaxValue,"§· ®¹t ®Õn giíi h¹n, kh«ng thÓ sö dông tiÕp","<") then
		return
	end
	local rtotal = 10000000	
	local rcur=random(1,rtotal);
	local rstep=0;
	local tbItem = %tbAward_NgoiSao_Exp
	local nRandResult = 0
	for i=1,getn(tbItem) do
		rstep=rstep+floor(tbItem[i].nRate*rtotal/100);
		--so sanh neu exp so sanh nho hon exp trong bang thi lay exp trong bang
		if(rcur <= rstep) then
			nRandResult = tbItem[i].nExp
			break
		end
	end
	local nCurTskVal = tbVNG_BitTask_Lib:getBitTask(%tbBITTSK_LIMIT_USE_NGOISAO)
	local nNextExp = nRandResult
	-- Lan su dung cuoi cung vuot qua gioi han
	if floor(nNextExp/1e6) + nCurTskVal > %tbBITTSK_LIMIT_USE_NGOISAO.nMaxValue then
		nNextExp = (%tbBITTSK_LIMIT_USE_NGOISAO.nMaxValue - nCurTskVal)*1e6
	end
	
	tbVNG_BitTask_Lib:addTask(%tbBITTSK_LIMIT_USE_NGOISAO, floor(nNextExp/1e6))
	tbVNG_BitTask_Lib:addTask(%tbBITTSK_LIMIT_USE_NGOISAO_COUNT, 1)
	tbAwardTemplet:Give({szName = "§iÓm kinh nghiÖm", nExp=nNextExp}, 1, {%EVENT_LOG_TITLE, "SuDungBanhLongDenNgoiSaoNhanExp"})
	nCurTskVal = tbVNG_BitTask_Lib:getBitTask(%tbBITTSK_LIMIT_USE_NGOISAO)
	Msg2Player(format("B¹n võa nhËn ®­îc <color=yellow>%s<color> exp tõ vËt phÈm %s", nNextExp, "<color=green>ITEM_AWARD_2.szName<color>" ))	
end


function pActivity:UseLongDenOng()
	if not tbVNG_BitTask_Lib:CheckBitTaskValue(%tbBITTSK_LIMIT_USE_ONG,%tbBITTSK_LIMIT_USE_ONG.nMaxValue,"§· ®¹t ®Õn giíi h¹n, kh«ng thÓ sö dông tiÕp","<") then
		return
	end
	local rtotal = 10000000	
	local rcur=random(1,rtotal);
	local rstep=0;
	local tbItem = %tbAward_Ong_Exp
	local nRandResult = 0
	for i=1,getn(tbItem) do
		rstep=rstep+floor(tbItem[i].nRate*rtotal/100);
		--so sanh neu exp so sanh nho hon exp trong bang thi lay exp trong bang
		if(rcur <= rstep) then
			nRandResult = tbItem[i].nExp
			break
		end
	end
	local nCurTskVal = tbVNG_BitTask_Lib:getBitTask(%tbBITTSK_LIMIT_USE_ONG)
	local nNextExp = nRandResult
	-- Lan su dung cuoi cung vuot qua gioi han
	if floor(nNextExp/1e6) + nCurTskVal > %tbBITTSK_LIMIT_USE_ONG.nMaxValue then
		nNextExp = (%tbBITTSK_LIMIT_USE_ONG.nMaxValue - nCurTskVal)*1e6
	end
	
	tbVNG_BitTask_Lib:addTask(%tbBITTSK_LIMIT_USE_ONG, floor(nNextExp/1e6))
	tbVNG_BitTask_Lib:addTask(%tbBITTSK_LIMIT_USE_ONG_COUNT, 1)
	tbAwardTemplet:Give({szName = "§iÓm kinh nghiÖm", nExp=nNextExp}, 1, {%EVENT_LOG_TITLE, "SuDungBanhLongDenOngExp"})
	nCurTskVal = tbVNG_BitTask_Lib:getBitTask(%tbBITTSK_LIMIT_USE_ONG)
	Msg2Player(format("B¹n võa nhËn ®­îc <color=yellow>%s<color> exp tõ vËt phÈm %s", nNextExp, "<color=green>ITEM_AWARD_3.szName<color>" ))	
end


function pActivity:UseLongDenTron()
	if not tbVNG_BitTask_Lib:CheckBitTaskValue(%tbBITTSK_LIMIT_USE_TRON,%tbBITTSK_LIMIT_USE_TRON.nMaxValue,"§· ®¹t ®Õn giíi h¹n, kh«ng thÓ sö dông tiÕp","<") then
		return
	end
	local rtotal = 10000000	
	local rcur=random(1,rtotal);
	local rstep=0;
	local tbItem = %tbAward_Tron_Exp
	local nRandResult = 0
	for i=1,getn(tbItem) do
		rstep=rstep+floor(tbItem[i].nRate*rtotal/100);
		--so sanh neu exp so sanh nho hon exp trong bang thi lay exp trong bang
		if(rcur <= rstep) then
			nRandResult = tbItem[i].nExp
			break
		end
	end
	local nCurTskVal = tbVNG_BitTask_Lib:getBitTask(%tbBITTSK_LIMIT_USE_TRON)
	local nNextExp = nRandResult
	-- Lan su dung cuoi cung vuot qua gioi han
	if floor(nNextExp/1e6) + nCurTskVal > %tbBITTSK_LIMIT_USE_TRON.nMaxValue then
		nNextExp = (%tbBITTSK_LIMIT_USE_TRON.nMaxValue - nCurTskVal)*1e6
	end
	
	tbVNG_BitTask_Lib:addTask(%tbBITTSK_LIMIT_USE_TRON, floor(nNextExp/1e6))
	tbVNG_BitTask_Lib:addTask(%tbBITTSK_LIMIT_USE_TRON_COUNT, 1)
	tbAwardTemplet:Give({szName = "§iÓm kinh nghiÖm", nExp=nNextExp}, 1, {%EVENT_LOG_TITLE, "SuDungBanhLongDenTronExp"})
	nCurTskVal = tbVNG_BitTask_Lib:getBitTask(%tbBITTSK_LIMIT_USE_ONG)
	Msg2Player(format("B¹n võa nhËn ®­îc <color=yellow>%s<color> exp tõ vËt phÈm %s", nNextExp, "<color=green>ITEM_AWARD_4.szName<color>" ))	
end

function pActivity:UseLongDenCaChep()
	if not tbVNG_BitTask_Lib:CheckBitTaskValue(%tbBITTSK_LIMIT_USE_CACHEP,%tbBITTSK_LIMIT_USE_CACHEP.nMaxValue,"§· ®¹t ®Õn giíi h¹n, kh«ng thÓ sö dông tiÕp","<") then
		return
	end
	local rtotal = 10000000	
	local rcur=random(1,rtotal);
	local rstep=0;
	local tbItem = %tbAward_CaChep_Exp
	local nRandResult = 0
	for i=1,getn(tbItem) do
		rstep=rstep+floor(tbItem[i].nRate*rtotal/100);
		--so sanh neu exp so sanh nho hon exp trong bang thi lay exp trong bang
		if(rcur <= rstep) then
			nRandResult = tbItem[i].nExp
			break
		end
	end
	local nCurTskVal = tbVNG_BitTask_Lib:getBitTask(%tbBITTSK_LIMIT_USE_CACHEP)
	local nNextExp = nRandResult
	-- Lan su dung cuoi cung vuot qua gioi han
	if floor(nNextExp/1e6) + nCurTskVal > %tbBITTSK_LIMIT_USE_CACHEP.nMaxValue then
		nNextExp = (%tbBITTSK_LIMIT_USE_CACHEP.nMaxValue - nCurTskVal)*1e6
	end
	
	tbVNG_BitTask_Lib:addTask(%tbBITTSK_LIMIT_USE_CACHEP, floor(nNextExp/1e6))
	tbVNG_BitTask_Lib:addTask(%tbBITTSK_LIMIT_USE_CACHEP_COUNT, 1)
	tbAwardTemplet:Give({szName = "§iÓm kinh nghiÖm", nExp=nNextExp}, 1, {%EVENT_LOG_TITLE, "SuDungBanhLongDenCaChepExp"})
	tbAwardTemplet:Give(%tbAward_CaChep_Item, 1, {%EVENT_LOG_TITLE, "SuDungLongDenCaChepNhanItem"})
	nCurTskVal = tbVNG_BitTask_Lib:getBitTask(%tbBITTSK_LIMIT_USE_CACHEP)
	Msg2Player(format("B¹n võa nhËn ®­îc <color=yellow>%s<color> exp tõ vËt phÈm %s", nNextExp, "<color=green>ITEM_AWARD_5.szName<color>" ))	
end

--Tang long den keo quan
function pActivity:GiveBestLightCage(nCount)
	tbAwardTemplet:Give({szName = "§iÓm kinh nghiÖm", nExp=3e6}, 1, {"Event_TangLongDenKeoQuan", "TangLongDenKeoQuan"})
	tbAwardTemplet:Give(%tbAward_KeoQuan, 1, {%EVENT_LOG_TITLE, "TangLongDenKeoQuanNhanItem"})	
	Msg2Player(format("C¸c h¹ tÆng vËt phÈm cho H»ng Nga nhËn ®­îc <color=yellow>%s<color> kinh nghiÖm vµ phÇn th­ëng thªm (nÕu may m¾n)", 10e6))	
	PlayerFunLib:AddTask(%nTask_ItemScript_KQ,nCount)	
	return 1
end

function pActivity:ComposeLimit(nCount)
	local nTaskVal = GetTask(%nTask_ItemScript_KQ)
	if not nTaskVal then
		return nil
	end
	if (nTaskVal + nCount) > %nLimit_LongDen_KQ then
		Msg2Player(format("Sè l­îng v­ît qu¸ giíi h¹n, ng­¬i chØ cã thÓ tÆng <color=yellow>%d <color>Lång §Ìn KÐo Qu©n n÷a.", %nLimit_LongDen_KQ - nTaskVal))
		return nil
	end
	return 1
end


function pActivity:UseHopVatLieuLongDen()
	local PItem = 0;
	local PGetItem = random();
	local PGetItem = PGetItem * 100;
	for ngift,mgift in TB_BOX_DROP do
		PItem = PItem + TB_BOX_DROP[ngift][3];
		if(PGetItem < PItem) then
			AddItem(6,1,TB_BOX_DROP[ngift][2],1,0,0,0);
			Msg2Player("B¹n nhÆt ®­îc nguyªn liÖu lµm lång ®Ìn: <color=green>"..TB_BOX_DROP[ngift][1].."<color>");
			return
		end
	end
	return 1;

end