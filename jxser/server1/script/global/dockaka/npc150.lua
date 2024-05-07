IncludeLib("SETTING")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\global\\fuyuan.lua")
--Include("\\script\\traogiaithdnb\\thdnb7.lua")
--Include("\\script\\global\\writeaddressdialog.lua")
Include("\\script\\missions\\leaguematch\\npc\\officer.lua")
Include("\\script\\vng_event\\2012_vlnb\\main.lua")
Include("\\script\\global\\lottery_gold.lua")
--Include("\\script\\global\\pgaming\\hotrotanthu\\hotroitem.lua")
Include("\\script\\global\\namcung\\gmquanlyserver\\libgm.lua")

--==========================================================================================

function namcung2()
	local szTitle = "<npc>Kiªm hiªp quÇn hïng chiªn nam h¶i, long tranh hæ ®Êu diÖu Cöu ch©u. Ta vèn sø gi¶ ®¹i biÓu t©y s¬n c­ ë chç nµy hoan nghªnh c¸c anh hïng hµo kiÖt...  " --    Script LÔ Quan ®­îc ViÖt Haa bëi _khunglongcon_                      clbgamesvn.com"
	local tbOpt =
	{
		
		{"Vµo ph¸i vµ häc skill 150", choose_faction},
	
		{"Tho¸t"},
	}
	
	end
	CreateNewSayEx(szTitle, tbOpt)
end
function cucphkhac()
dohoangkim()
end
function nguhanh()
local szTitle = "<npc>Ng­¬i cÇn g×?"
	local tbOpt =
	{
		{"ChuyÓn ®æi sang n÷ hÖ Kim", nukim},
		{"Chuyªn ®æi sang nam hÖ Thuy", namthuy},
		{"Tho¸t"},
	}

	CreateNewSayEx(szTitle, tbOpt)
end
function nukim()
if GetSex() == 1 then
SetSeries(0)
KickOutSelf()
	else
	Talk(1,"","Ng­¬i lµ Pª §ª µ ?")
end
end

function namthuy()
if GetSex() == 0 then
SetSeries(2)
KickOutSelf()
	else
	Talk(1,"","Vui lßng kiÓm tra l¹i giíi tÝnh")
end
end


function bktl()
AddGoldItem(0, 11)
AddGoldItem(0, 6)
end
function bktv()
AddGoldItem(0, 16)
AddGoldItem(0, 21)
AddGoldItem(0, 26)
end
function bknm()
AddGoldItem(0, 31)
end
function bkty()
AddGoldItem(0, 46)
end
function bk5d()
AddGoldItem(0, 61)
end
function bkdm()
AddGoldItem(0, 71)
AddGoldItem(0, 76)
AddGoldItem(0, 81)
end
function bkcb()
AddGoldItem(0, 96)
end
function bktn()
AddGoldItem(0, 101)
end
function bkvd()
for i=4346,4355 do
AddPlatinaItem(3, i)
end
end
function bkcl()
AddGoldItem(0, 126)
end
function hacthan()
for i=3890,3894 do
AddGoldItem(0, i)
end
end
function matna1()
for i=4493,4523 do
AddGoldItem(0, i)
end
end
function matna2()
for i=4524,4554 do
AddGoldItem(0, i)
end
end
function matna3()
for i=4555,4585 do
AddGoldItem(0, i)
end
end
function matna4()
for i=4586,4616 do
AddGoldItem(0, i)
end
end
function matna5()
for i=4617,4630 do
AddGoldItem(0, i)
end
end



function level_up_to150()
	local nCurLevel = GetLevel()
	if nCurLevel >= 150 then
		if ST_IsTransLife() == 1 then
			Talk(1, "", "Ng­¬i ®· ®¹t cÊp 150 råi.")
		else
			Talk(1, "", "§i chuyÓn sinh tr­íc ®i råi trë l¹i th¨ng cÊp.")
		end
		return
	end
	local nAddLevel = 150 - nCurLevel
	ST_LevelUp(nAddLevel)
end
function level_up_to190()
	local nCurLevel = GetLevel()
	if nCurLevel >= 190 then
		if ST_IsTransLife() == 1 then
			Talk(1, "", "Ng­¬i ®· ®¹t cÊp 190 råi.")
		else
			Talk(1, "", "§i chuyÓn sinh tr­íc ®i råi trë l¹i th¨ng cÊp.")
		end
		return
	end
	local nAddLevel = 190 - nCurLevel
	ST_LevelUp(nAddLevel)
end

function transfer()
	if GetLevel() < 190 then
		Talk(1, "", "CÊp 190 trë lªn míi ca thÓ chuyÓn sinh.")
		return
	end
	if (GetCash() <= 100000000) then
		Talk(1, "", "Ph¶i ca ®ñ 10k v¹n míi ca thÓ chuyÓn sinh.")
		return
	end
	Pay(100000000)
	ST_DoTransLife()
end

function check_faction()
	local szCurFaction = GetFaction()
	if szCurFaction ~= nil and szCurFaction ~= "" then
		return
	end
	return 1
end

function choose_faction()
	if check_faction() ~= 1 then
		Talk(1, "", "Ng­¬i ®· gia nhËp m«n ph¸i.")
		return
	end
	local nSeries = GetSeries() + 1
	local tbOpt = {}
	for i=1, getn(%tbFactionSeries[nSeries]) do
		local nIndex = %tbFactionSeries[nSeries][i]
		tinsert(tbOpt, {%tbFaction[nIndex].szShowName, set_faction, {nIndex}})
	end
	tinsert(tbOpt, {"Trë vÒ", dialog_main})
	tinsert(tbOpt, {"KOt thóc ®èi tho¹i."})
	CreateNewSayEx("<npc>Mét khi gia nhËp m«n ph¸i kh«ng thÓ thay ®æi, h·y suy nghÜ kü.", tbOpt)
end

function set_faction(nIndex)
	local szTitle = format("<npc>X¸c nhËn muèn gia nhËp m«n ph¸i ?<color=yellow>%s<color> m«n ph¸i?", %tbFaction[nIndex].szShowName)
	local tbOpt =
	{
		{"X¸c nhËn!", do_set_faction, {nIndex}},
		{"Trë vÒ.", choose_faction},
		{"KOt thóc ®èi tho¹i."},
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function do_set_faction(nIndex)
	if check_faction() ~= 1 then
		Talk(1, "", "Ng­¬i ®· gia nhËp m«n ph¸i.")
		return
	end
	local nResult = SetFaction(%tbFaction[nIndex].szFaction)
	if nResult == 0 then
		return
	end
	DynamicExecuteByPlayer(PlayerIndex, "\\script\\gmscript.lua", "AddSkills", %tbFaction[nIndex].nShortFaction, 0)
	for i=1, getn(%tbFaction[nIndex].tbSkill) do--90£¬120£¬150¼¶¼¼ÄÜ
		AddMagic(%tbFaction[nIndex].tbSkill[i], 20)
	end
	AddMagic(210, 1)--?»¼¶Çá¹¦
	Talk(1, "KickOutSelf", format("Ng­¬i ®· gia nhËp thµnh c«ng ph¸i %s", %tbFaction[nIndex].szShowName))
end

function show_faction()
	if check_faction() == 1 then
		Talk(1, "", "Gia nhËp m«n ph¸i míi ca thÓ nhËn trang bÞ")
		return
	end
	local nFactionId = GetLastFactionNumber() + 1
	local tbOpt = {}
	local tbSubFaction = %tbFaction[nFactionId].tbEquip
	for i=1, getn(tbSubFaction) do
		tinsert(tbOpt, {tbSubFaction[i].szFaction, show_equip, {nFactionId, i}})
	end
	tinsert(tbOpt, {"Trë vÒ.", dialog_main})
--	tinsert(tbOpt, {"
	tinsert(tbOpt, {"KOt thóc ®èi tho¹i."})
	CreateNewSayEx("<npc>Xin mêi lùa chän ph¸i.", tbOpt)
end

function show_equip(nFactionId, nSubFactionId)
	local tbEquip = %tbFaction[nFactionId]["tbEquip"][nSubFactionId]
	local tbEquipName = tbEquip["tbEquipName"]
	local nFirstEquipId = tbEquip["nFirstEquipId"]
	local tbOpt = {}
	for i=1, getn(tbEquipName) do
		tinsert(tbOpt, {tbEquipName[i], get_equip, {i, nFirstEquipId + i - 1}})
	end
	tinsert(tbOpt, {"Trë vÒ", show_faction})
	tinsert(tbOpt, {"KOt thóc ®èi tho¹i."})
	local szTitle = format("<npc>LÊy ®å %s Kim ¤", tbEquip.szFaction)
	CreateNewSayEx(szTitle, tbOpt)
end

function get_equip(nIndex, nEquipId)
	local nWidth = %tbEquipFreeCell[nIndex][1]
	local nHeigth = %tbEquipFreeCell[nIndex][2]
	if CountFreeRoomByWH(nWidth, nHeigth) < 1 then
		Talk(1, "", format("CÇn Ut nhÊt 1 c¸i %dx%d tói ®eo l­ng", nWidth, nHeigth))
		return
	end
	AddGoldItem(0, nEquipId)
end

function show_item()
	local tbOpt = {}
	local nCount = getn(%tbFreeItem)
	local szOption = ""
	for i=1, nCount-1 do
		szOption = format("NhËn %s", %tbFreeItem[i].szName)
		tinsert(tbOpt, {szOption, get_item, {i}})
	end
	szOption = format("NhËn %s", %tbFreeItem[nCount].szName)
	tinsert(tbOpt, {szOption, get_single_item, {nCount}})
	tinsert(tbOpt, {"NhËn cùc phÈm giíi chØ...", get_normal_item})
	tinsert(tbOpt, {"Trë vÒ.", dialog_main})
	tinsert(tbOpt, {"KOt thóc ®èi tho¹i."})
	CreateNewSayEx("<npc>l·o phu n¬i nµy ca h¬i thë nham vËt phÈm nh­ng nhËn lÊy", tbOpt)
end


function get_normal_item()
	local tbOpt =
	{
		{"NhËn 5 viªn KNB.", cszb},
		{"H­ng Bang Chi Giíi", xb_jz},
		{"TrÊn Nh¹c Chi Giíi", zy_jz},
		{"Th­îng Ph­¬ng Chi Giíi", sf_jz},
		{"Thiªn Hµ Giíi", sh_jz},
		{"§O Hoµng Chi Giíi", dh_jz},
		{"Thiªn Tö Chi Giíi", tz_jz},
		{"ThO Tóc Toµn Giíi", sz_jz},
		{"Cµn Kh«n Giíi ChØ (Cùc phÈm)", jz08},
		{"L·nh B¸ Nguyªn Méng Chi Giíi (Míi)", jz08x},
		{"Trë vÒ.", namcung2},
		{"KOt thóc ®èi tho¹i."},
	}
	CreateNewSayEx("<npc>L·o phu ca mét sè man cùc phÈm, ng­êi cÇn thøc g× ?", tbOpt)
end

function fifong()
	local tbOpt =
	{
		{"V©t phÈm hæ trî", hotrothem},
		{"Phi phong", phiphong},
		{"MÆt n¹", matna},
		{"Ên", an},
		{"Trang søc", trangsuc1},
		{"Vò liÖt", vuliet},
		{"Huynh ®Ö", huynhde},
		{"Cè s¬n", coson},
		{"D­¬ng thÇn", duongthan},
		{"Trë l¹i", namcung2},
		{"Tho¸t"},
	}
	CreateNewSayEx("<npc>Chän item", tbOpt)
end

function hotrothem()
	local szTitle = "<npc>Xin ®¹i hiªp chän l÷a "
	local tbOpt =
	{
		{"§¸ Ðp ®å.", daep},
		{"LÊy item bang héi.", banghoi},
		{"ThÇn bÝ kho¸ng th¹ch.", tbkt},
		{"Thuèc l¾c.", thuoclac},
		{"Ta muèn lÊy ®å B¹ch Hæ.", show_faction},	
		{"Ta muèn lÊy B¹ch Kim", bachkim},
		{"KÕt thóc ®èi tho¹i."},
	}
	CreateNewSayEx(szTitle, tbOpt)
end
function trangsuc()
	local tbOpt =
	{
		{"Trang søc 1", trangsuc1},
		{"Trang søc 2", trangsuc2},
		{"Trang søc 3", trangsuc3},
		{"Trë l¹i", namcung2},
		{"Tho¸t"},
	}
	CreateNewSayEx("<npc>Chän item", tbOpt)
end
function an23()
	local tbOpt =
	{
		{"Ên 1", an1},
		{"Ên 2", an2},
		{"Ên 3", an3},
		{"Ên 4", an4},
		{"Trë l¹i", namcung2},
		{"Tho¸t"},
	}
	CreateNewSayEx("<npc>Chän item", tbOpt)
end
function matna()
	local tbOpt =
	{
		{"MÆt n¹ 1", matna1},
		{"MÆt n¹ 2", matna2},
		{"MÆt n¹ 3", matna3},
		{"MÆt n¹ 4", matna4},
		{"MÆt n¹ 5", matna5},
		{"Trë l¹i", namcung2},
		{"Tho¸t"},
	}
	CreateNewSayEx("<npc>Chän item", tbOpt)
end
function trangthai()
	local tbOpt =
	{
		{"ChÝnh ph¸i", mauvang},
		{"Tµ ph¸i", mautim},
		{"Trung lËp", mauxanh},
		{"S¸t Thñ", maudo},
		{"Trë l¹i", namcung2},
		{"Tho¸t"},
	}
	CreateNewSayEx("<npc>Chän mµu", tbOpt)
end
function mauvang()
		SetCurCamp(1)
		SetCamp(1)
end
function mautim()
		SetCurCamp(2)
		SetCamp(2)	
end
function mauxanh()
		SetCurCamp(3)
		SetCamp(3)	
end
function maudo()
		SetCurCamp(4)
		SetCamp(4)	
end
function an4()
	for i=5161,5197 do
	AddGoldItem(0, i)
	end
end
function an3()
	for i=5131,5161 do
	AddGoldItem(0, i)
end
end
function an2()
	for i=5098,5130 do
	AddGoldItem(0, i)
	end
end
function coson()
	AddGoldItem(0, 4441)
	AddGoldItem(0, 4445)
	AddGoldItem(0, 4449)
	AddGoldItem(0, 4453)
	AddGoldItem(0, 4457)
	AddGoldItem(0, 4461)
	AddGoldItem(0, 4465)
	AddGoldItem(0, 4469)
end
function huynhde()
	for i=4436,4437 do
	AddGoldItem(0, i)
end
	for i=4481,4482 do
	AddGoldItem(0, i)
end
end
function vuliet()
	for i=5208,5212 do
	AddGoldItem(0, i)
	end
end
function pro1()
	for i=430,441 do
	AddGoldItem(0, i)
	end
end
function dongsat()
for i=494,497 do
AddGoldItem(0, i)
end
for i=378,379 do
AddGoldItem(0, i)
end
end	
function duongthan()
for i=514,520 do
AddGoldItem(0, i)
end
end
function phiphong()
for i=3465,3490 do
AddGoldItem(0, i)
end
end
function an()
for i=3205,3234 do
AddGoldItem(0, i)
end
end
function trangsuc1()
for i=3542,3554 do
AddGoldItem(0, i)
end
for i=3491,3506 do
AddGoldItem(0, i)
end
end
function trangsuc2()
for i=5241,5261 do
AddGoldItem(0, i)
end
end
function trangsuc3()
	for i=5262,5289 do
	AddGoldItem(0, i)
	end
end
---Hoan kim mon phai.
function sethkmp()
	local tab_Content = {
		"Rêi khái/no",
		"ThiÕu L©m quyÒn/#sethkmp1(1)",
		"ThiÕu L©m c«n/#sethkmp1(2)",
		"ThiÕu L©m ®ao/#sethkmp1(3)",
		"Thiªn V­¬ng chïy/#sethkmp1(4)",
		"Thiªn V­¬ng th­¬ng/#sethkmp1(5)",
		"Thiªn V­¬ng ®ao/#sethkmp1(6)",
		"Nga My kiÕm/#sethkmp1(7)",
		"Nga My ch­ëng/#sethkmp1(8)",
		"Nga My buff/#sethkmp1(9)",
		"Thóy Yªn ®ao/#sethkmp1(10)",
		"Thóy Yªn song ®ao/#sethkmp1(11)",
		"Ngò §éc ch­ëng/#sethkmp1(12)",
		"Ngò §éc ®ao/#sethkmp1(13)",
		"Ngò §éc bïa/#sethkmp1(14)",
		"Trang sau/sethkmp2",
		
	}
	Say("Xin chµo <color=yellow>"..GetName().."<color>, h·y chän chøc n¨ng mµ b¹n muèn", getn(tab_Content), tab_Content);
end
function sethkmp2()
	local tab_Content = {
		"Rêi khái/no",
		"§­êng M«n phi ®ao/#sethkmp1(15)",
		"§­êng M«n tô tiÔn/#sethkmp1(16)",
		"§­êng M«n phi tiªu/#sethkmp1(17)",
		"§­êng M«n bÉy/#sethkmp1(18)",
		"C¸i Bang rång/#sethkmp1(19)",
		"C¸i Bang bæng/#sethkmp1(20)",
		"Thiªn NhÉn kÝch/#sethkmp1(21)",
		"Thiªn NhÉn ®ao/#sethkmp1(22)",
		"Thiªn NhÉn bïa/#sethkmp1(23)",
		"Vâ §ang khÝ /#sethkmp1(24)",
		"Vâ §ang kiÕm/#sethkmp1(25)",
		"C«n L«n ®ao/#sethkmp1(26)",
		"C«n L«n kiÕm/#sethkmp1(27)",
		"C«n L«n bïa/#sethkmp1(28)",
	}
	Say("Xin chµo <color=yellow>"..GetName().."<color>, h·y chän chøc n¨ng mµ b¹n muèn", getn(tab_Content), tab_Content);
end
function sethkmp1(nId)
	for i=1,5 do AddGoldItem(0,5*nId+i-5) end
end
--xich lan
function setxl()
local tab_Content = {
	"Roi Khoi/no",
	"ThiÕu L©m quyÒn/#setxl1(1)",
	"ThiÕu L©m bæng/#setxl1(2)",
	"ThiÕu L©m ®ao/#setxl1(3)",
	"Thiªn V­¬ng chïy/#setxl1(4)",
	"Thiªn V­¬ng th­¬ng/#setxl1(5)",
	"Thiªn V­¬ng ®ao/#setxl1(6)",
	"Nga My kiÕm/#setxl1(7)",
	"Nga My ch­uong/#setxl1(8)",
	"Thóy Yªn ®ao/#setxl1(9)",
	"Thóy Yªn song ®ao/#setxl1(10)",
	"Ngò §äc ch­ëng/#setxl1(11)",
	"Ngò §äc ®ao/#setxl1(12)",
	"§­êng M«n phi ®ao/#setxl1(13)",
	"§­êng M«n tiÔn/#setxl1(14)",
	"Trang sau/setxl2",

}
Say("Xin chµo <color=yellow>"..GetName().."<color>, h·y chän chøc n¨ng mµ b¹n muèn", getn(tab_Content), tab_Content);
end
function setxl2()
local tab_Content = {
	"Roi Khoi/no",
	"Duong Mon Phi Tieu/#setxl1(15)",
	"Cai Bang Rong/#setxl1(16)",
	"Cai Bang Bong/#setxl1(17)",
	"Thien Nhan Kich/#setxl1(18)",
	"Thien Nhan Dao/#setxl1(19)",
	"Vo Dang Kiem/#setxl1(20)",
	"Vo Dang Quyen/#setxl1(21)",
	"Con Lon Dao/#setxl1(22)",
	"Con Lon Kiem/#setxl1(23)",
}
Say("Xin chµo <color=yellow>"..GetName().."<color>, h·y chän chøc n¨ng mµ b¹n muèn", getn(tab_Content), tab_Content);
end
function setxl1(nId)
for i=2515,2525 do AddGoldItem(0,10*nId+i-10) end
end
--cuc pham
function cpds()
	AddGoldItem(0,494)
	AddGoldItem(0,495)
	AddGoldItem(0,496)
	AddGoldItem(0,497)
end
--set minh phung
function setmp()
	local tab_Content = {
		"Roi Khoi/no",
		"Thieu Lam Quyen/#setmp1(1)",
		"Thieu Lam Bong/#setmp1(2)",
		"Thieu Lam Dao/#setmp1(3)",
		"Thien Vuong Chuy/#setmp1(4)",
		"Thien Vuong Thuong/#setmp1(5)",
		"Thien Vuong Dao/#setmp1(6)",
		"Nga My kiem/#setmp1(7)",
		"Nga My ch­uong/#setmp1(8)",
		"Thuy Yen Dao/#setmp1(9)",
		"Thuy yen Song Dao/#setmp1(10)",
		"Ngu Doc Chuong/#setmp1(11)",
		"Ngu Doc Dao/#setmp1(12)",
		"Duong Mon Phi Dao/#setmp1(13)",
		"Duong Mon No/#setmp1(14)",
		"Trang sau/setmp2",

	}
	Say("Xin chµo <color=yellow>"..GetName().."<color>, h·y chän chøc n¨ng mµ b¹n muèn", getn(tab_Content), tab_Content);
end
function setmp2()
local tab_Content = {
	"Roi Khoi/no",
	"Duong Mon Phi Tieu/#setmp1(15)",
	"Cai Bang Rong/#setmp1(16)",
	"Cai Bang Bong/#setmp1(17)",
	"Thien Nhan Kich/#setmp1(18)",
	"Thien Nhan Dao/#setmp1(19)",
	"Vo Dang Kiem/#setmp1(20)",
	"Vo Dang Quyen/#setmp1(21)",
	"Con Lon Dao/#setmp1(22)",
	"Con Lon Kiem/#setmp1(23)",

}
Say("Xin chµo <color=yellow>"..GetName().."<color>, h·y chän chøc n¨ng mµ b¹n muèn", getn(tab_Content), tab_Content);
end
function setmp1(nId)
for i=2745,2755 do AddGoldItem(0,10*nId+i-10) end
end
-- set song long 
function setsonglo()
	local tab_Content = {
		"Rêi khái/no",
		"ThiÕu L©m quyÒn/#setsonglo1(1)",
		"ThiÕu L©m c«n/#setsonglo1(2)",
		"ThiÕu L©m ®ao/#setsonglo1(3)",
		"Thiªn V­¬ng chïy/#setsonglo1(4)",
		"Thiªn V­¬ng th­¬ng/#setsonglo1(5)",
		"Thiªn V­¬ng ®ao/#setsonglo1(6)",
		"Nga My kiÕm/#setsonglo1(7)",
		"Nga My ch­ëng/#setsonglo1(8)",
		"Nga My buff/#setsonglo1(9)",
		"Thóy Yªn ®ao/#setsonglo1(10)",
		"Thóy Yªn song ®ao/#setsonglo1(11)",
		"Ngò §éc ch­ëng/#setsonglo1(12)",
		"Ngò §éc ®ao/#setsonglo1(13)",
		"Ngò §éc bïa/#setsonglo1(14)",
		"Trang sau/setsonglo2",
		
	}
	Say("Xin chµo <color=yellow>"..GetName().."<color>, h·y chän chøc n¨ng mµ b¹n muèn", getn(tab_Content), tab_Content);
end
function setsonglo2()
	local tab_Content = {
		"Rêi khái/no",
		"§­êng M«n phi ®ao/#setsonglo1(15)",
		"§­êng M«n tô tiÔn/#setsonglo1(16)",
		"§­êng M«n phi tiªu/#setsonglo1(17)",
		"§­êng M«n bÉy/#setsonglo1(18)",
		"C¸i Bang rång/#setsonglo1(19)",
		"C¸i Bang bæng/#setsonglo1(20)",
		"Thiªn NhÉn kÝch/#setsonglo1(21)",
		"Thiªn NhÉn ®ao/#setsonglo1(22)",
		"Thiªn NhÉn bïa/#setsonglo1(23)",
		"Vâ §ang khÝ /#setsonglo1(24)",
		"Vâ §ang kiÕm/#setsonglo1(25)",
		"C«n L«n ®ao/#setsonglo1(26)",
		"C«n L«n kiÕm/#setsonglo1(27)",
		"C«n L«n bïa/#setsonglo1(28)",
	}
	Say("Xin chµo <color=yellow>"..GetName().."<color>, h·y chän chøc n¨ng mµ b¹n muèn", getn(tab_Content), tab_Content);
end
function setsonglo1(nId)
for i=2975,2985 do AddGoldItem(0,10*nId+i-10) end
end
function cszb()
	AddEventItem(343)
	AddEventItem(343)
	AddEventItem(343)
	AddEventItem(343)
	AddEventItem(343)
end
function xb_jz()
	AddGoldItem(0, 508)
end	
function zy_jz()
	AddGoldItem(0, 509)
end	
function sf_jz()
	AddGoldItem(0, 510)
end	
function sh_jz()
	AddGoldItem(0, 511)
end	
function dh_jz()
	AddGoldItem(0, 530)
end	
function tz_jz()
	AddGoldItem(0, 531)
end	
function sz_jz()
	AddGoldItem(0, 498)
end	
function jz08()
	AddGoldItem(0, 3878)
end	
function jz08x()
	AddGoldItem(0, 3541)
end	


function goiboss()
	for i =1,10 do
		AddItem(6,1,1022,0,0,0)
	end
end
function xxxx()
	AddItem(6,1,1022,0,0,0)
	AddItem(6,1,2061,0,0,0)
	AddItem(6,1,30227,1,0,0)
	AddItem(6,1,2349,0,0,0)
	AddItem(6,1,2371,0,0,0)
	AddItem(6,1,2595,0,0,0)
	AddItem(6,1,30125,0,0,0)

	AddItem(6,1,3083,0,0,0)
	AddItem(6,1,3084,0,0,0)
	AddItem(6,1,3085,0,0,0)

-------phientoan

AddItem(6,1,1308,0,0,0)
AddItem(6,1,1309,0,0,0)
AddItem(6,1,1310,0,0,0)

AddItem(6,1,2127,0,0,0)
AddItem(6,1,2160,0,0,0)
AddItem(6,1,2161,0,0,0)

AddItem(6,1,2162,0,0,0)
AddItem(6,1,398,0,0,0)
AddItem(6,1,1309,0,0,0)




--caythong
AddItem(6,1,2207,0,0,0)
AddItem(6,1,2294,0,0,0)

AddItem(6,1,1345,0,0,0)
AddItem(6,1,1986,0,0,0)
AddItem(6,1,2219,0,0,0)

AddItem(6,1,30074,0,0,0)

--banhsinhnhat

	AddItem(6,1,2859,0,0,0)
	AddItem(6,1,2860,0,0,0)
	AddItem(6,1,2861,0,0,0)
	AddItem(6,1,2862,0,0,0)
	AddItem(6,1,2863,0,0,0)
	AddItem(6,1,2867,0,0,0)
	AddItem(6,1,30094,0,0,0)
--giangsinh
AddItem(6,1,3378,0,0,0)
AddItem(6,1,3379,0,0,0)
AddItem(6,1,3384,0,0,0)
AddItem(6,1,3385,0,0,0)
AddItem(6,1,3398,0,0,0)
AddItem(6,1,3410,0,0,0)
AddItem(6,1,3414,0,0,0)
AddItem(6,1,3437,0,0,0)
AddItem(6,1,3438,0,0,0)
	
end
function get_item(nIndex)
	local nMaxCount = CalcFreeItemCellCount()
	g_AskClientNumberEx(0, nMaxCount, "Xin mêi ®­a vµo nhËn lÊy", {get_item_back, {nIndex}})
end

function get_item_back(nIndex, nCount)
	if nCount <= 0 then
		return
	end
	if CalcFreeItemCellCount() < nCount then
		Talk(1, "", format("CÇn Ut nhÊt <color=yellow>%d<color> tói kh«ng gian...", nCount))
		return
	end
	local szLogTitle = format("[liguan]get_free_item_%s", %tbFreeItem[nIndex].szName)
	tbAwardTemplet:GiveAwardByList(%tbFreeItem[nIndex], szLogTitle, nCount)
end
function banhtrungthu()

--long den
AddItem(6,1,1245,0,0,0)
AddItem(6,1,1246,0,0,0)
AddItem(6,1,1243,0,0,0)
AddItem(6,1,1244,0,0,0)
AddItem(6,1,1242,0,0,0)
AddItem(6,1,1241,0,0,0)
--gianhsinh
AddItem(6,1,4209,0,0,0)
AddItem(6,1,4210,0,0,0)
AddItem(6,1,4211,0,0,0)
AddItem(6,1,4212,0,0,0)

--banh sinh nhat
AddItem(6,1,2256,0,0,0)
AddItem(6,1,2255,0,0,0)
AddItem(6,1,2662,0,0,0)
AddItem(6,1,2663,0,0,0)
AddItem(6,1,2664,0,0,0)
AddItem(6,1,2665,0,0,0)
AddItem(6,1,4114,0,0,0)




end

function abcxyz()
	n_title = 81
	local nServerTime = GetCurServerTime()+ 1728000; --20*24*60*60
	local nDate = FormatTime2Number(nServerTime);
	local nDay = floor(mod(nDate,1000000) / 10000);
	local nMon = mod(floor(nDate / 1000000) , 100)
	local nTime = nMon * 1000000 + nDay * 10000 
	Title_AddTitle(n_title, 2, nTime)
	Title_ActiveTitle(n_title)
end
function abcxyz1()
	n_title = 154
	local nServerTime = GetCurServerTime()+ 1728000; --20*24*60*60
	local nDate = FormatTime2Number(nServerTime);
	local nDay = floor(mod(nDate,1000000) / 10000);
	local nMon = mod(floor(nDate / 1000000) , 100)
	local nTime = nMon * 1000000 + nDay * 10000 
	Title_AddTitle(n_title, 2, nTime)
	Title_ActiveTitle(n_title)
end
function abcxyz2()
	n_title = 255
	local nServerTime = GetCurServerTime()+ 1728000; --20*24*60*60
	local nDate = FormatTime2Number(nServerTime);
	local nDay = floor(mod(nDate,1000000) / 10000);
	local nMon = mod(floor(nDate / 1000000) , 100)
	local nTime = nMon * 1000000 + nDay * 10000 
	Title_AddTitle(n_title, 2, nTime)
	Title_ActiveTitle(n_title)
end
function get_single_item(nIndex)
	local tbItem = %tbFreeItem[nIndex]
	if CountFreeRoomByWH(tbItem.nWidth, tbItem.nHeigth) < 1 then
		Talk(1, "", format("CÇn Ut nhÊt 1 %dx%d µÄ±³°ü¿O¼ä", tbItem.nWidth, tbItem.nHeigth))
		return
	end
	local szLogTitle = format("[liguan]get_free_item_%s", tbItem.szName)
	tbAwardTemplet:GiveAwardByList(tbItem, szLogTitle)
end

function clear_attibute_point()
	local tbOpt =
	{
		{"TÈy ®iÓm kü n¨ng", clear_skill},
		{"TÈy ®iÓm tiÒm n¨ng", clear_prop},
		{"Trë vÒ", namcung2},
		{"KOt thóc ®èi tho¹i."},
	}
	CreateNewSayEx("<npc>Ng­¬i quyOt u muèn tÈy tñy?", tbOpt)
end

function clear_skill()
	local tbOpt =
	{
		{"X¸c nhËn", do_clear_skill},
		{"§Ó ta suy nghÜ l¹i."},
		{"Trë vÒ", clear_attibute_point},
	}
	CreateNewSayEx("<npc>Ng­¬i vÉn quyOt u muèn tÈy tñy?", tbOpt)
end

function do_clear_skill()
	local i = HaveMagic(210)		-- Çá¹¦ÁíÍâ²Ù×÷
	local j = HaveMagic(400)		-- ¡°½Ù¸»¼ÃÆ¶¡±ÁíÍâ²Ù×÷
	local n = RollbackSkill()		-- Çå³ý¼¼ÄÜ²¢·µ»ØËùÓÐ¼¼ÄÜ?ã£¨°üÀ¨Çá¹¦µÈÌØÊâ¼¼ÄÜ£?
	local x = 0
	if (i ~= -1) then i = 1; x = x + i end		-- ÕâÁ½¾äÅÐ¶ÏÊÇÅÅ³ý´ÓÎ´Ñ§¹ýÇá¹¦µÄÈË·µ»Ø-1´Ó¶øµ¼ÖÂµãÊý¼ÆËã´íÎóÇé¿ö
	if (j ~= -1) then x = x + j end
	local rollback_point = n - x			-- °Ñ¼¼ÄÜµãµ±×ö¿ÕÏÐµãÊý·µ»¹£¬µ«ÏÈ?Û³ýÇá¹¦µ?
	if (rollback_point + GetMagicPoint() < 0) then		-- Èç¹ûÏ´³ÉÁË¸ºÊý£¬Ôòµ±×÷0£¨ÎªÒÔºó¶à´ÎÏ´µã±£?ô£?
		 rollback_point = -1 * GetMagicPoint()
	end
	AddMagicPoint(rollback_point)
	if (i ~= -1) then AddMagic(210, i) end			-- Èç¹ûÑ§¹uÇá¹¦Ô?¼Ó»ØÔ­ÓÐµÈ¼¶
	if (j ~= -1) then AddMagic(400, j) end			-- Èç¹ûÑ§¹u¡°½Ù¸»¼AÆ¶¡±Í¬Ñù´¦Àí
	Msg2Player("TÈy tñy thµnh c«ng! Ng­¬i ca "..rollback_point.." ®iÓm kü n¨ng ®Ó ph©n phèi l¹i.")
	KickOutSelf()
end

function clear_prop()
	local tbOpt =
	{
		{"X¸c nhËn", do_clear_prop},
		{"§Ó ta suy nghÜ l¹i."},
		{"Trë vÒ", clear_attibute_point},
	}
	CreateNewSayEx("<npc>Ng­¬i vÉn quyOt u muèn tÈy tñy?", tbOpt)
end

function do_clear_prop()
	local base_str = {35,20,25,30,20}			-- ÎåÐÐÈËÎïµÄÌìÉúÊôÐÔÖµ
	local base_dex = {25,35,25,20,15}
	local base_vit = {25,20,25,30,25}
	local base_eng = {15,25,25,20,40}
	local player_series = GetSeries() + 1

	local Utask88 = GetTask(88)
	AddStrg(base_str[player_series] - GetStrg(1) + GetByte(Utask88, 1))			-- ½«ÒÑ·ÖÅäÇ±ÄÜÖØÖÃ£¨task(88)ÊÇÈÎÎñÖÐÖ±½Ó½±ÀøµÄÁ¦Á¿¡¢Éí·¨µÈ£©
	AddDex(base_dex[player_series] - GetDex(1) + GetByte(Utask88, 2))
	AddVit(base_vit[player_series] - GetVit(1) + GetByte(Utask88, 3))
	AddEng(base_eng[player_series] - GetEng(1) + GetByte(Utask88, 4))
end

function write_info()
	tbInputDialog:InputServer()
end