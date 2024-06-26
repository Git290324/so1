-- 华山擂台对话
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\missions\\huashanqunzhan\\high_grade\\ready\\readyclass.lua")
Include("\\script\\missions\\huashanqunzhan\\mid_grade\\ready\\readyclass.lua")
Include("\\script\\lib\\awardtemplet.lua")
function huashanqunzhan_SignUpMain(nStep)
	local tbSay = nil
	local nPlayerLevel = GetLevel()
	
	local tbReadyMission = nil
	if nPlayerLevel < 50 then
		tbReadyMission = nil
	elseif nPlayerLevel < 120 then
		tbReadyMission = huashanqunzhan_tbReady_M
	else
		tbReadyMission = huashanqunzhan_tbReady_H
	end
	
	local nState = tbReadyMission and tbReadyMission:CheckMathState() or nil
	if nStep == 1 then
		if nState == 1 then
			tbSay = 
			{
				format("<dec><npc>%s  b総 u b竜 danh, ph� b竜 danh l� 10 v筺 lng, i hi謕 c� ng � kh玭g?",tbReadyMission.tbRef.szMatchName),
				 "B竜 danh tham gia/#huashanqunzhan_SignUpMain(2)",
			}
		elseif nState == 0 or nState == -1 then
			local tbWorld = 
			{
				{"-","-","-"},
				{"Ng祔", "S� tr薾", "Th阨 gian"},
				{"-","-","-"},
				{"Th� 2 n th� 6", "2", "10:00 - 10:45"},
				{"","", "22:00 - 22:45"},
				{"-","-","-"},
				{"","","10:00 - 10:45"},
				{"Th� 7 v� Ch� nh藅", "3", "15:00 - 15:45"},
				{"","","22:00 - 22:45"},
				{"-","-","-"},
			}
			local szMsg = nState == 0 and "Tr薾 u v蒼 ch璦 b総 u." or "Tr薾 u 產ng 頲 ti課 h祅h."
			tbSay = 
			{
				"<dec><npc>"..szMsg.."Th阨 gian thi u nh� sau:<enter>"..huashanqunzhan_drawtable(tbWorld),
			}
		elseif nState == -2 then
			local tbMacthMission	= tbReadyMission.tbRef
			
			local szWinerName		= tbMacthMission:GetMissionS(tbMacthMission.tbMissionS.WINER_INDEX)
			local szMsg				= (szWinerName and szWinerName ~= "")  and format("Ngi chi課 th緉g: <color=yellow>%s<color>", szWinerName) or "Tr薾 n祔 kh玭g c� Ngi chi課 th緉g"
			
			tbSay = 
			{
				format("<dec><npc>Tr薾 %s  ph﹏ th緉g b筰, %s", tbMacthMission.szMatchName, szMsg),
				
			}
		elseif nState == nil then
			tbSay = 
			{
				"<dec><npc>Ngi ch琲 c蕄 tr猲 50  n筽 th� m韎 c� th� tham gia Hoa S琻 Чi Chi課. C蕄 t� 50 n 119 c� th� tham gia Hoa S琻 Чi Chi課 trung c蕄; c蕄 120 tr� l猲 c� th� tham gia Hoa S琻 Чi Chi課 cao c蕄. Ngi ch璦  ng c蕄  tham gia.",
			}
		end		
	elseif nStep == 2 then
		if GetCash() < tbReadyMission.nMoney then
			return Say(format("Ph� b竜 danh l� %d lng, ng﹏ lng tr猲 ngi kh玭g .", tbReadyMission.nMoney), 0)
		end
		
		
		if tbReadyMission == nil then
			return Say("Ъng c蕄 ch璦  50, kh玭g th� tham gia b竜 danh.", 0)
		else
			return huashanqunzhan_SignUpStep(tbReadyMission)
		end
	end
	
	if  huashanqunzhan_CheckGetAward(tbReadyMission.tbRef) then
		tinsert(tbSay,2,"Ph莕 thng cho ngi chi課 th緉g./huashanqunzhan_GetAward")
	end
	
	tinsert(tbSay, "K誸 th骳 i tho筰/OnCancel")
	CreateTaskSay(tbSay)
end


function huashanqunzhan_SignUpStep(tbMission)
	local nState = tbMission:CheckMathState()
	if nState == 1 then
		tbMission:GotoReadyPlace()
	elseif nState == 0 then
		Say("Tr薾 u v蒼 ch璦 b総 u.", 0)
	elseif nState == -1 then
		Say("Tr薾 u 產ng ti課 h祅h, xin i n tr薾 sau.", 0)
	elseif nState == -2 then
		
		local tbMacthMission	= tbMission.tbRef
		local szWinerName		= tbMacthMission:GetMissionS(tbMacthMission.tbMissionS.WINER_INDEX)
		local szMsg				= szWinerName and format("Ngi chi課 th緉g: <color=yellow>%s<color>", szWinerName) or "Tr薾 n祔 kh玭g c� Ngi chi課 th緉g"
		local tbSay = 
		{
			format("<dec><npc>Tr薾 %s  ph﹏ th緉g b筰, %s", tbMacthMission.szMatchName, szMsg),
			"K誸 th骳 i tho筰/OnCancel"
		}
		CreateTaskSay(tbSay)
	end
	
end

function huashanqunzhan_GetAward()
	if CalcFreeItemCellCount() < 20 then
		return Say("T骾 h祅h trang  y, h穣 d鋘 d裵 h祅h trang  b秓 m an to祅 cho v藅 ph萴.",0)
	end
	local tbAward = 
	{
		{szName="Lam Th駓 Tinh", tbProp={4, 238, 1, 1, 0, 0}, nCount = 2},
		{szName="L鬰 Th駓 Tinh", tbProp={4, 240, 1, 1, 0, 0}, nCount = 2},
		{szName="T� Th駓 Tinh", tbProp={4, 239, 1, 1, 0, 0}, nCount = 2},
		{szName="Tinh H錸g B秓 Th筩h", tbProp={4, 353, 1, 1, 0, 0}, nCount = 12},
		{szName="V� L﹎ M藅 T辌h", tbProp={6, 1, 26, 1, 0, 0}},
		{szName="T葃 T駓 Kinh", tbProp={6, 1, 22, 1, 0, 0}},
	}
	local nCount = GetTask(huashanqunzhan.TSK_Winer)
	
	tinsert(tbAward, { nJxb = 90000 * nCount})
	
	tbAwardTemplet:GiveAwardByList(tbAward, "L玦 Уi Hoa S琻 Чi Chi課")
	SetTask(huashanqunzhan.TSK_Winer, 0)
end


function huashanqunzhan_CheckGetAward(tbMission)
	local nState = tbMission:GetMissionState()
	local nPlayerMathId = GetTask(tbMission.TSK_MatchId)
	local nMathId = tbMission:GetMissionV(tbMission.tbMissionV.MATCH_ID)
	if nPlayerMathId == nMathId and nState == 2 and GetTask(tbMission.TSK_Winer) > 0 then
		
		return 1
	end
	return nil
end

function OnCancel()
	
end




function huashanqunzhan_drawtable(tbWord)
	local nLen = 0
	local str = ""
	for _, tb2 in tbWord do
		for _, sz in tb2 do
			if sz and nLen < strlen(sz) then
				nLen = strlen(sz)
			end
		end
	end
	for _, tb2 in tbWord do
		local str_space
		for j, sz in tb2 do
			if sz ~= "-" or ( sz == "-" and j==1 )then
				str = str.."|"
			else
				str = str.."-"
			end
			 str_space = sz == "-" and "-" or " "
			str = str..strfill_center(sz,nLen, str_space)
		end
		str = str.."|"
	
		str = str.."<enter>"
	end
	return str
end
