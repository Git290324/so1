Include("\\script\\battles\\battlehead.lua")
Include("\\script\\task\\newtask\\branch\\branch_bwsj.lua")
Include("\\script\\tong\\tong_award_head.lua")		--By Liao Zhishan
Include("\\script\\battles\\battles_award_head.lua")		--By 小浪多多
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
IncludeLib("SETTING");
MISSIONID = 58;
FRAME2TIME = 18;	--18帧游戏时间相当于1秒钟
sf_aryItems = {
	{ "Gia B祇 ho祅", {6,0,2,1,0,0}, 5 },
	{ "Cao Trung ho祅", {6,0,5,1,0,0}, 5 },
	{ "Cao Thi觤 ho祅", {6,0,4,1,0,0}, 5 },
	{ "Trng M謓h ho祅", {6,0,1,1,0,0}, 5 },
	{ "Phi T鑓 ho祅", {6,0,6,1,0,0}, 5 },
	{ "чc Ph遪g ho祅", {6,0,10,1,0,0}, 5 },
	{ "B╪g Ph遪g ho祅", {6,0,7,1,0,0}, 5 },
	{ "H醓 Ph遪g ho祅", {6,0,9,1,0,0}, 5 },
	{ "L玦 Ph遪g ho祅", {6,0,8,1,0,0}, 5 },
	{ "Чi L鵦 ho祅", {6,0,3,1,0,0}, 30 },
	{ "Ph竜 Hoa", {6,0,11,1,0,0}, 1 },
	{ "Mai Kh玦 Hoa V� ", {6,0,20,1,0,0}, 2 },
	{ "T﹎ T﹎ Tng 竛h ph� ", {6,1,18,1,0,0}, 5 },
	}

TIMER_1 = 20 * FRAME2TIME; --20秒公布一下战况
TIMER_2 = 90 * 60  * FRAME2TIME; -- 交战时间为1小时
RUNGAME_TIME = 30 * 60 * FRAME2TIME / TIMER_1; --报名30分钟之后，自动进入战斗阶段
VANISHGAME_TIME = 70 * 60 * FRAME2TIME/ TIMER_1; --战斗最后20分钟时，必须所以Npc全部产生
GO_TIME =  1800 * FRAME2TIME  / TIMER_1; -- 报名时间为半小时

MAX_MEMBERCOUNT = 150 
TIME_PLAYER_REV = 8 ; -- 玩家死亡或退出游戏再进入时，必须3分钟之后才能离开后营到大营



--以下是某些值记录在MissionValue中的索引位置，通过GetMissionV(MS_XXX)来获得实际的值
MS_STATE = 1; --任务中记录任务状态的变量ID
--该变量指向的状态值0表示战役为打开，1表示战役报名中，2表示战役战斗进行中，3表示战役刚刚结束了

MS_FLAGMODE = 2;--记录当前夺旗模式是固定模式还是随机夺旗模式，分别为0，1
MS_FLAGCOUNT = 3; --记录夺旗的数量

MS_CENTER_X1 = 4;   --区域1：当报名阶段时，禁止玩家离开大营时，将玩家扔回大营的坐标
MS_CENTER_Y1 = 5;
MS_CENTER_X2 = 6;		--区域2
MS_CENTER_Y2 = 7;

MS_HOMEIN_X1 = 8;    --区域1：后营内坐标
MS_HOMEIN_Y1 = 9;
MS_HOMEOUT_X1 = 10;  --后营外坐标
MS_HOMEOUT_Y1 = 11;
MS_HOMEIN_X2 = 12;		--区域2
MS_HOMEIN_Y2 = 13;
MS_HOMEOUT_X2 = 14;
MS_HOMEOUT_Y2 = 15;
MS_TIMER1_TIME = 17; --记录Timer1执行的次数

MS_FLAGPLY_S = 18;  --固定模式时，记录目前宋方夺旗的玩家PlayerIndex
MS_FLAGPLY_J = 19;  --固定模式时，记录目前金方夺旗的玩家PlayerIndex
MS_FLAGPOSX_S = 20; --固定模式时，记录宋方当前旗织的小地图坐标位置X
MS_FLAGPOSY_S = 21; --固定模式时，记录宋方当前旗织的小地图坐标位置Y
MS_FLAGPOSX_J = 22  --固定模式时，记录金方当前旗织的小地图坐标位置X
MS_FLAGPOSY_J = 23  --固定模式时，记录金方当前旗织的小地图坐标位置Y
MS_TOTALGRAIN_S = 24	--记录送粮袋数量，宋
MS_TOTALGRAIN_J = 25	--记录送粮袋数量，金

MAX_GRAINOBJ_COUNT	 = 5;	-- 粮车上栽粮食包的数量

TNPC_GHARRY1	= 1348		-- 宋金粮车
TNPC_GRAIN1		= 1350		-- 宋金粮食包

FILE_HOMETRAP1 = "\\script\\battles\\seizegrain\\hometrap1.lua";
FILE_HOMETRAP2 = "\\script\\battles\\seizegrain\\hometrap2.lua";
FILE_CENTERTRAP1 = "\\script\\battles\\seizegrain\\centertrap1.lua";
FILE_CENTERTRAP2 = "\\script\\battles\\seizegrain\\centertrap2.lua";
FILE_CENTERTOHOMETRAP1 = "\\script\\battles\\seizegrain\\homeouttrap1.lua"
FILE_CENTERTOHOMETRAP2 = "\\script\\battles\\seizegrain\\homeouttrap2.lua"

tabFILE_NPCDEATH = 
	{
	"\\script\\battles\\seizegrain\\npcdeath_1.lua",
	"\\script\\battles\\seizegrain\\npcdeath_2.lua",
	"\\script\\battles\\seizegrain\\npcdeath_3.lua",
	"\\script\\battles\\seizegrain\\npcdeath_4.lua",
	"\\script\\battles\\seizegrain\\npcdeath_5.lua",
	"\\script\\battles\\seizegrain\\npcdeath_6.lua"
	};

FILE_DOCTOR1 = 	"\\script\\battles\\seizegrain\\doctor.lua";
FILE_DOCTOR2 = 	"\\script\\battles\\seizegrain\\doctor.lua";
FILE_SYMBOLNPC = ""
FILE_DEPOSIT = 	"\\script\\battles\\openbox.lua"
FILE_GRAIN = 		"\\script\\battles\\seizegrain\\grainobj.lua"
FILE_GHARRY = 		"\\script\\battles\\seizegrain\\graingharry.lua"
FILE_DEATH = 		"\\script\\battles\\seizegrain\\npcdeath.lua"

--Npc的模板号ID

MAX_S_COUNT = 100;
MAX_J_COUNT = 100;


--增加一个指向某个坐标的某阵营旗
function sf_addgrain(camp, x, y)
	
	local tnpcid = TNPC_GRAIN1;
	
	local npcidx = AddNpc(tnpcid, 1, SubWorld, x, y, 1, "Bao lng");
	
	if (npcidx > 0) then
		SetNpcCurCamp(npcidx, camp);
		SetNpcScript(npcidx, FILE_GRAIN);
	else
		print("battle"..BT_GetGameData(GAME_BATTLEID).."error!can not add dialog npc !tnpcid:"..tnpcid.." ["..SubWorldIdx2ID(SubWorld)..","..x..","..y);
	end
	
	--SetNpcParam(npcidx, 1, desx)
	--SetNpcParam(npcidx, 2, desy)
	SetNpcParam(npcidx, 3, camp);
	SetNpcParam(npcidx, 4, 1);
	
	return npcidx;
end;

function sf_addgharry(camp, x, y, nfight)
	local n_npc_level = 1;
	local sz_file = FILE_GHARRY;
	local tnpcid = TNPC_GHARRY1;
	local sz_npc_name = {"Xe lng phe T鑞g", "Xe lng phe Kim"}
	
	if (nfight == 1) then
		n_npc_level = 90;
		tnpcid = tnpcid + 1;	-- 战斗的ID
	end
	
	local npcidx = AddNpc(tnpcid, n_npc_level, SubWorld, x, y, 1, sz_npc_name[camp]);
	
	if (npcidx > 0) then
		SetNpcCurCamp(npcidx, camp);
		if (nfight == 0) then
			SetNpcScript(npcidx, sz_file);
		else
			SetNpcDeathScript(npcidx, sz_file);
		end
	else
		print("battle"..BT_GetGameData(GAME_BATTLEID).."error!can not add dialog npc !tnpcid:"..tnpcid.." ["..SubWorldIdx2ID(SubWorld)..","..x..","..y);
		return 0;
	end
	
	SetNpcParam(npcidx, 1, x);
	SetNpcParam(npcidx, 2, y);
	SetNpcParam(npcidx, 3, camp);	-- 车的阵营
	SetNpcParam(npcidx, 4, MAX_GRAINOBJ_COUNT);		-- 车上 5袋粮食包
	
	return npcidx;
end


function sf_onplayerleave()
	RestoreOwnFeature();
	if (GetMissionV(MS_STATE) == 2 and BT_GetData(PL_PARAM3) ~= 0) then
		--该玩家现在正处于背粮状态，死亡里需要让粮食包掉下来
			local w,x,y = GetWorldPos()
			sf_addgrain(GetCurCamp(), x*32, y*32)
			
			if (GetCurCamp() == 1 ) then
				Msg2MSAll(MISSIONID, format("<color=0x00FFFF>Phe T鑞g<color=yellow>%s<color> m蕋 甶 Bao Lng Th鵦 t筰<color=yellow>%d,%d",GetName(),floor(x/8),floor(y/16)))
			else
				Msg2MSAll(MISSIONID, format("<color=0x9BFF9B>Phe Kim<color=yellow>%s<color> m蕋 甶 Bao Lng Th鵦 t筰<color=yellow>%d,%d",GetName(),floor(x/8),floor(y/16)))
			end
	end
	BT_SetData(PL_PARAM3 ,0)
	BT_SetData(PL_LASTDEATHTIME, GetGameTime())
end

function sf_winbouns(wincamp)
	local failcamp = 0;
	--如果结束对方阵营没有玩家，则胜方不给奖励
	if (wincamp == 1) then
		failcamp = 2;
	else
		failcamp = 1;
	end
	if (GetMSPlayerCount(MISSIONID, failcamp) == 0) then
		WriteLog("Do phe b筰 kh玭g c� ngi ch琲, phe th緉g kh玭g 頲 t苙g thng!")
		return
	end
--by zero 2007-8-1 获得所有赢方
	local Win_Players_Table={}
	idx = 0;
	
	for i = 1 , GetMSPlayerCount(MISSIONID, wincamp) do
		idx, pidx = GetNextPlayer(MISSIONID, idx, wincamp)
		if (pidx > 0) then
			Win_Players_Table[getn(Win_Players_Table)+1]=pidx
		end
		if (idx <= 0) then 
			break
		end;
	end
	--end 
	--by zero 2007-7-30 获得宋金军功牌 一天获得2次
	local OldPlayerIndex = PlayerIndex
	for i=1,getn(Win_Players_Table) do
		PlayerIndex=Win_Players_Table[i];
		local player_total_point=BT_GetData(PL_TOTALPOINT) --获得积分
		
		--领取军功牌
		local jg_ndate=tonumber(GetLocalDate("%y%m%d"))
		jg_ndate=jg_ndate*10+2;
		local JG_T_Value=GetTask(JUNGONGPAI_Task_ID) --军功牌获取任务变量
		
		--print(format("%d %d",player_total_point,JG_T_Value))
		if(player_total_point >= 1000 and JG_T_Value < jg_ndate) then
			local ItemIdx = AddItem(6,1,JUNGONGPAI,1,0,0);
			
			local Tdate=FormatTime2Number(GetCurServerTime()+24*60*60)--领取的第二天
			Tdate=floor(Tdate/10000) --取年,月,日
			nEndYear=floor(Tdate/10000)+2000
			nEndMonthDay=floor(mod(Tdate,10000))
			SetSpecItemParam(ItemIdx, 1,nEndYear);--设置物品年
			SetSpecItemParam(ItemIdx, 2,nEndMonthDay);--设置物品月日
			SyncItem(ItemIdx)
			SetItemBindState(ItemIdx, -2);-- 绑定
			Msg2Player("B筺 nh薾 頲 1 Hu﹏ c玭g b礽 T鑞g Kim")
			WriteLog(format("[Chi課 trng T鑞g Kim]\t%s\tName:%s\tAccount:%s\t 1000 甶觤 t輈h l騳 tr� l猲 s� nh薾 頲 1 Hu﹏ c玭g b礽 T鑞g Kim",
					GetLocalDate("%y%m%d %X"), GetName(), GetAccount()));
			if(JG_T_Value == (jg_ndate-1)) then --领取了2次	
				SetTask(JUNGONGPAI_Task_ID,jg_ndate);
			elseif(JG_T_Value ~= jg_ndate) then --领取了1次	
				SetTask(JUNGONGPAI_Task_ID,jg_ndate-1);
			end
		end
	end
	PlayerIndex = OldPlayerIndex
	--end
	
	local award_over = floor(BATTLES_LOSEGAME_POINT * bt_getgn_awardtimes())
	bt_camp_getbonus(failcamp, award_over, "L莕 n祔 phe ta b筰! Th緉g b筰 l� chuy謓 thng t譶h c馻 binh gia, tng s� ng n秐 l遪g! L莕 sau s� quy誸 1 tr薾 th� h飊g. (Nh薾 頲 <color=yellow>"..award_over.."<color> 甶觤 t輈h l騳) ", 50);
	
	bonuscff1 = BATTLES_WINGAME_POINT * bt_getgn_awardtimes()
   	repute = 3 * bt_getgn_awardtimes()
	WriteLog("觤 t輈h l騳 cho phe th緉g l頸 l�:"..bonuscff1)
	
	sf_itemcount = getn(sf_aryItems)
	-- by zero 修改获取赢方人员的方式
	OldPlayerIndex = PlayerIndex	
	for i=1,getn(Win_Players_Table) do
		PlayerIndex=Win_Players_Table[i];
            local game_level = BT_GetGameData(GAME_LEVEL);
            
	   		AddRepute(repute);			
	   		Msg2Player("Danh v鋘g c馻 b筺 t╪g th猰 "..repute.."甶觤!")
	   		Msg2Player("B筺 nh薾 頲 "..bonuscff1.." 甶觤 t輈h l騳")
	   		
			--Storm 胜方结束挑战，并记录获胜者
			Say("Ch骳 m鮪g phe b筺 gi祅h th緉g l頸! Danh v鋘g c馻 b筺 t╪g th猰 <color=yellow>"..repute.."<color>! V� nh薾 th猰 <color=yellow>"..bonuscff1.."<color> 甶觤 t輈h l騳", 1, "K誸 th骳 i tho筰/#storm_end(1)")
			tb_storm_winner[PlayerIndex] = 1
			
			bt_addtotalpoint(bonuscff1)
			
			randitem = random(1, sf_itemcount);
			if (randitem > 0) then
				local szItemName = sf_aryItems[randitem][1];
				local arySelItemID =  sf_aryItems[randitem][2];
				AddItem( arySelItemID[1], arySelItemID[2], arySelItemID[3], arySelItemID[4], arySelItemID[5], arySelItemID[6], 0);
				Msg2Player("<#>Ch骳 m鮪g B筺! L蕐 頲 gi秈 thng "..szItemName);
			end;
	end
	PlayerIndex = OldPlayerIndex
end;

function GameOver()
	WriteLog("battle is ending. now member count="..GetMSPlayerCount(MISSIONID, 1)..":"..GetMSPlayerCount(MISSIONID, 2))
	local bonus_s = BT_GetGameData(GAME_CAMP1);
	local bonus_j = BT_GetGameData(GAME_CAMP2);
	local resultstr = "";
	local OldPlayerIndex = PlayerIndex;

	
	--更新宋金相关的世界排名榜
	--
	game_mode = GetMissionV(MS_FLAGMODE);
	--模式总排行榜
	if (game_mode == 1) then
		BT_SortWorldLadder(PL_TOTALPOINT, 10009)
		BT_SortWorldLadder(PL_KILLPLAYER, 10011)
		BT_SortWorldLadder(PL_KILLNPC, 10012)
		BT_SortWorldLadder(PL_SNAPFLAG, 10008)
		--BT_SortWorldLadder(PL_KILLRANK5, 10006)
		BT_SortWorldLadder(PL_MAXSERIESKILL, 10013)
		BT_SortWorldLadder(PL_GETITEM, 10014)
	else
		BT_SortWorldLadder(PL_TOTALPOINT, 10018)
		BT_SortWorldLadder(PL_KILLPLAYER, 10020)
		BT_SortWorldLadder(PL_KILLNPC, 10021)
		BT_SortWorldLadder(PL_SNAPFLAG, 10017)
		--BT_SortWorldLadder(PL_KILLRANK5, 10006)
		BT_SortWorldLadder(PL_MAXSERIESKILL, 10022)
		BT_SortWorldLadder(PL_GETITEM, 10023)
	end
	
	local game_level = BT_GetGameData(GAME_LEVEL);
	
	--模式加等级排行榜
	if (game_mode == 1) then
		if (game_level == 3) then
			BT_SortWorldLadder(PL_SNAPFLAG, 10044)
			BT_SortWorldLadder(PL_KILLPLAYER, 10045)
			BT_SortWorldLadder(PL_KILLNPC, 10046)
			BT_SortWorldLadder(PL_MAXSERIESKILL, 10047)
			BT_SortWorldLadder(PL_GETITEM, 10048)
			BT_SortWorldLadder(PL_TOTALPOINT, 10049)
		elseif (game_level == 2) then
			BT_SortWorldLadder(PL_SNAPFLAG, 10060)
			BT_SortWorldLadder(PL_KILLPLAYER, 10061)
			BT_SortWorldLadder(PL_KILLNPC, 10062)
			BT_SortWorldLadder(PL_MAXSERIESKILL, 10063)
			BT_SortWorldLadder(PL_GETITEM, 10064)
			BT_SortWorldLadder(PL_TOTALPOINT, 10065)
		elseif (game_level == 1) then
			BT_SortWorldLadder(PL_SNAPFLAG, 10076)
			BT_SortWorldLadder(PL_KILLPLAYER, 10077)
			BT_SortWorldLadder(PL_KILLNPC, 10078)
			BT_SortWorldLadder(PL_MAXSERIESKILL, 10079)
			BT_SortWorldLadder(PL_GETITEM, 10080)
			BT_SortWorldLadder(PL_TOTALPOINT, 10081)
		end
	else
		if (game_level == 3) then
			BT_SortWorldLadder(PL_SNAPFLAG, 10036)
			BT_SortWorldLadder(PL_KILLPLAYER, 10037)
			BT_SortWorldLadder(PL_KILLNPC, 10038)
			BT_SortWorldLadder(PL_MAXSERIESKILL, 10039)
			BT_SortWorldLadder(PL_GETITEM, 10040)
			BT_SortWorldLadder(PL_TOTALPOINT, 10041)
		elseif (game_level == 2) then
			BT_SortWorldLadder(PL_SNAPFLAG, 10052)
			BT_SortWorldLadder(PL_KILLPLAYER, 10053)
			BT_SortWorldLadder(PL_KILLNPC, 10054)
			BT_SortWorldLadder(PL_MAXSERIESKILL, 10055)
			BT_SortWorldLadder(PL_GETITEM, 10056)
			BT_SortWorldLadder(PL_TOTALPOINT, 10057)
		elseif (game_level == 1) then
			BT_SortWorldLadder(PL_SNAPFLAG, 10068)
			BT_SortWorldLadder(PL_KILLPLAYER, 10069)
			BT_SortWorldLadder(PL_KILLNPC, 10070)
			BT_SortWorldLadder(PL_MAXSERIESKILL, 10071)
			BT_SortWorldLadder(PL_GETITEM, 10072)
			BT_SortWorldLadder(PL_TOTALPOINT, 10073)
		end
	end
	
	BT_SortWorldLadder(PL_SNAPFLAG, 10084)
	BT_SortWorldLadder(PL_TOTALPOINT, 10085)
	BT_SortWorldLadder(PL_BATTLEPOINT, 10086)
	BT_SortWorldLadder(PL_KILLPLAYER, 10087)
	BT_SortWorldLadder(PL_KILLNPC, 10088)
	BT_SortWorldLadder(PL_MAXSERIESKILL, 10089)
	BT_SortWorldLadder(PL_GETITEM, 10090)
	
	if (game_level == 1) then
		resultstr = "Khu v鵦 S� c蕄 "
	elseif (game_level == 2) then
		resultstr = "Khu v鵦 Trung c蕄 "
	elseif (game_level == 3) then
		resultstr = "Khu v鵦 Cao c蕄 "
	end
		--edit by zero 根据排名给奖励
	
	battle_rank_award0808(game_level)
	
	battle_rank_activity(game_level)
	--end
	--edit by 小浪多多
	--把3种模式奖励指向一个文件编写
	--所有队员奖励,胜负平皆有
	--sign start
	local Win_Players_Table={}
	local idx = 0;
	local pidx = 0;
	for i=1,500 do
		idx, pidx = GetNextPlayer(MISSIONID, idx, 0)
		if (pidx > 0) then
			Win_Players_Table[getn(Win_Players_Table)+1]=pidx
		end
		if (idx <= 0) then 
			break
		end;
	end
	for i = 1,getn(Win_Players_Table) do
		local noldplayerindex = PlayerIndex
		PlayerIndex = Win_Players_Table[i]
		local player_total_point=BT_GetData(PL_TOTALPOINT) --获得积分
		battles_award_all_singleplayer(PlayerIndex,player_total_point,game_level)
		PlayerIndex = noldplayerindex
	end 
	--sign end
	
	tb_storm_winner = {}	--Storm	清空获胜者
	
	if (bonus_s > bonus_j ) then
		resultstr = resultstr.."T鑞g Kim phng th鴆 v薾 lng  k誸 th骳, s� lng Bao lng c馻 phe T鑞g v� phe Kim l� "..BT_GetGameData(GAME_CAMP1)..":"..BT_GetGameData(GAME_CAMP2)..", phe T鑞g gi祅h 頲 th緉g l頸!";
		Msg2MSAll(MISSIONID, resultstr)
		WriteLog(resultstr.."T� l� qu﹏ s� l�: T鑞g "..GetMSPlayerCount(MISSIONID, 1)..": Kim "..GetMSPlayerCount(MISSIONID, 2)..". Th阨 gian k誸 th骳"..date("%H:%M"))
		BT_ReportResult(1)
		sf_winbouns(1)
		RecordBTCount_Win(1)		--在每个人任务变量里记录它此次宋金战场胜负状况
	elseif (bonus_s < bonus_j) then
		resultstr = resultstr.."T鑞g Kim phng th鴆 v薾 lng  k誸 th骳, s� lng Bao lng c馻 phe T鑞g v� phe Kim l� "..BT_GetGameData(GAME_CAMP1)..":"..BT_GetGameData(GAME_CAMP2)..", phe Kim gi祅h 頲 th緉g l頸!"
		Msg2MSAll(MISSIONID, resultstr)
		WriteLog(resultstr.."T� l� qu﹏ s� l�: T鑞g "..GetMSPlayerCount(MISSIONID, 1)..": Kim "..GetMSPlayerCount(MISSIONID, 2)..". Th阨 gian k誸 th骳"..date("%H:%M"))
		BT_ReportResult(2)
		sf_winbouns(2)
		RecordBTCount_Win(2)		--在每个人任务变量里记录它此次宋金战场胜负状况
	else
			resultstr = resultstr.."T鑞g Kim phng th鴆 v薾 lng  k誸 th骳 v韎 k誸 qu� h遖, s� Bao lng phe T鑞g v� phe Kim l� "..bonus_s.."";
			Msg2MSAll(MISSIONID, resultstr);
			WriteLog(resultstr.."T� l� qu﹏ s� l�: T鑞g "..GetMSPlayerCount(MISSIONID, 1)..": Kim "..GetMSPlayerCount(MISSIONID, 2)..". Th阨 gian k誸 th骳"..date("%H:%M"))
			local award_over = BATTLES_TIEGAME_POINT * bt_getgn_awardtimes()
			bt_camp_getbonus(1, award_over, "L莕 n祔 t筸 h遖! Tng s� h穣 t筸 ngh� ng琲! L莕 sau s� quy誸 1 tr薾 th� h飊g! (Л頲 thng <color=yellow>"..award_over.."<color> 甶觤 t輈h l騳) ", 75);
			bt_camp_getbonus(2, award_over, "L莕 n祔 t筸 h遖! Tng s� h穣 t筸 ngh� ng琲! L莕 sau s� quy誸 1 tr薾 th� h飊g! (Л頲 thng <color=yellow>"..award_over.."<color> 甶觤 t輈h l騳) ", 75);
	end;
		AddGlobalCountNews(resultstr, 1) 
	
	local tbPlayer = {};
	idx = 0;
	for i = 1 , 500 do 
		idx, pidx = GetNextPlayer(MISSIONID,idx, 0);
		if( pidx > 0 ) then
			tbPlayer[ getn(tbPlayer) + 1 ] = pidx
		end
		if (idx <= 0) then 
	 		break
	 	end;
	end 	
 	
 	for i= 1, getn(tbPlayer) do 
	 	PlayerIndex = tbPlayer[i];
	 	branchTask_JoinSJend1();
	 	l_curcamp = GetCurCamp();
		camp = GetCamp();
		SetCurCamp(camp);
		SetTaskTemp(200,0);
		SetLogoutRV(0);
		SetCreateTeam(1);
		SetDeathScript("");
		SetFightState(0)		-- 打完仗后改为非战斗状态（by Dan_Deng）
		SetPunish(1)
		ForbidChangePK(0);
		SetPKFlag(0)
		
		--Storm 给获胜者以外的结束挑战
		if (not tb_storm_winner[PlayerIndex]) then
			storm_end(1)
		end
		
		if (l_curcamp == 1) then
			SetRevPos(tbGAME_SIGNMAP[game_level], 1)
			NewWorld(bt_getsignpos(1))
		else	
			SetRevPos(tbGAME_SIGNMAP[game_level], 2)
			NewWorld(bt_getsignpos(2))
		end;
	end;
	PlayerIndex = OldPlayerIndex
end;
-------------------------------------------------------------------------
function sf_join(camp)
	LeaveTeam()
	if (GetMSPlayerCount(MISSIONID, camp) >= MAX_MEMBERCOUNT ) then
		if (camp==1) then
			Msg2Player("Qu﹏ l鵦 c馻 ta hi謓 gi�  d� s鴆 ti猽 di謙 Kim qu﹏. Tr竛g s� xin i tr薾 sau nh�!")
			return
		elseif (camp==2) then
			Msg2Player("Qu﹏ l鵦 c馻 ta hi謓 gi�  d� s鴆 ti猽 di謙 T鑞g qu﹏. Tr竛g s� xin i tr薾 sau nh�!")
			return
		end
	end
	result = bt_checklastbattle(camp)
	
	if (result == 2) then
		if (camp==1) then
			Talk(1,"","Ngi Kim b鋘 ngi, x﹎ lc giang s琻, gi誸 h筰 ng b祇 ta! Ta th� quy誸 c飊g b鋘 ngi m閠 m蕋 m閠 c遪!")
		else
			Talk(1,"","Kim qu鑓 ai c騨g u d騨g s� thi謓 chi課. T鑞g tri襲 m鬰 n竧 c竎 ngi sao x鴑g l� i th�!")
			return
		end
	end

if (result == 0) then
	if (GetCash() >= 3000) then
		Pay(3000)
		BT_LeaveBattle() -- 清除玩家客户端当前的排名数据
		BT_ClearPlayerData()
		SetTask(2435, 0);--本场宋金已经领取的帮会贡献度清零--by 廖志山
		Msg2Player("Nh綾 nh�: c� th� 蕁 ph輒 ~ � g鉩 tr竔 ph輆 tr猲 b祅 ph輒  xem tin t鴆 chi課 s�!");
		BT_SetData(PL_ROUND,BT_GetGameData(GAME_ROUND))
		local nlevel = BT_GetGameData(GAME_LEVEL)
		G_ACTIVITY:OnMessage("SignUpSongJin", PlayerIndex, nleve)
	else
		Say("Mu鑞 tham gia chi課 trng T鑞g Kim h穣 駈g h� 3000 lng", 0)
		return 
	end
end

gametime = floor(GetMSRestTime(MISSIONID, 97) / 18);
AddMSPlayer(MISSIONID,camp);
BT_UpdateMemberCount();
SetCurCamp(camp);

SetTaskTemp(200,1)
SetFightState(0);
SetLogoutRV(1);

SetPunish(0);

level = BT_GetGameData(GAME_LEVEL)

if (camp == 1) then
	posx = GetMissionV(MS_HOMEIN_X1)
	posy = GetMissionV(MS_HOMEIN_Y1)
	str = GetName().."Gia nh藀 phe T鑞g"
	EnterChannel(PlayerIndex, "Phe T鑞g"..szGAME_GAMELEVEL[level].."V薾 lng")
else
	posx = GetMissionV(MS_HOMEIN_X2)
	posy = GetMissionV(MS_HOMEIN_Y2)
	str = GetName().."Gia nh藀 phe Kim"
	EnterChannel(PlayerIndex, "Phe Kim"..szGAME_GAMELEVEL[level].."V薾 lng")
end

BT_SetData(PL_PARAM1,0)
BT_SetData(PL_PARAM2,0)
sf_mapid = SubWorldIdx2ID(SubWorld)

if (camp == 1) then
	SetRevPos(tbGAME_SIGNMAP[level], 1)
else
	SetRevPos(tbGAME_SIGNMAP[level], 2)
end

NewWorld(sf_mapid, posx, posy);
SetTempRevPos(sf_mapid, posx * 32, posy * 32);
BT_SetData(PL_LASTDEATHTIME, GetGameTime())

SetCreateTeam(0);
BT_SetData(PL_KEYNUMBER, BT_GetGameData(GAME_KEY))
BT_SetData(PL_BATTLEID, BT_GetGameData(GAME_BATTLEID))
BT_SetData(PL_RULEID, BT_GetGameData(GAME_RULEID))

BT_BroadView();
BT_BroadAllLadder();
BT_SetRestTime(gametime);
BT_BroadGameData();
BT_SortLadder();
BT_BroadSelf()
BT_BroadBattleDesc();
BT_ViewBattleStart()
SetFightState(0)
--Msg2MSAll(MISSIONID,str);
SetPKFlag(1)
ForbidChangePK(1);
SetDeathScript("\\script\\battles\\seizegrain\\playerdeath.lua");
bt_JudgePLAddTitle()
end;
------------------------------------------------------------------

-----将秒传换成分与秒，比如62s = 1m2s
function GetMinAndSec(nSec)
nRestMin = floor(nSec / 60);
nRestSec = mod(nSec,60)
return nRestMin, nRestSec;
end;
------------------------------------------------------

function RecordBTCount_Win(camp)		--在每个人任务变量里记录它此次宋金战场胜负状况
	if (camp ~= 1 and camp ~= 2) then
		print("ERROR: T鑞g Kim k誸 th骳! L璾 tr� th玭g tin c� sai s鉻!!!")
		return
	end
	local OldPlayerIndex = PlayerIndex
	idx = 0
	if (camp == 1) then
		idx = 0
		for i = 1 , 500 do 
			idx, pidx = GetNextPlayer(MISSIONID,idx, 1);
			if( pidx > 0 ) then
				PlayerIndex = pidx
				nt_setTask(1072, nt_getTask(1072) + 1)
			end
			if (idx <= 0) then 
		 		break
		 	end			 	
		end
		
		idx = 0
		for i = 1 , 500 do 
			idx, pidx = GetNextPlayer(MISSIONID,idx, 2);
			if( pidx > 0 ) then
				PlayerIndex = pidx
				nt_setTask(1073, nt_getTask(1073) + 1)
			end
			if (idx <= 0) then 
		 		break
		 	end			 	
		end
	else
		idx = 0
		for i = 1 , 500 do 
			idx, pidx = GetNextPlayer(MISSIONID,idx, 2)
			if( pidx > 0 ) then
				PlayerIndex = pidx
				nt_setTask(1072, nt_getTask(1072) + 1)
			end
			if (idx <= 0) then 
		 		break
		 	end			 	
		end
		
		idx = 0
		for i = 1 , 500 do 
			idx, pidx = GetNextPlayer(MISSIONID,idx, 1)
			if( pidx > 0 ) then
				PlayerIndex = pidx
				nt_setTask(1073, nt_getTask(1073) + 1)
			end
			if (idx <= 0) then 
		 		break
		 	end			 	
		end
		
	end
	PlayerIndex = OldPlayerIndex
end

-- 设置任务状态
function nt_setTask(nTaskID, nTaskValue)
	SetTask(nTaskID, nTaskValue)
	SyncTaskValue(nTaskID) -- 同步到客户端
end

-- 获取任务状态
function nt_getTask(nTaskID)
	return GetTask(nTaskID)
end

-- 送回粮食包的处理
function sf_addgrain_point(ncamp)
	local nPGrain = BT_GetData(PL_PARAM3);
	
	if (nPGrain == 0) then
		return 0;
	end
	
	local n_player_camp = GetCurCamp();
	
	bt_addtotalpoint(BT_GetTypeBonus(PL_KILLRANK4, ncamp))-- 加积分
	
	BT_SortLadder();
	BT_BroadSelf();
	
	if (ncamp == 1) then
		BT_SetGameData(GAME_CAMP1, BT_GetGameData(GAME_CAMP1) + 1);
		SetMissionV(MS_TOTALGRAIN_S, GetMissionV(MS_TOTALGRAIN_S) + 1);
		Msg2MSAll(MISSIONID, "phe T鑞g <color=yellow>"..GetName().."<color>H� t鑞g th祅h c玭g 1 Bao Lng Th鵦");--左下角的即时战况："GetCamp方玩家GetName()成功运送帅旗到达目的地！"
	elseif(ncamp == 2) then
		BT_SetGameData(GAME_CAMP2, BT_GetGameData(GAME_CAMP2) + 1);
		SetMissionV(MS_TOTALGRAIN_J, GetMissionV(MS_TOTALGRAIN_J) + 1);
		Msg2MSAll(MISSIONID, "phe Kim<color=yellow>"..GetName().."<color>H� t鑞g th祅h c玭g 1 Bao Lng Th鵦");--左下角的即时战况："GetCamp方玩家GetName()成功运送帅旗到达目的地！"
	end;
	
	BT_BroadGameDataToAll()
	
	BT_SetData(PL_PARAM3, 0)
	RestoreOwnFeature();
	AddSkillState(460, 1, 0, 0 ) --颜色光环，分辩敌我
	AddSkillState(656, 30, 0, 0) --降玩家的速度
	AddSkillState(461, 1, 0, 0) --颜色光环，分辩敌我
	
end
