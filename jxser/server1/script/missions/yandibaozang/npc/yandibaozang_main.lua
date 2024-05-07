-- 炎帝宝藏
-- by 小浪多多
-- 2007.10.24
-- 我..
-- 正在尝试着..
-- 寻找着属于我的天地..
Include("\\script\\lib\\gb_modulefuncs.lua")
Include("\\script\\missions\\yandibaozang\\readymap\\include.lua")
Include("\\script\\missions\\yandibaozang\\include.lua")
Include("\\script\\missions\\yandibaozang\\npc\\golditem.lua")
Include("\\script\\missions\\yandibaozang\\npc\\yandituteng.lua")
Include("\\script\\missions\\yandibaozang\\yandiduihuan.lua")
--YDBZ_DATE_START = 13	--	开始时间
--YDBZ_DATE_END = 23		--	结束时间
ID_PRISONMAN = 96; 		-- 判断是否在坐牢的 ID
function main()
--	Say("Ch鴆 n╪g 產ng 頲 t筸 ng",0)
--	do return end
--	if gb_GetModule("YANDIBAOZANG_TALK") ~= 1 then
--		Say("对不起，此功能暂时关闭，开放时间敬请关注官方公告。",0)
--		return
--	end
	local tbarytalk = {
	"<dec><npc>C竎h ch琲 vt 秈 m韎, n閕 dung m韎, boss m韎, b秐  m韎, v� v祅 k� tr﹏ d� b秓, r蕋 th輈h h頿 c竎 trang b� ho祅g kim c馻 m玭 ph竔 ch� c� t筰 b秓 t祅g vi猰 . C竎 h�  chu萵 b� ch璦?",
	"Xem t譶h h譶h t� i/YDBZ_view_player",
--	"炎帝黄金图谱兑换/YDBZ_golditem",
--	"炎帝图腾兑换/YDBZ_tradeYandiTuTeng",
--	"Ta mu鑞 i vi猰  l謓h k�/YDBZ_tradeYandiLingQi",
--	"Ta mu鑞 i huy襫 vi猲 l謓h/YDBZ_tradeXuanYuanLing",
--	"我要重铸炎帝黄金装备/yandiduihuan_main",
--	"重铸炎帝黄金装备说明/yandiduihuan_shuoming",
	"Ngu錸 g鑓 b秓 t祅g vi猰 /YDBZ_about",
	"Ta ch� mu鑞 d筼 ch琲/NoChoice",
	}
	if YDBZ_check_ready_state() == 1 then
		tinsert(tbarytalk,2,"B竜 danh tham gia/YDBZ_want_play")
		tinsert(tbarytalk,3,"Th祅h vi猲 tham chi課/YDBZ_member_play")
	end
	CreateTaskSay(tbarytalk)
end

function YDBZ_check_ready_state()
	OldSubWorld = SubWorld
	for i = 1, getn(YDBZ_READY_MAP) do 
		sub = SubWorldID2Idx(YDBZ_READY_MAP[i])
		if (sub >= 0) then
			SubWorld = sub
			local state = GetMissionV(YDBZ_READY_STATE)
			if state == 1 then
				SubWorld = OldSubWorld
				return 1
			end
		end
	end
	SubWorld = OldSubWorld
	return 0
end
function YDBZ_member_play()
	if YDBZ_checkLimit2() == 1 then
		return
	end
	YDBZ_dragon_mem_join()
end
function YDBZ_view_player()
	if YDBZ_checkLimit() == 1 then
		return
	end
	Say("T� i c馻 c竎 h� ph� h頿 v韎 甶襲 ki謓 ti課 v祇 b秓 t祅g vi猰 ",0)
end

function YDBZ_checkLimit2()
	if GetCamp() == 0 then
			Say("Th祅h vi猲 trong t� i c� ngi ch璦 gia nh藀 m玭 ph竔, kh玭g th� tham gia ho箃 ng.",0)
			return 1
	end 
	if GetTeamSize() ~= 0 then
		Say("C莕 ph秈 tr� v� � c鯽 v祇 b秓 t祅g vi猰  c馻 t� i, hi謓 gi� kh玭g th� t� i 頲",0)
		return 1
	end
	if (GetLevel() < YDBZ_LIMIT_PLAYER_LEVEL) then
		Say("C蕄 b薱 kh玭g   tham gia ho箃 ng",0)
		return 1
	end
		
	--检查信物
	local ndg = YDBZ_LIMIT_DOUBEL_ITEM[1][1]									--物品
	local ndd = YDBZ_LIMIT_DOUBEL_ITEM[1][2]
	local ndp = YDBZ_LIMIT_DOUBEL_ITEM[1][3]

	local ndnumzimu = CalcItemCount(3,ndg,ndd,ndp,-1)
	local ndnumbeibao = CalcItemCount(23,ndg,ndd,ndp,-1)	
	
	local g = YDBZ_LIMIT_ITEM[1][1]									--物品
	local d = YDBZ_LIMIT_ITEM[1][2]
	local p = YDBZ_LIMIT_ITEM[1][3]

	local numzimu = CalcItemCount(3,g,d,p,-1)
	local numbeibao = CalcItemCount(23,g,d,p,-1)
	if ( (numzimu+numbeibao) < YDBZ_LIMIT_ITEM[2] and (ndnumzimu+ndnumbeibao) < YDBZ_LIMIT_DOUBEL_ITEM[2] ) then
		Say("C竎 h� kh玭g 甧m theo anh h飊g thi誴, kh玭g th� tham gia tranh 畂箃 vi猰 .",0)
		return 1
	end
	
	--检测参加上限
	local nweek = tonumber(GetLocalDate("%W"))			--次数
	local nday = tonumber(GetLocalDate("%d"))
	local noldweek = YDBZ_sdl_getTaskByte(YDBZ_PLAY_LIMIT_COUNT,1)
	local ncount = YDBZ_sdl_getTaskByte(YDBZ_PLAY_LIMIT_COUNT,2)
	local noldday = YDBZ_sdl_getTaskByte(YDBZ_PLAY_LIMIT_COUNT,3)
	local ndaycount = YDBZ_sdl_getTaskByte(YDBZ_PLAY_LIMIT_COUNT,4)

	if nweek == noldweek and ncount >= YDBZ_LIMIT_WEEK_COUNT and (ndnumzimu + ndnumbeibao) == 0 then
			Say("Tu莕 n祔 c竎 h�  tham gia  s� t c莕 thi誸.",0)
			return 1
	elseif (nday == noldday and ndaycount >= YDBZ_LIMIT_DAY_COUNT and (ndnumzimu + ndnumbeibao) == 0 )then
			Say("S� l莕 tham gia trong ng祔  t n m鴆 cao nh蕋.",0)
			return 1
	end
	if nweek ~= noldweek then
		 YDBZ_sdl_setTaskByte(YDBZ_PLAY_LIMIT_COUNT,1,nweek)
		 YDBZ_sdl_setTaskByte(YDBZ_PLAY_LIMIT_COUNT,2,0)
	end
	if nday ~= noldday then
		YDBZ_sdl_setTaskByte(YDBZ_PLAY_LIMIT_COUNT,3,nday)
		YDBZ_sdl_setTaskByte(YDBZ_PLAY_LIMIT_COUNT,4,0)
	end

	YDBZ_sdl_setTaskByte(YDBZ_ITEM_YANDILING,1,0)
	YDBZ_sdl_setTaskByte(YDBZ_ITEM_YANDILING,2,0)
	
end

-- Ki觤 tra Anh H飊g Thi誴 ho芻 Vi猰 д L謓h tham gia t輓h n╪g Vi猰 д - Modified - by AnhHH 20110725
function YDBZ_checkLimit()
	local oldplayer = PlayerIndex
	if (IsCaptain() ~= 1) then
		local tbarytalk ={
			"<dec><npc>Tham gia ho箃 ng vt 秈 vi猰  b秓 t祅g c莕 ph秈 do i trng b竜 danh m韎 v祇 頲.",
			"Bi誸 r錳/NoChoice",
		}
		CreateTaskSay(tbarytalk)
		return 1
	end
	if (GetTeamSize() < YDBZ_TEAM_COUNT_LIMIT or GetTeamSize() > YDBZ_TEAM_COUNT_MAXLIMIT) then
		local tbarytalk ={
			"<dec><npc>T� i tham gia b秓 tang vi猰  c莕 輙 nh蕋 <color=red>"..YDBZ_TEAM_COUNT_LIMIT.."<color> ngi v� kh玭g th� vt qu� <color=red>"..YDBZ_TEAM_COUNT_MAXLIMIT.."<color>. Trc m総 s� ngi trong t� i kh玭g ph� h頿 y猽 c莡.",
			"Bi誸 r錳/NoChoice",
		}
		CreateTaskSay(tbarytalk)
		return 1
	end
	local tbplay = {}
	local noplaylv = 0
	local noitem = 0
	local nocount = 0
	local nsignweekday = 0
	local tbstr = {{},{},{},{}}
	local szstr = ""
	local	nAcc = 0
	for i = 1, GetTeamSize() do 
		PlayerIndex = GetTeamMember(i)
		if GetCamp() == 0 then
			PlayerIndex = oldplayer
			Say("Th祅h vi猲 trong t� i c� ngi ch璦 gia nh藀 m玭 ph竔, kh玭g th� tham gia ho箃 ng.",0)
			return 1
		end 
		--检查等级
		if(GetLevel() < YDBZ_LIMIT_PLAYER_LEVEL) then		--等级
			noplaylv = noplaylv + 1
			tbstr[1][noplaylv] = "<color=yellow>"..GetName().."<color>"
		end
		
		--检查信物
		local ndg = YDBZ_LIMIT_DOUBEL_ITEM[1][1]									--物品
		local ndd = YDBZ_LIMIT_DOUBEL_ITEM[1][2]
		local ndp = YDBZ_LIMIT_DOUBEL_ITEM[1][3]

		local ndnumzimu = CalcItemCount(3,ndg,ndd,ndp,-1)
		local ndnumbeibao = CalcItemCount(23,ndg,ndd,ndp,-1)		
		
		local g = YDBZ_LIMIT_ITEM[1][1]									--物品
		local d = YDBZ_LIMIT_ITEM[1][2]
		local p = YDBZ_LIMIT_ITEM[1][3]

		local numzimu = CalcItemCount(3,g,d,p,-1)
		local numbeibao = CalcItemCount(23,g,d,p,-1)
		--print(ndnumzimu + ndnumbeibao)
--		if ( (numzimu+numbeibao) < YDBZ_LIMIT_ITEM[2] and (ndnumzimu+ndnumbeibao) < YDBZ_LIMIT_DOUBEL_ITEM[2] ) then
--			noitem = noitem + 1
--			tbstr[2][noitem] = "<color=yellow>"..GetName().."<color>"
--		end
		
		--检测参加上限
		local nweek = tonumber(GetLocalDate("%W"))			--次数
		local nday = tonumber(GetLocalDate("%d"))
		local noldweek = YDBZ_sdl_getTaskByte(YDBZ_PLAY_LIMIT_COUNT,1)
		local ncount = YDBZ_sdl_getTaskByte(YDBZ_PLAY_LIMIT_COUNT,2)
		local noldday = YDBZ_sdl_getTaskByte(YDBZ_PLAY_LIMIT_COUNT,3)
		local ndaycount = YDBZ_sdl_getTaskByte(YDBZ_PLAY_LIMIT_COUNT,4)

		if nweek == noldweek and ncount >= YDBZ_LIMIT_WEEK_COUNT and (ndnumzimu + ndnumbeibao) == 0 then
				nocount = nocount + 1
				tbstr[3][nocount] = "<color=yellow>"..GetName().."<color>"
				nsignweekday = 1
		elseif (nday == noldday and ndaycount >= YDBZ_LIMIT_DAY_COUNT and (ndnumzimu + ndnumbeibao) == 0 )then
				nocount = nocount + 1
				tbstr[3][nocount] = "<color=yellow>"..GetName().."<color>"
				nsignweekday = 2
		end
		if nweek ~= noldweek then
			 YDBZ_sdl_setTaskByte(YDBZ_PLAY_LIMIT_COUNT,1,nweek)
			 YDBZ_sdl_setTaskByte(YDBZ_PLAY_LIMIT_COUNT,2,0)
		end
		if nday ~= noldday then
			YDBZ_sdl_setTaskByte(YDBZ_PLAY_LIMIT_COUNT,3,nday)
			YDBZ_sdl_setTaskByte(YDBZ_PLAY_LIMIT_COUNT,4,0)
		end

		YDBZ_sdl_setTaskByte(YDBZ_ITEM_YANDILING,1,0)
		YDBZ_sdl_setTaskByte(YDBZ_ITEM_YANDILING,2,0)
		
		if (YDBZ_sdl_getTaskByte(YDBZ_PLAY_LIMIT_COUNT,4) == 0) then
		--Thay i c竎h b竜 danh vi猰 , l莕 u ti猲 c� th� d飊g anh h飊g thi誴 ho芻 vi猰  l謓h - Modified By DinhHQ - 20120206
			if ((numzimu+numbeibao) < YDBZ_LIMIT_ITEM[2] and (ndnumzimu+ndnumbeibao) < YDBZ_LIMIT_DOUBEL_ITEM[2]) then
				noitem = noitem + 1
				tbstr[2][noitem] = "<color=yellow>"..GetName().."<color>"
			end
		elseif (YDBZ_sdl_getTaskByte(YDBZ_PLAY_LIMIT_COUNT,4) >= 1 and YDBZ_sdl_getTaskByte(YDBZ_PLAY_LIMIT_COUNT,4) <= 3) then
			if ((ndnumzimu+ndnumbeibao) < YDBZ_LIMIT_DOUBEL_ITEM[2])then
				nAcc = nAcc + 1
				tbstr[4][nAcc] = "<color=yellow>"..GetName().."<color>"
			end
		end
	end
	
	PlayerIndex = oldplayer
	if noplaylv > 0 then
		local szstr1 = tbstr[1][1]
		for i=2,noplaylv do 
			szstr1 = szstr1 .. ", " .. tbstr[1][i]
		end
		szstr = szstr .. format("Ngi ch琲 %s trong i v蒼 ch璦 t c蕄 %s.",szstr1,YDBZ_LIMIT_PLAYER_LEVEL)
	end
	if noitem > 0 then
		local szstr1 = tbstr[2][1]
		for i=2,noitem do 
			szstr1 = szstr1 .. ", " .. tbstr[2][i]
		end
		szstr = szstr .. format("Ngi ch琲 %s kh玭g mang theo %s.",szstr1,YDBZ_LIMIT_ITEM[3])
	end
	if nocount > 0 then
		local szstr1 = tbstr[3][1]
		for i=2,nocount do 
			szstr1 = szstr1 .. ", " .. tbstr[3][i]
		end
		if nsignweekday == 1 then
			szstr = szstr .. format("Ngi ch琲 %s trong tu莕 n祔 c� s� l莕 tham gia  t n <color=yellow>%s l莕<color>, kh玭g th� tham gia ho箃 ng vt 秈",szstr1,YDBZ_LIMIT_WEEK_COUNT)	
		elseif nsignweekday == 2 then
			szstr = szstr .. format("Ngi ch琲 %s trong ng祔 c� s� l莕 tham gia  t n <color=yellow>%s l莕<color>, kh玭g th� tham gia ho箃 ng l莕 n祔.",szstr1,YDBZ_LIMIT_DAY_COUNT)	
		end
	end
	if (nAcc > 0) then
		local szstr1 = tbstr[4][1]
		for i = 2, nAcc do 
			szstr1 = szstr1 .. ", " .. tbstr[4][i]
		end
		szstr = szstr .. format("Ngi ch琲 %s kh玭g mang theo %s.",szstr1,YDBZ_LIMIT_DOUBEL_ITEM[3])
	end
	
	if noplaylv + noitem + nAcc +nocount > 0 then
		Msg2Team(szstr);
		Say(szstr,0)
		return 1 	
	end
	return 0
end
function YDBZ_want_play()
	OldSubWorld = SubWorld
	OldPlayer = PlayerIndex
	local totalboat = 0
	local freeboat = 0
	local startboat = 0
	--if YDBZ_checkLimit2() == 1 then
		--return		
	--end
	if YDBZ_checkLimit() == 1  then
		return
	end
	PlayerIndex = OldPlayer
	for i = 1, getn(YDBZ_READY_MAP) do 
		sub = SubWorldID2Idx(YDBZ_READY_MAP[i])
		if (sub >= 0) then
			--print("have "..map_map[i])
			totalboat = totalboat + 1
			SubWorld = sub
			--print(sub)
			local state = GetMissionV(YDBZ_READY_STATE)
			--print(state)
			if (state > 0) then
				startboat = 1
			end
			if ( state == 1) then
				if GetMissionV(YDBZ_READY_TEAM) < YDBZ_LIMIT_TEAMS_COUNT and GetMissionV(YDBZ_READY_TEAM_MAX) < 100 then
					freeboat = freeboat + 1
				end
			end
			--if (state > 1) then
				--Say("姑娘：本城区炎帝宝藏已经开始，要想参加请留意下次开始时间。",0)
				--return
			--end
		end
	end
	--print("total"..totalboat.."free"..freeboat)
	local	strlevel = "Vt 秈 b秓 t祅g vi猰 "
	if (startboat == 1) then
		if (freeboat == 0) then
			local tbarytalk ={
			"<dec><npc>Khu v鵦 th祅h n祔"..strlevel.."   b総 u, kh玭g c遪 v� tr� tr鑞g n祇.",
			"Bi誸 r錳/NoChoice",
		}
		CreateTaskSay(tbarytalk)
			return
		else
			local tbarytalk ={
			-- Thay i hi觧 th� d遪g th玭g b竜 - Modified - by AnhHH 20110725
			"<dec><npc>Khu v鵦 th祅h n祔"..strlevel.." ti課 v祇 giai 畂an b竜 danh, L莕 u m鏸 th祅h vi猲 c莕 ph秈 n閜 <color=red>"..YDBZ_LIMIT_ITEM[2].." c竔 "..YDBZ_LIMIT_ITEM[3].."<color>. T� l莕 th� 2 m鏸 th祅h vi猲 c莕 ph秈 n閜  <color=red>"..YDBZ_LIMIT_DOUBEL_ITEM[2].." c竔 "..YDBZ_LIMIT_DOUBEL_ITEM[3].."<color>, i hi謕 c� mu鑞 tham gia?",
			"Ph秈! Ta mu鑞 d蒼 d総 i c馻 ta tham gia./YDBZ_dragon_join",
			"Kh玭g c莕/NoChoice",
		}
		CreateTaskSay(tbarytalk)
			return
		end
	else
		local tbarytalk ={
			"<dec><npc>Xin l鏸, khu v鵦 th祅h n祔"..strlevel.."Hi謓 t筰 kh玭g c� nhi謒 v� b秓 t祅g vi猰  n祇 c� th� tham gia. B総 u t� <color=red>14:00 n 24:00<color>, xin h穣 ch� � th玭g b竜 v� n trc 5 ph髏  b竜 danh.",
			"Bi誸 r錳/NoChoice",
		}
		CreateTaskSay(tbarytalk)
		return
	end

end

function YDBZ_dragon_join()
	if YDBZ_checkLimit() == 1  then
		return
	end	
		
	OldSubWorld = SubWorld
	
	for i = 1, getn(YDBZ_READY_MAP) do 
		sub = SubWorldID2Idx(YDBZ_READY_MAP[i])
		if (sub >= 0) then
			SubWorld = sub
			local state = GetMissionV(YDBZ_READY_STATE)
			 
			if ( state == 1 and GetMissionV(YDBZ_READY_TEAM) < YDBZ_LIMIT_TEAMS_COUNT ) then
					
				local tabplayer = {}
				for i = 1, GetTeamSize() do 
					tabplayer[i] = GetTeamMember(i)
					--print("plal"..tabplayer[i])
				end

				PlayerIndex = tabplayer[1]
				w,x,y = GetWorldPos()
				SetMissionV(YDBZ_READY_SIGNUP_WORLD, w)
				SetMissionV(YDBZ_READY_SIGNUP_POSX, x)
				SetMissionV(YDBZ_READY_SIGNUP_POSY, y)
				local nteammax = GetMissionV(YDBZ_READY_TEAM_MAX)
				--print(nteammax)
				SetMissionV(YDBZ_READY_TEAM,GetMissionV(YDBZ_READY_TEAM) + 1)
				SetMissionV(YDBZ_READY_TEAM_MAX,(nteammax + 1))
				local szteamname = GetName()
				SetMissionS((nteammax + 1),szteamname)
				
							
				for i = 1 , getn(tabplayer) do 
					PlayerIndex = tabplayer[i]
					--print("player"..PlayerIndex)
					
					-- 在这里判断是否有越狱企图
					w,x,y = GetWorldPos();
					if GetTask(ID_PRISONMAN)>100 or w==208 then
						SetPK(10);
						Msg2Player("<color=red>Ngi v� c� �  vt ng鬰 v� b� t╪g khung h譶h ph箃 n苙g th猰, <color><color=yellow>PK bi課 th祅h 10!<color>");
						for i=1, 3 do
							Msg2SubWorld("<color=yellow>Ngi ch琲: <color><color=green>"..GetName().."<color><color=yellow> c� �  vt ng鬰, b� nha d辌h b総 ngay t筰 hi謓 trng, ng th阨 t╪g m鴆 h譶h ph箃! Th玭g b竜 cho to祅 thi猲 h� bi誸 tin<color>!");
						end;
					else
						SetTask(YDBZ_TEAMS_TASKID,(nteammax+1))
						YDBZ_ready_joinmap(PlayerIndex)				
					end;
				end
				BuildATeam(1,0,tabplayer)
				SubWorld = sub
				Msg2MSAll(YDBZ_READY_MISSION,format("<color=blue>чi %s <color> ti課 v祇 c鎛g b秓 t祅g vi猰 ",szteamname))
				return
			end
		end
	end
	SubWorld = OldSubWorld
	PlayerIndex = OldPlayer
	local	strlevel = "Vt 秈 b秓 t祅g vi猰 "
	Say(format("Hi謓 t筰 <color=red>%s<color> kh玭g c遪 v� tr� tr鑞g n祇. H穣 i t sau", strlevel),0);
end


function YDBZ_dragon_mem_join()
	if YDBZ_checkLimit2() == 1  then
		return
	end	
		
	OldSubWorld = SubWorld
	
	for i = 1, getn(YDBZ_READY_MAP) do 
		sub = SubWorldID2Idx(YDBZ_READY_MAP[i])
		if (sub >= 0) then
			SubWorld = sub
			local state = GetMissionV(YDBZ_READY_STATE)
			if ( state == 1 ) then
				if GetTask(YDBZ_MISSIOM_PLAYER_KEY) ~=  GetMissionV(YDBZ_MISSION_KEY) then
					Say("T� i c馻 i hi謕 kh玭g � t筰 t vt 秈 l莕 n祔.",0)
					return
				end
				local ngroup = GetTask(YDBZ_TEAMS_TASKID)
				--SetTask(YDBZ_TEAMS_TASKID,(nteammax+1))
				if GetMSPlayerCount(YDBZ_READY_MISSION,ngroup) == 0 then
					Say("C鎛g v祇 b秓 t祅g vi猰  kh玭g c� t� i c馻 i hi謕, h穣 t� i l筰 b竜 danh tham gia",0)
					return
				end
				YDBZ_ready_joinmap(PlayerIndex)
				SubWorld = sub
				local idx = 0;
				local ncapter = 0;
				local pidx;
				local tbplayer = {}
				for nj = 1, 10 do
					idx , pidx = GetNextPlayer(YDBZ_READY_MISSION, idx, ngroup);
					if (pidx > 0) then
							tbplayer[nj] = pidx
							PlayerIndex = pidx
							if GetName() == GetMissionS(ngroup) then
									ncapter = nj
							end
					end;
					if (idx <= 0) then
						break;
					end;
				end
				if ncapter > 0 then
					tbplayer[1],tbplayer[ncapter] = tbplayer[ncapter],tbplayer[1]
				end
				BuildATeam(1,0,tbplayer)
				return
			end
		end
	end
	SubWorld = OldSubWorld
	PlayerIndex = OldPlayer
	local	strlevel = "Vt 秈 b秓 t祅g vi猰 "
	Say(format("Hi謓 t筰 <color=red>%s<color> kh玭g c遪 v� tr� tr鑞g n祇. H穣 i t sau", strlevel),0);
	
end

function YDBZ_about()
	-- Thay i th玭g b竜 b竜 danh tham gia  t輓h n╪g Vi猰 д -Modifiled by AnhHH - 20110802
	Say(format("C竎h ch琲 vt 秈 m韎, n閕 dung m韎, boss m韎, b秐  m韎, v� v祅 k� tr﹏ d� b秓, r蕋 th輈h h頿 c竎 trang b� ho祅g kim c馻 m玭 ph竔 ch� c� t筰 b秓 t祅g vi猰 ! <enter>M鏸 ng祔 %s, h穣 n trc 5 ph髏  b竜 danh � B譶h B譶h c� nng.", "14:25, 16:25, 18:25, 20:25, 22:25"),0)
	
end