--加入某一方的Npc对应脚本
--BattleId外部的全局变量，表示当前挑战赛地图的编号(1-8)

--HaveBeginWar(CityID) -- CityID(1-7)		//现在某个城市是否已开战,返回值为一个BOOL值
--GetCityAreaName(CityID)					//取1到7的城区名称,返回值为一个字符串
--GetCityWarBothSides(CityID)				//获得攻击方与守方的帮会名,返回两个字符串,按次序分别代表攻击方和守方
--NotifyWarResult(CityID, WarResult)		//比赛结束之后，通知Relay比赛结果(WarResult为BOOL值表示攻城方是否胜利)
--GetCityWarTongCamp(TongName)				//获得参与攻城战相关活动的帮会阵营，返回INT即阵营代表值
--IsArenaBegin(ArenaID) -- ArenaID(0-7)		//获得当前各个擂台场区是否开始，返回BOOL
--GetArenaCityArea(nArenaID)				//获得当前正在进行的擂台赛是针对哪个城区,返回值为CityID
--GetArenaBothSides(ArenaID)				//获得某一场擂台赛双方的名称,返回两个字符串,按次序分别代表甲方乙方
--NotifyArenaResult(ArenaID, ArenaResult)	//通知一场擂台赛结束的比赛结果给Relay, ArenaResult为BOOL值表示的甲方是否获胜
--GetArenaLevel()							//获得当前擂台赛所在轮次，返回值 0:比赛已经结束或者尚未开始，1:第一轮，2/3/4/5以此类推
--GetArenaTotalLevel()						//获得当前擂台赛的总轮次
--GetCurArenaInfo()							//获得当前轮次的赛程
--GetArenaTotalLevelByCity(CityID)			//获得某个城市擂台赛的总轮次
--GetArenaInfoByCity(CityID, ArenaLevel)	//获得某个城市擂台赛果的数据,ArenaLevel: 0-Based

Include("\\script\\missions\\citywar_arena\\head.lua");
Include("\\script\\lib\\common.lua")
function main()
	ms_state = GetMissionV(MS_STATE);
	if (ms_state == 0) then 
		WorldID = SubWorldIdx2ID(SubWorld);
		ArenaID = WorldID - 213;
		if (IsArenaBegin(ArenaID) ~= 0) then
			Tong1, Tong2 = GetArenaBothSides(ArenaID);
			Tong1 = safeshow(Tong1)
			Tong2 = safeshow(Tong2)
			Say(Tong1.."v�"..Tong2.."L藀 t鴆 chu萵 b� chi課 u, u trng 產ng chu萵 b�, m鋓 ngi h穣 s絥 s祅g ", 0);
		else
			Say("Th阨 gian chi課 u v蒼 ch璦 n!", 1, "Bi誸 r錳, ta 甶 trc y /OnCancel");
		end;
	elseif (ms_state == 1) then
		OnReady();
	elseif (ms_state == 2) then 
		OnFighting();
	else
		ErrorMsg(3)
	end;
end;

function OnHelp()
	Talk(8, "",	"L玦 i bang h閕 l� n琲 h鋍 h醝 v� ngh� gi鱝 c竎 bang h閕 tr猲 giang h�! Зy s� l� n琲 thi u c玭g b籲g",	"Mu鑞 tham gia L玦 i bang h閕, trc h誸 ph秈 g苝 ta  xin ph衟! Ngi xin ph衟 ph秈 l� bang ch� c馻 bang h閕 thi u!",	"Sau khi t� i, i trng 2 b猲 s� n b竜 danh. Bang ch� hai b猲  m鏸 ngi ph秈 t cc thi u 1000 v筺 lng. ",	"Sau khi t cc xong, xin ph衟 thi u  ho祅 th祅h. Trong l骳 c� 2 bang h閕 kh竎 產ng thi u, kh玭g cho ph衟 b竜 danh",	"Xin ph衟 th祅h c玭g xong, th祅h vi猲 c馻 hai bang h閕 c�10 ph髏 gia nh藀 u trng. Sau  thi u s� ch輓h th鴆 b総 u!" ,"Th緉g b筰 ph� thu閏 v祇 甶觤 t輈h l騳 thi u c馻 hai b猲. M鏸 th祅h vi猲 bang h閕 l祄 tr鋘g thng i phng s� 頲 3 甶觤, i phng b� tr� 1 甶觤", 	"K誸 th骳 thi u, bang h閕 n祇 t輈h l騳 甶觤 cao h琻 s� gi祅h th緉g l頸!",	"Ngo礽 ra, trong l骳 thi u m閠 b猲 n祇 kh玭g c遪 th祅h vi猲 n祇 � l筰 u trng th� th緉g l頸 s� thu閏 v� b猲 kia. ","Bang h閕 chi課 th緉g c� th� thu h錳 1000 v筺 lng  ng, ngo礽 ra c遪 頲 800 v筺 lng ti襫 thng v� 12.000 甶觤 kinh nghi謒 bang h閕. Bang h閕 thua cu閏 s� kh玭g l蕐 l筰 頲 ti襫  ng, m� c遪 b� tr� 14.000 甶觤 kinh nghi謒 bang h閕");
end;

function OnReady()
	V = GetMissionV(MS_NEWSVALUE);
	RestTime = (GO_TIME - V) * 20;
	
	if (RestTime < 0) then 
		RestTime=0
	end;
	
	RestMin, RestSec = GetMinAndSec(RestTime);

	str = "<#> N琲 n祔 產ng di詎 ra tranh u"..GetMissionS(3).."<#> c玭g th祅h khi猽 chi課, hi謓 t筰 bang h閕 thi u l�:"..GetMissionS(1).."<#> v韎"..GetMissionS(2).."<#>, th阨 gian nh藀 trng c遪 l筰"..RestMin.."<#> ph髏 "..RestSec.."<#> gi﹜.";
	Say(str, 2, "Ta th輈h h頿 v韎 甶襲 ki謓, ta mu鑞 v祇 u trng /OnJoin", "ta kh玭g mu鑞 v祇 u trng /OnCancel");
end;

function ErrorMsg(ErrorId)
if (ErrorId == 1) then 
	Say("Bang ch� hai b猲 mu鑞 xin ph衟 thi u trc h誸 ph秈 l藀 nh鉳 r錳 m韎 xin ph衟. ",0)
elseif (ErrorId == 2) then 
	Say("дn b竜 danh ph秈 l� i trng c馻 bang h閕 mu鑞 thi u, m鏸 bang ch� ph秈 mang  1000 v筺 lng",0)
elseif (ErrorId == 3) then 
	Say("B竜 danh xu蕋 hi謓 tr鬰 tr芻. Xin li猲 h� ngi qu秐 l�!",0);
elseif (ErrorId == 4) then 
	Say("B筺 kh玭g ph秈 l� th祅h vi猲 c馻 hai bang h閕 thi u ho芻 s� ngi trong u trng  y, kh玭g th� v祇 頲!", 0);
elseif(ErrorId == 5) then 
	Say("Bang ch� b竜 danh c莕 ph秈 l� i trng c馻 i ng� hi謓 t筰",0);
else
	
end;

return
end;

function OnJoin()
	if (GetTongName() == GetMissionS(1)) then 
		if (GetJoinTongTime() >= 7200) then
			JoinCamp(1);
		else
			Say("Th阨 gian b筺 gia nh藀 bang h閕 qu� ng緉, kh玭g th� tham gia chi課 u!", 0);
		end;
	elseif (GetTongName() == GetMissionS(2)) then 
		if (GetJoinTongTime() >= 7200) then
			JoinCamp(2);
		else
			Say("Th阨 gian b筺 gia nh藀 bang h閕 qu� ng緉, kh玭g th� tham gia chi課 u!", 0);
		end;
	else
		ErrorMsg(4)
	end;
end;

function OnFighting()
	gametime = (floor(GetMSRestTime(MISSIONID,17)/18));
	RestMin, RestSec = GetMinAndSec(gametime);
	str1 = "<#> nh﹏ s� 2 b猲 hi謓 t筰 l�:"..GetMSPlayerCount(MISSIONID, 1).."<#> "..GetMSPlayerCount(MISSIONID, 2).."<#>. Th阨 gian c遪 d� "..RestMin.."<#> ph髏 "..RestSec.."<#> gi﹜.";
	str = "<#> hi謓 t筰 bang h閕"..GetMissionS(1).."<#> v韎"..GetMissionS(2).."<#> 產ng ti課 h祅h";
	Say(str..str1, 0);
end;

function OnCancel()

end;
