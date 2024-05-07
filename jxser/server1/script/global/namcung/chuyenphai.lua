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
		"<color=yellow>chuy�n ph�i v� ��i t�n nh�n v�t t�i ��y<color>.",
		"<color=yellow>Chuy�n gi�i t�nh v�i gi� 2 KNB<color>.",

	}
       local nNpcIndex = GetLastDiagNpc();
       local ran = random(1,getn(tab_Chat))
	-- NpcChat(nNpcIndex,tab_Chat[ran])

	local szTitle = "<npc>"
	local tbOpt =
	{
{"Chuy�n ph�i.", chuyenphai},
{"Giao n�p t�n v�t m�n ph�i.", toushiApplyMenPaiXinWu},
		-- {"Chuy�n gi�i t�nh (200xu).", chuyengioi},	
		-- {"��i t�n nh�n v�t (200xu).", khuvucdoiten},		
		{"K�t th�c ��i tho�i"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function khuvucdoiten1()
	local szTitle = "<npc>C�n 2 KNB �� v�o khu v�c ��c bi�t �� thay ��i t�n nh�n v�t<enter>Tr��c khi ch�a ��i ���c t�n theo � mu�n ko ���c t�y ti�n ra kh�i khu v�c ng��i �� r� ch�a !"
	local tbOpt =
	{
			{"0k", khuvucdoiten},		
		{"K�t th�c ��i tho�i"},
	}

	CreateNewSayEx(szTitle, tbOpt)
end
function khuvucdoiten()
if (CalcEquiproomItemCount(4, 417, 1, -1) < 200) then
Say("C�n 200 xu �� ��i t�n nh�n v�t") 
return
end 
if (ConsumeEquiproomItem(200, 4, 417, 1, -1) == 1) then
NewWorld(521,1600,3279) 
end
end
function chuyengioi()
if (CalcEquiproomItemCount(4, 417, 1, -1) < 200) then
Say("C�n 200 xu �� chuy�n gi�i t�nh !") 
return
end 
player_Faction = GetFaction()
if GetSeries() == 0 then
Talk(1,"","H� Kim kh�ng ���c chuy�n gi�i nha!")
elseif GetSeries() == 2 then
Talk(1,"","H� Th�y kh�ng ���c chuy�n gi�i nha!")
elseif (player_Faction == "shaolin") then
Talk(1,"","Thi�u L�m Ph�i kh�ng ���c chuy�n gi�i nha!")
elseif (player_Faction == "emei") then
Talk(1,"","Nga My Ph�i kh�ng ���c chuy�n gi�i nha!")
elseif GetSex() == 0 then		-- ����
Say("Ta ��i sang n�!",2,"Chuy�n qua n� d�m ta./cgnu","Tho�t./no")
elseif GetSex() == 1 then		-- ����
Say("Ta ��i sang nam!",2,"Chuy�n qua nam d�m ta./cgnam","Tho�t./no")
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
		Talk(1,"","H�y luy�n ��n c�p 120 tr� l�n r�i nh�n!")
		return
	end


	local szTitle = "<npc>Hoan ngh�nh ng��i ��n th�m ta!"
	local tbOpt =
	{
			{"Thi�n V��ng.", chuyentv},
		{"Thi�u L�m.", chuyentl},	
		{"Ng� ��c.", chuyennd},
		{"���ng m�n.", chuyendm},
		{"Nga mi.", chuyennm},
		{"Th�y y�n.", chuyenty},
		{"C�i bang.", chuyencb},
		{"Thi�n nh�n.", chuyentn},
	      {"V� �ang.", chuyenvd},
	      {"C�n l�n.", chuyencl},		
		{"K�t th�c ��i tho�i"},
	}

	CreateNewSayEx(szTitle, tbOpt)
end

function chuyenphai()
	if GetLevel() < 120 then
		Talk(1,"","H�y luy�n ��n c�p 120 tr� l�n r�i nh�n!")
		return
	end
local tbSay = {}
tinsert(tbSay,"Chuy�n Ph�i Thi�u L�m./#daiyitoushi_main(0)")
tinsert(tbSay,"Chuy�n Ph�i Thi�n V��ng./#daiyitoushi_main(1)")
tinsert(tbSay,"Chuy�n Ph�i ���ng M�n./#daiyitoushi_main(2)")
tinsert(tbSay,"Chuy�n Ph�i Ng� ��c./#daiyitoushi_main(3)")
tinsert(tbSay,"Chuy�n Ph�i Nga My./#daiyitoushi_main(4)")
tinsert(tbSay,"Chuy�n Ph�i Th�y Y�n./#daiyitoushi_main(5)")
tinsert(tbSay,"Chuy�n Ph�i C�i Bang./#daiyitoushi_main(6)")
tinsert(tbSay,"Chuy�n Ph�i Thi�n Nh�n./#daiyitoushi_main(7)")
tinsert(tbSay,"Chuy�n Ph�i V� �ang./#daiyitoushi_main(8)")
tinsert(tbSay,"Chuy�n Ph�i C�n L�n./#daiyitoushi_main(9)")
--tinsert(tbSay,"Chuy�n Ph�i Hoa S�n./#daiyitoushi_main(10)")
tinsert(tbSay,"G�p l�i mu�i sau/Quit")
Say("Hoan ngh�nh ng��i ��n th�m ta!.", getn(tbSay), tbSay)

end

function query_rolename() 
AskClientForString("on_query_rolename", "", 1, 16, "<#> �t nh�t l� 7 k� t� "); 
end 

function on_query_rolename(new_name) 
QueryRoleName(new_name); 
end 
function doiten()
if (CalcEquiproomItemCount(4, 417, 1, -1) < 500) then
Say("<color=green>Ng��i kh�ng c� <color=red>500 <color=yellow> Xu<color> !") 
return
end 
	AskClientForString("doitennv", "", 1, 100, "Xin nh�p t�n mu�n ��i");
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
		Say("H�y c�t b�t v�t ph�m �� ��m b�o c� 20 � tr�ng r�i h�y m�.",0);
		return 1;
	end
if (CalcEquiproomItemCount(6, 1, 2221, -1) < 1) then
Say("<color=green>Ng��i kh�ng c� <color=red> 1 <color=yellow> Bao l� x�<color> !") 
return
end
if (GetTask(70) == 0) then
if GetLevel() >=100 then
if (ntranscount == 0) then
if (ConsumeEquiproomItem(1, 6,1,2221, -1) == 1) then
Earn(2000000)
ST_LevelUp(nAddLevel)
local tbItem = { tbProp={6,1,1781,1,0,0}, nCount = 10,tbParam={60}, nBindState = -2}
tbAwardTemplet:GiveAwardByList(tbItem, "Ph�n th��ng t�n th�");
local tbItem = {szName="STG.", tbProp={6, 1, 400, 90, 0, 0},nCount =1, nBindState = -2}
tbAwardTemplet:GiveAwardByList(tbItem, "Ph�n th��ng t�n th�");
local tbItem = {szName="LB Kiem Gia.", tbProp={6, 1, 2623, 1, 0, 0},nCount =1, nBindState = -2}
tbAwardTemplet:GiveAwardByList(tbItem, "Ph�n th��ng t�n th�");
local tbItem = {szName="LB PLD.", tbProp={4, 489, 1, 1, 0, 0},nCount =1, nBindState = -2}
tbAwardTemplet:GiveAwardByList(tbItem, "Ph�n th��ng t�n th�");
local tbItem = {szName="VD lenh.", tbProp={6, 1, 1617, 1, 0, 0},nCount =1, nBindState = -2}
tbAwardTemplet:GiveAwardByList(tbItem, "Ph�n th��ng t�n th�");
local tbItem = {szName="Xu.", tbProp={4, 417, 1, 1, 0, 0},nCount =20, nBindState = -2}
tbAwardTemplet:GiveAwardByList(tbItem, "Ph�n th��ng t�n th�");
SetTask(70,1) -- Danh dau da hoan thanh nhiem vu
end
else
Say("<color=green>Ch�a tr�ng sinh m�i nh�n ���c ph�n th��ng n�y !") 
end
else
Say("<color=green>C�p 100 tr� l�n m�i nh�n ���c ph�n th��ng n�y.")  
end
else
Say("Vui l�ng nh�n H� tr� t�n th� v� m�i nh�n v�t ch� nh�n 1 l�n.") 
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
		Say("H�y c�t b�t v�t ph�m �� ��m b�o c� 10 � tr�ng r�i h�y m�.",0);
		return 1;
	end
if GetLevel() <= 180 then
local tbItem = { tbProp={6,1,1781,1,0,0}, nCount = 1,tbParam={60}, nBindState = -2}
tbAwardTemplet:GiveAwardByList(tbItem, "Ph�n th��ng t�n th�");
else
Say("<color=green>C�p 150 tr� xu�ng m�i nh�n ���c.")  
end
end
function nahndo()
local tbItem = {tbProp={4,417,1,1,0,0},nCount =50}
tbAwardTemplet:GiveAwardByList(tbItem, "Ph�n th��ng t�n th�");
end
function thuonghangngayyy()
	if GetLevel() < 100 then
		Talk(1,"","H�y luy�n ��n c�p 150 tr� l�n r�i nh�n!")
		return
	end
	local nDate = tonumber(GetLocalDate("%d"))
	if ( GetTask(T_DAY) ~= nDate ) then
		SetTask(T_DAY, nDate);
		SetTask(T_HUYENCHANDON_HNN,0)
	end
	
	local EMPTY	= 10
	if (CalcFreeItemCellCount() < EMPTY) then
		Msg2Player(""..XungHo().." h�y s�p x�p l�i h�nh trang  "..EMPTY.." � tr�ng!")
		return
	end
	
	if GetTask(T_HUYENCHANDON_HNN) > 0 then
		Talk(1,"","M�i ng�y ch� nh�n 1 l�n.")
	else
		local TAB_BONUS = {
				{szName="TTL", tbProp={6,1,71}, nCount = 3, nBindState = -2},
			
				
		}
	
		for i = 1,getn(TAB_BONUS) do
			tbAwardTemplet:GiveAwardByList(TAB_BONUS[i], "Ph�n th��ng");
		end
		SetTask(T_HUYENCHANDON_HNN,GetTask(T_HUYENCHANDON_HNN)+100)
	end
end

function sukien()
--if (CalcEquiproomItemCount(6, 1, 1678, -1) < 1) then
--Say("<color=green>Ng��i kh�ng c� 1 Huy�n Ch�n ��n !") 
--return
--end 
	if GetLevel() < 100 then
		Talk(1,"","H�y luy�n ��n c�p 100 tr� l�n r�i nh�n!")
		return
	end
	local nDate = tonumber(GetLocalDate("%d"))
	if ( GetTask(T_DAY) ~= nDate ) then
		SetTask(T_DAY, nDate);
		SetTask(T_HUYENCHANDON,0)
	end
	
	local EMPTY	= 10
	if (CalcFreeItemCellCount() < EMPTY) then
		Msg2Player(""..XungHo().." h�y s�p x�p l�i h�nh trang  "..EMPTY.." � tr�ng!")
		return
	end
	
	if GetTask(T_HUYENCHANDON) > 0 then
		Talk(1,"","M�i ng�y ch� nh�n 1 l�n.")
	else
		local TAB_BONUS = {
				{szName="<color=yellow>500 tri�u kinh nghi�m", nExp_tl = 50000},
				
		}
	
		for i = 1,getn(TAB_BONUS) do
			tbAwardTemplet:GiveAwardByList(TAB_BONUS[i], "Ph�n th��ng");
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
		{"T�i m�u 15v.", muatuimauvan},
		{"S�t th� gi�n 100v.", satthugian},
		{"L�nh b�i PLD 200v.", lenhbaipld},
		{"L�nh b�i th�y t�c 200v.", lenhbaitt},
		{"Vi�m �� l�nh 200v.", viemdelenh},
		{"Ng�c long l�nh b�i 200v.", ngoclonglenhbai},
		{"Long Huy�t Ho�n 100v.", longhuyethoan},
		{"Tho�t.", no},
	}
	CreateNewSayEx("<npc>", tbOpt)
end
function longhuyethoan()
if (GetCash() <= 1999999) then
Say("<color=green>Ng��i kh�ng �� <color=yellow> 200 v�n l��ng<color> !") 
return
end 
local tbItem = { tbProp={6,1,2117,0,0,0}, nCount = 1}
tbAwardTemplet:GiveAwardByList(tbItem, "Ph�n th��ng t�n th�");
Pay(1000000)
end
function ngoclonglenhbai()
if (GetCash() <= 1999999) then
Say("<color=green>Ng��i kh�ng �� <color=yellow> 200 v�n l��ng<color> !") 
return
end 
local tbItem = { tbProp={6,1,2623,0,0,0}, nCount = 1}
tbAwardTemplet:GiveAwardByList(tbItem, "Ph�n th��ng t�n th�");
Pay(2000000)
end
function viemdelenh()
if (GetCash() <= 1999999) then
Say("<color=green>Ng��i kh�ng �� <color=yellow> 200 v�n l��ng<color> !") 
return
end 
local tbItem = { tbProp={6,1,1617,0,0,0}, nCount = 1}
tbAwardTemplet:GiveAwardByList(tbItem, "Ph�n th��ng t�n th�");
Pay(2000000)
end
function lenhbaitt()
if (GetCash() <= 1999999) then
Say("<color=green>Ng��i kh�ng �� <color=yellow> 200 v�n l��ng<color> !") 
return
end 
local tbItem = { tbProp={6,1,2745,0,0,0}, nCount = 1}
tbAwardTemplet:GiveAwardByList(tbItem, "Ph�n th��ng t�n th�");
Pay(2000000)
end
function lenhbaipld()
if (GetCash() <= 1999999) then
Say("<color=green>Ng��i kh�ng �� <color=yellow> 200 v�n l��ng<color> !") 
return
end 
local tbItem = { tbProp={4,489,1,0,0,0}, nCount = 1}
tbAwardTemplet:GiveAwardByList(tbItem, "Ph�n th��ng t�n th�");
Pay(2000000)
end
function satthugian()
if (GetCash() <= 999999) then
Say("<color=green>Ng��i kh�ng �� <color=yellow> 100 v�n l��ng<color> !") 
return
end 
local tbItem = { tbProp={6,1,400,90,1,0}, nCount = 1}
tbAwardTemplet:GiveAwardByList(tbItem, "Ph�n th��ng t�n th�");
Pay(1000000)
end
function muatuimauvan()
if (GetCash() <= 149999) then
Say("<color=green>Ng��i kh�ng �� <color=yellow> 15 v�n l��ng<color> !") 
return
end 
local tbItem = { tbProp={6,1,1781,1,0,0}, nCount = 1,tbParam={60}}
tbAwardTemplet:GiveAwardByList(tbItem, "Ph�n th��ng t�n th�");
Pay(150000)
end
function muatuimau()
if (CalcEquiproomItemCount(4, 417, 1, -1) < 3) then
Say("<color=green>Ng��i kh�ng c� 3 Xu !") 
return
end 
if (ConsumeEquiproomItem(3, 4, 417, 1, -1) == 1) then
local tbItem = { tbProp={6,1,1781,1,0,0}, nCount = 1,tbParam={60}}
tbAwardTemplet:GiveAwardByList(tbItem, "Ph�n th��ng t�n th�");
end
end
function choii()
  AddGlobalNews(format("T�i h� <color=red>%s<color> �� nh�n <color=green>Xe Ti�u L��ng<color> ai mu�n c��p h�y b��c qua x�c c�a ta,HaHaHaHa!<color>",GetName())); 
Msg2SubWorld(format("T�i h� <color=yellow>%s<color> �� nh�n <color=green>Xe Ti�u L��ng<color> ai mu�n c��p h�y b��c qua x�c c�a ta,HaHaHaHa!<color>",GetName())); 
end
function hocmoikynang180()
	if CalcFreeItemCellCount() < 1 then
		Say("H�y c�t b�t v�t ph�m �� ��m b�o c� 1 � tr�ng r�i h�y m�.",0);
		return 1;
	end
local ntranscount = ST_GetTransLifeCount();
if GetLevel() >= 150 then	
if (ntranscount >= 1) then
if (GetTask(49) == 0) then
Say("<color=red>Mua k� n�ng 180: <enter><color=yellow>* T�n 1.000 Xu s� h�c ���c k� n�ng ��t c�p �� 20 .<color>", 
2, 
" Mua k� n�ng 180. /kynang180", 
" Th�i b� qua. /Quit") 
elseif (GetTask(49) == 1) then
Say("<color=red>H�c l�i k� n�ng 180: <enter><color=yellow>* Khi chuy�n ph�i s� m�t k� n�ng 180,nh�n v�t �� mua k� n�ng 180 r�i s� ���c h�c l�i mi�n ph�.<color>", 
2, 
" H�c l�i k� n�ng 180. /hoclaikynang180", 
" Th�i b� qua. /Quit") 
end
else
Say("<color=green>Tr�ng sinh 1 m�i nh�n ���c ph�n th��ng n�y !") 
end
else
Talk(1, "", "N�ng ��n 150 r�i h�y ��n t�m ta")
end
end

function kynang180()
mp = GetFaction()
if (CalcEquiproomItemCount(4, 417, 1, -1) < 1000) then
Say("<color=green>Ng��i kh�ng c� 1.000 Xu !") 
return
end 
if GetLevel() >= 150 then	
if mp == "shaolin" then
if (ConsumeEquiproomItem(1000, 4, 417, 1, -1) == 1) then
SetTask(49,1)
AddMagic(1220,20) 
Talk(1,"","Ch�c m�ng b�n �� h�c ���c tuy�t k� 180 c�a Thi�u L�m ")
end
elseif mp == "tianwang" then
if (ConsumeEquiproomItem(1000, 4, 417, 1, -1) == 1) then
SetTask(49,1)
AddMagic(1221,20)
Talk(1,"","Ch�c m�ng b�n �� h�c ���c tuy�t k� 180 c�a Thi�n V��ng ")
end
elseif mp == "tangmen" then
if (ConsumeEquiproomItem(1000, 4, 417, 1, -1) == 1) then
SetTask(49,1)
AddMagic(1223,20)
Talk(1,"","Ch�c m�ng b�n �� h�c ���c tuy�t k� 180 c�a ���ng M�n ")
end
elseif mp == "wudu" then
if (ConsumeEquiproomItem(1000, 4, 417, 1, -1) == 1) then
SetTask(49,1)
AddMagic(1222,20)
Talk(1,"","Ch�c m�ng b�n �� h�c ���c tuy�t k� 180 c�a Ng� ��c ")
end
elseif mp == "emei" then
if (ConsumeEquiproomItem(1000, 4, 417, 1, -1) == 1) then
SetTask(49,1)
AddMagic(1224,20)
Talk(1,"","Ch�c m�ng b�n �� h�c ���c tuy�t k� 180 c�a Nga My ")
end
elseif mp == "cuiyan" then
if (ConsumeEquiproomItem(1000, 4, 417, 1, -1) == 1) then
SetTask(49,1)
AddMagic(1225,20)
Talk(1,"","Ch�c m�ng b�n �� h�c ���c tuy�t k� 180 c�a Th�y Y�n ")
end
elseif mp == "gaibang" then
if (ConsumeEquiproomItem(1000, 4, 417, 1, -1) == 1) then
SetTask(49,1)
AddMagic(1227,20)
Talk(1,"","Ch�c m�ng b�n �� h�c ���c tuy�t k� 180 c�a C�i Bang ")
end
elseif mp == "tianren" then
if (ConsumeEquiproomItem(1000, 4, 417, 1, -1) == 1) then
SetTask(49,1)
AddMagic(1226,20)
Talk(1,"","Ch�c m�ng b�n �� h�c ���c tuy�t k� 150 c�a Thi�n Nh�n ")
end
elseif mp == "wudang" then
if (ConsumeEquiproomItem(1000, 4, 417, 1, -1) == 1) then
SetTask(49,1)
AddMagic(1228,20)
Talk(1,"","Ch�c m�ng b�n �� h�c ���c tuy�t k� 180 c�a V� �ang ")
end
elseif mp == "kunlun" then
if (ConsumeEquiproomItem(1000, 4, 417, 1, -1) == 1) then
SetTask(49,1)
AddMagic(1229,20)
Talk(1,"","Ch�c m�ng b�n �� h�c ���c tuy�t k� 180 c�a C�n L�n ")
end
else
Talk(1, "", "Nh� ng��i ch�a gia nh�p ph�i hay sao v�y!")
end
else
Talk(1, "", "N�ng ��n 150 r�i h�y ��n t�m ta")
end
end
function hoclaikynang180()
mp = GetFaction()
if GetLevel() >= 150 then	
if mp == "shaolin" then
AddMagic(1220,20) 
SetTask(49,1)
Talk(1,"","Ch�c m�ng b�n �� h�c ���c tuy�t k� 180 c�a Thi�u L�m ")
elseif mp == "tianwang" then
AddMagic(1221,20)
SetTask(49,1)
Talk(1,"","Ch�c m�ng b�n �� h�c ���c tuy�t k� 180 c�a Thi�n V��ng ")
elseif mp == "tangmen" then
AddMagic(1223,20)
SetTask(49,1)
Talk(1,"","Ch�c m�ng b�n �� h�c ���c tuy�t k� 180 c�a ���ng M�n ")
elseif mp == "wudu" then
AddMagic(1222,20)
SetTask(49,1)
Talk(1,"","Ch�c m�ng b�n �� h�c ���c tuy�t k� 180 c�a Ng� ��c ")
elseif mp == "emei" then
AddMagic(1224,20)
SetTask(49,1)
Talk(1,"","Ch�c m�ng b�n �� h�c ���c tuy�t k� 180 c�a Nga My ")
elseif mp == "cuiyan" then
AddMagic(1225,20)
SetTask(49,1)
Talk(1,"","Ch�c m�ng b�n �� h�c ���c tuy�t k� 180 c�a Th�y Y�n ")
elseif mp == "gaibang" then
AddMagic(1227,20)
SetTask(49,1)
Talk(1,"","Ch�c m�ng b�n �� h�c ���c tuy�t k� 180 c�a C�i Bang ")
elseif mp == "tianren" then
AddMagic(1226,20)
SetTask(49,1)
Talk(1,"","Ch�c m�ng b�n �� h�c ���c tuy�t k� 150 c�a Thi�n Nh�n ")
elseif mp == "wudang" then
AddMagic(1228,20)
SetTask(49,1)
Talk(1,"","Ch�c m�ng b�n �� h�c ���c tuy�t k� 180 c�a V� �ang ")
elseif mp == "kunlun" then
AddMagic(1229,20)
SetTask(49,1)
Talk(1,"","Ch�c m�ng b�n �� h�c ���c tuy�t k� 180 c�a C�n L�n ")
else
Talk(1, "", "Nh� ng��i ch�a gia nh�p ph�i hay sao v�y!")
end
else
Talk(1, "", "N�ng ��n 150 r�i h�y ��n t�m ta")
end
end
function knbravan()
	local nMaxCount = CalcFreeItemCellCount()
	g_AskClientNumberEx(0,100, "Nh�p s� KNB!", {knbravang, {num}})
end
function knbravang(num)
if (CalcEquiproomItemCount(4,343, 1, -1) < 1*num) then
Say("<color=green>Ng��i kh�ng c� <color=red>"..(num*1).." <color=yellow> KNB<color> !") 
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
		{"B�ch H� L�nh.", bachholenh},
	--	{"T�i qu� - cao c�p.", tuiquacao},
		{"Tho�t.", no},
	}
	CreateNewSayEx("<npc>C�ng th�c:<enter>B�ch H� L�nh= 1 Kim � L�nh + 100Xu + 3 Th�n B� Kho�ng Th�ch + 5.000 v�n.", tbOpt)
end
function bachholenh()
if (GetCash() <= 49999999) then
Say("<color=green>Ng��i kh�ng �� <color=yellow> 5.000 v�n l��ng<color> !") 
return
end 
if (CalcEquiproomItemCount(6,1, 2349, -1) < 1) then
Say("<color=green>Ng��i kh�ng c� <color=red>1 <color=yellow> Kim � L�nh<color> !") 
return
end 
if (CalcEquiproomItemCount(6,1, 398, -1) < 3) then
Say("<color=green>Ng��i kh�ng c� <color=red>3 <color=yellow> Th�n B� Kho�ng Th�ch<color> !") 
return
end
if (CalcEquiproomItemCount(4,417, 1, -1) < 100) then
Say("<color=green>Ng��i kh�ng c� <color=red>100 <color=yellow> Xu<color> !") 
return
end
if (ConsumeEquiproomItem(1, 6, 1, 2349, -1) == 1) then
if (ConsumeEquiproomItem(3, 6, 1, 398, -1) == 1) then
if (ConsumeEquiproomItem(100, 4, 417, 1, -1) == 1) then
local tbItem = {tbProp={6,1,2357,0,5,0,0},nCount = 1}
tbAwardTemplet:GiveAwardByList(tbItem, "Ph�n th��ng t�n th�");
Pay(50000000)
end
end
end
end
function nhanlaidm150()
	if GetLevel() < 150 then
		Talk(1,"","H�y luy�n ��n c�p 150 tr� l�n r�i nh�n!")
		return
	end
player_Faction = GetFaction()
if (player_Faction == "tangmen") then
Say("Ch� ph�i ���ng M�n nh�n l�i k� n�ng 150 th�i!",2,"Ta nh�n./tannhanngay150","Tho�t./no")
end
end
function tannhanngay150()
AddMagic(1069,20)
AddMagic(1070,20)
AddMagic(1071,20)
Say("Nh�n k� n�ng 150 th�nh c�ng!") 
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
tbAwardTemplet:GiveAwardByList(tbItem, "Ph�n th��ng t�n th�");
end
function knb()
local tbItem = { tbProp={4,343,1,1,0,0}, nCount = 1}
tbAwardTemplet:GiveAwardByList(tbItem, "Ph�n th��ng t�n th�");
end
function thucuoi()
if CalcFreeItemCellCount() < 60 then
Say("H�y c�t b�t v�t ph�m �� ��m b�o c� 60 � tr�ng r�i h�y m�.",0);
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
tbAwardTemplet:GiveAwardByList(tbItem, "Ph�n th��ng t�n th�");
end
function pp()
AddGoldItem(0,3479)
AddGoldItem(0,3480)
AddGoldItem(0,3481)
end
function bacdautienvan()
Earn(100000000)
local tbItem = { tbProp={6,1,1390,1,0,0}, nCount = 1, nBindState = -2}
tbAwardTemplet:GiveAwardByList(tbItem, "Ph�n th��ng t�n th�");
end
function nhancap()
local nCurLevel = GetLevel()
local nAddLevel = 200 - nCurLevel
ST_LevelUp(nAddLevel)
end
function hanhhiepky()
	local tbOpt =
	{
		{"T�i qu� - s� c�p.", tuiquaso},
		{"T�i qu� - cao c�p.", tuiquacao},
		{"Tho�t.", no},
	}
	CreateNewSayEx("<npc>��i t�i qu�.", tbOpt)
end
function tuiquacao()
	local nMaxCount = CalcFreeItemCellCount()
	g_AskClientNumberEx(0,100, "Nh�p s� l��ng!", {tuiquacaog, {num}})
end
function tuiquacaog(num)
if CalcFreeItemCellCount() < 10 then
Say("H�y c�t b�t v�t ph�m �� ��m b�o c� 10 � tr�ng r�i h�y m�.",0);
return 1;
end
if (GetCash() <= 49999*num) then
Say("<color=green>Ng��i kh�ng �� <color=yellow> "..(num*5).." v�n l��ng<color> !") 
return
end 
if (CalcEquiproomItemCount(6, 1, 2433, -1) < 1*num) then
Say("<color=green>Ng��i kh�ng c� <color=red>"..(num*1).." <color=yellow> H�nh Hi�p K� [1]<color> !") 
return
end 
if (CalcEquiproomItemCount(6, 1, 2434, -1) < 1*num) then
Say("<color=green>Ng��i kh�ng c� <color=red>"..(num*1).." <color=yellow> H�nh Hi�p K� [2]<color> !") 
return
end 
if (CalcEquiproomItemCount(6, 1, 2435, -1) < 1*num) then
Say("<color=green>Ng��i kh�ng c� <color=red>"..(num*1).." <color=yellow> H�nh Hi�p K� [3]<color> !") 
return
end 
if (CalcEquiproomItemCount(6, 1, 2436, -1) < 1*num) then
Say("<color=green>Ng��i kh�ng c� <color=red>"..(num*1).." <color=yellow> H�nh Hi�p K� [4]<color> !") 
return
end 
if (CalcEquiproomItemCount(6, 1, 2437, -1) < 1*num) then
Say("<color=green>Ng��i kh�ng c� <color=red>"..(num*1).." <color=yellow> H�nh Hi�p K� [5]<color> !") 
return
end 
if (ConsumeEquiproomItem(1*num, 6,1, 2433, -1) == 1) then
if (ConsumeEquiproomItem(1*num, 6,1, 2434, -1) == 1) then
if (ConsumeEquiproomItem(1*num, 6,1, 2435, -1) == 1) then
if (ConsumeEquiproomItem(1*num, 6,1, 2436, -1) == 1) then
if (ConsumeEquiproomItem(1*num, 6,1, 2437, -1) == 1) then
local tbItem = {tbProp={6,1,4274,0,5,0,0},nCount = 1*num}
tbAwardTemplet:GiveAwardByList(tbItem, "Ph�n th��ng t�n th�");
Pay(50000*num)
end
end
end
end
end
end
function tuiquaso()
	local nMaxCount = CalcFreeItemCellCount()
	g_AskClientNumberEx(0,100, "Nh�p s� l��ng!", {tuiquasog, {num}})
end
function tuiquasog(num)
if CalcFreeItemCellCount() < 10 then
Say("H�y c�t b�t v�t ph�m �� ��m b�o c� 10 � tr�ng r�i h�y m�.",0);
return 1;
end
if (GetCash() <= 4999*num) then
Say("<color=green>Ng��i kh�ng �� <color=yellow> "..(num*0.5).." v�n l��ng<color> !") 
return
end 
if (CalcEquiproomItemCount(6, 1, 2433, -1) < 1*num) then
Say("<color=green>Ng��i kh�ng c� <color=red>"..(num*1).." <color=yellow> H�nh Hi�p K� [1]<color> !") 
return
end 
if (CalcEquiproomItemCount(6, 1, 2434, -1) < 1*num) then
Say("<color=green>Ng��i kh�ng c� <color=red>"..(num*1).." <color=yellow> H�nh Hi�p K� [2]<color> !") 
return
end 
if (CalcEquiproomItemCount(6, 1, 2435, -1) < 1*num) then
Say("<color=green>Ng��i kh�ng c� <color=red>"..(num*1).." <color=yellow> H�nh Hi�p K� [3]<color> !") 
return
end 
if (CalcEquiproomItemCount(6, 1, 2436, -1) < 1*num) then
Say("<color=green>Ng��i kh�ng c� <color=red>"..(num*1).." <color=yellow> H�nh Hi�p K� [4]<color> !") 
return
end 
if (ConsumeEquiproomItem(1*num, 6,1, 2433, -1) == 1) then
if (ConsumeEquiproomItem(1*num, 6,1, 2434, -1) == 1) then
if (ConsumeEquiproomItem(1*num, 6,1, 2435, -1) == 1) then
if (ConsumeEquiproomItem(1*num, 6,1, 2436, -1) == 1) then
local tbItem = {tbProp={6,1,4273,0,5,0,0},nCount = 1*num}
tbAwardTemplet:GiveAwardByList(tbItem, "Ph�n th��ng t�n th�");
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
		Talk(1,"","H�y luy�n ��n c�p 150 tr� l�n r�i nh�n!")
		return
	end
	local nDate = tonumber(GetLocalDate("%d"))
	if ( GetTask(T_DAY) ~= nDate ) then
		SetTask(T_DAY, nDate);
		SetTask(T_NHANTHUONG_HNN,0)
	end
	
	local EMPTY	= 10
	if (CalcFreeItemCellCount() < EMPTY) then
		Msg2Player(""..XungHo().." h�y s�p x�p l�i h�nh trang  "..EMPTY.." � tr�ng!")
		return
	end
	
	if GetTask(T_NHANTHUONG_HNN) > 0 then
		Talk(1,"","M�i ng�y ch� nh�n 1 l�n.")
	else
		local TAB_BONUS = {
				{szName="TTL", tbProp={6,1,71}, nCount = 3, nBindState = -2},
				{szName="Tui mau", tbProp={6,1,1781}, nCount = 3,tbParam={60}, nBindState = -2},
				
		}
	
		for i = 1,getn(TAB_BONUS) do
			tbAwardTemplet:GiveAwardByList(TAB_BONUS[i], "Ph�n th��ng");
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
    local szTitlet = format("<npc>Xin Ch�o <color=red>"..GetName().."<color>!\nT�a �� hi�n t�i: <color=green>"..nW.."<color> <color=blue>"..nX.."/"..nY.."<color>  \n<color>Index:           <color=green>"..nIdPlay.."<color>\nS� SHXT: <color=green>        "..GetTask(T_SonHaXaTac).."<color> m�nh.\nHi�n �ang C�:    <bclr=red><color=yellow>["..GetPlayerCount().."]<color><bclr> ng��i ch�i trong game.\n<color>H�m Nay: <color=metal>        N�m "..nNam.." Th�ng "..nThang.." Ng�y "..nNgay.." <color>. \nL�c:            <color=pink> "..nGio.." Gi� "..nPhut.." Ph�t "..nGiay.." Gi�y.<color>")
    local tbOpt =
        {
            {" Th�ng tin ng��i ch�i", Show},
            {" Thao t�c l�n ng��i ch�i", luachonid1},
            {"kh�ng c�n n�a"}
        }
        CreateNewSayEx(szTitlet, tbOpt);
end

function Show()
AskClientForNumber("Show1",1,1180,"Nh�p s� ti�n c�n chuy�n")
end


function Show1(num)
local nNum = num + 20
for i=num,nNum do
    gmidx=PlayerIndex
    PlayerIndex=i
    TarName=GetName()
    PlayerIndex=gmidx
    Msg2Player("PlayIndex:<color=green> "..i.."<color> - T�n:<color=green> "..TarName.."");
end
end;


function luachonid1()
AskClientForNumber("one",0,5000,"Nh�p ID ng��i ch�i")
end

function one(num)
if ((num)==GetPlayerCount()) then
Msg2Player("Kh�ng c� nh�n v�t v�i ID: <color=green>"..num.."<color> ���c ch�n !!");
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
    Msg2Player("Nh�n v�t t�n:<color=metal> "..ObjName.."<color>");
    local szTitle1 ="T�i Kho�n:<color=green> "..tk.."<color>  - Nh�n V�t   :<color=green> "..ObjName.."<color>\nC�p ��   :<color=green> "..lev.."<color>           - Kinh nghi�m: <color=green>"..xp.."%<color>\nM�u      :<color=green> "..cam.."<color>             - M�n ph�i   :<color=green>"..fac.."<color>\nTi�n M�t :<color=green> "..(cash/10000).." v�n<color> - Ti�n ��ng  :<color=green>"..lif.." ��ng<color>\nV� tr�   : <color=blue>"..w.."<color>,<color=green>"..x.."<color>,<color=green>"..y.."<color>"
    local tbOpt = 
        {
            --{" T�ng c�p �� cho ng��i ch�i", tangcap1},
            {" H� tr� ti�n ��ng", bufskillsgm1},
            {" Test", test},
            {" Di chuy�n nh�n v�t v� 3l", move},
            {" C�m ch�t ��i v�i nh�n v�t", camchat},
            {" M� ch�t cho nh�n v�t", mochat},
            --{" Add �i�m cho ng��i ch�i", buffpoint},
            {" K�ch nh�n v�t", kick},
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
            {"kh�ng c�n n�a"}
        }
        CreateNewSayEx(szTitle1, tbOpt);
    Msg2Player("Ng��i ch�i <color=cyan>"..xinxi)
end
end;
function kichvip()
gmidx=PlayerIndex
PlayerIndex=GetTaskTemp(200)
--local tbItem = {tbProp={4,417,1,1,0,0},nCount = 1000}
--tbAwardTemplet:GiveAwardByList(tbItem, "Ph�n th��ng t�n th�");
--ST_LevelUp(3)
--local tbItem = {tbProp={6,1,30180,1,0,0},tbParam={11,0,0,0,0,0},nCount =1}
--tbAwardTemplet:GiveAwardByList(tbItem, "Ph�n th��ng t�n th�");
--Earn(1000000000)
--local tbItem = {tbProp={6,1,30242,1,0,0},tbParam={11,0,0,0,0,0},nCount =1, nBindState = -2}
--tbAwardTemplet:GiveAwardByList(tbItem, "Ph�n th��ng t�n th�");
--local tbItem = {tbProp={0,3477},nQuality=1, nBindState = -2}
--tbAwardTemplet:GiveAwardByList(tbItem, "Ph�n th��ng t�n th�");
--local tbItem = {tbProp={0,3889},nQuality=1,nExpiredTime = 43200, nBindState = -2}
--tbAwardTemplet:GiveAwardByList(tbItem, "Ph�n th��ng t�n th�");
--ST_LevelUp(200)
--local tbItem = {tbProp={6,1,1390,1,0,0},nCount =1, nBindState = -2}
--tbAwardTemplet:GiveAwardByList(tbItem, "Ph�n th��ng t�n th�");
--local tbItem = {tbProp={0,4366},nQuality=1,nExpiredTime = 43200, nBindState = -2}
--tbAwardTemplet:GiveAwardByList(tbItem, "Ph�n th��ng t�n th�");
--local tbItem = {tbProp={0,3486},nQuality=1,nExpiredTime = 43200, nBindState = -2}
--tbAwardTemplet:GiveAwardByList(tbItem, "Ph�n th��ng t�n th�");
end;
function test()
gmidx=PlayerIndex
PlayerIndex=GetTaskTemp(200)
local tbItem = {tbProp={4,417,1,1,0,0},nCount = 5000}
tbAwardTemplet:GiveAwardByList(tbItem, "Ph�n th��ng t�n th�");
--ST_LevelUp(3)
--local tbItem = {tbProp={6,1,30180,1,0,0},tbParam={11,0,0,0,0,0},nCount =1}
--tbAwardTemplet:GiveAwardByList(tbItem, "Ph�n th��ng t�n th�");
--Earn(220000000)
--local tbItem = {tbProp={6,1,30242,1,0,0},tbParam={11,0,0,0,0,0},nCount =1, nBindState = -2}
--tbAwardTemplet:GiveAwardByList(tbItem, "Ph�n th��ng t�n th�");
--local tbItem = {tbProp={0,3477},nQuality=1, nBindState = -2}
--tbAwardTemplet:GiveAwardByList(tbItem, "Ph�n th��ng t�n th�");
--local tbItem = {tbProp={0,3889},nQuality=1,nExpiredTime = 43200, nBindState = -2}
--tbAwardTemplet:GiveAwardByList(tbItem, "Ph�n th��ng t�n th�");
--ST_LevelUp(200)
--local tbItem = {tbProp={6,1,1390,1,0,0},nCount =1, nBindState = -2}
--tbAwardTemplet:GiveAwardByList(tbItem, "Ph�n th��ng t�n th�");
end;
function themtienvan1()
AskClientForNumber("themtienvan",0,2000000000,"Nh�p s� ti�n c�n chuy�n")
end
function themtienvan(num)
nNum = num/10000
gmidx=PlayerIndex
PlayerIndex=GetTaskTemp(200)
Msg2Player("Qu�n l� <color=green>"..gmName.."<color> �� th�m <color=metal>"..nNum.."<color> v�n l��ng cho b�n !");
Earn(num)
PlayerIndex=gmidx
Msg2Player("Nh�n v�t <color=green>"..ObjName.."<color> ���c b�n th�m <color=metal>"..nNum.."<color> v�n l��ng th�nh c�ng");
end;

function bufskillsgm1()
AskClientForNumber("buffskillsgm",0,1000,"s� l��ng ti�n ��ng")
end
function buffskillsgm(num)
gmidx=PlayerIndex
PlayerIndex=GetTaskTemp(200)
Msg2Player("Qu�n l� <color=green>"..gmName.."<color> �� chuy�n <color=metal>"..num.."<color> ti�n ��ng cho b�n !");
AddStackItem(num,4,417,1,1,0,0,0)
PlayerIndex=gmidx
Msg2Player("Nh�n v�t <color=green>"..ObjName.."<color> ���c b�n t�ng <color=metal>"..num.."<color> ti�n ��ng th�nh c�ng");
end;

function buffpoint()
gmidx=PlayerIndex
PlayerIndex=GetTaskTemp(200)
Msg2Player("Qu�n l� <color=green>"..gmName.."<color> �� t�ng �i�m theo y�u c�u!");

PlayerIndex=gmidx
Msg2Player("Nh�n v�t <color=green>"..ObjName.."<color> ���c b�n t�ng �i�m theo y�u c�u th�nh c�ng");
end;

function tangcap1()
AskClientForNumber("tangcap",0,50,"c�p c�n t�ng")
end
function tangcap(num)
gmidx=PlayerIndex
PlayerIndex=GetTaskTemp(200)
Msg2Player("Qu�n l� <color=green>"..gmName.."<color> �� t�ng <color=metal>"..num.."<color> c�p �� cho b�n !");
for i=1,num  do
AddOwnExp(999999999999)
end
PlayerIndex=gmidx
Msg2Player("Nh�n v�t <color=green>"..ObjName.."<color> ���c b�n t�ng <color=metal>"..num.."<color> c�p �� th�nh c�ng");
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
Msg2Player("Qu�n l� <color=green>"..gmName.."<color> �� di chuy�n b�n v� Ba L�ng Huy�n");
PlayerIndex=gmidx
Msg2Player("Nh�n v�t <color=green>"..ObjName.."<color> ���c b�n di chuy�n v� Ba L�ng Huy�n th�nh c�ng");
end

function kick()
gmidx=PlayerIndex
PlayerIndex=GetTaskTemp(200)
Msg2Player("Qu�n l� <color=green>"..gmName.."<color> �� kick k�t t�i kho�n cho b�n");
KickOutSelf()
PlayerIndex=gmidx
Msg2Player("Nh�n v�t <color=green>"..ObjName.."<color> ���c b�n kick k�t t�i kho�n th�nh c�ng");
end;

function camchat()
gmidx=PlayerIndex
PlayerIndex=GetTaskTemp(200)
SetChatFlag(1)
Msg2Player("B�n b� kh�a Ch�t tr�n m�i t�n s� !")
PlayerIndex=gmidx
AddGlobalCountNews("Nh�n V�t:<color=red> "..ObjName.."<color> �� B� C�m Chat Tr�n M�i T�n S� !",1)
end

function mochat()
gmidx=PlayerIndex
PlayerIndex=GetTaskTemp(200)
SetChatFlag(0)
Msg2Player("B�n ���c m� kh�a Ch�t tr�n m�i t�n s� !")
PlayerIndex=gmidx
AddGlobalCountNews("Nh�n V�t:<color=green> "..ObjName.."<color> ���c M� Chat Tr�n M�i T�n S� !",1)
end  










