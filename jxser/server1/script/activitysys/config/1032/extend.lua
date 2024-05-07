Include("\\script\\activitysys\\config\\1032\\head.lua")
Include("\\script\\activitysys\\config\\1032\\variables.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\log.lua")

function pActivity:AddInitNpcTQSK()
	local tbPos = {		
		{1,199*8*32,199*16*32},
		{162,203*8*32,198*16*32},
		{80,221*8*32,189*16*32},
		{176,197*8*32,184*16*32},		
		{78,1588,3221},
		{11,3141,5061},
		{37,1707,3117},
	}
	
	

	for _, pos in tbPos do
		local nMapIndex = SubWorldID2Idx(pos[1])
		if nMapIndex >= 0 then
			local nNpcIndex = AddNpcEx(1932, 1, 0, nMapIndex, pos[2], pos[3], 1, "TÊng Qu∂n S˘ Ki÷n")
			if nNpcIndex and nNpcIndex > 0 then
				SetNpcScript(nNpcIndex, "\\script\\activitysys\\npcdailog.lua")
			end
		end
	end



end




pActivity.tbGlobalNumber = {
	["GiveHangNgaLenhBai"] = 0,
}
function pActivity:GiveHangNgaLenhBai(nCount)
	tbAwardTemplet:Give({szName = "ßi”m kinh nghi÷m", nExp=3e6}, 1, {"Event_GiaoHangNgaLenhBai", "GiaoHangNgaLenhBai"})
	--chinh lai 
	tbAwardTemplet:Give(%tbAward_HangNgaLenhBai, 1, {%EVENT_LOG_TITLE, "GiaoHangNgaLenhBaiNhanItem"})	
	Msg2Player(format("C∏c hπ t∆ng vÀt ph»m cho TÊng Qu∂n s˘ ki÷n nhÀn Æ≠Óc <color=yellow>%s<color> kinh nghi÷m vµ ph«n th≠Îng th™m (n’u may mæn)", 3e6))	
	PlayerFunLib:AddTask(%nTask_ItemScript_HangNgaLenhBai,nCount)	
	return 1
end

function pActivity:ComposeLimitHangNgaLenhBai(nCount)
	local nTaskVal = GetTask(%nTask_ItemScript_HangNgaLenhBai)
	if not nTaskVal then
		return nil
	end
	if (nTaskVal + nCount) > %nLimit_HangNgaLenhBai then
		Msg2Player(format("SË l≠Óng v≠Ót qu∏ giÌi hπn, ng≠¨i chÿ c„ th” t∆ng <color=yellow>%d <color>Hªng Nga L÷nh Bµi n˜a.", %nLimit_HangNgaLenhBai- nTaskVal))
		return nil
	end
	return 1
end
