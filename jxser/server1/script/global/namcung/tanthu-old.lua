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

bk90={2959,2960,2961,2962,2963,2964,2965,2966,2967,2968}
TASK_CODE_HT = 2000
T_NHANTHUONG_HNN	=	5031
T_DAY_HN = 5132



function main()
	dofile("script/global/namcung/tanthu.lua");		
	-- LoadScript("/script/global/·��_���.lua")
-- for i = 16,20 do
-- AddGoldItem(0,194)
-- end
	local tbAward = 
	{
		{nExp_tl = 5000000},
	}
	-- tbAwardTemplet:GiveAwardByList(tbAward, "L� T�nh Nh�n n�m 2011, m� L� H�p T�nh Nh�n")
	
	local szTitle = "  "
				local tbOpt =
	{
		 {"Nh�n l�nh b�i test", lbtest},
		-- {"Nh�n h� tr� t�n th�", hotrotanthune},
		{"Nh�n h� tr� t�n th�", hotrotanthune2},
		{"Nh�n nh�c v��ng ki�m", nhacvuongkiem},
		{"Nh�n ph�c l�i h�ng ng�y", thuonghangngay},
				{"Nh�n b� k�p 90",nhapbk90mienphi },
		{"Nh�n h� tr� skill 6x", HoTroSkill},
		-- {"Nh�n h� tr� skill 6x", HoTroSkill},
		{"Huy trang bi khoa", deltem},
		-- {"Nh�n V�ng s�ng h� tr� t�i c�p 80", vongsanghtb},
		-- {"Nh�n th��ng ��t c�p 80", thuongcap80},
		{"Tho�t"},
	}
		CreateNewSayEx(szTitle, tbOpt)	
end
function nhacvuongkiem()
AddItem(6,1,2340,1,0,0)
end
function hotrotanthune2()
if GetLevel() ~= 1 then
Say("H� tr� n�y ch� d�nh cho ng��i ch�i c�p 1",0);
return 1
end
if CalcFreeItemCellCount() < 50 then
Say("H�y s�p x�p h�nh trang c�n �t nh�t 50 � tr�ng",0);
return 1
end

local nAddLevel = 90 - GetLevel()
ST_LevelUp(nAddLevel)
for i=168,176 do
-- for i=143,146 do
local Index = AddGoldItem(0,i) ITEM_SetExpiredTime(Index,0) SyncItem(Index) SetItemBindState(Index, -2)
end
-- for i=159,163 do
-- local Index = AddGoldItem(0,i) ITEM_SetExpiredTime(Index,24*60*30) SyncItem(Index) SetItemBindState(Index, -2)
-- end

local Index = AddGoldItem(0,5290) ITEM_SetExpiredTime(Index,24*60*30) SyncItem(Index) SetItemBindState(Index, -2) -- an

-- local tbItem = {szName="Ti�n th�o l�", tbProp={6,1,71,1,0,0},nCount=10, nBindState=-2}
-- tbAwardTemplet:GiveAwardByList(tbItem, "add item", 1)

-- local Index = AddItem(6,1,71,1,0,0) ITEM_SetExpiredTime(Index,24*60*30) SyncItem(Index) SetItemBindState(Index, -2)	
local Index = AddItem(6,1,438,1,0,0) ITEM_SetExpiredTime(Index,24*60*30) SyncItem(Index) SetItemBindState(Index, -2)	-- tho dia phu
local Index = AddItem(6,1,1266,1,0,0) ITEM_SetExpiredTime(Index,24*60*30) SyncItem(Index) SetItemBindState(Index, -2) -- than hanh phu
local Index = AddItem(0,10,2,9,0,0,0) ITEM_SetExpiredTime(Index,0) SyncItem(Index) SetItemBindState(Index, -2) -- tuc suong
-- local Index = AddItem(0,10,2,1,0,0,0) ITEM_SetExpiredTime(Index,0) SyncItem(Index) SetItemBindState(Index, -2) -- liet bach ma
-- local Index = AddItem(6,1,4380,1,0,0) ITEM_SetExpiredTime(Index,0) SyncItem(Index) SetItemBindState(Index, -2) -- lb tan thu
AddLeadExp(999999999)
AddRepute(450)
AddMagic(210,1)
Earn(10000);
end

function thuonghangngay()
	local nDate = tonumber(GetLocalDate("%d"))
	if ( GetTask(T_DAY_HN) ~= nDate ) then
		SetTask(T_DAY_HN, nDate);
		SetTask(T_NHANTHUONG_HNN,0)
	end
	--if GetLevel() < 130 then
-- local ntranscount = ST_GetTransLifeCount();
-- if (ntranscount > 4) then
		-- Talk(1,"","Tr�ng sinh 4 tr� xu�ng m�i c� th� nh�n th��ng !")
		-- return
	-- end

	if GetTask(T_NHANTHUONG_HNN) > 0 then
		Talk(1,"","M�i ng�y ch� nh�n 1 l�n.")
	else
		local TAB_BONUS = {
				-- {szName="<color=yellow>200 t� kinh ngi�m + d�n", nExp_tl = 200000000000},
					{szName="S�t th� gi�n",tbProp={6,1,400,90,random(0,4),0},nCount=1},
					{szName="L�nh b�i d� t�u",tbProp={6,1,4381,1,0,0},nCount=1},
					{szName="L�nh b�i phong l�ng ��",tbProp={4,489,1,1,0,0},nCount=1},
				
		}
	
		for i = 1,getn(TAB_BONUS) do
			tbAwardTemplet:GiveAwardByList(TAB_BONUS[i], "Ph�n th��ng");
		end
		SetTask(T_NHANTHUONG_HNN,GetTask(T_NHANTHUONG_HNN)+100)
		-- Talk(1, "", "Nh�n th�nh c�ng 200 t� kinh nghi�m c�ng d�n")
--Msg2SubWorld(format("<color=green>��i hi�p <color=white>%s<color>  �� <color=yellow>nh�n thu��g h�ng ng�y 1 t� Exp<color> t�i l� quan<color>",GetName()));
	end
end

function nhapbk90mienphi()
if CalcFreeItemCellCount() < 5 then
Say("H�y s�p x�p h�nh trang c�n �t nh�t 5 � tr�ng",0);
return 1
end
nFaction = GetLastFactionNumber() + 1
for i=1,getn(bk90) do
if nFaction == i then
local Index = AddItem(6,1,bk90[i],1,0,0) ITEM_SetExpiredTime(Index,24*60*7) SyncItem(Index) SetItemBindState(Index, -2)	
end
end
local Index = AddItem(6,1,2424,1,0,0) ITEM_SetExpiredTime(Index,24*60*7) SyncItem(Index) SetItemBindState(Index, -2)	
end

function thuongcap80()
if CalcFreeItemCellCount() < 5 then
Say("H�y s�p x�p h�nh trang c�n �t nh�t 5 � tr�ng",0);
return 1
end
if GetLevel() >= 80 then
nFaction = GetLastFactionNumber() + 1
if GetTask(3975) == 0 then
for i=1,getn(bk90) do
if nFaction == i then
local Index = AddItem(6,1,bk90[i],1,0,0) ITEM_SetExpiredTime(Index,24*60*7) SyncItem(Index) SetItemBindState(Index, -2)	
-- local Index = AddItem(6,1,2424,1,0,0) ITEM_SetExpiredTime(Index,24*60*7) SyncItem(Index) SetItemBindState(Index, -2)	
SetTask(3975,1)
end
end
else
Say("B�n �� nh�n ph�n th��ng n�y r�i",0);
end
else
Say("C�p 80 h�y quay l�i t�m ta",0);
end
end

function vongsanghtb()
	if GetLevel()< 80 then
		AddSkillState(531,50,1,600*60*18) -- x2 kinh nghiem
		AddSkillState(461,1, 1,600*60*18) -- ngoi sao
		AddSkillState(512,20,1,600*60*18) -- chay nhanh
		AddSkillState(527,5,1,600*60*18) -- mau
		AddSkillState(313,5,1,600*60*18) -- khang tat ca
		AddSkillState(314,5,1,600*60*18) -- hoi mana + mau
		-- Talk(1, "", "B�n s� ���c nh�n h� tr� k� n�ng n�y ��n c�p 80");
	else
		--RemoveSkillState(531)	--Ng? sao
		--RemoveSkillState(461)

		RemoveSkillState(531)
		RemoveSkillState(461)
		RemoveSkillState(512)
		RemoveSkillState(527)
		RemoveSkillState(313)  	--Vong duoi chan
		RemoveSkillState(314)	 --Vong duoi chan
		--RemoveSkillState(546)		 --Rong bay
		return
	end
end

function lbtest()
AddItem(6,1,4378,1,0,0)
end

function hotrotanthune()
if GetLevel() ~= 1 then
Say("H� tr� n�y ch� d�nh cho ng��i ch�i c�p 1",0);
return 1
end
if CalcFreeItemCellCount() < 50 then
Say("H�y s�p x�p h�nh trang c�n �t nh�t 50 � tr�ng",0);
return 1
end

local nAddLevel = 10 - GetLevel()
ST_LevelUp(nAddLevel)
for i=177,185 do
local Index = AddGoldItem(0,i) ITEM_SetExpiredTime(Index,24*60*7) SyncItem(Index) SetItemBindState(Index, -2)
end

local tbItem = {szName="Ti�n th�o l�", tbProp={6,1,71,1,0,0},nCount=10, nBindState=-2}
tbAwardTemplet:GiveAwardByList(tbItem, "add item", 1)

-- local Index = AddItem(6,1,71,1,0,0) ITEM_SetExpiredTime(Index,24*60*7) SyncItem(Index) SetItemBindState(Index, -2)	
local Index = AddItem(6,1,438,1,0,0) ITEM_SetExpiredTime(Index,24*60*7) SyncItem(Index) SetItemBindState(Index, -2)	
local Index = AddItem(6,1,1266,1,0,0) ITEM_SetExpiredTime(Index,24*60*7) SyncItem(Index) SetItemBindState(Index, -2)
local Index = AddItem(0,10,2,9,0,0,0) ITEM_SetExpiredTime(Index,0) SyncItem(Index) SetItemBindState(Index, -2) -- tuc suong
-- local Index = AddItem(0,10,2,1,0,0,0) ITEM_SetExpiredTime(Index,0) SyncItem(Index) SetItemBindState(Index, -2) -- liet bach ma
local Index = AddItem(6,1,4380,1,0,0) ITEM_SetExpiredTime(Index,0) SyncItem(Index) SetItemBindState(Index, -2) -- lb tan thu
AddLeadExp(999999999)
AddRepute(450)
AddMagic(210,1)
end

function HoTroSkill()
	local szFaction = GetFaction()
	if tbAllSkill[szFaction] == nil then
	Talk(1, "", "��i hi�p ch�a gia nh�p m�n ph�i");
		return
	end
	for i=1, 7 do --ho tro den 6x
	--for i=1, 11 do --ho tro den 15x
		if tbAllSkill[szFaction][i] ~= nil then
			for j=1, getn(tbAllSkill[szFaction][i]) do
				--if HaveMagic(tbAllSkill[szFaction][i][j]) ~= -1 then
					--DelMagic(tbAllSkill[szFaction][i][j])
				--end
				--UpdateSkill()
				if HaveMagic(tbAllSkill[szFaction][i][j]) == -1 then
						if (i == 10 or i == 9 or i == 8) then
						AddMagic(tbAllSkill[szFaction][i][j],1)--ho tro den 20 dang cap skill
						else
						AddMagic(tbAllSkill[szFaction][i][j])
						end
				end
			end
		end
	end
	Talk(1, "", "Xin ch�c m�ng b�n �� nh�n ���c h� tr� k� n�ng t� BQT");
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