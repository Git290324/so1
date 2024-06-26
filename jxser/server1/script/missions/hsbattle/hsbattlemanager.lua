--参赛流程
--1、与主入口的Npc对话，选择进入第几个战区
--2、如果符合参赛条件则进入战区内（另一张地图），并以0阵营模式进入
--3、玩家与两边的Npc对话，自由选择参与的阵营。
--4、玩家Pk死亡后将自动被仍出场外，但在本地图内
--5、当玩家死亡时，会自动向同地图的所有玩家公布当前的战况。
--6、如果可以，可以从Npc对话中了解当前的总排行
--7、比赛可以按照等级分成各种赛场
--入战区的Npc、选择阵营的Npc

Include("\\script\\missions\\hsbattle\\hshead.lua");
Include("\\script\\tong\\tong_header.lua");
Include("\\script\\missions\\huashanqunzhan\\dailog.lua");
MapTab = {};
MapCount = 1;
MapTab[1]= {212, 1577, 3288};

function main()
--[DinhHQ]
--20110330: change request 30/03/2011
do
	Talk(1, "", "Ch鴆 n╪g t筸 ng")
	return
end
	local tbSay = 
	{
		"<dec><npc>Чi hi謕 t譵 ta c� vi謈 g�?",
		"L玦 i Hoa S琻 tuy謙 nh/HSBattle_Dailog_Main",
	}
	tinsert(tbSay, "L玦 i Hoa S琻/#huashanqunzhan_SignUpMain(1)")
	tinsert(tbSay, "K誸 th骳 i tho筰/OnCancel")
	CreateTaskSay(tbSay)
end;


function HSBattle_Dailog_Main()
	--设置返回点
	SetTask(300, 2);
	SetTask(301, 2605);
	SetTask(302, 3592);
	idx = SubWorldID2Idx(MapTab[1][1]);
	if (idx == -1) then 
		Say("Hi謓 gi� v蒼 ch璦 c� ai b竜 danh L玦 i n u! Ngh躠 s� c� mu鑞 th� t礽 kh玭g?",0)
		return
	end
	
	OldSubWorld = SubWorld;
	SubWorld = idx;
	ms_state = GetMissionV(MS_STATE);
	if (ms_state == 0) then 
		Say("Hi謓 gi� v蒼 ch璦 c� bang h閕 n祇 b竜 danh thi u! Ngh躠 s� c� mu鑞 th� t礽 kh玭g?", 3, "Л頲 th玦!/OnRegister", "Quy t綾 bang h閕 l玦 i nh� th� n祇? /OnHelp", "в ta suy ngh� l筰!/OnCancel");
	elseif (ms_state == 1) then
		OnReady();
	elseif (ms_state == 2) then 
		OnFighting();
	else
		ErrorMsg(2)
	end;
	
	SubWorld = OldSubWorld;
end


function OnHelp()
	Talk(8, "",	"L玦 i bang h閕 l� n琲 h鋍 h醝 v� ngh� gi鱝 c竎 bang h閕 tr猲 giang h�! Зy s� l� n琲 thi u c玭g b籲g",	"Mu鑞 tham gia L玦 i bang h閕, trc h誸 ph秈 g苝 ta  xin ph衟! Ngi xin ph衟 ph秈 l� bang ch� c馻 bang h閕 thi u!",	"Sau khi t� i, i trng 2 b猲 s� n b竜 danh. Bang ch� hai b猲  m鏸 ngi ph秈 t cc thi u 1000 v筺 lng. ",	"Sau khi t cc xong, xin ph衟 thi u  ho祅 th祅h. Trong l骳 c� 2 bang h閕 kh竎 產ng thi u, kh玭g cho ph衟 b竜 danh",	"Xin ph衟 th祅h c玭g xong, th祅h vi猲 c馻 hai bang h閕 c�10 ph髏 gia nh藀 u trng. Sau  thi u s� ch輓h th鴆 b総 u!" ,"Th緉g b筰 ph� thu閏 v祇 甶觤 t輈h l騳 thi u c馻 hai b猲. M鏸 th祅h vi猲 bang h閕 l祄 tr鋘g thng i phng s� 頲 3 甶觤, i phng b� tr� 1 甶觤", 	"K誸 th骳 thi u, bang h閕 n祇 t輈h l騳 甶觤 cao h琻 s� gi祅h th緉g l頸!",	"Ngo礽 ra, trong l骳 thi u m閠 b猲 n祇 kh玭g c遪 th祅h vi猲 n祇 � l筰 u trng th� th緉g l頸 s� thu閏 v� b猲 kia. ","Bang h閕 chi課 th緉g c� th� thu h錳 500 v筺 lng, ngo礽 ra c遪 頲 400 v筺 lng ti襫 thng v� 12.000 甶觤 kinh nghi謒 bang h閕; b猲 thua cu閏 s� kh玭g l蕐 l筰 頲 ti襫  ng, m� c遪 b� tr� 14.000 甶觤 kinh nghi謒 bang h閕. ");
end;

function OnRegister()
--报名
	if (GetTeamSize()  ~= 2) then
		ErrorMsg(1)
		return
	else
		if (IsCaptain() ~= 1) then 
			ErrorMsg(5)
			return
		end;
		
		OldPlayer = PlayerIndex;
		for i = 1, 2 do 
			PlayerIndex = GetTeamMember(i);
			if (GetTongFigure() ~= TONG_MASTER or GetCash() < MS_SIGN_MONEY) then 
				PlayerIndex = OldPlayer
				ErrorMsg(2)
				return
			end;
		end;
		PlayerIndex = OldPlayer;
		
		TongIdTab = {};
		TongNameTab = {};
		for i = 1, 2 do 
			PlayerIndex = GetTeamMember(i);
				if (Pay(MS_SIGN_MONEY) == 0) then
					WriteLog(GetTongName().."Bang h閕 giao"..MS_SIGN_MONEY.."Thao t竎 ph� thi u l玦 i bang h閕 kh玭g th祅h c玭g!!!! ");
					PlayerIndex = OldPlayer
					ErrorMsg(3)
					return
				else
					TongNameTab[i], TongIdTab[i] =  GetTongName();
					WriteLog(TongNameTab[i].."Bang h閕 giao"..MS_SIGN_MONEY.."Th祅h c玭g thao t竎 ph� thi u l玦 i c馻 bang h閕! ");
				end;
		end;
		PlayerIndex = OldPlayer;
		
		OldSubWorld = SubWorld;
		idx = SubWorldID2Idx(MapTab[1][1]);
		if (idx == -1) then
			ErrorMsg(3) 
			return
		end;
		SubWorld = idx;
		
		OpenMission(MISSIONID);
		for i  = 1, 2 do 
			SetMissionV(MS_TONG1ID + i - 1, TongIdTab[i]);
		end;
		
		SetMissionS(1, TongNameTab[1]); --1、2两个MissionString存放帮会的名称
		SetMissionS(2, TongNameTab[2]);
		
		str = "<#> b総 u l玦 i Bang h閕, hai b猲 l� "..TongNameTab[1].."<#> v韎"..TongNameTab[2];
		AddGlobalNews(str);
		SubWorld = OldSubWorld;
		Msg2Team("C竎 b筺  ho祅 t蕋 b竜 danh! Xin h穣 chu萵 b�! Sau 10 ph髏 n鱝 s� ch輓h th鴆 khai chi課");
		Say("C竎 b筺  ho祅 t蕋 b竜 danh! Xin h穣 chu萵 b�! Sau 10 ph髏 n鱝 s� ch輓h th鴆 khai chi課",0);
	end;
end;

function OnReady()
	str = "<#> Hi謓 t筰 l玦 i Bang h閕 產ng trong giai 畂筺 v祇 u trng, m阨"..GetMissionS(1).."<#> v韎"..GetMissionS(2).." th祅h vi猲 Bang h閕 <#> nhanh ch鉵g v祇 u trng, chu萵 b� b総 u thi u!";
	Say(str, 2, "Ta th輈h h頿 v韎 甶襲 ki謓, ta mu鑞 v祇 u trng /OnJoin", "Ta mu鑞 nh﹏ c� h閕 n祔  gi髉 m鋓 ngi trong bang h閕 tr� n猲 m筺h m�. /OnCancel");
end;

function ErrorMsg(ErrorId)
if (ErrorId == 1) then 
	Say("Bang ch� hai b猲 mu鑞 xin ph衟 thi u trc h誸 ph秈 l藀 nh鉳 r錳 m韎 xin ph衟. ",0)
elseif (ErrorId == 2) then 
	Say("Bang ch� b竜 danh c莕 ph秈 l� i trng c馻 i ng� hi謓 t筰 v� ph秈 mang theo  500 v筺 lng",0)
elseif (ErrorId == 3) then 
	Say("B竜 danh xu蕋 hi謓 tr鬰 tr芻. Xin li猲 h� ngi qu秐 l�!",0);
elseif (ErrorId == 4) then 
	Say("B筺 kh玭g ph秈 l� th祅h vi猲 c馻 2 bang h閕 產ng thi u, kh玭g th� v祇 trong!", 0);
elseif(ErrorId == 5) then 
	Say("Bang ch� b竜 danh c莕 ph秈 l� i trng c馻 i ng� hi謓 t筰",0);
else
	
end;

return
end;

function OnJoin()
	idx = SubWorldID2Idx(MapTab[1][1]);
	if (idx == -1) then 
		return
	end
	
	OldSubWorld = SubWorld;
	SubWorld = idx;
	
	if (GetTongName() == GetMissionS(1)) then 
		JoinCamp(1)
	elseif (GetTongName() == GetMissionS(2)) then 
		JoinCamp(2)
	else
		ErrorMsg(4)
	end;
	
	ms_state = GetMissionV(MS_STATE);
	if (ms_state == 2) then
		SetFightState(1)
	elseif(ms_state == 1) then  
		SetFightState(0)
	else
		return
	end;
	SubWorld=OldSubWorld
	
end;

function OnFighting()
	str = "<#> Hi謓 t筰 l玦 i Bang h閕 產ng ti課 h祅h thi u, m阨"..GetMissionS(1).."<#> v韎"..GetMissionS(2).."<#> th祅h vi猲 Bang h閕 v祇 u trng thi u!";
	Say(str, 2, "Ta th輈h h頿 v韎 甶襲 ki謓, ta mu鑞 v祇 u trng /OnJoin", "Ta kh玭g ph� h頿 v韎 甶襲 ki謓, ta kh玭g mu鑞 v祇! /OnCancel");
end;

function OnCancel()
end;
