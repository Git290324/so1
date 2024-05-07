-- Include("\\script\\global\\quanly.lua")
Include("\\script\\global\\skills_table.lua")
-- Include("\\script\\hotrotanthu\\ex_goldequip_lingpai.lua")
Include("\\script\\global\\platina_upgrade.lua")
Include("\\script\\vng_feature\\trungluyen\\refine_equip.lua")
Include("\\script\\nationalwar\\head.lua")
Include("\\script\\misc\\daiyitoushi\\toushi_function.lua")
Include("\\script\\event\\equip_publish\\baihu\\refine_equip.lua")
Include("\\script\\vng_feature\\resetbox.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\education\\knowmagic.lua")
Include("\\script\\global\\rename_head.lua")
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\global\\titlefuncs.lua")
Include("\\script\\bonusvlmc\\func_check.lua");
Include("\\script\\bonusvlmc\\func_quest999.lua");
Include("\\script\\bonusvlmc\\vlmc_main.lua");
Include("\\script\\bonusvlmc\\fucmain.lua");
Include("\\script\\bonus_onlinetime\\func_onlineaward.lua")
IncludeLib("SETTING")
IncludeLib("ITEM")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\awardtemplet.lua")
-- Include("\\script\\global\\hotrothem.lua")
Include("\\script\\vng_feature\\top10\\vngtop10.lua")
-- Include("\\script\\global\\thienvuong.lua")
-- Include("\\script\\global\\thieulam.lua")
-- Include("\\script\\global\\ngudoc.lua")
-- Include("\\script\\global\\duongmon.lua")
-- Include("\\script\\global\\ngamy.lua")
-- Include("\\script\\global\\thuyyen.lua")
-- Include("\\script\\global\\caibang.lua")
-- Include("\\script\\global\\thiennhan.lua")
-- Include("\\script\\global\\vodang.lua")
-- Include("\\script\\global\\conlon.lua")
IncludeLib("RELAYLADDER")
IncludeLib("TONG")
T_NHANTHUONG_HNN	=	5032
T_HUYENCHANDON_HNN	=	6032


function main()
	dofile("script/global/namcung/chuyenphai.lua");
	dialog_main()
end

--==========================================================================================

Include("\\script\\global\\repute_head.lua")
Include("\\script\\misc\\league_cityinfo.lua")

---------------------------
function dialog_main()
 local nIdPlay = PlayerIndex
	local tab_Chat = {
		"<color=yellow>chuyÓn ph¸i vµ ®çi tªn nh©n vËt t¹i ®©y<color>.",
		"<color=yellow>ChuyÓn giíi tÝnh víi gi¸ 2 KNB<color>.",

	}
       local nNpcIndex = GetLastDiagNpc();
       local ran = random(1,getn(tab_Chat))
	-- NpcChat(nNpcIndex,tab_Chat[ran])

	local szTitle = "<npc>"
	local tbOpt =
	{
{"ChuyÓn ph¸i.", chuyenphai},
{"Giao nép tÝn vËt m«n ph¸i.", toushiApplyMenPaiXinWu},
		-- {"ChuyÓn giíi tÝnh (200xu).", chuyengioi},	
		-- {"§æi tªn nh©n vËt (200xu).", khuvucdoiten},		
		{"KÕt thóc ®èi tho¹i"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function khuvucdoiten1()
	local szTitle = "<npc>CÇn 2 KNB ®Ó vµo khu vùc ®Æc biÖt ®Ó thay ®çi tªn nh©n vËt<enter>Tr­íc khi ch­a ®çi ®­îc tªn theo ý muèn ko ®­îc tïy tiÖn ra khái khu vùc ng­¬i ®· râ ch­a !"
	local tbOpt =
	{
			{"0k", khuvucdoiten},		
		{"KÕt thóc ®èi tho¹i"},
	}

	CreateNewSayEx(szTitle, tbOpt)
end
function khuvucdoiten()
if (CalcEquiproomItemCount(4, 417, 1, -1) < 200) then
Say("CÇn 200 xu ®Ó ®æi tªn nh©n vËt") 
return
end 
if (ConsumeEquiproomItem(200, 4, 417, 1, -1) == 1) then
NewWorld(521,1600,3279) 
end
end
function chuyengioi()
if (CalcEquiproomItemCount(4, 417, 1, -1) < 200) then
Say("CÇn 200 xu ®Ó chuyÓn giíi tÝnh !") 
return
end 
player_Faction = GetFaction()
if GetSeries() == 0 then
Talk(1,"","HÖ Kim kh«ng ®­îc chuyÓn giíi nha!")
elseif GetSeries() == 2 then
Talk(1,"","HÖ Thñy kh«ng ®­îc chuyÓn giíi nha!")
elseif (player_Faction == "shaolin") then
Talk(1,"","ThiÕu L©m Ph¸i kh«ng ®­îc chuyÓn giíi nha!")
elseif (player_Faction == "emei") then
Talk(1,"","Nga My Ph¸i kh«ng ®­îc chuyÓn giíi nha!")
elseif GetSex() == 0 then		-- ±¾ÃÅ
Say("Ta ®æi sang n÷!",2,"ChuyÓn qua n÷ dïm ta./cgnu","Tho¸t./no")
elseif GetSex() == 1 then		-- ±¾ÃÅ
Say("Ta ®æi sang nam!",2,"ChuyÓn qua nam dïm ta./cgnam","Tho¸t./no")
end
end
function cgnam()
if (ConsumeEquiproomItem(200, 4, 417, 1, -1) == 1) then
SetSex(0)
KickOutSelf()
end
end
function cgnu()
if (ConsumeEquiproomItem(200, 4, 417, 1, -1) == 1) then
SetSex(1)
KickOutSelf()
end
end

function noptv()
	if GetLevel() < 120 then
		Talk(1,"","H·y luyÖn ®Õn cÊp 120 trë lªn råi nhËn!")
		return
	end


	local szTitle = "<npc>Hoan nghªnh ng­¬i ®Õn th¨m ta!"
	local tbOpt =
	{
			{"Thiªn V­¬ng.", chuyentv},
		{"ThiÕu L©m.", chuyentl},	
		{"Ngò ®éc.", chuyennd},
		{"§­êng m«n.", chuyendm},
		{"Nga mi.", chuyennm},
		{"Thóy yªn.", chuyenty},
		{"C¸i bang.", chuyencb},
		{"Thiªn nhÉn.", chuyentn},
	      {"Vâ ®ang.", chuyenvd},
	      {"C«n l«n.", chuyencl},		
		{"KÕt thóc ®èi tho¹i"},
	}

	CreateNewSayEx(szTitle, tbOpt)
end

function chuyenphai()
	if GetLevel() < 120 then
		Talk(1,"","H·y luyÖn ®Õn cÊp 120 trë lªn råi nhËn!")
		return
	end
local tbSay = {}
tinsert(tbSay,"ChuyÓn Ph¸i ThiÕu L©m./#daiyitoushi_main(0)")
tinsert(tbSay,"ChuyÓn Ph¸i Thiªn V­¬ng./#daiyitoushi_main(1)")
tinsert(tbSay,"ChuyÓn Ph¸i §­êng M«n./#daiyitoushi_main(2)")
tinsert(tbSay,"ChuyÓn Ph¸i Ngò §éc./#daiyitoushi_main(3)")
tinsert(tbSay,"ChuyÓn Ph¸i Nga My./#daiyitoushi_main(4)")
tinsert(tbSay,"ChuyÓn Ph¸i Thóy Yªn./#daiyitoushi_main(5)")
tinsert(tbSay,"ChuyÓn Ph¸i C¸i Bang./#daiyitoushi_main(6)")
tinsert(tbSay,"ChuyÓn Ph¸i Thiªn NhÉn./#daiyitoushi_main(7)")
tinsert(tbSay,"ChuyÓn Ph¸i Vâ §ang./#daiyitoushi_main(8)")
tinsert(tbSay,"ChuyÓn Ph¸i C«n L«n./#daiyitoushi_main(9)")
--tinsert(tbSay,"ChuyÓn Ph¸i Hoa S¥n./#daiyitoushi_main(10)")
tinsert(tbSay,"GÆp l¹i muéi sau/Quit")
Say("Hoan nghªnh ng­¬i ®Õn th¨m ta!.", getn(tbSay), tbSay)

end

function query_rolename() 
AskClientForString("on_query_rolename", "", 1, 16, "<#> Ýt nhÊt lµ 7 ký tù "); 
end 

function on_query_rolename(new_name) 
QueryRoleName(new_name); 
end 
function doiten()
if (CalcEquiproomItemCount(4, 417, 1, -1) < 500) then
Say("<color=green>Ng­¬i kh«ng cã <color=red>500 <color=yellow> Xu<color> !") 
return
end 
	AskClientForString("doitennv", "", 1, 100, "Xin nhËp tªn muèn ®æi");
end
function doitennv(strings)
	RenameRole(strings)
if (ConsumeEquiproomItem(500, 4,417, 1, -1) == 1) then
end
end
function chuyencl()
conlon()
end
function chuyenvd()
vodang()
end
function chuyentn()
thiennhan()
end
function chuyencb()
caibang()
end
function chuyenty()
thuyyen()
end
function chuyennm()
ngami()
end
function chuyendm()
duongmon()
end
function chuyennd()
ngudoc()
end
function chuyentl()
thieulam()
end
function chuyentv()
thienvuong()
end
function codelixi()
local ntranscount = ST_GetTransLifeCount();
local nCurLevel = GetLevel()
local nAddLevel = 160 - nCurLevel
	if CalcFreeItemCellCount() < 20 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 20 « trèng råi h·y më.",0);
		return 1;
	end
if (CalcEquiproomItemCount(6, 1, 2221, -1) < 1) then
Say("<color=green>Ng­¬i kh«ng cã <color=red> 1 <color=yellow> Bao l× xÝ<color> !") 
return
end
if (GetTask(70) == 0) then
if GetLevel() >=100 then
if (ntranscount == 0) then
if (ConsumeEquiproomItem(1, 6,1,2221, -1) == 1) then
Earn(2000000)
ST_LevelUp(nAddLevel)
local tbItem = { tbProp={6,1,1781,1,0,0}, nCount = 10,tbParam={60}, nBindState = -2}
tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
local tbItem = {szName="STG.", tbProp={6, 1, 400, 90, 0, 0},nCount =1, nBindState = -2}
tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
local tbItem = {szName="LB Kiem Gia.", tbProp={6, 1, 2623, 1, 0, 0},nCount =1, nBindState = -2}
tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
local tbItem = {szName="LB PLD.", tbProp={4, 489, 1, 1, 0, 0},nCount =1, nBindState = -2}
tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
local tbItem = {szName="VD lenh.", tbProp={6, 1, 1617, 1, 0, 0},nCount =1, nBindState = -2}
tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
local tbItem = {szName="Xu.", tbProp={4, 417, 1, 1, 0, 0},nCount =20, nBindState = -2}
tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
SetTask(70,1) -- Danh dau da hoan thanh nhiem vu
end
else
Say("<color=green>Ch­a trïng sinh míi nhËn ®­îc phÇn th­ëng nµy !") 
end
else
Say("<color=green>CÊp 100 trë lªn míi nhËn ®­îc phÇn th­ëng nµy.")  
end
else
Say("Vui lßng nhËn Hç trî t©n thñ vµ mçi nh©n vËt chØ nhËn 1 lÇn.") 
end
end
function trungs()
LoadScript("/script/task/metempsychosis/npc_saodiseng.lua")
end
function testt()
admin()
end
function nhanmienphi()
	if CalcFreeItemCellCount() < 10 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 10 « trèng råi h·y më.",0);
		return 1;
	end
if GetLevel() <= 180 then
local tbItem = { tbProp={6,1,1781,1,0,0}, nCount = 1,tbParam={60}, nBindState = -2}
tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
else
Say("<color=green>CÊp 150 trë xuèng míi nhËn ®­îc.")  
end
end
function nahndo()
local tbItem = {tbProp={4,417,1,1,0,0},nCount =50}
tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
end
function thuonghangngayyy()
	if GetLevel() < 100 then
		Talk(1,"","H·y luyÖn ®Õn cÊp 150 trë lªn råi nhËn!")
		return
	end
	local nDate = tonumber(GetLocalDate("%d"))
	if ( GetTask(T_DAY) ~= nDate ) then
		SetTask(T_DAY, nDate);
		SetTask(T_HUYENCHANDON_HNN,0)
	end
	
	local EMPTY	= 10
	if (CalcFreeItemCellCount() < EMPTY) then
		Msg2Player(""..XungHo().." h·y s¾p xÕp l¹i hµnh trang  "..EMPTY.." « trèng!")
		return
	end
	
	if GetTask(T_HUYENCHANDON_HNN) > 0 then
		Talk(1,"","Mçi ngµy chØ nhËn 1 lÇn.")
	else
		local TAB_BONUS = {
				{szName="TTL", tbProp={6,1,71}, nCount = 3, nBindState = -2},
			
				
		}
	
		for i = 1,getn(TAB_BONUS) do
			tbAwardTemplet:GiveAwardByList(TAB_BONUS[i], "PhÇn th­ëng");
		end
		SetTask(T_HUYENCHANDON_HNN,GetTask(T_HUYENCHANDON_HNN)+100)
	end
end

function sukien()
--if (CalcEquiproomItemCount(6, 1, 1678, -1) < 1) then
--Say("<color=green>Ng­¬i kh«ng cã 1 HuyÒn Ch©n §¬n !") 
--return
--end 
	if GetLevel() < 100 then
		Talk(1,"","H·y luyÖn ®Õn cÊp 100 trë lªn råi nhËn!")
		return
	end
	local nDate = tonumber(GetLocalDate("%d"))
	if ( GetTask(T_DAY) ~= nDate ) then
		SetTask(T_DAY, nDate);
		SetTask(T_HUYENCHANDON,0)
	end
	
	local EMPTY	= 10
	if (CalcFreeItemCellCount() < EMPTY) then
		Msg2Player(""..XungHo().." h·y s¾p xÕp l¹i hµnh trang  "..EMPTY.." « trèng!")
		return
	end
	
	if GetTask(T_HUYENCHANDON) > 0 then
		Talk(1,"","Mçi ngµy chØ nhËn 1 lÇn.")
	else
		local TAB_BONUS = {
				{szName="<color=yellow>500 triÖu kinh nghiÖm", nExp_tl = 50000},
				
		}
	
		for i = 1,getn(TAB_BONUS) do
			tbAwardTemplet:GiveAwardByList(TAB_BONUS[i], "PhÇn th­ëng");
		end
       --    if (ConsumeEquiproomItem(6, 1, 1678, 1, -1) == 1) then
		SetTask(T_HUYENCHANDON,GetTask(T_HUYENCHANDON)+100)
    --       end
	end
end

function kinhcong()
AddMagic(210,1)
end
function shoptienvan()
	local tbOpt =
	{
		{"Tói m¸u 15v.", muatuimauvan},
		{"S¸t thñ gi·n 100v.", satthugian},
		{"LÖnh bµi PLD 200v.", lenhbaipld},
		{"LÖnh bµi thñy tÆc 200v.", lenhbaitt},
		{"Viªm ®Õ lÖnh 200v.", viemdelenh},
		{"Ngäc long lÖnh bµi 200v.", ngoclonglenhbai},
		{"Long HuyÕt Hoµn 100v.", longhuyethoan},
		{"Tho¸t.", no},
	}
	CreateNewSayEx("<npc>", tbOpt)
end
function longhuyethoan()
if (GetCash() <= 1999999) then
Say("<color=green>Ng­¬i kh«ng ®ñ <color=yellow> 200 v¹n l­îng<color> !") 
return
end 
local tbItem = { tbProp={6,1,2117,0,0,0}, nCount = 1}
tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
Pay(1000000)
end
function ngoclonglenhbai()
if (GetCash() <= 1999999) then
Say("<color=green>Ng­¬i kh«ng ®ñ <color=yellow> 200 v¹n l­îng<color> !") 
return
end 
local tbItem = { tbProp={6,1,2623,0,0,0}, nCount = 1}
tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
Pay(2000000)
end
function viemdelenh()
if (GetCash() <= 1999999) then
Say("<color=green>Ng­¬i kh«ng ®ñ <color=yellow> 200 v¹n l­îng<color> !") 
return
end 
local tbItem = { tbProp={6,1,1617,0,0,0}, nCount = 1}
tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
Pay(2000000)
end
function lenhbaitt()
if (GetCash() <= 1999999) then
Say("<color=green>Ng­¬i kh«ng ®ñ <color=yellow> 200 v¹n l­îng<color> !") 
return
end 
local tbItem = { tbProp={6,1,2745,0,0,0}, nCount = 1}
tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
Pay(2000000)
end
function lenhbaipld()
if (GetCash() <= 1999999) then
Say("<color=green>Ng­¬i kh«ng ®ñ <color=yellow> 200 v¹n l­îng<color> !") 
return
end 
local tbItem = { tbProp={4,489,1,0,0,0}, nCount = 1}
tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
Pay(2000000)
end
function satthugian()
if (GetCash() <= 999999) then
Say("<color=green>Ng­¬i kh«ng ®ñ <color=yellow> 100 v¹n l­îng<color> !") 
return
end 
local tbItem = { tbProp={6,1,400,90,1,0}, nCount = 1}
tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
Pay(1000000)
end
function muatuimauvan()
if (GetCash() <= 149999) then
Say("<color=green>Ng­¬i kh«ng ®ñ <color=yellow> 15 v¹n l­îng<color> !") 
return
end 
local tbItem = { tbProp={6,1,1781,1,0,0}, nCount = 1,tbParam={60}}
tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
Pay(150000)
end
function muatuimau()
if (CalcEquiproomItemCount(4, 417, 1, -1) < 3) then
Say("<color=green>Ng­¬i kh«ng cã 3 Xu !") 
return
end 
if (ConsumeEquiproomItem(3, 4, 417, 1, -1) == 1) then
local tbItem = { tbProp={6,1,1781,1,0,0}, nCount = 1,tbParam={60}}
tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
end
end
function choii()
  AddGlobalNews(format("T¹i h¹ <color=red>%s<color> ®· nhËn <color=green>Xe Tiªu L­¬ng<color> ai muèn c­íp h·y b­íc qua x¸c cña ta,HaHaHaHa!<color>",GetName())); 
Msg2SubWorld(format("T¹i h¹ <color=yellow>%s<color> ®· nhËn <color=green>Xe Tiªu L­¬ng<color> ai muèn c­íp h·y b­íc qua x¸c cña ta,HaHaHaHa!<color>",GetName())); 
end
function hocmoikynang180()
	if CalcFreeItemCellCount() < 1 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 1 « trèng råi h·y më.",0);
		return 1;
	end
local ntranscount = ST_GetTransLifeCount();
if GetLevel() >= 150 then	
if (ntranscount >= 1) then
if (GetTask(49) == 0) then
Say("<color=red>Mua kü n¨ng 180: <enter><color=yellow>* Tèn 1.000 Xu sÏ häc ®­îc kü n¨ng ®¹t cÊp ®é 20 .<color>", 
2, 
" Mua kü n¨ng 180. /kynang180", 
" Th«i bá qua. /Quit") 
elseif (GetTask(49) == 1) then
Say("<color=red>Häc l¹i kü n¨ng 180: <enter><color=yellow>* Khi chuyÓn ph¸i sÏ mÊt kü n¨ng 180,nh©n vËt ®· mua kü n¨ng 180 råi sÏ ®­îc häc l¹i miÔn phÝ.<color>", 
2, 
" Häc l¹i kü n¨ng 180. /hoclaikynang180", 
" Th«i bá qua. /Quit") 
end
else
Say("<color=green>Trïng sinh 1 míi nhËn ®­îc phÇn th­ëng nµy !") 
end
else
Talk(1, "", "N©ng ®Õn 150 råi h·y ®Õn t×m ta")
end
end

function kynang180()
mp = GetFaction()
if (CalcEquiproomItemCount(4, 417, 1, -1) < 1000) then
Say("<color=green>Ng­¬i kh«ng cã 1.000 Xu !") 
return
end 
if GetLevel() >= 150 then	
if mp == "shaolin" then
if (ConsumeEquiproomItem(1000, 4, 417, 1, -1) == 1) then
SetTask(49,1)
AddMagic(1220,20) 
Talk(1,"","Chóc mõng b¹n ®· häc ®­îc tuyÖt kü 180 cña ThiÕu L©m ")
end
elseif mp == "tianwang" then
if (ConsumeEquiproomItem(1000, 4, 417, 1, -1) == 1) then
SetTask(49,1)
AddMagic(1221,20)
Talk(1,"","Chóc mõng b¹n ®· häc ®­îc tuyÖt kü 180 cña Thiªn V­¬ng ")
end
elseif mp == "tangmen" then
if (ConsumeEquiproomItem(1000, 4, 417, 1, -1) == 1) then
SetTask(49,1)
AddMagic(1223,20)
Talk(1,"","Chóc mõng b¹n ®· häc ®­îc tuyÖt kü 180 cña §­êng M«n ")
end
elseif mp == "wudu" then
if (ConsumeEquiproomItem(1000, 4, 417, 1, -1) == 1) then
SetTask(49,1)
AddMagic(1222,20)
Talk(1,"","Chóc mõng b¹n ®· häc ®­îc tuyÖt kü 180 cña Ngò §éc ")
end
elseif mp == "emei" then
if (ConsumeEquiproomItem(1000, 4, 417, 1, -1) == 1) then
SetTask(49,1)
AddMagic(1224,20)
Talk(1,"","Chóc mõng b¹n ®· häc ®­îc tuyÖt kü 180 cña Nga My ")
end
elseif mp == "cuiyan" then
if (ConsumeEquiproomItem(1000, 4, 417, 1, -1) == 1) then
SetTask(49,1)
AddMagic(1225,20)
Talk(1,"","Chóc mõng b¹n ®· häc ®­îc tuyÖt kü 180 cña Thóy Yªn ")
end
elseif mp == "gaibang" then
if (ConsumeEquiproomItem(1000, 4, 417, 1, -1) == 1) then
SetTask(49,1)
AddMagic(1227,20)
Talk(1,"","Chóc mõng b¹n ®· häc ®­îc tuyÖt kü 180 cña C¸i Bang ")
end
elseif mp == "tianren" then
if (ConsumeEquiproomItem(1000, 4, 417, 1, -1) == 1) then
SetTask(49,1)
AddMagic(1226,20)
Talk(1,"","Chóc mõng b¹n ®· häc ®­îc tuyÖt kü 150 cña Thiªn NhÉn ")
end
elseif mp == "wudang" then
if (ConsumeEquiproomItem(1000, 4, 417, 1, -1) == 1) then
SetTask(49,1)
AddMagic(1228,20)
Talk(1,"","Chóc mõng b¹n ®· häc ®­îc tuyÖt kü 180 cña Vâ §ang ")
end
elseif mp == "kunlun" then
if (ConsumeEquiproomItem(1000, 4, 417, 1, -1) == 1) then
SetTask(49,1)
AddMagic(1229,20)
Talk(1,"","Chóc mõng b¹n ®· häc ®­îc tuyÖt kü 180 cña C«n L«n ")
end
else
Talk(1, "", "Nhµ ng­¬i ch­a gia nhËp ph¸i hay sao vËy!")
end
else
Talk(1, "", "N©ng ®Õn 150 råi h·y ®Õn t×m ta")
end
end
function hoclaikynang180()
mp = GetFaction()
if GetLevel() >= 150 then	
if mp == "shaolin" then
AddMagic(1220,20) 
SetTask(49,1)
Talk(1,"","Chóc mõng b¹n ®· häc ®­îc tuyÖt kü 180 cña ThiÕu L©m ")
elseif mp == "tianwang" then
AddMagic(1221,20)
SetTask(49,1)
Talk(1,"","Chóc mõng b¹n ®· häc ®­îc tuyÖt kü 180 cña Thiªn V­¬ng ")
elseif mp == "tangmen" then
AddMagic(1223,20)
SetTask(49,1)
Talk(1,"","Chóc mõng b¹n ®· häc ®­îc tuyÖt kü 180 cña §­êng M«n ")
elseif mp == "wudu" then
AddMagic(1222,20)
SetTask(49,1)
Talk(1,"","Chóc mõng b¹n ®· häc ®­îc tuyÖt kü 180 cña Ngò §éc ")
elseif mp == "emei" then
AddMagic(1224,20)
SetTask(49,1)
Talk(1,"","Chóc mõng b¹n ®· häc ®­îc tuyÖt kü 180 cña Nga My ")
elseif mp == "cuiyan" then
AddMagic(1225,20)
SetTask(49,1)
Talk(1,"","Chóc mõng b¹n ®· häc ®­îc tuyÖt kü 180 cña Thóy Yªn ")
elseif mp == "gaibang" then
AddMagic(1227,20)
SetTask(49,1)
Talk(1,"","Chóc mõng b¹n ®· häc ®­îc tuyÖt kü 180 cña C¸i Bang ")
elseif mp == "tianren" then
AddMagic(1226,20)
SetTask(49,1)
Talk(1,"","Chóc mõng b¹n ®· häc ®­îc tuyÖt kü 150 cña Thiªn NhÉn ")
elseif mp == "wudang" then
AddMagic(1228,20)
SetTask(49,1)
Talk(1,"","Chóc mõng b¹n ®· häc ®­îc tuyÖt kü 180 cña Vâ §ang ")
elseif mp == "kunlun" then
AddMagic(1229,20)
SetTask(49,1)
Talk(1,"","Chóc mõng b¹n ®· häc ®­îc tuyÖt kü 180 cña C«n L«n ")
else
Talk(1, "", "Nhµ ng­¬i ch­a gia nhËp ph¸i hay sao vËy!")
end
else
Talk(1, "", "N©ng ®Õn 150 råi h·y ®Õn t×m ta")
end
end
function knbravan()
	local nMaxCount = CalcFreeItemCellCount()
	g_AskClientNumberEx(0,100, "NhËp sè KNB!", {knbravang, {num}})
end
function knbravang(num)
if (CalcEquiproomItemCount(4,343, 1, -1) < 1*num) then
Say("<color=green>Ng­¬i kh«ng cã <color=red>"..(num*1).." <color=yellow> KNB<color> !") 
return
end 
if (ConsumeEquiproomItem(1*num, 4, 343, 1, -1) == 1) then
Earn(30000000*num)
end
end
function hay()
AddProp(-65486)
end
function chetaolenhbai()
	local tbOpt =
	{
		{"B¹ch Hæ LÖnh.", bachholenh},
	--	{"Tói quµ - cao cÊp.", tuiquacao},
		{"Tho¸t.", no},
	}
	CreateNewSayEx("<npc>C«ng thøc:<enter>B¹ch Hæ LÖnh= 1 Kim ¤ LÖnh + 100Xu + 3 ThÇn BÝ Kho¸ng Th¹ch + 5.000 v¹n.", tbOpt)
end
function bachholenh()
if (GetCash() <= 49999999) then
Say("<color=green>Ng­¬i kh«ng ®ñ <color=yellow> 5.000 v¹n l­îng<color> !") 
return
end 
if (CalcEquiproomItemCount(6,1, 2349, -1) < 1) then
Say("<color=green>Ng­¬i kh«ng cã <color=red>1 <color=yellow> Kim ¤ LÖnh<color> !") 
return
end 
if (CalcEquiproomItemCount(6,1, 398, -1) < 3) then
Say("<color=green>Ng­¬i kh«ng cã <color=red>3 <color=yellow> ThÇn BÝ Kho¸ng Th¹ch<color> !") 
return
end
if (CalcEquiproomItemCount(4,417, 1, -1) < 100) then
Say("<color=green>Ng­¬i kh«ng cã <color=red>100 <color=yellow> Xu<color> !") 
return
end
if (ConsumeEquiproomItem(1, 6, 1, 2349, -1) == 1) then
if (ConsumeEquiproomItem(3, 6, 1, 398, -1) == 1) then
if (ConsumeEquiproomItem(100, 4, 417, 1, -1) == 1) then
local tbItem = {tbProp={6,1,2357,0,5,0,0},nCount = 1}
tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
Pay(50000000)
end
end
end
end
function nhanlaidm150()
	if GetLevel() < 150 then
		Talk(1,"","H·y luyÖn ®Õn cÊp 150 trë lªn råi nhËn!")
		return
	end
player_Faction = GetFaction()
if (player_Faction == "tangmen") then
Say("ChØ ph¸i §­êng M«n nhËn l¹i kü n¨ng 150 th«i!",2,"Ta nhËn./tannhanngay150","Tho¸t./no")
end
end
function tannhanngay150()
AddMagic(1069,20)
AddMagic(1070,20)
AddMagic(1071,20)
Say("NhËn kü n¨ng 150 thµnh c«ng!") 
end
function danglonghskiem()
for p = 4813,4822 do
	AddGoldItem(0,p)
end
end
function danglonghskhi()
for p = 4823,4832 do
	AddGoldItem(0,p)
end
end
function tdn()
local tbItem = { tbProp={4,417,1,1,0,0}, nCount = 500}
tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
end
function knb()
local tbItem = { tbProp={4,343,1,1,0,0}, nCount = 1}
tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
end
function thucuoi()
if CalcFreeItemCellCount() < 60 then
Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 60 « trèng råi h·y më.",0);
return 1;
end
AddGoldItem(0,5213)
AddGoldItem(0,5214)
AddGoldItem(0,5093)
AddGoldItem(0,5094)
AddGoldItem(0,5095)
AddGoldItem(0,5096)
AddGoldItem(0,4480)
AddGoldItem(0,4366)
end
function nvk()
local tbItem = { tbProp={6,1,2340,1,0,0}, nCount = 1, nBindState = -2}
tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
end
function pp()
AddGoldItem(0,3479)
AddGoldItem(0,3480)
AddGoldItem(0,3481)
end
function bacdautienvan()
Earn(100000000)
local tbItem = { tbProp={6,1,1390,1,0,0}, nCount = 1, nBindState = -2}
tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
end
function nhancap()
local nCurLevel = GetLevel()
local nAddLevel = 200 - nCurLevel
ST_LevelUp(nAddLevel)
end
function hanhhiepky()
	local tbOpt =
	{
		{"Tói quµ - s¬ cÊp.", tuiquaso},
		{"Tói quµ - cao cÊp.", tuiquacao},
		{"Tho¸t.", no},
	}
	CreateNewSayEx("<npc>§æi tói quµ.", tbOpt)
end
function tuiquacao()
	local nMaxCount = CalcFreeItemCellCount()
	g_AskClientNumberEx(0,100, "NhËp sè l­îng!", {tuiquacaog, {num}})
end
function tuiquacaog(num)
if CalcFreeItemCellCount() < 10 then
Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 10 « trèng råi h·y më.",0);
return 1;
end
if (GetCash() <= 49999*num) then
Say("<color=green>Ng­¬i kh«ng ®ñ <color=yellow> "..(num*5).." v¹n l­îng<color> !") 
return
end 
if (CalcEquiproomItemCount(6, 1, 2433, -1) < 1*num) then
Say("<color=green>Ng­¬i kh«ng cã <color=red>"..(num*1).." <color=yellow> Hµnh HiÖp Kú [1]<color> !") 
return
end 
if (CalcEquiproomItemCount(6, 1, 2434, -1) < 1*num) then
Say("<color=green>Ng­¬i kh«ng cã <color=red>"..(num*1).." <color=yellow> Hµnh HiÖp Kú [2]<color> !") 
return
end 
if (CalcEquiproomItemCount(6, 1, 2435, -1) < 1*num) then
Say("<color=green>Ng­¬i kh«ng cã <color=red>"..(num*1).." <color=yellow> Hµnh HiÖp Kú [3]<color> !") 
return
end 
if (CalcEquiproomItemCount(6, 1, 2436, -1) < 1*num) then
Say("<color=green>Ng­¬i kh«ng cã <color=red>"..(num*1).." <color=yellow> Hµnh HiÖp Kú [4]<color> !") 
return
end 
if (CalcEquiproomItemCount(6, 1, 2437, -1) < 1*num) then
Say("<color=green>Ng­¬i kh«ng cã <color=red>"..(num*1).." <color=yellow> Hµnh HiÖp Kú [5]<color> !") 
return
end 
if (ConsumeEquiproomItem(1*num, 6,1, 2433, -1) == 1) then
if (ConsumeEquiproomItem(1*num, 6,1, 2434, -1) == 1) then
if (ConsumeEquiproomItem(1*num, 6,1, 2435, -1) == 1) then
if (ConsumeEquiproomItem(1*num, 6,1, 2436, -1) == 1) then
if (ConsumeEquiproomItem(1*num, 6,1, 2437, -1) == 1) then
local tbItem = {tbProp={6,1,4274,0,5,0,0},nCount = 1*num}
tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
Pay(50000*num)
end
end
end
end
end
end
function tuiquaso()
	local nMaxCount = CalcFreeItemCellCount()
	g_AskClientNumberEx(0,100, "NhËp sè l­îng!", {tuiquasog, {num}})
end
function tuiquasog(num)
if CalcFreeItemCellCount() < 10 then
Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 10 « trèng råi h·y më.",0);
return 1;
end
if (GetCash() <= 4999*num) then
Say("<color=green>Ng­¬i kh«ng ®ñ <color=yellow> "..(num*0.5).." v¹n l­îng<color> !") 
return
end 
if (CalcEquiproomItemCount(6, 1, 2433, -1) < 1*num) then
Say("<color=green>Ng­¬i kh«ng cã <color=red>"..(num*1).." <color=yellow> Hµnh HiÖp Kú [1]<color> !") 
return
end 
if (CalcEquiproomItemCount(6, 1, 2434, -1) < 1*num) then
Say("<color=green>Ng­¬i kh«ng cã <color=red>"..(num*1).." <color=yellow> Hµnh HiÖp Kú [2]<color> !") 
return
end 
if (CalcEquiproomItemCount(6, 1, 2435, -1) < 1*num) then
Say("<color=green>Ng­¬i kh«ng cã <color=red>"..(num*1).." <color=yellow> Hµnh HiÖp Kú [3]<color> !") 
return
end 
if (CalcEquiproomItemCount(6, 1, 2436, -1) < 1*num) then
Say("<color=green>Ng­¬i kh«ng cã <color=red>"..(num*1).." <color=yellow> Hµnh HiÖp Kú [4]<color> !") 
return
end 
if (ConsumeEquiproomItem(1*num, 6,1, 2433, -1) == 1) then
if (ConsumeEquiproomItem(1*num, 6,1, 2434, -1) == 1) then
if (ConsumeEquiproomItem(1*num, 6,1, 2435, -1) == 1) then
if (ConsumeEquiproomItem(1*num, 6,1, 2436, -1) == 1) then
local tbItem = {tbProp={6,1,4273,0,5,0,0},nCount = 1*num}
tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
Pay(5000*num)
end
end
end
end
end

function trangbihk()
dohoangkim()
end






function thuonghangngay()
	if GetLevel() < 100 then
		Talk(1,"","H·y luyÖn ®Õn cÊp 150 trë lªn råi nhËn!")
		return
	end
	local nDate = tonumber(GetLocalDate("%d"))
	if ( GetTask(T_DAY) ~= nDate ) then
		SetTask(T_DAY, nDate);
		SetTask(T_NHANTHUONG_HNN,0)
	end
	
	local EMPTY	= 10
	if (CalcFreeItemCellCount() < EMPTY) then
		Msg2Player(""..XungHo().." h·y s¾p xÕp l¹i hµnh trang  "..EMPTY.." « trèng!")
		return
	end
	
	if GetTask(T_NHANTHUONG_HNN) > 0 then
		Talk(1,"","Mçi ngµy chØ nhËn 1 lÇn.")
	else
		local TAB_BONUS = {
				{szName="TTL", tbProp={6,1,71}, nCount = 3, nBindState = -2},
				{szName="Tui mau", tbProp={6,1,1781}, nCount = 3,tbParam={60}, nBindState = -2},
				
		}
	
		for i = 1,getn(TAB_BONUS) do
			tbAwardTemplet:GiveAwardByList(TAB_BONUS[i], "PhÇn th­ëng");
		end
		SetTask(T_NHANTHUONG_HNN,GetTask(T_NHANTHUONG_HNN)+100)
	end
end








function system()

    local nNam = tonumber(GetLocalDate("%Y"));
    local nThang = tonumber(GetLocalDate("%m"));
    local nNgay = tonumber(GetLocalDate("%d"));
    local nGio = tonumber(GetLocalDate("%H"));
    local nPhut = tonumber(GetLocalDate("%M"));
    local nGiay = tonumber(GetLocalDate("%S"));
    local nW, nX, nY = GetWorldPos()
    local nIdPlay = PlayerIndex
    local szTitlet = format("<npc>Xin Chµo <color=red>"..GetName().."<color>!\nTäa ®é hiÖn t¹i: <color=green>"..nW.."<color> <color=blue>"..nX.."/"..nY.."<color>  \n<color>Index:           <color=green>"..nIdPlay.."<color>\nSè SHXT: <color=green>        "..GetTask(T_SonHaXaTac).."<color> m¶nh.\nHiÖn §ang Cã:    <bclr=red><color=yellow>["..GetPlayerCount().."]<color><bclr> ng­êi ch¬i trong game.\n<color>H«m Nay: <color=metal>        N¨m "..nNam.." Th¸ng "..nThang.." Ngµy "..nNgay.." <color>. \nLóc:            <color=pink> "..nGio.." Giê "..nPhut.." Phót "..nGiay.." Gi©y.<color>")
    local tbOpt =
        {
            {" Th«ng tin ng­êi ch¬i", Show},
            {" Thao t¸c lªn ng­êi ch¬i", luachonid1},
            {"kh«ng cÇn n÷a"}
        }
        CreateNewSayEx(szTitlet, tbOpt);
end

function Show()
AskClientForNumber("Show1",1,1180,"NhËp sè tiÒn cÇn chuyÓn")
end


function Show1(num)
local nNum = num + 20
for i=num,nNum do
    gmidx=PlayerIndex
    PlayerIndex=i
    TarName=GetName()
    PlayerIndex=gmidx
    Msg2Player("PlayIndex:<color=green> "..i.."<color> - Tªn:<color=green> "..TarName.."");
end
end;


function luachonid1()
AskClientForNumber("one",0,5000,"NhËp ID ng­êi ch¬i")
end

function one(num)
if ((num)==GetPlayerCount()) then
Msg2Player("Kh«ng cã nh©n vËt víi ID: <color=green>"..num.."<color> ®­îc chän !!");
else
SetTaskTemp(200,num)
    gmName=GetName()
    gmidx=PlayerIndex
    PlayerIndex=GetTaskTemp(200)
    tk=GetAccount()
    lev=GetLevel()
    xp=GetExp()
    cam=GetCamp()
    fac=GetFaction()
    cash=GetCash()
    lif=GetExtPoint(1)
    man=GetMana()
    apo=GetEnergy()
    spo=GetRestSP()
    cr=GetColdR()
    pr=GetTask(747)
    phr=GetPhyR()
    fr=GetFireR()
    lr=GetLightR()
    eng=GetEng()
    dex=GetDex()
    strg=GetStrg()
    vit=GetVit()
    w,x,y=GetWorldPos()
    xinxi = GetInfo()
    ObjName=GetName()
    PlayerIndex=gmidx
    Msg2Player("Nh©n vËt tªn:<color=metal> "..ObjName.."<color>");
    local szTitle1 ="Tµi Kho¶n:<color=green> "..tk.."<color>  - Nh©n VËt   :<color=green> "..ObjName.."<color>\nCÊp ®é   :<color=green> "..lev.."<color>           - Kinh nghiÖm: <color=green>"..xp.."%<color>\nMµu      :<color=green> "..cam.."<color>             - M«n ph¸i   :<color=green>"..fac.."<color>\nTiÒn MÆt :<color=green> "..(cash/10000).." v¹n<color> - TiÒn §ång  :<color=green>"..lif.." ®ång<color>\nVÞ trÝ   : <color=blue>"..w.."<color>,<color=green>"..x.."<color>,<color=green>"..y.."<color>"
    local tbOpt = 
        {
            --{" T¨ng cÊp ®é cho ng­êi ch¬i", tangcap1},
            {" Hç trî tiÒn ®ång", bufskillsgm1},
            {" Test", test},
            {" Di chuyÓn nh©n vËt vÒ 3l", move},
            {" CÊm ch¸t ®èi víi nh©n vËt", camchat},
            {" Më ch¸t cho nh©n vËt", mochat},
            --{" Add ®iÓm cho ng­êi ch¬i", buffpoint},
            {" KÝch nh©n vËt", kick},
            --{" Vip 1", vip1},
            --{" Vip 2", vip2},
            --{" Vip 3", vip3},
            --{" Vip 4", vip4},
            {" Vip 5", vip5},
            --{" Vip 6", vip6},
            --{" Vip 7", vip7},
            {" Vip 8", vip8},
            {" Vip 9", vip9},
            {" vs", vip11},
            {" Kich Vip", kichvip},
            {"kh«ng cÇn n÷a"}
        }
        CreateNewSayEx(szTitle1, tbOpt);
    Msg2Player("Ng­êi ch¬i <color=cyan>"..xinxi)
end
end;
function kichvip()
gmidx=PlayerIndex
PlayerIndex=GetTaskTemp(200)
--local tbItem = {tbProp={4,417,1,1,0,0},nCount = 1000}
--tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
--ST_LevelUp(3)
--local tbItem = {tbProp={6,1,30180,1,0,0},tbParam={11,0,0,0,0,0},nCount =1}
--tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
--Earn(1000000000)
--local tbItem = {tbProp={6,1,30242,1,0,0},tbParam={11,0,0,0,0,0},nCount =1, nBindState = -2}
--tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
--local tbItem = {tbProp={0,3477},nQuality=1, nBindState = -2}
--tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
--local tbItem = {tbProp={0,3889},nQuality=1,nExpiredTime = 43200, nBindState = -2}
--tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
--ST_LevelUp(200)
--local tbItem = {tbProp={6,1,1390,1,0,0},nCount =1, nBindState = -2}
--tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
--local tbItem = {tbProp={0,4366},nQuality=1,nExpiredTime = 43200, nBindState = -2}
--tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
--local tbItem = {tbProp={0,3486},nQuality=1,nExpiredTime = 43200, nBindState = -2}
--tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
end;
function test()
gmidx=PlayerIndex
PlayerIndex=GetTaskTemp(200)
local tbItem = {tbProp={4,417,1,1,0,0},nCount = 5000}
tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
--ST_LevelUp(3)
--local tbItem = {tbProp={6,1,30180,1,0,0},tbParam={11,0,0,0,0,0},nCount =1}
--tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
--Earn(220000000)
--local tbItem = {tbProp={6,1,30242,1,0,0},tbParam={11,0,0,0,0,0},nCount =1, nBindState = -2}
--tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
--local tbItem = {tbProp={0,3477},nQuality=1, nBindState = -2}
--tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
--local tbItem = {tbProp={0,3889},nQuality=1,nExpiredTime = 43200, nBindState = -2}
--tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
--ST_LevelUp(200)
--local tbItem = {tbProp={6,1,1390,1,0,0},nCount =1, nBindState = -2}
--tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
end;
function themtienvan1()
AskClientForNumber("themtienvan",0,2000000000,"NhËp sè tiÒn cÇn chuyÓn")
end
function themtienvan(num)
nNum = num/10000
gmidx=PlayerIndex
PlayerIndex=GetTaskTemp(200)
Msg2Player("Qu¶n lý <color=green>"..gmName.."<color> ®· thªm <color=metal>"..nNum.."<color> v¹n l­îng cho b¹n !");
Earn(num)
PlayerIndex=gmidx
Msg2Player("Nh©n vËt <color=green>"..ObjName.."<color> ®­îc b¹n thªm <color=metal>"..nNum.."<color> v¹n l­îng thµnh c«ng");
end;

function bufskillsgm1()
AskClientForNumber("buffskillsgm",0,1000,"sè l­îng tiÒn ®ång")
end
function buffskillsgm(num)
gmidx=PlayerIndex
PlayerIndex=GetTaskTemp(200)
Msg2Player("Qu¶n lý <color=green>"..gmName.."<color> ®· chuyÓn <color=metal>"..num.."<color> tiÒn ®ång cho b¹n !");
AddStackItem(num,4,417,1,1,0,0,0)
PlayerIndex=gmidx
Msg2Player("Nh©n vËt <color=green>"..ObjName.."<color> ®­îc b¹n t¨ng <color=metal>"..num.."<color> tiÒn ®ång thµnh c«ng");
end;

function buffpoint()
gmidx=PlayerIndex
PlayerIndex=GetTaskTemp(200)
Msg2Player("Qu¶n lý <color=green>"..gmName.."<color> ®· t¨ng ®iÓm theo yªu cÇu!");

PlayerIndex=gmidx
Msg2Player("Nh©n vËt <color=green>"..ObjName.."<color> ®­îc b¹n t¨ng ®iÓm theo yªu cÇu thµnh c«ng");
end;

function tangcap1()
AskClientForNumber("tangcap",0,50,"cÊp cÇn t¨ng")
end
function tangcap(num)
gmidx=PlayerIndex
PlayerIndex=GetTaskTemp(200)
Msg2Player("Qu¶n lý <color=green>"..gmName.."<color> ®· t¨ng <color=metal>"..num.."<color> cÊp ®é cho b¹n !");
for i=1,num  do
AddOwnExp(999999999999)
end
PlayerIndex=gmidx
Msg2Player("Nh©n vËt <color=green>"..ObjName.."<color> ®­îc b¹n t¨ng <color=metal>"..num.."<color> cÊp ®é thµnh c«ng");
end;

function move()
gmidx=PlayerIndex
PlayerIndex=GetTaskTemp(200)
w,x,y=GetWorldPos()
if (w~=53) then
SetFightState(0)
NewWorld(53,200*8,200*16)
else
SetPos(1630, 3255)
end
Msg2Player("Qu¶n lý <color=green>"..gmName.."<color> ®· di chuyÓn b¹n vÒ Ba L¨ng HuyÖn");
PlayerIndex=gmidx
Msg2Player("Nh©n vËt <color=green>"..ObjName.."<color> ®­îc b¹n di chuyÓn vÒ Ba LÆng HuyÖn thµnh c«ng");
end

function kick()
gmidx=PlayerIndex
PlayerIndex=GetTaskTemp(200)
Msg2Player("Qu¶n lý <color=green>"..gmName.."<color> ®· kick kÑt tµi kho¶n cho b¹n");
KickOutSelf()
PlayerIndex=gmidx
Msg2Player("Nh©n vËt <color=green>"..ObjName.."<color> ®­îc b¹n kick kÑt tµi kho¶n thµnh c«ng");
end;

function camchat()
gmidx=PlayerIndex
PlayerIndex=GetTaskTemp(200)
SetChatFlag(1)
Msg2Player("B¹n bÞ khãa Ch¸t trªn mäi tÇn sè !")
PlayerIndex=gmidx
AddGlobalCountNews("Nh©n VËt:<color=red> "..ObjName.."<color> §· BÞ CÊm Chat Trªn Mäi TÇn Sè !",1)
end

function mochat()
gmidx=PlayerIndex
PlayerIndex=GetTaskTemp(200)
SetChatFlag(0)
Msg2Player("B¹n ®­îc më khãa Ch¸t trªn mäi tÇn sè !")
PlayerIndex=gmidx
AddGlobalCountNews("Nh©n VËt:<color=green> "..ObjName.."<color> §­îc Më Chat Trªn Mäi TÇn Sè !",1)
end  










