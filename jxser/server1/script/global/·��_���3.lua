Include("\\script\\global\\gift\\gift.lua")
Include("\\script\\tagnewplayer\\tbitemHK.lua");
Include("\\script\\global\\namcung\\top5.lua")
Include("\\script\\global\\namcung\\namcung_say.lua")
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
	dofile("script/global/·��_���.lua")
	-- for i = 4383,4383+2 do
	-- AddStackItem(200,6,1,i,1,0,0);
	-- end
	-- LoadScript("/script/global/·��_���.lua")
			ttk = mod(GetTask(81),16)
			vlmt = mod(GetTask(80),16)
	local bilTbOp = {}	
	tinsert(bilTbOp, "Mua Th�n H�nh Ph� (50 V�n)/MuaThanHanh")
	tinsert(bilTbOp, "Mua Th� ��a ph� (50 V�n)/MuaThodia")
	tinsert(bilTbOp, "Ho�t ��ng c�a h�ng/shopkv")
	tinsert(bilTbOp, "Xu�t s� - ��i m�u PK (10 v�n)/trangthai")
	tinsert(bilTbOp, "50 b� l�nh b�i phi t�c (100 v�n)/lenhbaiphitoc50")
	tinsert(bilTbOp, "L�p bang h�i/dmcreattongtest")
	tinsert(bilTbOp, "��i trang b� an bang/doianbang")
	tinsert(bilTbOp, "H�y trang b� kh�a/deltem")

	for i = 1,getn(adm) do
	if (GetAccount() == adm[i] ) then
		tinsert(bilTbOp, "L�nh b�i adm/lb_adm");
	end
	end;
		tinsert(bilTbOp, "K�t th�c ��i tho�i/thoat")
	Say("Xin ch�o <color=yellow>"..GetName().."<color> \r�� s� d�ng\nV� l�m m�t t�ch : "..vlmt.."\nT�y t�y kinh  : "..ttk.."", getn(bilTbOp), bilTbOp)
	
end		

function doianbang()
	local tab_Content = {
		"An Bang B�ng Tinh Th�ch H�ng Li�n/#doianbang1(1)",
		"An Bang C�c Hoa Th�ch Ch� ho�n/#doianbang1(2)",
		"An Bang �i�n Ho�ng Th�ch Ng�c B�i/#doianbang1(3)",
		"An Bang K� Huy�t Th�ch Gi�i Ch�/#doianbang1(4)",
		"R�i kh�i/no",
	}
	Say("Xin ch�o <color=yellow>"..GetName().."<color><enter><color=red>��i trang b� an bang h�n s� d�ng 30 ng�y<color>", getn(tab_Content), tab_Content);
end
function doianbang1(a)
local dc = CalcEquiproomItemCount(6,1,4383,-1);
local nb = CalcEquiproomItemCount(6,1,4384,-1);
local n = CalcEquiproomItemCount(6,1,4385,-1);

if a ==1 then
if dc < 100 then Talk(1,"","b�n kh�ng �� 100 m�nh an bang h�ng li�n") return end
if (ConsumeEquiproomItem(100, 6,1, 4383, -1) == 1) then
local Index =AddGoldItem(0,164) ITEM_SetExpiredTime(Index,24*60*30) SyncItem(Index) SetItemBindState(Index, 0);
end
end

if a ==3 then
if nb < 100 then Talk(1,"","b�n kh�ng �� 100 m�nh an bang ng�c b�i") return end
if (ConsumeEquiproomItem(100, 6,1, 4384, -1) == 1) then
local Index =AddGoldItem(0,166) ITEM_SetExpiredTime(Index,24*60*30) SyncItem(Index) SetItemBindState(Index, 0);
end
end

if a == 2 or a == 4 then
if n < 100 then Talk(1,"","b�n kh�ng �� 100 m�nh an bang gi�i ch�") return end
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
Talk(1,"","B�n kh�ng �� 100 v�n l��ng")
return
end
if(Pay(sotien))then
AddStackItem(50,6,1,157,1,0,0)
AddStackItem(50,6,1,190,1,0,0)
end
end

function shopkv()
	CreateStores();
	AddShop2Stores(166,"Ho�t ��ng c�a h�ng ", 1, 100, "fBuyCallBack(%d,%d)"); 
	OpenStores();
end
	function fBuyCallBack(nItemIdx, nPrice)
	local nCount = 1
	local itemgenre, itemdetail, itemParticular = GetItemProp(nItemIdx)
	if itemgenre == 6 and itemdetail == 1 and itemParticular == 2317 then
		-- ������
		AddStatData("jlxiaohao_shiliantiegoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 2355 then
		-- �������
		AddStatData("jlxiaohao_xuantiangoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 2369 then
		-- �����
		AddStatData("jlxiaohao_qingjulinggoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 2353 then
		-- ��¹��
		AddStatData("jlxiaohao_yunlulinggoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 2352 then
		-- ������
		AddStatData("jlsxiaohao_canglanglinggoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 2351 then
		-- ��Գ��
		AddStatData("jlxiaohao_xuanyuanlinggoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 2350 then
		-- ������
		AddStatData("jlxiaohao_zimanglinggoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 2744 then
		-- ����Կ��
		AddStatData("jlxiaohao_ruyiyaoshigoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 1617 then
		-- �׵���
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
		{"Ch�nh ph�i", mauvang},
		{"T� ph�i", mautim},
		{"Trung l�p", mauxanh},
		{"S�t Th�", maudo},
		-- {"Tr� l�i", namcung2},
		{"Tho�t"},
	}
	CreateNewSayEx("<npc>Ch�n m�u", tbOpt)
end
function mauvang()
if GetCash() < 10000 then
return
Talk(1,"","B�n kh�ng �� 10 v�n l��ng")
end
Pay(10000)
		SetCurCamp(1)
		SetCamp(1)
end
function mautim()
if GetCash() < 10000 then
return
Talk(1,"","B�n kh�ng �� 10 v�n l��ng")
end
Pay(10000)
		SetCurCamp(2)
		SetCamp(2)	
end
function mauxanh()
if GetCash() < 10000 then
return
Talk(1,"","B�n kh�ng �� 10 v�n l��ng")
end
Pay(10000)
		SetCurCamp(3)
		SetCamp(3)	
end
function maudo()
if GetLevel() >= 60 then
if GetCash() < 100000 then
Talk(1,"","B�n kh�ng �� 10 v�n l��ng")
return
else
Pay(10000)
		SetCurCamp(4)
		SetCamp(4)	
end
else
Talk(1,"","C�p 60 tr� l�n m�i c� th� xu�t s�")
end
end

function guitienbang()
--local szTongName, nTongID = GetTongName(); 
--if (nTongID == 0 or ( GetTongFigure() ~= TONG_MASTER and GetTongFigure() ~= TONG_ELDER)) then 
--Say("Bang ch� ho�c tr��ng l�o m�i c� th� s� d�ng ch�c n�ng n�y !", 0); 
--return
--end 
if (GetTongMaster() == "") then 
Talk(1,"","B�n ch�a c� bang h�i")
return 1
end;
	local szTitle = "<npc>Ch�o m�ng b�n ��n v�i h� th�ng <color=yellow>V� L�m Truy�n K�<color> - <color=green>C�ng Th�nh Chi�n<color>"
	local Opt = 
	{	
		
		{"G�i ti�n 100 v�n", guitien10},
		{"G�i ti�n 500 v�n", guitien50},
		{"G�i ti�n 1000 v�n", guitien100},
		{"K�t th�c ��i tho�i. ", End}
	}
	CreateNewSayEx(szTitle,Opt)
end
-- function sotiengui()
			-- if (GetTongMaster() == "") then 
					-- Talk(1,"","<color=red>Ch�a gia nh�p !<color>")
		-- return 1
	-- end;
	-- local sltien = GetCash()
	-- local nMaxCount = CalcFreeItemCellCount()
	-- g_AskClientNumberEx(0,sltien, "Nh�p s� ti�n!", {sotiengui1, {num}})
-- end
-- function sotiengui1(num)
	-- local sltien = GetCash()
	-- local szMember = GetName()
	-- local _, nTongID = GetTongName()
	-- if(num > sltien) then
		-- Say("��i hi�p kh�ng mang ��: "..num.." l��ng")
		-- return
		-- end
	-- szMsg = szMember.." �� ��ng g�p "..num.." l��ng v�o ng�n qu� bang h�i"
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
		Say("��i hi�p kh�ng mang ��: "..nAdd.." l��ng")
		return
		end
	szMsg = szMember.." �� ��ng g�p "..nAdd.." l��ng v�o ng�n qu� bang h�i"
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
		Say("��i hi�p kh�ng mang ��: "..nAdd.." l��ng")
		return
		end
	szMsg = szMember.." �� ��ng g�p "..nAdd.." l��ng v�o ng�n qu� bang h�i"
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
		Say("��i hi�p kh�ng mang ��: "..nAdd.." l��ng")
		return
		end
	szMsg = szMember.." �� ��ng g�p "..nAdd.." l��ng v�o ng�n qu� bang h�i"
	Msg2Tong(nTongID, szMsg)
	TONG_ApplyAddMoney(nTongID, nAdd)
	Pay(nAdd)
end

function Nhap_Code()
	if GetTask(3932) == 1  then
		Talk(1, "", "Ng��i �� nh�n code r�i mau �i luy�n t�p th�m �i.")
		return
	end
	if GetLevel() < 10 then
		Talk(1, "", "Ta l� ng��i t� ch�c c�c s� ki�n! h�y di luy�n ��n c�p 10 r�i t�m ta nh�n th��ng.")
		return
	end
	--local strFaction = GetFaction()
	--if (tbItemHK[strFaction] == nil) then
		--Talk(1, "", "Ng��i l� ai ? kh�ng thu�c ph�i n�o th� �i �i ! ta kh�ng xem tr�ng v� danh ti�u t�t !.")
		--return
	--end
	CodeStrings()
end

function Hotro_Skills()
	if GetTask(3932) ~= 1  then
		Talk(1, "", "Ng��i h�y nh�n code t�n th� r�i ��n t�m ta !.")
		return
	end
	if GetTask(3933) == 1  then
		Talk(1, "", "Ng��i �� c� danh ti�ng tr�n giang h� r�i mau �i luy�n t�p th�m �i.")
		return
	end
	if GetLevel() < 80 then
		Talk(1, "", "h�y di luy�n ��n c�p 10 r�i t�m ta nh�n th��ng.")
		return
	end
	local strFaction = GetFaction()
	if (tbItemHK[strFaction] == nil) then
		Talk(1, "", "Ng��i l� ai ? kh�ng thu�c ph�i n�o th� �i �i ! ta kh�ng xem tr�ng v� danh ti�u t�t !.")
		return
	end

	HoTroSkill()
	Talk(1, "", "Ch�c m�ng ? Ng��i �� c� th� b�n t�u giang h� r�i h�y mau �i �i !.")

end

function MuaThanHanh()
	if (GetCash() <= 500000) then
		Talk(1, "", "Ph�i ca �� 50 v�n m�i ca th� mua.")
		return
	end
	Pay(500000)
	local tbItem = {szName="Th�n h�nh ph�", tbProp={6,1,1266,1,0,0}, nBindState=-2,nExpiredTime = 43830}
	tbAwardTemplet:GiveAwardByList(tbItem, "Th�n h�nh ph�", 1)

end
function MuaThodia()
	if (GetCash() <= 500000) then
		Talk(1, "", "Ph�i ca �� 50 v�n m�i ca th� mua.")
		return
	end
	Pay(500000)
	local tbItem = {szName="Th� ��a ph�", tbProp={6,1,438,1,0,0}, nBindState=-2,nExpiredTime = 43830}
	tbAwardTemplet:GiveAwardByList(tbItem, "Th� ��a ph�", 1)

end

function OnExit()
end


Include("\\script\\global\\lib\\serverlib.lua")

function xuatsu()
	local tb = {"<dec><npc>Ta l� ng��i c� th� gi�p ng��i r�i b� m�n ph�i m�t c�ch d� d�ng, n�u ng��i mang theo 10 v�n."};
	Tong_name,oper = GetTong()
	if Tong_name == "" then 
		local nCamp = GetCamp();
		if nCamp ~= 4 then 
			tinsert(tb,"Ta mu�n r�i kh�i s� m�n/leave_sumon_change2killer");
		else
			tinsert(tb,"Ta mu�n tr� l�i m�n ph�i/back_sumon_change2normal");
		end
		tinsert(tb,"�� ta suy ngh� th�m/cancel")
		CreateTaskSay(tb);
	else
		Talk(1,"","Ng��i �ang c� bang h�i h�y r�i kh�i bang h�i r�i ta m�i c� th� gi�p ng��i.")
	end
end

function leave_sumon_change2killer()
	if GetCash() >= 100000  then
		Pay(100000);
		SetCamp(4);
		SetCurCamp(4);
		Msg2Player("B�n �� r�i kh�i s� m�n.")
	else
		Msg2Player(GetName().." ng��i kh�ng c� 10 v�n ta kh�ng th� gi�p ng��i")
	end
end

function back_sumon_change2normal()
	local nFaction = GetLastFactionNumber();
	local listcamp = {[0] = 1,[1] = 3,[2] = 3,[3] = 2,[4] = 1,[5] = 3,[6] = 1,[7] = 2, [8]= 1,[9] = 3};
	if GetCash() >= 500000  then
		Pay(500000);
		SetCamp(listcamp[nFaction]);
		SetCurCamp(listcamp[nFaction]);
		Msg2Player("B�n �� quay tr� l�i s� m�n.")
	else
		Msg2Player(GetName().." ng��i kh�ng c� 50 v�n ta kh�ng th� gi�p ng��i")
	end
end

function cancel()
end

function dmcreattongtest()
local strTongName = GetTongName()
local tszTitle = "Ch�o m�ng b�n �� tham gia h� th�ng <color=yellow>Bang H�i<color>"
if (strTongName == nil or strTongName == "") then
	Say(tszTitle,4,"T�o bang h�i/dmcreateit","K�t th�c ��i tho�i")
else
	Say(tszTitle,0)
end	
end
function dmcreateit()
	Tong_name,oper = GetTong()
	if (oper == 0) and (GetTask(99) == 1) then
		Say("Ti�p t�c t�o bang." ,2,"T�o bang/Direct_CreateTong","Ch� m�t ph�t/wait_a_moment")
	elseif (oper == 0) and (GetCamp() == 4) and (GetLevel() >= 50) and (GetReputeLevel(GetRepute()) >= 6) and (GetLeadLevel() >= 30) and (HaveItem(195) == 1) then
		Talk(6,"create_pay", "Ng��i ch�i: Ki�m hi�p ch��ng m�n nh�n, xin h�i ta ph�i l�m nh� th� n�o m�i ca th� khai t�ng l�p ph�i tr� th�nh Bang ch� ��y?", "Ki�m hi�p ch��ng m�n nh�n: ��u ti�n ng��i ph�i ca �� n�ng l�c l�nh ��o, ca 16 ng��i c�ng chU h��ng c�ng ng��i l�p bang, tr�i qua 3 ng�y Kh�o Nghi�m K� ", "Ch��ng m�n nh�n:  NOu trong 3 ng�y ca ng��i r�i bang th� n�i trong 3 ng�y �a ng��i ph�i t�m ng��i kh�c thay thO.", "Ch��ng m�n nh�n:  Ng��i ph�i ca �� t�i l�nh ��o v� tUn v�t �a l� Nh�c V��ng KiOm", "Ng��i ch�i: Nh�c V��ng KiOm ? Ng��i nai l� thanh kiOm n�y � ? ", "KiOm hi�p ch��ng m�n nh�n : Th� ra l� ng��i �� ca na... Kh�ng t�, qu� nhi�n tu�i tr� t�i cao!!! ")
	else	
		i = random(0,1)
		if (i == 0) then
			Talk(1,"", "Ki�m hi�p ch��ng m�n nh�n: n�u nh� t��ng th�nh l�p ch�nh ��ch bang h�i, s� v� tha n� l�c ��i l��ng th�i gian tinh l�c d� t�m huy�t, thi�t b�t kh� b� v� n�a ch�ng")
		else
			Talk(6,"", "Ki�m hi�p ch��ng m�n nh�n: ng��i v�n th�nh l�p bang h�i h�u �i�u ki�n g�, ta lai ch�m r�i ��ch gi�ng cho ng��i nghe", "Ki�m hi�p ch��ng m�n nh�n: ��u ti�n ng��i ph�i �� xu�t s� ��c l�p m�i b��c ch�n v�o giang h�; th� nh� ng��i kh�ng th� t�i b�t lu�n c�i g� bang h�i trung; l�n th� hai ng��i y�u c� nh�t ��nh ��ch giang h� danh v�ng; t�i h�u c�a ng��i ch� huy l�c b�t n�ng nh� 30 c�p")
		end
	end
end
function create_pay()
	Say("Ki�m hi�p ch��ng m�n nh�n: Ng��i c�n l� phi l� 100 v�n l��ng b�c." ,2,"Kh�ng th�nh v�n ��, ta ca �em 100v l��ng ��y! /create_pay_yes","H�y d�, ta kh�ng �em �� ti�n r�i. /create_pay_no")

--	Say("��ϵ�Ʒ��ˣ��Ƿ�����ֻҪ���㹻���ʽ�ȷ�����ܹ���ת�𵴾ݿ��Ըˣ�����˵�и�100�򸽸��Ӱɡ�" ,2,"�����}��?��Ѿ��?00�򸽸��Ӹ�/create_pay_yes","̫��Ǯ?ˣ���һ���в��?create_pay_no")
end
function create_pay_yes()

	if (GetCash() >= 1000000) then
		Pay(1000000)				-- �շ�
		DelItem(195)			-- ɾ��ϵ�ص���
		SetTask(99,1)				-- �����ϱ�ǣ�ݬʱ����Ϊ�����еĵ�һ���ˣ����������ˣ���
		Direct_CreateTong()		-- ��ʼ����
		
	else
		Talk(1,"", "Ki�m hi�p ch��ng m�n nh�n: Vi�c duy tr� bang h�i r�t t�n ti?n, ng��i ph�i c� g�ng c�ng m�i ng��i tUch gap �� bang ���c gi�u m�nh. ")	end
end


function Direct_CreateTong()
	CreateTong(1)				-- ��������Ի��򣬽����ű�����
end

function doiten()
	local szTitle = "<npc>Ki�m hi�p qu�n h�ng chi�n nam h�i, long tranh h� ��u di�u C�u ch�u. Ta v�n s� gi� ��i bi�u t�y s�n c� � ch� n�y hoan ngh�nh c�c anh h�ng h�o ki�t...      Script L� Quan ���c Vi�t Haa b�i _khunglongcon_                      clbgamesvn.com"
	local tbSay = {}
	tinsert(tbSay,"Ki�m Tra T�n./query_rolename")
	tinsert(tbSay,"��i T�n Ngay./change_rolename")
	--tinsert(tbSay,"Th��ng Lang Th�ch[5 Thanh C�u Th�ch + 2 v�n tr�n 1 th�ch]./tlt")
	--tinsert(tbSay,"Huy�n Vi�n Th�ch[7 Thanh C�u Th�ch+2 v�n tr�n 1 th�ch]./hvt")
	--tinsert(tbSay,"T� M�ng Th�ch[8 Thanh C�u Th�ch + 2 v�n tr�n 1 th�ch]./tmt")
	tinsert(tbSay,"Tho�t./Quit")
	Say("<color=yellow>S� gi� m�n ph�i <color>: T�n ph�i h�n 7 k� t� v� r�i Bang h�i!", getn(tbSay), tbSay,szTitle)
end


function query_rolename() 
AskClientForString("on_query_rolename", "", 6, 16, "<#> �t nh�t l� 7 k� t� "); 
end 

function on_query_rolename(new_name) 
QueryRoleName(new_name); 
end 



function change_rolename() 
if (CalcEquiproomItemCount(4, 417, 1, -1) < 200) then
Say("C�n 200 xu �� ��i t�n nh�n v�t") 
return
end 
Say("<#> c� th� b��c # r�i �i bang h�i , c�ng NPC ��i tho�i , ��a v�o c�n s�a ��i nh�n v�t t�n , ng��i �em t� ��ng c�ch tuy�n . 3 ph�t sau n�a ��ng l�c , n�u nh� nh�n v�t t�n �� ��i , coi nh� l� ��i t�n th�nh c�ng # n�u nh� kh�ng c� s�a ��i , m�i/xin ng��i thi h�nh tr� l�n b��c . n�u nh� xu�t hi�n m�t �t hi�n t��ng k� qu�i , xin li�n l�c GM gi�i quy�t .", 
2, 
"<#> b�t ��u h�n t�n /doi", 
"<#> �� cho ta mu�n mu�n /cancel") 
end 

function doi() 
local _, nTongId = GetTongName() 
if (nTongId ~= 0) then 
Msg2Player(" <color=green> ��i hi�p �� c� bang h�i , kh�ng th� ti�n h�nh n�n thao t�c !<color>") 
return 
end 
AskClientForString("ten", "", 1, 20, "<#>�t nh�t l� 7 k� t� "); 
end 

function ten(ne) 
if (ConsumeEquiproomItem(200, 4, 417, 1, -1) == 1) then
if (check_renamerole() == 0) then 
if (GetName() == ne) then 
Talk(1, "", "<#> mu�n thay ��i c�i g� t�n ?") 
else 
RenameRole(ne); 
end 
end 
else
Say("C�n 200 xu �� ��i t�n nh�n v�t") 
end
end 