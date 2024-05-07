Include("\\script\\tong\\tong_header.lua")
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\answer.lua")
IncludeLib("LEAGUE")
IncludeLib("TONG")
tbZhongQiu200909 = {}
tbZhongQiu200909.tbNpcPos = {}
local tbLadderId = 
{
	10263,10264,10265
}

local tbTongTSK_Exploit = 
{
	TONGTSK_Gongde_meici,
	TONGTSK_Gongde_meizhou,
	TONGTSK_Gongde_Total,
}

local tbTongTSK_ExploitFlag = 
{
	TONGTSK_Gongde_meici_flag,
	TONGTSK_Gongde_meizhou_flag
}

-- 获得帮会功德值
function tbZhongQiu200909:GetTongExploit(nId)
	local szTongName, nTongID = GetTongName();
	if szTongName == nil or szTongName == "" then
		error("Have not a Tong")
	end
	return TONG_GetTaskValue(nTongID, %tbTongTSK_Exploit[nId]);
end

-- 帮会功德+nCount
function tbZhongQiu200909:AddExploit(nCount)
	local szTongName, nTongID = GetTongName();
	if szTongName == nil or szTongName == "" then
		error("Have not a Tong")
	end

	local nOldCount1 = TONG_GetTaskValue(nTongID, %tbTongTSK_Exploit[1]);
	local nOldCount2 = TONG_GetTaskValue(nTongID, %tbTongTSK_Exploit[2]);
	local nOldCount3 = TONG_GetTaskValue(nTongID, %tbTongTSK_Exploit[3]);	

	Ladder_NewLadder(%tbLadderId[1], szTongName, nOldCount1+ nCount, 0)
	Ladder_NewLadder(%tbLadderId[2], szTongName, nOldCount2+ nCount, 0)
	Ladder_NewLadder(%tbLadderId[3], szTongName, nOldCount3+ nCount, 0)
	
	TONG_ApplyAddTaskValue(nTongID, %tbTongTSK_Exploit[1], nCount);
	TONG_ApplyAddTaskValue(nTongID, %tbTongTSK_Exploit[2], nCount);
	TONG_ApplyAddTaskValue(nTongID, %tbTongTSK_Exploit[3], nCount);
	Msg2Tong(nTongID, format("Bang h閕 %s t╪g %d, hi謓 t筰 bang h閕 %s %d", "甶觤 trang tr�", nCount, "甶觤 trang tr�", nOldCount1+ nCount))
	
	
	
	--local szParam = format("%u,%s,%d", nTongID, szTongName, nCount)
	--LG_ApplyDoScript(1, "", "", "\\script\\event\\zhongqiu_jieri\\head.lua", "tbZhongQiu200909_AddExploit", szParam , "", "")
end

-- 帮会功德值更新 ,好像不用了
function tbZhongQiu200909:UpdateExploit(nTongID, nId)
	local nFlag = self:GetCurFlag(nId);
	
	if (TONG_GetTaskValue(nTongID, %tbTongTSK_ExploitFlag[nId]) ~= nFlag) then
		return 1
	end
end

function tbZhongQiu200909:IsTimeAct()
	
	local nTime = tonumber(GetLocalDate("%H%M"))
	local nWeek	= tonumber(GetLocalDate("%w"))	
	local nWeek	= tonumber(GetLocalDate("%w"))
	if ( nWeek == 5 or nWeek == 6 or nWeek == 0) then
		
		if (1930 <= nTime and nTime < 2000) then
			return 1	
		end
	end
	Talk(1,"", format("Hi謓 t筰 kh玭g th� n閜 %s nh薾 %s.", "nh竛h c﹜", "甶觤 trang tr�"))
end

-- 获得目前标志值
function tbZhongQiu200909:GetCurFlag(nId)
	if (nId == 2) then
		return tonumber(GetLocalDate("%W%Y"));
	end
		
	if (nId == 1) then
		ndate = GetLocalDate("%y%m%d");
		return tonumber(ndate);

	end
end


function tbZhongQiu200909:GetAwardDailog()
	local tbOpt = {}
	local nWeek = tonumber(GetLocalDate("%w"))
	local nTimeHM = tonumber(GetLocalDate("%H%M"))
	if (2000 <= nTimeHM and nTimeHM <  2400 and ( nWeek == 5 or nWeek == 6 or nWeek == 0)) then
		tinsert(tbOpt, {"Nh薾 ph莕 thng m鏸 t", self.GetAward1, {self}})
	end
	
	if nWeek == 0 and (2000 <= nTimeHM and nTimeHM <  2400) then
		tinsert(tbOpt, {"Nh薾 ph莕 thng tu莕", self.GetAward2, {self}})
	end
	local nDate = tonumber(GetLocalDate("%Y%m%d"))
	if nDate == 20100124 and (2000 <= nTimeHM and nTimeHM <  2400) then
		tinsert(tbOpt, {"Nh薾 ph莕 thng chung cu閏", self.GetAward3, {self}})
	end
	if getn(tbOpt) == 0 then
		Talk(1, "", "Hi謓 t筰 kh玭g ph秈 l� th阨 gian nh薾 thng")
		return 
	end
	tinsert(tbOpt, {"K誸 th骳 i tho筰"})
	
	CreateNewSayEx("Чi hi謕 c莕 nh薾 lo筰 ph莕 thng n祇?", tbOpt)
end

function tbZhongQiu200909:TongInfo()
	local szTongName, nTongID = GetTongName();
	if szTongName == nil or szTongName == "" then
		return
	end
	local szMsg = format("Th祅h t輈h m鏸 t: %d<enter>Th祅h t輈h tu莕: %d<enter> Th祅h t輈h chung %d",tbZhongQiu200909:GetTongExploit(1),tbZhongQiu200909:GetTongExploit(2),tbZhongQiu200909:GetTongExploit(3))
	Say(szMsg, 0)
end

function tbZhongQiu200909:GetRank(nId)
	local szTongName, nTongID = GetTongName();
	for i = 1, 5 do
		local szName, nValue = Ladder_GetLadderInfo(%tbLadderId[nId], i);
		if (szName ~= nil and nValue ~= "" and szName == szTongName) then
			return i
		end
	end
	return nil
end



function tbZhongQiu200909:GetAward1()
	
	
	local szTongName, nTongID = GetTongName();
	if szTongName == nil or szTongName == "" then
		return
	end
	local nId = 1
	local nRank = self:GetRank(nId)
	
	if not PlayerFunLib:CheckTask(2646, 22000, "Ngi ch琲 ch� nh薾 頲 22000000000 t� 3 lo筰 ho箃 ng t, tu莕, chung cu閏", "<") then
	
		return
	end	
	
	local nFlag = self:GetCurFlag(nId)
	local nGongdeCount = self:GetTongExploit(nId);
	

	if not PlayerFunLib:CheckTask(2648, nFlag, "Чi hi謕  nh薾 ph莕 thng n祔 r錳.", "~=") then
		return
	end	
	
	
	local nJoinTongTime = GetJoinTongTime()
	
	if nJoinTongTime < 12*60 then
		Talk(1, "", format("C莕 ph秈 v祇 bang %d gi� m韎 c� th� nh薾 頲 ph莕 thng n祔.", 12))
		return 
	end
	local tbAward = 
	{
		{nExp = 6e7},
		{nExp = 4e7},
		{nExp = 3e7},
		{nExp = 2e7},
		{nExp = 1e7},
	}
	if nRank and nGongdeCount > 0 then
		tbAwardTemplet:GiveAwardByList(tbAward[nRank], "meici gong de paiming "..nRank, 1)
		PlayerFunLib:AddTask(2646, floor(tbAward[nRank].nExp/1e6))
		PlayerFunLib:SetActivityTask(2648, nFlag)
	elseif not nRank and nId == 1 and nGongdeCount >= 2 then
		PlayerFunLib:AddExp(5e6, bFlag, "meici gong de paiming not rank")
		PlayerFunLib:AddTask(2646, 5)
			
		PlayerFunLib:SetActivityTask(2648, nFlag)
	else
		Talk(1, "", " kh玭g ph� h頿 v韎 甶襲 ki謓 nh薾 thng l莕 n祔.")
		return
	end	
end


function tbZhongQiu200909:GetAward2()
	local szTongName, nTongID = GetTongName();
	if szTongName == nil or szTongName == "" then
		return
	end
	local nId = 2
	local nRank = self:GetRank(nId)
	
	if not PlayerFunLib:CheckTask(2646, 22000, "Ngi ch琲 ch� nh薾 頲 22000000000 t� 3 lo筰 ho箃 ng t, tu莕, chung cu閏", "<") then
		return
	end	

	if not PlayerFunLib:CheckTask(2649, tonumber(GetLocalDate("%W%Y")), "Чi hi謕  nh薾 ph莕 thng n祔 r錳.", "~=") then
		return
	end	
	local nJoinTongTime = GetJoinTongTime()
	
	if nJoinTongTime < 48*60 then
		Talk(1, "", format("C莕 ph秈 v祇 bang %d gi� m韎 c� th� nh薾 頲 ph莕 thng n祔.", 48))
		return 
	end
	local tbAward = 
	{
		{nExp = 15e7},
		{nExp = 1e8},
		{nExp = 8e7},
		{nExp = 6e7},
		{nExp = 4e7},
	}
	if nRank then
		tbAwardTemplet:GiveAwardByList(tbAward[nRank], "meizhou gong de paiming "..nRank, 1)
		PlayerFunLib:AddTask(2646, floor(tbAward[nRank].nExp/1e6))
		PlayerFunLib:SetActivityTask(2649, tonumber(GetLocalDate("%W%Y")))
	else
		Talk(1, "", " kh玭g ph� h頿 v韎 甶襲 ki謓 nh薾 thng l莕 n祔.")
		return
	end	
end


function tbZhongQiu200909:GetAward3()
	local szTongName, nTongID = GetTongName();
	if szTongName == nil or szTongName == "" then
		return
	end
	local nId = 3
	local nRank = self:GetRank(nId)
	
	if not PlayerFunLib:CheckTask(2646, 22000, "Ngi ch琲 ch� nh薾 頲 22000000000 t� 3 lo筰 ho箃 ng t, tu莕, chung cu閏", "<") then
		return
	end	

	if not PlayerFunLib:CheckTask(2650, 0, "Чi hi謕  nh薾 ph莕 thng n祔 r錳.", "==") then
		return
	end	
	local nJoinTongTime = GetJoinTongTime()
	
	if nJoinTongTime < 24*60*7 then
		Talk(1, "", format("C莕 ph秈 v祇 bang %d gi� m韎 c� th� nh薾 頲 ph莕 thng n祔.", 24*7))
		return 
	end
	local tbAward = 
	{
		{nExp = 2e8},
		{nExp = 15e7},
		{nExp = 10e7},
		{nExp = 8e7},
		{nExp = 6e7},
	}
	if nRank then
		tbAwardTemplet:GiveAwardByList(tbAward[nRank], "tatol gong de paiming "..nRank, 1)
		PlayerFunLib:AddTask(2646, floor(tbAward[nRank].nExp/1e6))
		PlayerFunLib:SetActivityTask(2650, 1)
	else
		Talk(1, "", " kh玭g ph� h頿 v韎 甶襲 ki謓 nh薾 thng l莕 n祔.")
		return
	end	
end



function tbZhongQiu200909:FlyToTree()
	local tbPos = 
	{
		{121,226,275, "Long M玭 tr蕁"},
		{100,183,203, "Chu Ti猲 tr蕁"},
		{101,171,198, "Чo Hng th玭"},
		{174,218,192, "Long Tuy襫 th玭"},
		{53, 220,200, "Ba L╪g huy謓"},
		{20, 432,359, "Giang T﹏ Th玭"},
		{153,232,180, "Th筩h C� tr蕁"},
		{99, 189,223, "V躰h L筩 tr蕁"},
	}
	local tbOpt = {}
	for i=1, getn(tbPos) do 
		local tb = tbPos[i]
		tinsert(tbOpt, format("%s(%d,%d)/#tbZhongQiu200909:Fly(%d,%d,%d)", tb[4],tb[2],tb[3], tb[1],tb[2] * 8 ,tb[3] * 16))
		
	end
	tinsert(tbOpt, "H駓 b� /OnCancel")
	Say("Xa phu: Чi hi謕 mu鑞 甶 n琲 u?", getn(tbOpt), tbOpt)
end
function tbZhongQiu200909:Fly(n,x,y)
	NewWorld(n,x,y)
	SetFightState(1)
end


function OnCancel()
	
	
end