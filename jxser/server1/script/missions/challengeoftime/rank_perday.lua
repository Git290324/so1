Include("\\script\\lib\\gb_taskfuncs.lua")
Include("\\script\\lib\\awardtemplet.lua")

tsk_rank_lastdate	= 2636	-- 玩家最近一次参加高级闯关的时间
tsk_rank_lastscore 	= 2637	-- 玩家最近一次参加高级闯关的成绩
tsk_rank_2thdate 	= 2638	-- 玩家最近第二次参加高级闯关的时间
tsk_rank_2thscore 	= 2639	-- 玩家最近第二次参加高级闯关的成绩

DailyRankLadderId	= 10235

nTIMERANK = "challengeoftime_ranklist";	-- 时间挑战每天的排名

tbQiannianlingyao = {szName = "Thi猲 Ni猲 Linh Dc", tbProp = {6, 1, 2116, 1, 1, 0}, nExpiredTime = 24 * 60};

function rank_award()
	ntime = tonumber(GetLocalDate("%H%M"))
	if (ntime < 4 or ntime > 2300) then
		Say("Nhi誴 Th� Tr莕: дn nh薾 v祇 th阨 gian ch� nh", 0);
		return
	end
	
	if (CalcFreeItemCellCount() < 1) then
		Say("Nhi誴 Th� Tr莕: V� s� an to祅 cho i hi謕, xin h穣 ch鮝 h祅h trang tr猲 1 � tr鑞g", 0);
		return
	end
	
	update_gbtask(9999999);
	update_playertask();
end

function update_gbtask(nTime)
	local ndate = tonumber(GetLocalDate("%y%m%d"));
	local nlastday = floor(FormatTime2Number(GetCurServerTime() - 24 * 60 * 60) / 10000);
	if (gb_GetTask(nTIMERANK, 1) ~= ndate) then
		if (gb_GetTask(nTIMERANK, 1) ~= nlastday) then
			gb_SetTask(nTIMERANK, 3, nlastday);
			gb_SetTask(nTIMERANK, 4, 0);
			
		else
			gb_SetTask(nTIMERANK, 3, gb_GetTask(nTIMERANK, 1));
			gb_SetTask(nTIMERANK, 4, gb_GetTask(nTIMERANK, 2));
		end
		gb_SetTask(nTIMERANK, 1, ndate);
		gb_SetTask(nTIMERANK, 2, nTime)
	else
		if (gb_GetTask(nTIMERANK, 2) > nTime) then
			gb_SetTask(nTIMERANK, 2, nTime);
		end
	end	
end

function update_playertask()
	local nlastday = floor(FormatTime2Number(GetCurServerTime() - 24 * 60 * 60) / 10000);
	if (GetTask(tsk_rank_lastdate) ~= nlastday and GetTask(tsk_rank_2thdate) ~= nlastday) then
		Say("Nhi誴 Th� Tr莕: Чi hi謕 v蒼 ch璦  甶襲 ki謓 nh薾 thng", 0);
		return
	end
	
	local nlastday = floor(FormatTime2Number(GetCurServerTime() - 24 * 60 * 60) / 10000);
	if (GetTask(tsk_rank_lastdate) == nlastday) then
		if (GetTask(tsk_rank_lastscore) == 0) then
			Say("Nhi誴 Th� Tr莕: H玬 nay i hi謕  nh薾 ph莕 thng n祔 r錳.", 0);
		else
			SetTask(tsk_rank_lastscore, 0);
			tbAwardTemplet:GiveAwardByList(tbQiannianlingyao, "Thi猲 Ni猲 Linh Dc");
		end
	else
		if (GetTask(tsk_rank_2thscore) == 0) then
			Say("Nhi誴 Th� Tr莕: H玬 nay i hi謕  nh薾 ph莕 thng n祔 r錳.", 0);
		else
			SetTask(tsk_rank_2thscore, 0);
			tbAwardTemplet:GiveAwardByList(tbQiannianlingyao, "Thi猲 Ni猲 Linh Dc");
		end
	end
end

function get_top5team()
	tbRoleName = {};
	for i = 1, 5 do
		RoleName, value = Ladder_GetLadderInfo(DailyRankLadderId, i);
		value = value * (-1);
		if (RoleName == "" and i == 1) then
			Say("B秐g x誴 h筺g t筸 th阨 ch璦 c� th玭g tin!", 0);
			return
		end
--		if (RoleName == "") then
--			break
--		end
		local szTime	= format("%s ph髏 %s gi﹜", floor(value/60), floor(mod(value, 60)));
		tinsert(tbRoleName, getn(tbRoleName)+1, format("H筺g %d: %s\tTh祅h t輈h: %s\n", i, RoleName, szTime));
	end
	tinsert(tbRoleName, getn(tbRoleName)+1, "Ta ch� n xem!/OnCancel");
	Say("B秐g x誴 h筺g:", getn(tbRoleName), unpack(tbRoleName));
end
