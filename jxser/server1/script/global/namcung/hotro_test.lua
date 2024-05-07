
Include("\\script\\global\\namcung\\hotrogm.lua")
Include("\\script\\global\\namcung\\hotroitem.lua")
Include("\\script\\global\\ÌØÊâÓÃµØ\\ÃÎ¾³\\npc\\Â·ÈË_ÅÑÉ®.lua")
Include("\\script\\missions\\boss\\callboss_incity.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\functionlib.lua")
Include("\\script\\lib\\log.lua")
IncludeLib("SETTING")
Include("\\script\\global\\rename_head.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\global\\fuyuan.lua")
Include("\\script\\global\\namcung\\hotrogm.lua")
Include("\\script\\global\\namcung\\xephang\\top10_all.lua")
Include("\\script\\task\\partner\\education\\swordking_people.lua")
Include("\\script\\global\\namcung\\hotrotanthu\\doiraclayvk.lua")
Include("\\script\\global\\namcung\\gmquanlyserver\\ds_gm.lua");
Include("\\script\\global\\namcung\\hotrogm.lua")
Include("\\script\\global\\namcung\\namcung_say.lua")


function main()	
	--dofile("script/global/namcung/hotro_test.lua");	
	 --LoadScript("/script/global/namcung/hotrogm.lua");
	 --CallBossDown_Fixure();
	Say("Chuc nang test", 10, 
		"NhËp Ph¸i Vµ NhËn Skills 120/choose_faction",
		"NhËn Bé An Bang/nhananbang",
		"NhËn Bé §Þnh Quèc/nhandinhquoc",
		"NhËn §å Xanh/trangbixanh",
		"NhËn cÊp 150/cap150",
		"NhËn HKMP/bachkimm",
		"NhËn ngùa/nguabontieu",
		"Thay ®æi Mµu PK /trangthai",
		"Trang 2/test_trang2",
		"Thoat/thoat"
		);
return 1
end

function cap150()
	local nCurLevel = GetLevel()
	if nCurLevel >= 150 then
			Talk(1, "", "Ng­¬i ®· ®¹t cÊp 150 råi.")
		return
	end
	local nAddLevel = 150 - nCurLevel
	ST_LevelUp(nAddLevel)	
end;

Include("\\script\\tagnewplayer\\tbitemHK.lua");
function nhanhkmp()
if CalcFreeItemCellCount() < 20 then
Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 20 « trèng råi h·y më.",0);
return 1;
end 
	local strFaction = GetFaction()
	if (tbItemHK[strFaction] == nil) then
		Talk(1, "", "C¸c h¹ vÉn ch­a gia nhËp m«n ph¸i!");
		return
	end
	local tbOpp = {}
	local str = "<#> Ta cho phÐp ®¹i hiÖp chän 1 trong nh÷ng trang bÞ Hoµng Kim M«n Ph¸i ";
	for i=1, getn(tbItemHK[strFaction]) do
		local strItemName = tbItemHK[strFaction][i].szName
		local nID =  tbItemHK[strFaction][i].nID
		tinsert(tbOpp,"Ta muèn nhËn ".. strItemName.." /#GetBonusHK(" .. nID .. ")");
	end
	tinsert(tbOpp, "<#>Tho¸t/OnCancel")
	if ( getn( tbOpp ) == 0 ) then
		Say(str, 0);
		return
	end;
	Say( str, getn( tbOpp ), tbOpp )
end
function GetBonusHK(nID)
	local nIndex = AddGoldItem(0, nID)
	local strItemName = GetItemName(nIndex)
	Msg2Player("B¹n nhËn ®­îc "..strItemName)
--	SetTask(5709,GetTask(5709)+1)
end


function test_trang2()	
	Say("Chuc nang test", 10, 
		"NhËn 2000 V¹n/tienvan2",
		"NhËn 500 TiÒn §ång/tiendong2",
		"Danh väng,Phóc duyªn /danhvongphucduyen",
		"Tµi l·nh ®¹o /lanhdao",
		"TÈy ®iÓm /clear_attibute_point",
		"Thay ®æi Mµu PK /trangthai",
		 "Nguyªn liÖu ®å tÝm/phoitepdo",
		 "Info npc/LastNpcTalk",
		-- "Bug tiem nang /tiemnang",
		 "Tang tiem nang /add_prop",
		"Thoat/thoat"
		);
return 1
end

function LastNpcTalk()
	local nNpcIndex = GetLastDiagNpc()
	local Name = GetNpcName(nNpcIndex)
	local IdNpc = GetNpcSettingIdx(nNpcIndex)
	local nScript = GetNpcScript(nNpcIndex)
	local DropFile = GetNpcDropRateFile(nNpcIndex)
	local NguHanh = GetNpcSeries(nNpcIndex)
	local Life = GetNpcLife(nNpcIndex)
	local NpcKind = GetNpcKind(nNpcIndex)
	local file  = openfile("npcinfo.lua", "a+")
	write(file,strchar(34).."Name: "..Name.." ID: "..IdNpc.." Script: "..nScript.." DropFile: "..DropFile.." Life: "..Life.." NguHanh: "..NguHanh.." Kind: "..NpcKind..strchar(34),'\n')
	closefile(file)
	Msg2Player("<color=yellow>Th«ng tin ®­îc l­u l¹i ë file server1-npcinfo.lua<color>")
return 1
end


function phoitepdo()
	Say("Chuc nang test", 10, 
		"§å tÝm/dotim",
		"§¸ Èn/#epdotim(1)",
		"§¸ hiÖn/#epdotim(2)",
		"Tö thñy tinh/#epdotim(3)",
		"Phóc duyªn/#epdotim(4)",
		"HuyÒn tinh/#epdotim(5)",
		"Thoat/thoat"
		);
return 1
end

function chondaan()
	Say("Chuc nang test", 10, 
		"Kim/#chondaan1(1)",
		"Méc/#chondaan1(2)",
		"Thñy/#chondaan1(3)",
		"Háa/#chondaan1(4)",
		"Thæ/#chondaan1(5)",
		"Thoat/thoat"
		);
return 1
end
function chondaan1(a)
if a == 1 then
AddItem(6,1,150,1,a-1,0,0)
AddItem(6,1,152,1,a-1,0,0)
AddItem(6,1,154,1,a-1,0,0)
elseif a == 2 then
AddItem(6,1,150,1,a-1,0,0)
AddItem(6,1,152,1,a-1,0,0)
AddItem(6,1,154,1,a-1,0,0)
elseif a == 3 then
AddItem(6,1,150,1,a-1,0,0)
AddItem(6,1,152,1,a-1,0,0)
AddItem(6,1,154,1,a-1,0,0)
elseif a == 4 then
AddItem(6,1,150,1,a-1,0,0)
AddItem(6,1,152,1,a-1,0,0)
AddItem(6,1,154,1,a-1,0,0)
elseif a == 5 then
AddItem(6,1,150,1,a-1,0,0)
AddItem(6,1,152,1,a-1,0,0)
AddItem(6,1,154,1,a-1,0,0)
end
end
function epdotim(a)
if a == 1 then
chondaan()
elseif a == 2 then
AddItem(6,1,149,1,0,0,0)
AddItem(6,1,151,1,0,0,0)
AddItem(6,1,153,1,0,0,0)
elseif a == 3 then
for i = 1,3 do
AddItem(4,239,1,1,0,0)
end
elseif a == 4 then
for i = 1,3 do
AddItem(6,1,124,1,0,0)
end
elseif a == 5 then
for i = 1,3 do
AddItem(6,1,147,5,0,0)
end
end
end
function cap80()
	local nCurLevel = GetLevel()
	if nCurLevel >= 81 then
			Talk(1, "", "Ng­¬i ®· ®¹t cÊp 81 råi.")
		return
	end
	local nAddLevel = 81 - nCurLevel
	ST_LevelUp(nAddLevel)	
end;

function tiemnang()
AddProp(1000000)
end

function bktl()
local tbItem = {tbProp={0,2},nQuality=1,nExpiredTime = 0, nBindState = 0}
tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
local tbItem = {tbProp={0,11},nQuality=1,nExpiredTime = 0, nBindState = 0}
tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
local tbItem = {tbProp={0,6},nQuality=1,nExpiredTime = 0, nBindState = 0}
tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
end
function bktv()
local tbItem = {tbProp={0,16},nQuality=1,nExpiredTime = 0, nBindState = 0}
tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
local tbItem = {tbProp={0,21},nQuality=1,nExpiredTime = 0, nBindState = 0}
tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
local tbItem = {tbProp={0,26},nQuality=1,nExpiredTime = 0, nBindState = 0}
tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
end
function bknm()
local tbItem = {tbProp={0,31},nQuality=1,nExpiredTime = 0, nBindState = 0}
tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
local tbItem = {tbProp={0,39},nQuality=1,nExpiredTime = 0, nBindState = 0}
tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
end
function bkty()
local tbItem = {tbProp={0,46},nQuality=1,nExpiredTime = 0, nBindState = 0}
tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
local tbItem = {tbProp={0,51},nQuality=1,nExpiredTime = 0, nBindState = 0}
tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
end
function bk5d()
local tbItem = {tbProp={0,61},nQuality=1,nExpiredTime = 0, nBindState = 0}
tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
local tbItem = {tbProp={0,56},nQuality=1,nExpiredTime = 0, nBindState = 0}
tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
end
function bkdm()
local tbItem = {tbProp={0,71},nQuality=1,nExpiredTime = 0, nBindState = 0}
tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
local tbItem = {tbProp={0,76},nQuality=1,nExpiredTime = 0, nBindState = 0}
tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
local tbItem = {tbProp={0,81},nQuality=1,nExpiredTime = 0, nBindState = 0}
tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
end
function bkcb()
local tbItem = {tbProp={0,96},nQuality=1,nExpiredTime = 0, nBindState = 0}
tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
local tbItem = {tbProp={0,94},nQuality=1,nExpiredTime = 0, nBindState = 0}
tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
end
function bktn()
local tbItem = {tbProp={0,101},nQuality=1,nExpiredTime = 0, nBindState = 0}
tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
local tbItem = {tbProp={0,115},nQuality=1,nExpiredTime = 0, nBindState = 0}
tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
end
function bkvd()
local tbItem = {tbProp={0,116},nQuality=1,nExpiredTime = 0, nBindState = 0}
tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
local tbItem = {tbProp={0,121},nQuality=1,nExpiredTime = 0, nBindState = 0}
tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
end
function bkcl()
local tbItem = {tbProp={0,126},nQuality=1,nExpiredTime = 0, nBindState = 0}
tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
local tbItem = {tbProp={0,131},nQuality=1,nExpiredTime = 0, nBindState = 0}
tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
end

function bachkimm()

-- local nLastTime = GetTask(TASK_GAME)
-- local nDifTime =  GetCurServerTime() - nLastTime
	-- local nItemData	= 20190724;	
	-- local nDate = tonumber(GetLocalDate("%Y%m%d"));
	-- local nLevel = GetLevel();
	
	if CalcFreeItemCellCount() < 30 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 30 « trèng råi h·y më.",0);
		return 1;
	end
	local tbOpt =
	{
		{"ThiÕu l©m", bktl},
		{"Thiªn v­¬ng", bktv},
		{"®­êng m«n", bkdm},
		{"Ngò ®éc", bk5d},
		{"Nga mi", bknm},
		{"Thuý yªn", bkty},
		{"C¸i bang", bkcb},
		{"Thiªn nhÉn", bktn},
		{"Vâ ®ang", bkvd},
		{"C«n l«n", bkcl},
		{"Tho¸t"},
	}
	CreateNewSayEx("Chän m«n ph¸i?", tbOpt)
end
tbAllSkill = {
	shaolin = {
		[1] = {10,14},
		[2] = {4,6,8},
		[3] = {15},
		[4] = {16},
		[5] = {20},
		[6] = {11,19,271},
		[7] = {21,273},
		[9] = {318,319,321},
	},
	tianwang = {
		[1] = {29,30,34},
		[2] = {23,24,26},
		[3] = {33},
		[4] = {31,35,37},
		[5] = {40},
		[6] = {42},
		[7] = {32,36,41,324},
		[9] = {322,323,325},
	},
	tangmen = {
		[1] = {45},
		[2] = {43,347},
		[3] = {303},
		[4] = {47,50,54,343},
		[5] = {345},
		[6] = {349},
		[7] = {48,58,249,341},
		[9] = {302,339,342,351},
	},
	wudu = {
		[1] = {63,65},
		[2] = {60,62,67},
		[3] = {66,70},
		[4] = {64,68,69,384},
		[5] = {73,356},
		[6] = {72},
		[7] = {71,74,75},
		[9] = {353,355,390},
	},
	emei = {
		[1] = {80,85},
		[2] = {77,79},
		[3] = {93},
		[4] = {82,89,385},
		[5] = {86},
		[6] = {92},
		[7] = {88,91,252,282},
		[9] = {328,332,380},
	},
	cuiyan = {
		[1] = {99,102},
		[2] = {95,97},
		[3] = {269},
		[4] = {105,113},
		[5] = {100},
		[6] = {109},
		[7] = {108,111,114},
		[9] = {336,337},
	},
	gaibang = {
		[1] = {119,122},
		[2] = {115,116},
		[3] = {129},
		[4] = {124,274},
		[5] = {277},
		[6] = {125,128},
		[7] = {130,360},
		[9] = {357,359},
	},
	tianren = {
		[1] = {135,145},
		[2] = {131,132,136},
		[3] = {137},
		[4] = {138,140,141},
		[5] = {364},
		[6] = {143},
		[7] = {142,148,150},
		[9] = {361,362,391},
	},
	wudang = {
		[1] = {153,155},
		[2] = {151,152},
		[3] = {159},
		[4] = {158,164},
		[5] = {160},
		[6] = {157},
		[7] = {165,166,267},
		[9] = {365,368},
	},
	kunlun = {
		[1] = {169,179},
		[2] = {167,168,171,392},
		[3] = {174},
		[4] = {172,173,178,393},
		[5] = {175,181},
		[6] = {90,176},
		[7] = {182,275,630},
		[9] = {372,375,394},
	},
}