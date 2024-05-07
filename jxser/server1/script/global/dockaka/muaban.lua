Include("\\script\\global\\gift\\gift.lua")
Include("\\script\\tagnewplayer\\tbitemHK.lua");
Include("\\script\\global\\namcung\\top5.lua")
Include("\\script\\global\\namcung\\namcung_say.lua")
nclude("\\script\\global\\dockaka\\muaban.lua")
Include("\\script\\activitysys\\npcdailog.lua")
Include("\\script\\event\\chunjie_jieri\\200901\\fulushou\\findnpc_head.lua");	-- 
Include("\\script\\global\\olympics_award.lua")
Include("\\script\\global\\repute_head.lua")
Include("\\script\\misc\\league_cityinfo.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\global\\rename_head.lua")
Include("\\script\\tong\\tong_mix.lua")

adm ={"3"}
function main()
	dofile("script/global/Â·ÈË_Àñ¹Ù.lua")
	-- for i = 4383,4383+2 do
	-- AddStackItem(200,6,1,i,1,0,0);
	-- end
	-- LoadScript("/script/global/Â·ÈË_Àñ¹Ù.lua")
			ttk = mod(GetTask(81),16)
			vlmt = mod(GetTask(80),16)
	local bilTbOp = {}	
	tinsert(bilTbOp, "Mua ThÇn dia Phï (50 V¹n)/MuaThanHanh")
	tinsert(bilTbOp, "Ho¹t ®éng cöa hµng/shopkv")
	--tinsert(bilTbOp, "XuÊt s­ - §çi mµu PK (10 v¹n)/trangthai")
	--tinsert(bilTbOp, "50 bé lªnh bµi phi tèc (100 v¹n)/lenhbaiphitoc50")
	--tinsert(bilTbOp, "LËp bang héi/dmcreattongtest")
	--tinsert(bilTbOp, "§çi trang bÞ an bang/doianbang")
	--tinsert(bilTbOp, "Hñy trang bÞ khãa/deltem")

	for i = 1,getn(adm) do
	if (GetAccount() == adm[i] ) then
		tinsert(bilTbOp, "LÖnh bµi adm/lb_adm");
	end
	end;
		tinsert(bilTbOp, "KÕt thóc ®èi tho¹i/thoat")
	Say("Xin chµo <color=yellow>"..GetName().."<color> \r§· sö dông\nVâ l©m mËt tÞch : "..vlmt.."\nTÈy tñy kinh  : "..ttk.."", getn(bilTbOp), bilTbOp)
	
end		

function doianbang()
	local tab_Content = {
		"An Bang B¨ng Tinh Th¹ch H¹ng Liªn/#doianbang1(1)",
		"An Bang Cóc Hoa Th¹ch ChØ hoµn/#doianbang1(2)",
		"An Bang §iÒn Hoµng Th¹ch Ngäc Béi/#doianbang1(3)",
		"An Bang Kª HuyÕt Th¹ch Giíi ChØ/#doianbang1(4)",
		"Rêi khái/no",
	}
	Say("Xin chµo <color=yellow>"..GetName().."<color><enter><color=red>§çi trang bÞ an bang h¹n sö dông 30 ngµy<color>", getn(tab_Content), tab_Content);
end
function doianbang1(a)
local dc = CalcEquiproomItemCount(6,1,4383,-1);
local nb = CalcEquiproomItemCount(6,1,4384,-1);
local n = CalcEquiproomItemCount(6,1,4385,-1);

if a ==1 then
if dc < 100 then Talk(1,"","b¹n kh«ng ®ñ 100 m¶nh an bang h¹ng liªn") return end
if (ConsumeEquiproomItem(100, 6,1, 4383, -1) == 1) then
local Index =AddGoldItem(0,164) ITEM_SetExpiredTime(Index,24*60*30) SyncItem(Index) SetItemBindState(Index, 0);
end
end

if a ==3 then
if nb < 100 then Talk(1,"","b¹n kh«ng ®ñ 100 m¶nh an bang ngäc béi") return end
if (ConsumeEquiproomItem(100, 6,1, 4384, -1) == 1) then
local Index =AddGoldItem(0,166) ITEM_SetExpiredTime(Index,24*60*30) SyncItem(Index) SetItemBindState(Index, 0);
end
end

if a == 2 or a == 4 then
if n < 100 then Talk(1,"","b¹n kh«ng ®ñ 100 m¶nh an bang giíi chØ") return end
if (ConsumeEquiproomItem(100, 6,1, 4385, -1) == 1) then
if a == 2 then
local Index =AddGoldItem(0,165) ITEM_SetExpiredTime(Index,24*60*30) SyncItem(Index) SetItemBindState(Index, 0);
elseif a == 4 then
local Index =AddGoldItem(0,167) ITEM_SetExpiredTime(Index,24*60*30) SyncItem(Index) SetItemBindState(Index, 0);
end
end
end

end

function lenhbaiphitoc50()
sotien=100*10000;
if(GetCash()<sotien) then
Talk(1,"","B¹n kh«ng ®ñ 100 v¹n l­îng")
return
end
if(Pay(sotien))then
AddStackItem(50,6,1,157,1,0,0)
AddStackItem(50,6,1,190,1,0,0)
end
end

function shopkv()
	CreateStores();
	AddShop2Stores(166,"Ho¹t ®éng cöa hµng ", 1, 100, "fBuyCallBack(%d,%d)"); 
	OpenStores();
end
	function fBuyCallBack(nItemIdx, nPrice)
	local nCount = 1
	local itemgenre, itemdetail, itemParticular = GetItemProp(nItemIdx)
	if itemgenre == 6 and itemdetail == 1 and itemParticular == 2317 then
		-- ÊÔÁ¶Ìû
		AddStatData("jlxiaohao_shiliantiegoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 2355 then
		-- ÐþÌì½õÄÒ
		AddStatData("jlxiaohao_xuantiangoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 2369 then
		-- Çà¾ÔÁî
		AddStatData("jlxiaohao_qingjulinggoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 2353 then
		-- ÔÆÂ¹Áî
		AddStatData("jlxiaohao_yunlulinggoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 2352 then
		-- ²ÔÀÇÁî
		AddStatData("jlsxiaohao_canglanglinggoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 2351 then
		-- ÐþÔ³Áî
		AddStatData("jlxiaohao_xuanyuanlinggoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 2350 then
		-- ×ÏòþÁî
		AddStatData("jlxiaohao_zimanglinggoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 2744 then
		-- ÈçÒâÔ¿³×
		AddStatData("jlxiaohao_ruyiyaoshigoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 1617 then
		-- Ñ×µÛÁî
		AddStatData("jlxiaohao_yandilinggoumai", nCount)
	end											
	return 1
end
function lb_adm()
	local tbItem = {szName="lb adm", tbProp={6,1,4379,1,0,0}, nBindState=-2}
	tbAwardTemplet:GiveAwardByList(tbItem, "add item", 1)
end
function trangthai()
	local tbOpt =
	{
		{"ChÝnh ph¸i", mauvang},
		{"Tµ ph¸i", mautim},
		{"Trung lËp", mauxanh},
		{"S¸t Thñ", maudo},
		-- {"Trë l¹i", namcung2},
		{"Tho¸t"},
	}
	CreateNewSayEx("<npc>Chän mµu", tbOpt)
end
function mauvang()
if GetCash() < 10000 then
return
Talk(1,"","B¹n kh«ng ®ñ 10 v¹n l­îng")
end
Pay(10000)
		SetCurCamp(1)
		SetCamp(1)
end
function mautim()
if GetCash() < 10000 then
return
Talk(1,"","B¹n kh«ng ®ñ 10 v¹n l­îng")
end
Pay(10000)
		SetCurCamp(2)
		SetCamp(2)	
end
function mauxanh()
if GetCash() < 10000 then
return
Talk(1,"","B¹n kh«ng ®ñ 10 v¹n l­îng")
end
Pay(10000)
		SetCurCamp(3)
		SetCamp(3)	
end
function maudo()
if GetLevel() >= 60 then
if GetCash() < 100000 then
Talk(1,"","B¹n kh«ng ®ñ 10 v¹n l­îng")
return
else
Pay(10000)
		SetCurCamp(4)
		SetCamp(4)	
end
else
Talk(1,"","CÊp 60 trë lªn míi cã thÓ xuÊt s­")
end
end

function guitienbang()
--local szTongName, nTongID = GetTongName(); 
--if (nTongID == 0 or ( GetTongFigure() ~= TONG_MASTER and GetTongFigure() ~= TONG_ELDER)) then 
--Say("Bang chñ hoÆc tr­ëng l·o míi cã thÓ sö dông chøc n¨ng nµy !", 0); 
--return
--end 
if (GetTongMaster() == "") then 
Talk(1,"","B¹n ch­a cã bang héi")
return 1
end;
	local szTitle = "<npc>Chµo mõng b¹n ®Õn víi hÖ thèng <color=yellow>Vâ L©m TruyÒn Kú<color> - <color=green>C«ng Thµnh ChiÕn<color>"
	local Opt = 
	{	
		
		{"Göi tiÒn 100 v¹n", guitien10},
		{"Göi tiÒn 500 v¹n", guitien50},
		{"Göi tiÒn 1000 v¹n", guitien100},
		{"KÕt thóc ®èi tho¹i. ", End}
	}
	CreateNewSayEx(szTitle,Opt)
end
-- function sotiengui()
			-- if (GetTongMaster() == "") then 
					-- Talk(1,"","<color=red>Ch­a gia nhËp !<color>")
		-- return 1
	-- end;
	-- local sltien = GetCash()
	-- local nMaxCount = CalcFreeItemCellCount()
	-- g_AskClientNumberEx(0,sltien, "NhËp sè tiÒn!", {sotiengui1, {num}})
-- end
-- function sotiengui1(num)
	-- local sltien = GetCash()
	-- local szMember = GetName()
	-- local _, nTongID = GetTongName()
	-- if(num > sltien) then
		-- Say("§¹i hiÖp kh«ng mang ®ñ: "..num.." l­îng")
		-- return
		-- end
	-- szMsg = szMember.." ®· ®ãng gãp "..num.." l­îng vµo ng©n quü bang héi"
	-- Msg2Tong(nTongID, szMsg)
	-- TONG_ApplyAddMoney(nTongID, num)
	-- Pay(num)
-- end
function guitien10(num)
	local sltien = GetCash()
	local nAdd = 1000000
	local szMember = GetName()
	local _, nTongID = GetTongName()
	if(sltien < nAdd) then
		Say("§¹i hiÖp kh«ng mang ®ñ: "..nAdd.." l­îng")
		return
		end
	szMsg = szMember.." ®· ®ãng gãp "..nAdd.." l­îng vµo ng©n quü bang héi"
	Msg2Tong(nTongID, szMsg)
	TONG_ApplyAddMoney(nTongID, nAdd)
	Pay(nAdd)
end

function guitien50()
	local sltien = GetCash()
	local nAdd = 5000000
	local szMember = GetName()
	local _, nTongID = GetTongName()
	if(sltien < nAdd) then
		Say("§¹i hiÖp kh«ng mang ®ñ: "..nAdd.." l­îng")
		return
		end
	szMsg = szMember.." ®· ®ãng gãp "..nAdd.." l­îng vµo ng©n quü bang héi"
	Msg2Tong(nTongID, szMsg)
	TONG_ApplyAddMoney(nTongID, nAdd)
	Pay(nAdd)
end

function guitien100()
	local sltien = GetCash()
	local nAdd = 10000000
	local szMember = GetName()
	local _, nTongID = GetTongName()
	if(sltien < nAdd) then
		Say("§¹i hiÖp kh«ng mang ®ñ: "..nAdd.." l­îng")
		return
		end
	szMsg = szMember.." ®· ®ãng gãp "..nAdd.." l­îng vµo ng©n quü bang héi"
	Msg2Tong(nTongID, szMsg)
	TONG_ApplyAddMoney(nTongID, nAdd)
	Pay(nAdd)
end

function Nhap_Code()
	if GetTask(3932) == 1  then
		Talk(1, "", "Ng­¬i ®· nhËn code råi mau ®i luyÖn tËp thªm ®i.")
		return
	end
	if GetLevel() < 10 then
		Talk(1, "", "Ta lµ ng­êi tæ chøc c¸c sù kiÖn! h·y di luyÖn ®Õn cÊp 10 råi t×m ta nhËn th­ëng.")
		return
	end
	--local strFaction = GetFaction()
	--if (tbItemHK[strFaction] == nil) then
		--Talk(1, "", "Ng­¬i lµ ai ? kh«ng thuéc ph¸i nµo th× ®i ®i ! ta kh«ng xem träng v« danh tiÓu tèt !.")
		--return
	--end
	CodeStrings()
end

function Hotro_Skills()
	if GetTask(3932) ~= 1  then
		Talk(1, "", "Ng­¬i h·y nhËn code t©n thñ råi ®Õn t×m ta !.")
		return
	end
	if GetTask(3933) == 1  then
		Talk(1, "", "Ng­¬i ®· cã danh tiÕng trªn giang hå råi mau ®i luyÖn tËp thªm ®i.")
		return
	end
	if GetLevel() < 80 then
		Talk(1, "", "h·y di luyÖn ®Õn cÊp 10 råi t×m ta nhËn th­ëng.")
		return
	end
	local strFaction = GetFaction()
	if (tbItemHK[strFaction] == nil) then
		Talk(1, "", "Ng­¬i lµ ai ? kh«ng thuéc ph¸i nµo th× ®i ®i ! ta kh«ng xem träng v« danh tiÓu tèt !.")
		return
	end

	HoTroSkill()
	Talk(1, "", "Chóc mõng ? Ng­êi ®· cã thÓ b«n tÈu giang hå råi h·y mau ®i ®i !.")

end

function MuaThanHanh()
	if (GetCash() <= 500000) then
		Talk(1, "", "Ph¶i ca ®ñ 50 v¹n míi ca thÓ mua.")
		return
	end
	Pay(500000)
	local tbItem = {szName="ThÇn hµnh phï", tbProp={6,1,438,1,0,0}, nBindState=-2,nExpiredTime = 43830}
	tbAwardTemplet:GiveAwardByList(tbItem, "ThÇn hµnh phï", 1)

end

function OnExit()
end


Include("\\script\\global\\lib\\serverlib.lua")

function xuatsu()
	local tb = {"<dec><npc>Ta lµ ng­êi cã thÓ gióp ng­¬i rêi bá m«n ph¸i mét c¸ch dÔ dµng, nÕu ng­¬i mang theo 10 v¹n."};
	Tong_name,oper = GetTong()
	if Tong_name == "" then 
		local nCamp = GetCamp();
		if nCamp ~= 4 then 
			tinsert(tb,"Ta muèn rêi khái s­ m«n/leave_sumon_change2killer");
		else
			tinsert(tb,"Ta muèn trë l¹i m«n ph¸i/back_sumon_change2normal");
		end
		tinsert(tb,"§Ó ta suy nghÜ thªm/cancel")
		CreateTaskSay(tb);
	else
		Talk(1,"","Ng­¬i ®ang cã bang héi h·y rêi khái bang héi råi ta míi cã thÓ gióp ng­¬i.")
	end
end

function leave_sumon_change2killer()
	if GetCash() >= 100000  then
		Pay(100000);
		SetCamp(4);
		SetCurCamp(4);
		Msg2Player("B¹n ®· rêi khái s­ m«n.")
	else
		Msg2Player(GetName().." ng­¬i kh«ng cã 10 v¹n ta kh«ng thÓ gióp ng­¬i")
	end
end

function back_sumon_change2normal()
	local nFaction = GetLastFactionNumber();
	local listcamp = {[0] = 1,[1] = 3,[2] = 3,[3] = 2,[4] = 1,[5] = 3,[6] = 1,[7] = 2, [8]= 1,[9] = 3};
	if GetCash() >= 500000  then
		Pay(500000);
		SetCamp(listcamp[nFaction]);
		SetCurCamp(listcamp[nFaction]);
		Msg2Player("B¹n ®· quay trë l¹i s­ m«n.")
	else
		Msg2Player(GetName().." ng­¬i kh«ng cã 50 v¹n ta kh«ng thÓ gióp ng­¬i")
	end
end

function cancel()
end

function dmcreattongtest()
local strTongName = GetTongName()
local tszTitle = "Chµo mõng b¹n ®· tham gia hÖ thèng <color=yellow>Bang Héi<color>"
if (strTongName == nil or strTongName == "") then
	Say(tszTitle,4,"T¹o bang héi/dmcreateit","KÕt thóc ®èi tho¹i")
else
	Say(tszTitle,0)
end	
end
function dmcreateit()
	Tong_name,oper = GetTong()
	if (oper == 0) and (GetTask(99) == 1) then
		Say("TiÕp tôc t¹o bang." ,2,"T¹o bang/Direct_CreateTong","Chß mét phót/wait_a_moment")
	elseif (oper == 0) and (GetCamp() == 4) and (GetLevel() >= 50) and (GetReputeLevel(GetRepute()) >= 6) and (GetLeadLevel() >= 30) and (HaveItem(195) == 1) then
		Talk(6,"create_pay", "Ng­êi ch¬i: KiÕm hiÖp ch­ëng m«n nh©n, xin hái ta ph¶i lµm nh­ thÕ nµo míi ca thÓ khai t«ng lËp ph¸i trë thµnh Bang chñ ®©y?", "KiÕm hiÖp ch­ëng m«n nh©n: §Çu tiªn ng­¬i ph¶i ca ®ñ n¨ng lùc l·nh ®¹o, ca 16 ng­êi cïng chU h­íng cïng ng­¬i lËp bang, tr¶i qua 3 ngµy Kh¶o NghiÖm Kú ", "Ch­ëng m«n nh©n:  NOu trong 3 ngµy ca ng­êi rêi bang th× néi trong 3 ngµy ®a ng­êi ph¶i t×m ng­êi kh¸c thay thO.", "Ch­ëng m«n nh©n:  Ng­¬i ph¶i ca ®ñ tµi l·nh ®¹o vµ tUn vËt ®a lµ Nh¹c V­¬ng KiOm", "Ng­êi ch¬i: Nh¹c V­¬ng KiOm ? Ng­êi nai lµ thanh kiOm nµy µ ? ", "KiOm hiÖp ch­ëng m«n nh©n : Th× ra lµ ng­¬i ®· ca na... Kh«ng tÖ, qu¶ nhiªn tuæi trÎ tµi cao!!! ")
	else	
		i = random(0,1)
		if (i == 0) then
			Talk(1,"", "KiÕm hiÖp ch­ëng m«n nh©n: nÕu nh­ t­ëng thµnh lËp chÝnh ®Ých bang héi, sÏ v× tha nç lùc ®¹i l­îng thêi gian tinh lùc d÷ t©m huyÕt, thiÕt bÊt kh¶ bá vë nöa chõng")
		else
			Talk(6,"", "KiÕm hiÖp ch­ëng m«n nh©n: ng­¬i vÊn thµnh lËp bang héi h÷u ®iÒu kiÖn g×, ta lai chËm r·i ®Ých gi¶ng cho ng­¬i nghe", "KiÕm hiÖp ch­ëng m«n nh©n: ®Çu tiªn ng­¬i ph¶i ®· xuÊt s­ ®éc lËp míi b­íc ch©n vµo giang hå; thø nh× ng­¬i kh«ng thÓ t¹i bÊt luËn c¸i g× bang héi trung; lÇn thø hai ng­¬i yÕu cã nhÊt ®Þnh ®Ých giang hå danh väng; tèi hËu cña ng­¬i chØ huy lùc bÊt n¨ng nhá 30 cÊp")
		end
	end
end
function create_pay()
	Say("Kiªm hiÖp ch­ëng m«n nh©n: Ng­¬i cÇn lÖ phi lµ 100 v¹n l­îng b¹c." ,2,"Kh«ng thµnh vÊn ®ª, ta ca ®em 100v l­îng ®©y! /create_pay_yes","H©y dµ, ta kh«ng ®em ®ñ tiªn råi. /create_pay_no")

--	Say("½£ÏµÕÆ·ÅÈË£ºÄÇ·´£¬ÄãÖ»ÒªÓÐ×ã¹»µÄ×Ê½ðÈ·°ïÅÉÄÜ¹»ÔË×ªÆðµ´¾Ý¿ÉÒÔ¸Ë£¬±ÈÈçËµÓÐ¸ö100Ýò¸½¸½×Ó°É¡£" ,2,"·»ÎÊî}£¬?ÒÒÑ¾­Ó?00Ýò¸½¸½×Ó¸Ë/create_pay_yes","Ì«·ÑÇ®?Ë£¬ÉïÒ»µãÐÐ²»Ð?create_pay_no")
end
function create_pay_yes()

	if (GetCash() >= 1000000) then
		Pay(1000000)				-- ÊÕ·Ñ
		DelItem(195)			-- É¾³ýÏµ¹Øµµ¾ß
		SetTask(99,1)				-- ²¢´òÉÏ±ê¼Ç£¨Ý¬Ê±¶¨ÒåÎª°ïÅÉÖÐµÄµóÒ»¸öÈË£¨¼´°ïÖ÷±¾ÈË£©£©
		Direct_CreateTong()		-- ¿ªÊ¼½¨°ï
		
	else
		Talk(1,"", "Kiªm hiÖp ch­ëng m«n nh©n: ViÖc duy tr× bang héi rÊt tèn ti?n, ng­êi ph¶i cè g¾ng cïng mäi ng­êi tUch gap ®Ó bang ®­îc giµu m¹nh. ")	end
end


function Direct_CreateTong()
	CreateTong(1)				-- µ¯³ö½¨°ï¶Ô»°¿ò£¬½áÊø½Å±¾¿ØÖÆ
end

function doiten()
	local szTitle = "<npc>Kiªm hiªp quÇn hïng chiªn nam h¶i, long tranh hæ ®Êu diÖu Cöu ch©u. Ta vèn sø gi¶ ®¹i biÓu t©y s¬n c­ ë chç nµy hoan nghªnh c¸c anh hïng hµo kiÖt...      Script LÔ Quan ®­îc ViÖt Haa bëi _khunglongcon_                      clbgamesvn.com"
	local tbSay = {}
	tinsert(tbSay,"KiÓm Tra Tªn./query_rolename")
	tinsert(tbSay,"§æi Tªn Ngay./change_rolename")
	--tinsert(tbSay,"Th­¬ng Lang Th¹ch[5 Thanh C©u Th¹ch + 2 v¹n trªn 1 th¹ch]./tlt")
	--tinsert(tbSay,"HuyÒn Viªn Th¹ch[7 Thanh C©u Th¹ch+2 v¹n trªn 1 th¹ch]./hvt")
	--tinsert(tbSay,"Tö M·ng Th¹ch[8 Thanh C©u Th¹ch + 2 v¹n trªn 1 th¹ch]./tmt")
	tinsert(tbSay,"Tho¸t./Quit")
	Say("<color=yellow>Sø gi¶ m«n ph¸i <color>: Tªn ph¶i h¬n 7 ký tù vµ rêi Bang héi!", getn(tbSay), tbSay,szTitle)
end


function query_rolename() 
AskClientForString("on_query_rolename", "", 6, 16, "<#> Ýt nhÊt lµ 7 ký tù "); 
end 

function on_query_rolename(new_name) 
QueryRoleName(new_name); 
end 



function change_rolename() 
if (CalcEquiproomItemCount(4, 417, 1, -1) < 200) then
Say("CÇn 200 xu ®Ó ®æi tªn nh©n vËt") 
return
end 
Say("<#> cô thÓ b­íc # rêi ®i bang héi , cïng NPC ®èi tho¹i , ®­a vµo cÇn söa ®æi nh©n vËt tªn , ng­¬i ®em tù ®éng c¸ch tuyÕn . 3 phót sau n÷a ®¨ng lôc , nÕu nh­ nh©n vËt tªn ®· ®æi , coi nh­ lµ ®æi tªn thµnh c«ng # nÕu nh­ kh«ng cã söa ®æi , mêi/xin ng­¬i thi hµnh trë lªn b­íc . nÕu nh­ xuÊt hiÖn mét Ýt hiÖn t­îng kú qu¸i , xin liªn l¹c GM gi¶i quyÕt .", 
2, 
"<#> b¾t ®Çu h¬n tªn /doi", 
"<#> ®Ó cho ta muèn muèn /cancel") 
end 

function doi() 
local _, nTongId = GetTongName() 
if (nTongId ~= 0) then 
Msg2Player(" <color=green> ®¹i hiÖp ®· cã bang héi , kh«ng thÓ tiÕn hµnh nªn thao t¸c !<color>") 
return 
end 
AskClientForString("ten", "", 1, 20, "<#>Ýt nhÊt lµ 7 ký tù "); 
end 

function ten(ne) 
if (ConsumeEquiproomItem(200, 4, 417, 1, -1) == 1) then
if (check_renamerole() == 0) then 
if (GetName() == ne) then 
Talk(1, "", "<#> muèn thay ®æi c¸i g× tªn ?") 
else 
RenameRole(ne); 
end 
end 
else
Say("CÇn 200 xu ®Ó ®æi tªn nh©n vËt") 
end
end 