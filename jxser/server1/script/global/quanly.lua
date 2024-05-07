--Include("\\script\\task\\metempsychosis\\npc_saodiseng.lua")
-- Include("\\script\\missions\\horse_racing\\head.lua")
Include("\\script\\global\\gmrole.lua")
-- Include("\\script\\missions\\horse_racing\\head.lua")
-- Include("\\script\\global\\cailao.lua")
Include("\\script\\item\\ib\\shenxingfu.lua")
-- Include("\\script\\global\\tasktinnang.lua")
-- Include("\\script\\global\\xephang\\lib.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\task\\metempsychosis\\task_func.lua")
Include("\\script\\vng_lib\\files_lib.lua")
Include("\\script\\global\\autoexec_head.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
-- Include("\\script\\global\\event.lua")
-- Include("\\script\\global\\xephang\\bangxephang.lua")
-- Include("\\script\\global\\timer.lua")
-- Include("\\script\\global\\tanthu.lua")
IncludeLib("TIMER")
Include("\\script\\global\\translife.lua")
-- Include("\\script\\global\\event.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\global\\titlefuncs.lua")
IncludeLib("RELAYLADDER")
IncludeLib("TONG")
IncludeLib("SPREADER")
Include("\\script\\misc\\itemexchangevalue\\itemexchangevalue.lua") -- ¶Ò»»¾«¸¶±¦Ïä
Include("\\script\\misc\\itemexchangevalue\\ex_goldequip_lingpai.lua")
Include("\\script\\global\\systemconfig.lua") -- ÏµÍ³ÅäÖÃ
Include("\\script\\shitu\\shitu_head.lua")
Include("\\script\\misc\\spreader\\head.lua")
Include("\\script\\misc\\spreader\\newaccount.lua")
Include("\\script\\global\\rename_head.lua")
-- Include("\\script\\global\\namcung\\tinhnang\\newbossmoi\\call_boss_namcung383.lua")
-- Include("\\script\\global\\namcung\\tinhnang\\newbossmoi\\boss20h.lua")
Include("\\script\\misc\\rename\\rename_func.lua")
--Include("\\script\\misc\\lostgolditem\\restore_goldeqitem.lua")	
Include("\\script\\battles\\battlehead.lua")
-- Include("\\script\\global\\xephang\\top.lua")
-- Include("\\script\\global\\chanle\\chanle.lua")
Include("\\script\\lib\\file.lua");
Include("\\script\\lib\\string.lua");
Include("\\script\\global\\forbidmap.lua");
Include("\\script\\missions\\sevencity\\war.lua")
Include("\\script\\global\\playerlist.lua")
-- Include("\\script\\global\\longdenbanghoi\\longdenbossbaove\\\call_boss_namcung.lua")
-- Include("\\script\\global\\longdenbanghoi\\longdenbanghoi\\\longden.lua")
Include("\\script\\vng_feature\\top10\\vngtop10.lua")
Include("\\script\\item\\ib\\headshenxingfu.lua")
-- Include("\\script\\global\\quanlygame\\sukien\\vantieubanghoi\\vantieubanghoi.lua")
-- Include("\\script\\global\\namcung\\gioihan_ip.lua")
TSK_SUONGDAO_TTT = 1000
gmcaocap ='luubine'
function tienvannn()
Earn(5000000)
end
function main()
	dofile("script/global/quanly.lua");
	-- AddItem(6,1,1670,1,0,0)
-- LoadScript("/script/global/Áã··¹¦ÄÜ.lua")
		local w,x,y = GetWorldPos();
		-- LoadScript("/script/nationalwar/npc.lua")
		
		-- Msg2Player("M¸p sè <color=Green>"..w.."<color> täa ®é <color=Yellow>"..x..", "..y)
	-- Msg2Player("M¸p sè <color=Green>"..w.."<color> täa ®é <color=Yellow>"..floor(x/32)..", "..floor(y/32))
	-- Talk(1,"","M¸p sè <color=Green>"..w.."<color> täa ®é <color=Yellow>"..x..", "..y.." ")
	-- Talk(1,"","M¸p sè <color=Green>"..w.."<color> täa ®é <color=Yellow>"..floor(x/32)..", "..floor(y/32).." ")
	-- Talk(1,""," "..tonumber(GetLocalDate("%H%M")).." ")
	-- kickvongsang()
	-- add_npc_trong_bang_hoi()
	-- AddTieuBang()
	-- xephangtinhluc1()
	-- callbossdoccocaubai()
	-- NewWorld(180, 1569,2898)
	-- LoadScript("/script/global/judgeoffline.lua")
	if CalcFreeItemCellCount() < 20 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 20 « trèng råi h·y më.",0);
		return 1;
	end
	-- reload()
	-- for i = 4563,4568 do
	-- AddItem(6,1,i,1,0,0)
	-- end
	-- LoadScript("/script/global/ÌØÊâÓÃµØ/ÃÎ¾³/npc/Â·ÈË_ÅÑÉ®.lua")
	-- LoadScript("/script/missions/fengling_ferry/fld_head.lua")
	-- LoadScript("/script/battles/marshal/playerdeath.lua")
--	LoadScript("/script/missions/boss/bossdeath.lua")
	-- LoadScript("/script/tong/tong.lua")

--	AddStackItem(100,6,1,4439,1,0,0)
--	AddItem(6,1,3144,1,0,0)
-- LoadScript("/script/global/login.lua")
-- LoadScript("/script/global/namcung/login/login.lua")
-- LoadScript("/script/global/logout.lua")
--LoadScript("/script/missions/yandibaozang/head.lua")
--	LoadScript("/script/task/tollgate/messenger/posthouse.lua")
--	LoadScript("/script/activitysys/config/12/extend.lua")

local tbOwnIP = split(GetIP()," ")
local szStr = tbOwnIP[1]

-- if (GetAccount() == 'testsv1' or GetAccount() == '' or GetAccount() =='') then
-- if (GetAccount() == 'thispc' or GetAccount() == 'testsv1') and (szStr == '116.105.17.201' or szStr== '14.165.59.57' ) then
    local nNam = tonumber(GetLocalDate("%Y"));
    local nThang = tonumber(GetLocalDate("%m"));
    local nNgay = tonumber(GetLocalDate("%d"));
    local nGio = tonumber(GetLocalDate("%H"));
    local nPhut = tonumber(GetLocalDate("%M"));
    local nGiay = tonumber(GetLocalDate("%S"));
    local nW, nX, nY = GetWorldPos()
    local nIdPlay = PlayerIndex
    local cash = GetCash()
    local lif = GetExtPoint(1)	
    local tk=GetAccount()
    local lev=GetLevel()
    local xp=GetExp()

	local SubWorld = SubWorldID2Idx(w)
	local SubName=SubWorldName(SubWorld)
	
	local w,x,y = GetWorldPos();
	-- Msg2Player("M¸p sè <color=Green>"..w.."<color> täa ®é <color=Yellow>"..x..", "..y)
	-- Msg2Player("M¸p sè <color=Green>"..w.."<color> täa ®é <color=Yellow>"..floor(x/32)..", "..floor(y/32))
	
	--Say("Xin Chµo <color=red>"..GetName().."<color>!\nCÊp ®é   :<color=green> "..lev.."<color>  Kinh nghiÖm: <color=green>"..xp.."<color> \n<color>Index:           <color=green>"..nIdPlay.."<color>\nTiÒn MÆt :<color=green> "..(cash/10000).." v¹n<color> - TiÒn §ång  :<color=green>"..lif.." ®ång<color>\n<color>H«m Nay: <color=metal>        N¨m "..nNam.." Th¸ng "..nThang.." Ngµy "..nNgay.." <color>. \nLóc:            <color=pink> "..nGio.." Giê "..nPhut.." Phót "..nGiay.." Gi©y.<color>", 10,
	Say("HiÖn t¹i cã <color=red>"..GetPlayerCount().." <color>ng­êi ch¬i ®ang trùc tuyÕn\nIP : "..szStr.." ! ", 10,
	 -- "Rêi khái/adminnn", 
	 "Rêi khái/no", 
       -- "trong bang hoi/add_npc_trong_bang_hoi",
       -- "tienvan/tienvannn",
       "toa do/toado",
        "di chuyen/admdichuyen",
        -- "bach ho len/bhl",
        "GM thong bao/thongbaoquantrong",
        "ho tro gm/gmkhac",
        -- "mo ip cho nguoi choi/moip",
        -- "Chuc nang test/hotrotest",
         "BK 150/bk150",
       -- "Vt bang hoi/AddTieuBang",
        "Chuc nang ADM/gmlaydo");
        --"Tµi xØu/maintaixiu",
       -- "Chøc n¨ng qu¶n lý server 2/adminnn",
	--	"Chøc n¨ng qu¶n lý server 1/admin");
       -- "Chøc n¨ng qu¶n lý server 2/adminnn");
		--"È¥ÆäËûµØÍ¼/#tbVNGWORDPOS:GotoOtherMap()");
	return 1	
	-- else
	-- end
end;
function moip()
LimitAccountPerIP:AskSetMax()
end
function bhl()
if CalcFreeItemCellCount() < 10 then
Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 10 « trèng råi h·y më.",0);
return 1;
end
AddItem(6,1,2357,1,0,0)
AddItem(6,1,2357,1,0,0)
AddItem(6,1,2357,1,0,0)
end
function bk150()
if CalcFreeItemCellCount() < 10 then
Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 10 « trèng råi h·y më.",0);
return 1;
end
AddItem(6,1,4416,1,0,0)
AddItem(6,1,4417,1,0,0)
AddItem(6,1,4418,1,0,0)
end

function chonthaotac()
	local tbOpt = {}
	tinsert(tbOpt, "Ten tai khoan/#napknbchomem()")
	tinsert(tbOpt, "Ten nhan vat/#thaotactennv()")
	tinsert(tbOpt, "Tho¸t/OnCancel")
	Say("§¹i hiÖp t×m ta cã viÖc g×?", getn(tbOpt), tbOpt)
end
function thaotactennv() 
	AskClientForString("thaotactennv123", "", 0,5000,"NhËp ten NV") 
end 
function thaotactennv123(nNameChar) 
local nNum = GetPlayerCount()
for i = 1, nNum+1000 do
		gmidx=PlayerIndex
		PlayerIndex=i
		TarName=GetName()
		taikhoan=GetAccount()
		PlayerIndex=gmidx
--	if ((i)> GetPlayerCount()) then
--		Msg2Player("Nh©n vËt Nµy HiÖn Kh«ng Online Vui Lßng Quay L¹i Sau...!");  
--	else
	if TarName == nNameChar then


		SetTaskTemp(200,i) 
		gmName=GetName() 
		gmidx=PlayerIndex 
		PlayerIndex=GetTaskTemp(200) 
		tk=GetAccount() 
		lev=GetLevel()
		xp=GetExp() 
		cam=GetCamp() 
		fac=GetFaction() 
		cash=GetCash() 
		soknb=GetExtPoint(1)
		soknb2=GetExtPoint(2)
		nTienDong=CalcEquiproomItemCount(4,417,1,1)
		event=CalcEquiproomItemCount(6,1,4569,1)
		nDiemVip=GetTask(5994)
		nTransLife=ST_GetTransLifeCount()
		CaiLao=GetTask(5969)
		knb=GetTask(5996)
		vnd=GetTask(5997)
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
		diemnapcard=GetTask(5793)
		SubWorld = SubWorldID2Idx(w)
		SubName=SubWorldName(SubWorld)
		toadox = floor(x/8)
		toadoy = floor(y/16)
		smm = GetStrg(1)
		tpp = GetDex(1)
		skk = GetVit(1)
		ncc = GetEng(1)
		
		monphai = GetLastFactionNumber() + 1
		if monphai == 1 then monphai = 'Thieu lam'
		elseif monphai == 2 then monphai = 'Thien vuong'
		elseif monphai == 3 then monphai = 'Duong mon'
		elseif monphai == 4 then monphai = 'Ngu doc'
		elseif monphai == 5 then monphai = 'Nga my'
		elseif monphai == 6 then monphai = 'Thuy yen'
		elseif monphai == 7 then monphai = 'Cai bang'
		elseif monphai == 8 then monphai = 'Thien nhan'
		elseif monphai == 9 then monphai = 'Vo dang'
		elseif monphai == 10 then monphai = 'Con lon'
		else monphai = 'Chua nhap phai'
		end
		PlayerIndex=gmidx 
		--Msg2Player("Nh©n vËt tªn:<color=metal> "..ObjName.."<color> - ID: <color=green> "..i.."<color>"); 
		local tbSay =  {}
		tinsert(tbSay,"Nap knb./addknb")        
		--tinsert(tbSay,"Tru knb./truknb")        
		tinsert(tbSay,"Kich nhan vat./kick")        
		tinsert(tbSay,"Céng ®iÓm tÝch lòy/congdiemnapcard")        
		tinsert(tbSay,"Di chuyÓn ®Õn vÞ trÝ ng­êi nµy/chuyendennguoichoi")        
		-- tinsert(tbSay,"Di chuyÓn ng­êi nµy vÒ ba l¨ng huyÖn/move")        
		tinsert(tbSay,"Tho¸t./no")     
	
		Say("Tai khoan <color=yellow>"..tk.."<color> - Nhan vat <color=yellow>"..ObjName.."<color>\nMon phai-<color=yellow>"..monphai.."<color> Cap-<color=yellow>"..lev.."<color> Trung sinh-<color=yellow>"..nTransLife.."<color>\n§ang cã <color=yellow>"..soknb2.."<color> KNB trong tiÒn trang\n§ang cã <color=yellow>"..diemnapcard.."<color> ®iÓm tÝch lòy  n¹p thÎ!\n§ang ë <color=yellow>"..SubName.."<color> täa ®é <color=yellow>"..toadox.."/"..toadoy.."<color>\nSøc m¹nh <color=yellow>"..smm.."<color> Sinh khÝ <color=yellow>"..skk.."<color>\nTh©n ph¸p <color=yellow>"..tpp.." <color>Néi c«ng <color=yellow>"..ncc.." <color>!   "..event.."", getn(tbSay), tbSay)

		return --end
	end 
end
	if TarName ~= nNameChar then
		Msg2Player("Kh«ng t×m thÊy nh©n vËt tªn <color=green>"..nNameChar.."<color>"); 
	end
end

function chuyendennguoichoi()
-- if GetAccount() == gmcaocap then
gmidx=PlayerIndex
PlayerIndex=GetTaskTemp(200)
w,x,y=GetWorldPos() 
PlayerIndex=gmidx
NewWorld(w,x,y)
-- Msg2Player("Nh©n vËt <color=green>"..ObjName.."<color> ®­îc b¹n t¨ng <color=metal>"..num.."<color> KNB thµnh c«ng");
-- Talk(1,"","Nh©n vËt <color=green>"..ObjName.."<color> ®­îc b¹n t¨ng <color=metal>"..num.."<color> KNB thµnh c«ng")
-- logplayer("dulieu/add_knb_adm.txt",format("[IP : %s ] - Thêi gian : %s  - ["..gmName.."] Add "..num.." KNB cho ["..ObjName.."] ! ",GetIP(),GetLocalDate("%m/%d/%Y_%H:%M:%S")))
-- else
-- Say("Kh«ng ®ñ quyÒn sö dông chøc n¨ng nµy",0);
-- end
end;

function napknbchomem() 
	AskClientForString("napknbchomem1", "", 0,5000,"NhËp tµi kho¶n") 
end 
function napknbchomem1(nNameChar) 
local nNum = GetPlayerCount()
for i = 1, nNum+1000 do
		gmidx=PlayerIndex
		PlayerIndex=i
		TarName=GetName()
		taikhoan=GetAccount()
		PlayerIndex=gmidx
--	if ((i)> GetPlayerCount()) then
--		Msg2Player("Nh©n vËt Nµy HiÖn Kh«ng Online Vui Lßng Quay L¹i Sau...!");  
--	else
	if taikhoan == nNameChar then


		SetTaskTemp(200,i) 
		gmName=GetName() 
		gmidx=PlayerIndex 
		PlayerIndex=GetTaskTemp(200) 
		tk=GetAccount() 
		lev=GetLevel()
		xp=GetExp() 
		cam=GetCamp() 
		fac=GetFaction() 
		cash=GetCash() 
		soknb=GetExtPoint(1)
		soknb2=GetExtPoint(2)
		nTienDong=CalcEquiproomItemCount(4,417,1,1)
		event=CalcEquiproomItemCount(6,1,4569,1)
		nDiemVip=GetTask(5994)
		nTransLife=ST_GetTransLifeCount()
		CaiLao=GetTask(5969)
		knb=GetTask(5996)
		vnd=GetTask(5997)
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
		diemnapcard=GetTask(5793)
		SubWorld = SubWorldID2Idx(w)
		SubName=SubWorldName(SubWorld)
		toadox = floor(x/8)
		toadoy = floor(y/16)
		smm = GetStrg(1)
		tpp = GetDex(1)
		skk = GetVit(1)
		ncc = GetEng(1)
		monphai = GetLastFactionNumber() + 1
		if monphai == 1 then monphai = 'Thieu lam'
		elseif monphai == 2 then monphai = 'Thien vuong'
		elseif monphai == 3 then monphai = 'Duong mon'
		elseif monphai == 4 then monphai = 'Ngu doc'
		elseif monphai == 5 then monphai = 'Nga my'
		elseif monphai == 6 then monphai = 'Thuy yen'
		elseif monphai == 7 then monphai = 'Cai bang'
		elseif monphai == 8 then monphai = 'Thien nhan'
		elseif monphai == 9 then monphai = 'Vo dang'
		elseif monphai == 10 then monphai = 'Con lon'
		else monphai = 'Chua nhap phai'
		end
		
		PlayerIndex=gmidx 
		--Msg2Player("Nh©n vËt tªn:<color=metal> "..ObjName.."<color> - ID: <color=green> "..i.."<color>"); 
		local tbSay =  {}
		tinsert(tbSay,"Nap knb./addknb")        
		--tinsert(tbSay,"Tru knb./truknb")   
		tinsert(tbSay,"Kich nhan vat./kick")     
		tinsert(tbSay,"Céng ®iÓm tÝch lòy/congdiemnapcard")   	
		tinsert(tbSay,"Di chuyÓn ®Õn vÞ trÝ ng­êi nµy/chuyendennguoichoi")  
		-- tinsert(tbSay,"Di chuyÓn ng­êi nµy vÒ ba l¨ng huyÖn/move")   		
		tinsert(tbSay,"Tho¸t./no")        
		Say("Tai khoan <color=yellow>"..tk.."<color> - Nhan vat <color=yellow>"..ObjName.."<color>\nMon phai-<color=yellow>"..monphai.."<color> Cap-<color=yellow>"..lev.."<color> Trung sinh-<color=yellow>"..nTransLife.."<color>\n§ang cã <color=yellow>"..soknb2.."<color> KNB trong tiÒn trang\n§ang cã <color=yellow>"..diemnapcard.."<color> ®iÓm tÝch lòy  n¹p thÎ!\n§ang ë <color=yellow>"..SubName.."<color> täa ®é <color=yellow>"..toadox.."/"..toadoy.."<color>\nSøc m¹nh <color=yellow>"..smm.."<color> Sinh khÝ <color=yellow>"..skk.."<color>\nTh©n ph¸p <color=yellow>"..tpp.." <color>Néi c«ng <color=yellow>"..ncc.." <color>!   "..event.."", getn(tbSay), tbSay)
		return --end
	end 
end
	if taikhoan ~= nNameChar then
		Msg2Player("Kh«ng t×m thÊy nh©n vËt tªn <color=green>"..nNameChar.."<color>"); 
	end
end
function thongbaoquantrong()
	local tbOpt = {}
	tinsert(tbOpt, "Msg2SubWorld/#thongbao(1)")
	tinsert(tbOpt, "AddGlobalNews/#thongbao(2)")
	tinsert(tbOpt, "Ca 2/#thongbao(3)")
	tinsert(tbOpt, "Tho¸t/OnCancel")
	Say("§¹i hiÖp t×m ta cã viÖc g×?", getn(tbOpt), tbOpt)
end
function thongbao(n)
	if n == 1 then
		AskClientForString("Input_Msg2SubWorld","",1,9999999999,"Type Msg muèn nh¾n")
	elseif n == 2 then
		AskClientForString("Input_AddGlobalNews","",1,9999999999,"Type Msg muèn nh¾n")
		else
		AskClientForString("ca2thongbao","",1,9999999999,"Type Msg muèn nh¾n")
	end
end
function ca2thongbao(nVal)
	Msg2SubWorld(format("[<color=orange>GM<color>]:<color=yellow>%s<color>",nVal))
	AddGlobalNews(format("[<color=orange>GM<color>]:<color=green>%s<color>",nVal))
end
function Input_Msg2SubWorld(nVal)
	Msg2SubWorld(format("[<color=orange>GM<color>]:<color=yellow>%s<color>",nVal))
end
function Input_AddGlobalNews(nVal)
	AddGlobalNews(format("[<color=orange>GM<color>]:<color=green>%s<color>",nVal))
end
function adminnn()
if GetAccount()=='hoilamgi45' then
tbGmRole:GMC_Menu() 
end
end
function laynguyenlieu()
AddStackItem(100,6,1,4389,1,0,0,0)
end
function testthoi111()
AddStackItem(50,6,1,198,1,0,0,0)
end
function dctc()
	local tbOpt =
	{
		{"T­¬ng D­¬ng", ctctd},
		{"BiÖn Kinh", ctcbk},
		{"Ph­îng T­êng", ctcpt},
		{"§¹i Lý", ctcdl},
		{"L©m An", ctcla},
		{"D­¬ng Ch©u", ctcdc},
		{"Tho¸t"},
	}
	CreateNewSayEx("<npc>Anh cÇn g×?", tbOpt)
end
function gmday()
local szTitle = "<npc><color=gold>GM: <color>Chµo mõng b¹n ®Õn víi hÖ thèng <color=red>Vâ L©m TruyÒn Kú<color> <color=green>Cöu Niªn T­¬ng Phïng<color> .\nNh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra server\nHiÖn t¹i cã <color=red>"..GetPlayerCount().." <color>ng­êi ch¬i ®ang trùc tuyÕn.<color>"
		local Opt = 
			{
		{"LÊy täa ®é ®ang ®øng", toado},
		--{"LÊy täa ®é ®ang ®øng", testthoi111},
		{"ReLoad", reload},
		--{"so lan ev", testevent},
		--{"xoa trang bi", xoavatpham},
		--{"Th«ng b¸o", thongbao},
		{"B¶o tr×.", baotri},
		--{"XÕp Top 10", XepHang_Top10ALL},
		{"GM", dacbiet},
		--{"Xãa Top 10",XoaXepHang},
		{"Qu¶n lý", system},
		--{"gift code",giftcode},
		{"Test", hotrotest},
		{"lever", nhancap},
		{"Th«ng b¸o kªnh hÖ thèng dµnh cho GM",tbGM.Msg2World},
		{"Tho¸t"},
		}
		CreateNewSayEx(szTitle,Opt)
end
function goine()
local szTitle = "<npc><color=gold>GM: <color>Chµo mõng b¹n ®Õn víi hÖ thèng <color=red>Vâ L©m TruyÒn Kú<color> <color=green>Cöu Niªn T­¬ng Phïng<color> .\nNh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra server\nHiÖn t¹i cã <color=red>"..GetPlayerCount().." <color>ng­êi ch¬i ®ang trùc tuyÕn.<color>"
		local Opt = 
			{
--		{"chac khong", NewBoss},
		{"chac khong", NewBossMoi383},
		{"Tho¸t"},
		}
		CreateNewSayEx(szTitle,Opt)
end
function xephangtinhluc1()
XepHang:TaiDanhSachTopToanServer()
end
function ctctd()
NewWorld(931 ,1549 ,3569)
	SetFightState(0);
end

function ctcbk()
NewWorld(927 ,1968 ,3305)
	SetFightState(0);
end

function ctcpt()
NewWorld(929, 1725, 3792)
	SetFightState(0);
end

function ctcdl()
NewWorld(928 ,1898 ,2804)
	SetFightState(0);
end

function ctcla()
NewWorld(930 ,2007 ,3650)
	SetFightState(0);
end

function ctcdc()
NewWorld(932 ,1952 ,3289)
	SetFightState(0);
end
function rll()
--LoadScript("/script/global/congthanh.lua")
LoadScript("/script/global/vatpham/qualoai2.lua")
end
function add_mauhotro()
local tbProp = {1,2,0,5,0,0,0,0};
						local totalnguhoa = CalcEquiproomItemCount(1,2,0,5);
						local totalcount =CalcFreeItemCellCount();
						if totalcount > 0  then  
							if CalcEquiproomItemCount(1,2,0,5) <= 2 then 
								for k=1,totalcount do 
									local ItemIndex = AddItem(unpack(tbProp));
							
								end
							end
						end
end
function gmchat()
AskClientForString("noidung", "", 1, 9000, "NhËp Néi Dung:")
end 
function noidung(noidunggm)
Msg2SubWorld ("<color=red>GM:<color><color=yellow>"..noidunggm.."");
end
function dichuyen()
NewWorld(967,1634, 3231) 
end
function DisposeItem_main()
		AskClientForNumber("PasswordAccepted",0,99999999,"<#>NhËp Code T©n Thñ")
end
function PasswordAccepted(nValue)
	local pass = 6011992
	if (nValue ~= pass) then
		Talk(1,"","B¹n ®· nhËp sai Code !")
		return
	end
	
	local tbOps=
	{
		"NhËn cÊp/admin",

	}
	if (getn(tbOps) == 0) then
		return
	end
	local str = "<#> §¹i hiÖp muèn hñy vËt g×?";
	Say(str,getn(tbOps),tbOps)
end
function admin()
	local tbOpt =
	{
		{"LÊy täa ®é ®ang ®øng", toado},
		{"ReLoad", reload},
		--{"Tµi xØu", testtaixiu},
		{"id nguoi choi", luachonid1},
		--{"check shop", ktshop},
		--{"boss ly bach", bosslybachkt},
		--{"boss bang hoi", bossbanghoi},
		--{"nguyen lieu", laynguyenlieu},
		--{"test tinh xao", bugtiemnang},
		--{"test vongsang", vongb},
		{"gm", gmday},
		{"lay event", layevent},
		{"nhan task", nhantask},
		{"lay do hoang kim", tbhk},
		--{"mat na quy anh", matnaquyanh},
		{"xep hang", xephangtinhluc1},
		{"Tho¸t"},
	}
	CreateNewSayEx("<npc>Anh cÇn g×?", tbOpt)
end
function DoClearProp()
	Say("Ng­¬i ®ång ý tÈy ®iÓm tiÒm n¨ng? ", 2, "TÈy ®iÓm tiÒm n¨ng/DoClearPropCore", "Kh«ng tÈy/OnCancel")
end
function testtx()
for i=3834,3848 do
AddGoldItem(0, i)
end
end

function DoClearPropCore()
		base_str = {35,20,25,30,20}			-- ÎåÐÐÈËÎïµÄÌìÉúÊôÐÔÖµ
		base_dex = {25,35,25,20,15}
		base_vit = {25,20,25,30,25}
		base_eng = {15,25,25,20,40}
		player_series = GetSeries() + 1

		Utask88 = GetTask(88)
		AddStrg(base_str[player_series] - GetStrg(1) + GetByte(Utask88,1))			-- ½«ÒÑ·ÖÅäÇ±ÄÜÖØÖÃ£¨task(88)ÊÇÈÎÎñÖÐÖ±½Ó½±ÀøµÄÁ¦Á¿¡¢Éí·¨µÈ£©
		AddDex(base_dex[player_series] - GetDex(1) + GetByte(Utask88,2))
		AddVit(base_vit[player_series] - GetVit(1) + GetByte(Utask88,3))
		AddEng(base_eng[player_series] - GetEng(1) + GetByte(Utask88,4))
end;

function DisposeItem()
	GiveItemUI("Hñy vËt phÈm", "§¹i hiÖp h·y cÈn träng trong viÖc hñy vËt phÈm!", "DisposeConfirm", "onCancel", 1);
end
function DisposeConfirm(nCount)
	for i=1, nCount do
		local nItemIndex = GetGiveItemUnit(i)
		local strItem = GetItemName(nItemIndex)
		RemoveItemByIndex(nItemIndex)
		WriteLog(date("%Y%m%d %H%M%S").."\t".." GM Hñy Item "..GetAccount().."\t"..GetName().."\t".." Huû item "..strItem)
	end--for
	Msg2Player("Thao t¸c hñy vËt phÈm thµnh c«ng")
	Talk(1, "", "Thao t¸c thµnh c«ng, kiÓm tra l¹i!");	
end
function xoavatpham()
GiveItemUI("§Æt 1 VËt PhÈm Vµo","Khi Xãa SÎ MÊt VËt PhÈm NhÐ","Task_Accept_01","Task_Wait")
end
function Task_Accept_01()
RemoveItemByIndex(GetGiveItemUnit(1))
Msg2Player("§· Hñy VËt PhÈm Thµnh C«ng");
end 
--function xoavatpham()
--if (ConsumeEquiproomItem(1, 0, 5214, -1) == 1) then
--end
--end
function giftcode()
DoiThoai()
end
function dacbiet()
	SetCamp(6)
	SetCurCamp(6)
	AddMagic(1206, 1)--ÒþÉí
end
function kaka()
	SetTask(TASK_ACTIVE_TITLE)
end
function kichdanhhieu()
Title_ActiveTitle(GetTask(TASK_ACTIVE_TITLE))
end
function vongsang()
	local nMaxCount = CalcFreeItemCellCount()
	g_AskClientNumberEx(0,10000, "NhËp sè l­îng T§!", {vongsangg, {num}})
end
function vongsangggggg()
n_title = 199
	local nServerTime = GetCurServerTime()+ 86400; --1*24*60*60
	local nDate	= FormatTime2Number(nServerTime);
	local nDay	= floor(mod(nDate,1000000) / 10000);
	local nMon	= mod(floor(nDate / 1000000) , 100)
	local nTime	= nMon * 1000000 + nDay * 10000	-- ?????????	
	Title_AddTitle(n_title, 2, nTime)
	Title_ActiveTitle(n_title)
	SetTask(1122, n_title)
end
function kich()
KickOutSelf()
end;
function kichh()
if GetAccount() ~= gmcaocap then
		Say("QuyÒn h¹n ko ®ñ",0);
		return 1;
end
	local OldPlayer = PlayerIndex
	for i=1,GetPlayerCount() do
		PlayerIndex = i
			KickOutSelf()
	end
	PlayerIndex = OldPlayer
end
function save()
	local OldPlayer = PlayerIndex
	for i=1,GetPlayerCount() do
		PlayerIndex = i
			SaveNow()
--			XepHang:LuuDSNhanVat()
--SetTask(EVENT_TRUNGTHU,0)
--SetTask(EVENT_GIOIHAN,0)
	end
	PlayerIndex = OldPlayer
end
function baotri()
	local tbOpt =
	{
		{"KÝch toµn nh©n vËt.",kichh},
		{"L­u toµn nh©n vËt.", save},
		{"Tho¸t"},
	}
	CreateNewSayEx("<npc>Anh cÇn g×?", tbOpt)
end


function thongbaokoxai()
--Msg2SubWorld(format("<color=red>HiÖn t¹i hÖ thèng ®¨ng ký vµ n¹p thÎ ®ang bÞ tÊn c«ng quý nh©n sÜ muèn n¹p thÎ vµ ®¨ng ký xin liªn hÖ adm qua Fanpage <color=green>ThÕ Giíi Game<color> trang chñ <color=yellow>Chivuong.net<color>!!!!!!!!.<color>",GetName())); 
--Msg2SubWorld(format("<color=red>Event Tèng Kim <color=green>21<color> giê tèi nay top <color=yellow>1 3 5 7 9<color> sÏ nhËn ®­îc <color=yellow>200<color> xu vui lßng liÖn hÖ adm ®Ó nhËn th­ëng.<color>",GetName())); 
--Msg2SubWorld(format("<color=red>M¸y chñ <color=yellow>ThiÕt Liªn Tø S¸t<color> sÏ b¶o tr× trong <color=yellow>1<color> phót n÷a thêi gian b¶o tr× lµ 5 phót quý b»ng h÷u vui lßng ch¹y <color=yellow>Autoupdate<color> ®Ó cËp nhËt tÝnh n¨ng míi .<color>",GetName())); 
--Msg2SubWorld(format("<color=red>M¸y chñ <color=yellow>ThiÕt Liªn Tø S¸t<color> ®· khai më ®óng vµo lóc <color=yellow>13h30<color> phót sÏ cã thÓ nhËn hæ trî t©n thñ trang chñ  <color=yellow>chivuong.net<color>  .<color>",GetName())); 
Msg2SubWorld(format("<color=red>PhÇn th­ëng CTC thø 6 tuÇn nµy <color=yellow>truy cËp fanpage <color> ®Ó biÕt chi tiÕt <color=yellow>thêi gian b¸o danh tõ 18h ®Õn 19h ®iÒu kiÖn b¸o danh gåm 5k v¹n vµ 10 khiªu chiÕn lÖnh <color>",GetName())); 
--Msg2SubWorld(format("<color=red>CËp nhËt b¶o tr× 12h ngµy 10/12 <color=yellow>x2 <color>kinh nghiÖm toµn sever vµ më tÝnh n¨ng cµy  <color=yellow>Hµnh hiÖp lÖnh<color> ë c¸c ho¹t ®éng PLD vµ V­ît ¶i chi tiÕt xem t¹i Fanpage !!! <color>",GetName()));
--Msg2SubWorld(format("<color=red>Th«ng b¸o b¶o tr× s¸ng ngµy 13/12 <color=yellow>tõ 10h30 ®Õn 11h30 <color>®Ó s¸t nhËp 2 m¸y chñ chi tiÕt xem t¹i trang chñ  <color=yellow>chivuong.net<color> !!! <color>",GetName()));  
end
function nhancap()
	local nMaxCount = CalcFreeItemCellCount()
	g_AskClientNumberEx(0,200, "NhËp sè!", {nhancapg, {num}})
end
function nhancapg(num)
	local nCurLevel = GetLevel()
	local nAddLevel = num - nCurLevel
	ST_LevelUp(nAddLevel)
end
function nhanne()

	if CalcFreeItemCellCount() < 30 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 60 « trèng råi h·y më.",0);
		return 1;
	end
if GetLevel() <= 119 then
if (GetTask(52) == 0) then
local tbItem = {tbProp={0,204},nQuality=1, nBindState = -2,nExpiredTime = 2880}
tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
local tbItem = {tbProp={0,205},nQuality=1, nBindState = -2,nExpiredTime = 2880}
tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
local tbItem = {tbProp={0,206},nQuality=1, nBindState = -2,nExpiredTime = 2880}
tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
local tbItem = {tbProp={0,207},nQuality=1, nBindState = -2,nExpiredTime = 2880}
tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
SetTask(52,1) -- Danh dau da hoan thanh nhiem vu
else
Say("<color=green>Mçi nh©n vËt nhËn 1 lÇn .") 
end
else
Say("<color=green>D­íi cÊp 120 míi nhËn ®­îc .") 
end
end
function XepHang_Top10ALL()
	Ladder_NewLadder(10287, GetName(),GetLevel(),1);
end
function XoaXepHang()
	for i=10270,10281 do
		Ladder_ClearLadder(i)
	end
	Ladder_ClearLadder(10119)
end
function jinshop_sell() 
Sale(98, 4); 
end; 
function reload1()
	local tbOpt =
	{
		{"tmd", tmd},
		{"tong hop", tonghop},
		{"log in", filelog},
		{"dame", dame10phai},
		{"luu nhan vat", save},
		{"reload ngay", rsngay},
		{"Tho¸t"},
	}
	CreateNewSayEx("<npc>chøc n¨ng Reload", tbOpt)
end
function reload()
--LoadScript("/script/global/chanle/memdanh.lua")
--LoadScript("/script/global/chanle/chanle.lua")
--LoadScript("/script/global/translife.lua")
--LoadScript("/script/tagnewplayer/tbitemhk.lua")
--LoadScript("/script/missions/boss/bossdeath.lua")
--LoadScript("/script/missions/maze/item/mazeextaward.lua")
LoadScript("/script/global/item/bktieu.lua")
-- LoadScript("/script/global/judgeoffline.lua")
-- LoadScript("/script/global/judgeoffline_limit.lua")
-- LoadScript("/script/global/judgeoffline_special.lua")
--LoadScript("/script/item/market_pack.lua")
end
function rsngay()
LoadScript("/script/global/baucua.lua")
--LoadScript("/script/missions/yuegedao/yuegedao/yuegedaoplayer.lua")
end

function tmd()
LoadScript("/script/global/gmrole.lua")
LoadScript("/script/global/namcung/gmquanlyserver/quanly.lua")
LoadScript("/script/global/namcung/login/login.lua")
end

function ktshop()
--Sale(146,11)-- shop lien dau
--Sale(174,100)-- shop lien dau
	CreateStores();
	AddShop2Stores(174, "Cöa hµng 1", 15, 100, "fBuyCallBack(%d,%d)");
	AddShop2Stores(179,"Cöa hµng 1 ", 1, 100, "fBuyCallBack(%d,%d)"); 
	AddShop2Stores(93,"Cöa hµng 1 ", 2, 100, "fBuyCallBack(%d,%d)"); 
	AddShop2Stores(98,"Cöa hµng 1 ", 4, 100, "fBuyCallBack(%d,%d)"); 
	AddShop2Stores(146,"Cöa hµng 1 ", 11, 100, "fBuyCallBack(%d,%d)"); 
	AddShop2Stores(173,"Cöa hµng 1 ", 13, 100, "fBuyCallBack(%d,%d)"); 
	OpenStores();
end
function xxx()
LoadScript("/script/ÖÐÔ­±±Çø/ãê¾©/ãê¾©/npc/ãê¾©_ÔÓ»õµêÀÏ°å¶Ô»°.lua")
end


function gioihan()
LoadScript("/script/global/volamht/hancheip.lua")
end
QUAIBALANG= {
{32*1549,3265*32},}
function mapmoi()
	local npcmapindex = SubWorldID2Idx(53)
for i=1,getn(QUAIBALANG) do
IDQUAI = 1872
local npcblh= AddNpc(IDQUAI,95,npcmapindex,QUAIBALANG[i][1],QUAIBALANG[i][2])


end
end
function dame10phai()
LoadScript("/script/skill/tianwang.lua")
LoadScript("/script/skill/emei.lua")
LoadScript("/script/skill/wudang.lua")
LoadScript("/script/skill/shaolin.lua")
LoadScript("/script/skill/tianren.lua")
LoadScript("/script/skill/wudu.lua")
LoadScript("/script/skill/tangmen.lua")
LoadScript("/script/skill/gaibang.lua")
LoadScript("/script/skill/cuiyan.lua")
LoadScript("/script/skill/kunlun.lua")
end
function tonghop()
--LoadScript("/script/missions/yandibaozang/head.lua")
LoadScript("/script/global/mautrain.lua")
LoadScript("/script/global/moraphao.lua")
LoadScript("/script/global/eventphao.lua")
LoadScript("/script/global/phaodai.lua")
--LoadScript("/script/activitysys/config/1010/variables.lua")
--LoadScript("/script/activitysys/config/1010/config.lua")
LoadScript("/script/global/event.lua")
--LoadScript("/script/activitysys/config/12/usehealbag.lua")
LoadScript("/script/global/maupk.lua")
--LoadScript("/script/vng_event/item/giahanphu.lua")
LoadScript("/script/global/minhphuongcamnang.lua")
LoadScript("/script/global/tuiso.lua")
--LoadScript("/script/global/baoruongvuotai.lua")
--LoadScript("/script/global/baoruongviemde.lua")
--LoadScript("/script/global/baoruongkiemgia.lua")
LoadScript("/script/global/tanthu.lua")
LoadScript("/script/vng_feature/trungluyen/globalvar.lua")
LoadScript("/script/vng_feature/trungluyen/refine_equip.lua")
LoadScript("/script/event/equip_publish/baihu/equiptable.lua")
LoadScript("/script/event/equip_publish/baihu/refine_equip.lua")
--LoadScript("/script/giftcode/giftcodedata.lua")
--LoadScript("/script/giftcode/code.lua")
--LoadScript("/script/missions/sevencity/dialog_npc.lua")
LoadScript("/script/global/vn/gamebank_proc.lua")
--LoadScript("/script/global/shenmi_chapman.lua")
LoadScript("/script/global/Áã··¹¦ÄÜ.lua")
LoadScript("/script/global/tuicao.lua")
--LoadScript("/script/global/tuisukien.lua")
LoadScript("/script/item/ib/shenxingfu.lua")
--LoadScript("/script/nationalwar/npc.lua")
--LoadScript("/script/event/birthday_jieri/200905/npc/npc_zhanxin_zunzhe.lua")
LoadScript("/script/misc/itemexchangevalue/ex_goldequip_head.lua")
--LoadScript("/script/global/hotro.lua")
LoadScript("/script/global/shop.lua")
LoadScript("/script/global/namcung/tinhnang/newboss/call_boss_letuan.lua")
LoadScript("/script/global/seasonnpc.lua")
LoadScript("/script/global/Â·ÈË_Àñ¹Ù.lua")
--LoadScript("/script/missions/sevencity/war.lua")
LoadScript("/script/task/tollgate/messenger/posthouse.lua")
--LoadScript("/script/task/tollgate/killer/nieshichen.lua")
--LoadScript("/script/missions/challengeoftime/npc/dragonboat_main.lua")
LoadScript("/script/missions/boss/bossdeath.lua")
LoadScript("/script/missions/maze/item/mazeextaward.lua")
LoadScript("/script/missions/maze/maze.lua")
LoadScript("/script/misc/itemexchangevalue/ex_goldequip_lingpai.lua")
end
function filelog()
LoadScript("/script/global/login.lua")
end
function time()
LoadScript("/script/global/timer.lua")
end
function NhapDuongDanFileCanReLoadOK(Link)
        local ReloadScript = LoadScript(Link);
        if (ReloadScript ) then
            Msg2Player("<color=green>Reload thµnh c«ng Script<color><enter><color=blue>"..Link.."");
        end
end

function NhapDuongDanFileCanReLoad()
    return AskClientForString("NhapDuongDanFileCanReLoadOK", "", 1, 500, "<#>NhËp ®­êng dÉn")
end  

function abcxyz(nindex) 
Title_AddTitle(nindex, 1, 4302359); 
Title_ActiveTitle(nindex); 
SetTask(1122, nindex); 
end 
function DanhHieu() 
local szTitle = "<npc>moi ban chon danh hieu" 
local tbOpt = 
{ 
{"VL Kiet xuat", abcxyz,{500}}, 
{"VL Minh Chu", abcxyz,{188}}, 
{"Ngu Long", abcxyz,{165}}, 
{"Ngu Long", abcxyz,{150}}, 
{"Ngu Long", abcxyz,{189}}, 
{"Tuyet The Cao Thu", abcxyz,{235}}, 
{"Manh Long Tranh Ba", abcxyz,{228}}, 
{"Manh Long Tranh Ba", abcxyz,{263}}, 
{"Tho¸t"}, 
} 
CreateNewSayEx(szTitle, tbOpt) 
end


function epdotim()
AddItem(0,1,2,10,1,200,10)--do xamh
AddQualityItem(2,0,1,2,10,0,0,-1,-1,-1,-1,-1,-1) --foi tim
--AddItem(6,1,147,10,0,0,0) --thuy tinh c?p t? 1 - 10
--AddItem(6,1,149,1,0,0,0) --dá hi?n 1
--AddItem(6,1,150,1,3,0,0) --dá ?n 1, h? Kim M?c Th?y H?a Th? tuong ?ng 0 1 2 3 4
--AddItem(6,1,151,1,0,0,0) --dá hi?n 2
--AddItem(6,1,152,1,3,0,0) --dá ?n 2, h? nhu trên
--AddItem(6,1,153,1,0,0,0) --dá hi?n 3
--AddItem(6,1,154,1,3,0,0) --dá ?n 3, h? nhu trên

end;
function lenhbaigoiboss()
--for i =1,10 do--lap 10 lan de lay 10 cai lenh bai
--AddItem(6,1,1022,0,0,0)
AddItem(0,1,2,1110,1,0,0)
end



function nguyenlieu()  
AddStackItem(200,6,1,2312,1,0,0,0)
AddStackItem(200,6,1,2312,1,0,0,0)
AddStackItem(200,6,1,2312,1,0,0,0)
AddStackItem(200,6,1,2312,1,0,0,0)
AddStackItem(200,6,1,2312,1,0,0,0)
AddStackItem(200,6,1,2312,1,0,0,0)
AddStackItem(200,6,1,2312,1,0,0,0)
AddStackItem(200,6,1,2312,1,0,0,0)
AddStackItem(200,6,1,2312,1,0,0,0)
AddStackItem(200,6,1,2312,1,0,0,0)
Msg2Player("B¹n ®· mua <color=blue>10<color><color=yellow> Hçn Nguyªn Linh Lé <color>=<color=blue>50<color> V¹n L­îng")  
end 



function toado()
	local w,x,y = GetWorldPos();
	-- Msg2Player("M¸p sè <color=Green>"..w.."<color> täa ®é <color=Yellow>"..x..", "..y)
	-- Msg2Player("M¸p sè <color=Green>"..w.."<color> täa ®é <color=Yellow>"..floor(x/32)..", "..floor(y/32))
	Talk(1,"","M¸p sè <color=Green>"..w.."<color> täa ®é <color=Yellow>"..x..", "..y.." ")
	-- Talk(1,"","M¸p sè <color=Green>"..w.."<color> täa ®é <color=Yellow>"..floor(x/32)..", "..floor(y/32).." ")
end;

function yes()
Sale(142)
end;

function doxanh()
--AddItem(6,1,3377,1,0,0,0,0)--DO pho HK
--AddEventItem(348)
--AddItem(6,1,4369,1,0,0,0,0)--lenh bai adm
--AddItem(6,1,1266,1,0,0,0,0)--thanh hanh phu
AddItem(6,1,1254,1,0,0,0,0)--
AddItem(6,1,1255,1,0,0,0,0)
AddItem(6,1,1256,1,0,0,0,0)
AddItem(6,1,1257,1,0,0,0,0)
--AddItem(6,1,1083,1,0,0,0,0)--tho dia phu
end


function laydoxanh()
--AddGoldItem (0,3)-- do xanh
--AddEventItem(343)-- kim nguyên b?o
--AddStackItem(100,4,417,1,1,0,0,0) --ti?n d?ng
--AddItem(0,1,1,10,1,200,10) ----do xanh
AddEventItem(942)-- manh HK
end


tab_RevivePos = {
	[1] = {	--"Thµnh §«"
		{"Cöa §«ng", 6, 11},{"Cöa T©y", 7, 11},{"Cöa Nam", 8, 11},{"Cöa B¾c", 9, 11},{"Trung T©m", 5, 11}
	},
	[2] = {	--"T­¬ng D­¬ng"
		{"Cöa §«ng", 30, 78},{"Cöa T©y", 32 , 78},{"Cöa Nam", 31, 78},{"Cöa B¾c", 33, 78},{"Trung T©m", 29, 78}
	},
	[3] = {	--"Ph­îng T­êng"
		{"Cöa §«ng", 1, 1},{"Cöa T©y", 2, 1},{"Cöa Nam", 3, 1},{"Cöa B¾c", 4, 1},{"Trung T©m", 0, 1}
	},
	[4] = {	--"§¹i Lý"
		{"Cöa B¾c", 64, 162},{"Trung T©m", 63, 162}
	},
	[5] = {	--"BiÖn Kinh"
		{"Cöa §«ng", 24, 37},{"Cöa T©y", 25, 37},{"Cöa Nam", 24, 37},{"Cöa B¾c", 26, 37},{"Trung T©m", 23, 37}
	},
	[6] = {	--"D­¬ng Ch©u"
		{"Cöa §«ng", 35, 80},{"Cöa T©y", 38, 80},{"Cöa Nam", 37, 80},{"Cöa B¾c", 36, 80},{"Trung T©m", 34, 80}
	},
	[7] = {	--"L©m An"
		{"Cöa §«ng", 68, 176},{"Cöa Nam", 67, 176},{"Cöa B¾c", 69, 176}
	},
	[8] = {	--"Th«n TrÊn"
		{"Ba L¨ng HuyÖn", 19, 53},{"Giang T©n Th«n", 10, 20},{"VÜnh L¹c TrÊn", 43, 99},{"Chu Tiªn TrÊn", 45, 100},{"§¹o H­¬ng Th«n", 47, 101},{"Long M«n TrÊn", 55, 121},{"Th¹ch Cæ TrÊn", 59, 153},{"Long TuyÒn Th«n", 65, 174}
	},
	[9] = {	--"M«n Ph¸i"
		{"Thiªn V­¬ng", 21, 59},{"ThiÕu L©m", 52, 103},{"§­êng M«n", 15, 25},{"Ngò §éc", 71, 183},{"Nga Mi", 13, 13},{"Thóy Yªn", 61, 154},{"Thiªn NhÉn", 28, 49},{"C¸i Bang", 53, 115},{"Vâ §ang", 40, 81},{"C«n L«n", 58, 131}
	},
};
--Éè¶¨ÖØÉúµã£¨Ñ¡³ÇÊÐ£©
function set_backpos()
	for i = 1, getn(tbBATTLEMAP) do 
		if ( nMapId == tbBATTLEMAP[i] ) then
			Msg2Player("Kh«ng thÓ sö dông ë ®©y!");
			return 1;
		end
	end	
	

	
	local tab_Content = {
		"Rêi khái/no",
		"  Thµnh §«/#setpos_step2(1)",
		"  T­¬ng D­¬ng/#setpos_step2(2)",
		"  Ph­îng T­êng/#setpos_step2(3)",
		"  §¹i Lý/#setpos_step2(4)",
		"  BiÖn Kinh/#setpos_step2(5)",
		"  D­¬ng Ch©u/#setpos_step2(6)",
		"  L©m An/#setpos_step2(7)",
		"  Th«n trÊn/#setpos_step2(8)",
		"  M«n ph¸i/#setpos_step2(9)"
		
	}
	Say("ThÇn Hµnh Phï, di chuyÓn ®Õn n¬i cÇn ®Õn.", getn(tab_Content), tab_Content);
end;

--Ñ¡µØµã
function setpos_step2(nIdx)
	local tab_Content = {};
	for i = 1, getn(tab_RevivePos[nIdx]) do
		tinsert(tab_Content, tab_RevivePos[nIdx][i][1].."/#setpos_step3( "..nIdx..","..i..")");
	end;
	tinsert(tab_Content, "Kh«ng ®i.../no");
	Say("ThÇn Hµnh Phï, di chuyÓn ®Õn n¬i cÇn ®Õn.", getn(tab_Content), tab_Content);
end;

--Ñ¡µØµã
function setpos_step3(nIdx, nSubIdx)
	SetRevPos(tab_RevivePos[nIdx][nSubIdx][3], tab_RevivePos[nIdx][nSubIdx][2]);
	Say("ThiÕt lËp ®Þa ®iÓm hßi sinh thµnh c«ng ë "..tab_RevivePos[nIdx][nSubIdx][1], 0);
	--Msg2Player("§· ®Õn "..tab_RevivePos[nIdx][nSubIdx][1]);
end;

--»Ø³Ç
function gototown()
	
	local tab_Content = {
		"  Rêi khái/no",
		
		"Thµnh thÞ/gopos_step2town",
		"Th«n trang/#gopos_step2(8)",
		"M«n ph¸i/#gopos_step2(9)",
		"Hoa S¬n Ph¸i/tth",
		"B¶n ®å cÊp 90/#gopos_step2lv90()",
		"ChiÕn tr­êng Tèng Kim/gopos_step2battle",
		"ChiÕn tr­êng ThÊt §¹i Thµnh ChiÕn/cncm"

		
	}
	Say("ThÇn Hµnh Phï, di chuyÓn ®Õn n¬i cÇn ®Õn.", getn(tab_Content), tab_Content);
end;
function cncm()
Say("Chøc n¨ng nµy hiÖn ®ang hoµn thiÖn",0)
end
function tth()
NewWorld(333,167*8+7,196*16)
end
function chidi()
gototown()
end


function gopos_step2town()
	local tab_Content = {
		
		"Thµnh §«/#gopos_step2(1)",
		"T­¬ng D­¬ng/#gopos_step2(2)",
		"Ph­îng T­êng/#gopos_step2(3)",
		"§¹i Lý/#gopos_step2(4)",
		"BiÖn Kinh/#gopos_step2(5)",
		"D­¬ng Ch©u/#gopos_step2(6)",
		"L©m An/#gopos_step2(7)",
		"Kh«ng ®i./no"
	}
	Say("ThÇn Hµnh Phï, di chuyÓn ®Õn n¬i cÇn ®Õn.", getn(tab_Content), tab_Content);
end

--ÉñÐÐ·û£­£­£­£­µÚ¶þ²½
function gopos_step2(nIdx)
	local tab_Content = {};
	for i = 1, getn(tab_RevivePos[nIdx]) do
		tinsert(tab_Content, tab_RevivePos[nIdx][i][1].."/#gopos_step3( "..nIdx..","..i..")");
	end;
	tinsert(tab_Content, "Kh«ng ®i/no");
	Say("ThÇn Hµnh Phï, di chuyÓn ®Õn n¬i cÇn ®Õn.", getn(tab_Content), tab_Content);
end;

--ÉñÐÐ·û£­£­£­£­µÚÈý²½
function gopos_step3(nIdx, nSubIdx)
	local file = [[\settings\RevivePos.ini]];
	ini_loadfile(file, 0)
	local szData = ini_getdata(file, tab_RevivePos[nIdx][nSubIdx][3], tab_RevivePos[nIdx][nSubIdx][2]);

	local szArr = split(szData);
	local nPosX = floor(tonumber(szArr[1]) / 32);
	local nPosY = floor(tonumber(szArr[2]) / 32);
	
	if (not nPosX or not nPosY) then
		return
	end;
	NewWorld(tab_RevivePos[nIdx][nSubIdx][3], nPosX, nPosY)
	SetFightState(0);
	Msg2Player("Ngåi yªn! Chóng ta ®i!"..tab_RevivePos[nIdx][nSubIdx][1].."¿©");
end;


tab_lv90map = {
		{322,1589,3164	,"Tr­êng B¹ch S¬n B¾c",},
		{321,967,2313	,"Tr­êng B¹ch S¬n Nam",},
		{75,1811,3012	,"Xi V­u §éng Mª Cung",},
		{227,1588,3237	,"Sa M¹c Mª Cung 3",},
		{225,1474,3275	,"Sa M¹c Mª Cung 1",},
		{226,1560,3184	,"Sa M¹c Mª Cung 2",},
		{336,1124,3187	,"Phong L¨ng §é",},
		{340,1845,3438	,"M¹c Cao QuËt",},
		{144,1691,3020	,"D­îc V­¬ng §éng TÇng 4",},
		{93,1529,3166	,"TiÕn Cóc §éng MËt Cung",},
		{124,1675,3418	,"Hiªn Viªn §éng Mª Cung",},
		{152,1672,3361	,"TuyÕt B¸o §éng TÇng 8",},
                {917,1816,3392	,"Ph¸ch HuyÕt Cèc",},
		{918,1816,3392	,"Ác Nh©n Cèc",},
		{919,1608,3168	,"Thùc Cèt Nhai",},
		{920,1608,3168	,"H¾c Méc Nhai",},
		{921,1560,3104	,"Thiªn Phô S¬n",},
		{922,1560,3104	,"Bµn Long S¬n",},
		{923,2008,4080	,"§Þa MÉu S¬n",},
		{924,2008,4080	,"UyÓn Ph­îng S¬n",},
	}

function gopos_step2lv90(ns, ne)
	print(ns, ne)
	if (not ns) then
		ns_1 = 1;
		ne_1 = 7;
	else
		ns_1 = ns;
		ne_1 = ne;
	end
	
	if (ne_1 - ns_1 > 6) then
		ne_1 = ns_1 + 6;
	end
	
	local n_count = getn(tab_lv90map);
	
	local tab_Content = {};
	for i = ns_1, ne_1 do
		tinsert(tab_Content, tab_lv90map[i][4].."/#gopos_step3lv90( "..i..")");
	end
	
	if (ns_1 ~= 1) then
		tinsert(tab_Content, "Trang tr­íc/#gopos_step2lv90( 1,"..(ns_1-1)..")");
	end
	
	if (ne_1 < n_count) then
		tinsert(tab_Content, "Trang sau/#gopos_step2lv90( "..(ne_1+1)..","..n_count..")");
	end
	
	tinsert(tab_Content, "Hñy bá/no");
	Say("ThÇn Hµnh Phï, di chuyÓn ®Õn n¬i cÇn ®Õn.", getn(tab_Content), tab_Content);
end


function gopos_step3lv90(nIdx)
	NewWorld(tab_lv90map[nIdx][1], tab_lv90map[nIdx][2], tab_lv90map[nIdx][3])
	SetFightState(1);
	Msg2Player("Ngåi yªn! Chóng ta ®i!"..tab_lv90map[nIdx][4].."!");
end


function gopos_step2battle()
	if ( GetLevel() < 120 ) then
		Talk( 1, "", "ChiÕn Tr­êng tµn khèc, ng­êi ch­a ®¹t ®Õn LV120, nªn ®õng cã ham hè :v" );
	else
		Say ( "Ng­¬i qu¶ thËt muèn ®Õn chiÕn tr­êng Tèng Kim?", 3, "Tèng qu©n ghi danh./#DoRescriptFunc(1)", "Kim qu©n ghi danh/#DoRescriptFunc(2)","À ê... ®Ó ta suy nghÜ l¹i./no" );
	end;
end

function gopos_sevencityfield()
	Say("ThÊt §¹i Thµnh ChiÕn, ng­êi muèn ®Õn n¬i nµo?", 8,
		"Thµnh §« chiÕn tr­êng/#goto_sevencityfield(1)",
		"T­¬ng D­¬ng chiÕn tr­êng/#goto_sevencityfield(2)",
		"Ph­îng T­êng chiÕn tr­êng/#goto_sevencityfield(3)",
		"§¹i Lý chiÕn tr­êng/#goto_sevencityfield(4)",
		"BiÖn Kinh chiÕn tr­êng/#goto_sevencityfield(5)",
		"D­¬ng Ch©u chiÕn tr­êng/#goto_sevencityfield(6)",
		"L©m An chiÕn tr­êng/#goto_sevencityfield(7)",
		"Th«i kh«ng ®i.../Cancel")
end

function goto_sevencityfield(nIndex)
	local player = PlayerList:GetPlayer(PlayerIndex)
	local tbErr = {}
	if (BattleWorld:CheckMapPermission(player, tbErr) == 0) then
		player:Say(tbErr.Msg)
		return
	end
	local nMapId = FIELD_LIST[nIndex]
	BattleWorld:Transfer(player, nMapId)
end

function DoRescriptFunc(nSel)
	if ( GetLevel() < 120 ) then
		Talk( 1, "", "ChiÕn Tr­êng tµn khèc, ng­êi ch­a ®¹t ®Õn LV120, nªn ®õng cã ham hè :v" );
		return
	end
	local tbsongjin_pos = {1608,3254};	
	local szstr = "Tèng qu©n ghi danh.";
	if (nSel == 2) then
		tbsongjin_pos = {1566,3277};
		szstr = "Kim qu©n ghi danh.";
	end;
	szstr = ""
	if ( GetLevel() >= 40 and GetLevel() < 80 ) then
		NewWorld( 323, tbsongjin_pos[1], tbsongjin_pos[2]);
		SetFightState(0);
		DisabledUseTownP(0); 
		Msg2Player( "ChiÕn Tr­êng S¬ cÊp" );
	elseif ( GetLevel() >= 80 and GetLevel() < 120 ) then
		NewWorld( 324, tbsongjin_pos[1], tbsongjin_pos[2]);
		SetFightState(0);
		DisabledUseTownP(0); 
		Msg2Player( "ChiÕn Tr­êng Trung cÊp" );
	else
		NewWorld( 162, tbsongjin_pos[1], tbsongjin_pos[2]);
		SetFightState(0);
		DisabledUseTownP(0); 
		Msg2Player( "ChiÕn Tr­êng Cao cÊp" );
	end
end


function no()
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
	hhl=GetTask(5050)
	hmd=GetTask(5051)
	hld=GetTask(5253)
	knb=GetTask(5793)
	ntranscount = ST_GetTransLifeCount();
    PlayerIndex=gmidx
    Msg2Player("Nh©n vËt tªn:<color=metal> "..ObjName.."<color>");
    local szTitle1 ="Tµi Kho¶n:<color=green> "..tk.."<color>  - Nh©n VËt   :<color=green> "..ObjName.."<color>\nCÊp ®é   :<color=green> "..lev.."<color> - Trïng sinh : :<color=red> "..ntranscount.."<color> - Kinh nghiÖm: <color=green>"..xp.."%<color>\nMµu      :<color=green> "..cam.."<color>             - M«n ph¸i   :<color=green>"..fac.."<color>\nTiÒn MÆt :<color=green> "..(cash/10000).." v¹n<color> - TiÒn §ång  :<color=green>"..lif.." ®ång<color>\nVÞ trÝ   : <color=blue>"..w.."<color>,<color=green>"..x.."<color>,<color=green>"..y.."<color>\n<color=yellow>Hµnh hiÖp lÖnh <color=green>"..hhl.."<color> Hé m¹ch ®¬n <color=green>"..hmd.." <color>HuyÕt long ®»ng <color=green>"..hld.."<color>\n<color=green>§· rót <color=cyan>"..knb.."<color> KNB<color>"
    local tbOpt = 
        {
            {" T¨ng cÊp ®é cho ng­êi ch¬i", tangcap1},
--            {" Hç trî tiÒn ®ång", bufskillsgm1},
            --{" tan thu lenh", tanthulenh},
 --           {" Di chuyÓn nh©n vËt vÒ 3l", move},
 --           {" CÊm ch¸t ®èi víi nh©n vËt", camchat},
 --           {" Më ch¸t cho nh©n vËt", mochat},
            --{" Add ®iÓm cho ng­êi ch¬i", buffpoint},
            {" KÝch nh©n vËt", kick},
            {" xoa pass ruong", xoapassruong},
            {" nap knb", addknb},
            {" nap xu", test},
            --{" Vip 1", vip1},
            --{" Vip 2", vip2},
            --{" Vip 3", vip3},
            --{" Vip 4", vip4},
           -- {" Vip 5", vip5},
            --{" Vip 6", vip6},
            --{" Vip 7", vip7},
            --{" Vip 8", vip8},
            --{" Vip 9", vip9},
            --{" vs", vip11},
 --           {" Kich Vip", kichvip},
            {"kh«ng cÇn n÷a"}
        }
        CreateNewSayEx(szTitle1, tbOpt);
    Msg2Player("Ng­êi ch¬i <color=cyan>"..xinxi)
end
end;
function xoapassruong()
gmidx=PlayerIndex
PlayerIndex=GetTaskTemp(200)
GMCancleBoxPassword()
end;

function truknb()
	local nMaxCount = CalcFreeItemCellCount()
	--soknb=GetExtPoint(1)
	g_AskClientNumberEx(0,soknb, "NhËp sè l­îng!", {truknb123, {num}})
end
function truknb123(num)
gmidx=PlayerIndex
PlayerIndex=GetTaskTemp(200)
--Msg2Player("Qu¶n lý <color=green>"..gmName.."<color> ®· chuyÓn <color=metal>"..num.."<color> KNB cho b¹n !");
Talk(1,"","GM ®· lÊy ®i cña b¹n <color=yellow>"..num.."<color> Kim nguyªn b¶o")
--AddExtPoint(1,num)
PayExtPoint(1,num)
PlayerIndex=gmidx
Msg2Player("Nh©n vËt <color=green>"..ObjName.."<color> bÞ trï <color=metal>"..num.."<color> KNB thµnh c«ng");
Talk(1,"","Nh©n vËt <color=green>"..ObjName.."<color> bÞ trï <color=metal>"..num.."<color> KNB thµnh c«ng")
end;

function congdiemnapcard()
	local nMaxCount = CalcFreeItemCellCount()
	g_AskClientNumberEx(1,99999, "NhËp sè l­îng!", {congdiemnapcard1, {num}})
end
function congdiemnapcard1(num)
gmidx=PlayerIndex
PlayerIndex=GetTaskTemp(200)
--Msg2Player("Qu¶n lý <color=green>"..gmName.."<color> ®· chuyÓn <color=metal>"..num.."<color> KNB cho b¹n !");
-- Talk(1,"","GM ®· n¹p vµo tiÒn trang cña b¹n <color=yellow>"..num.."<color> Kim nguyªn b¶o")
SetTask(5793,GetTask(5793)+num)
--PayExtPoint(1,num)
PlayerIndex=gmidx
Msg2Player("Nh©n vËt <color=green>"..ObjName.."<color> ®­îc b¹n t¨ng <color=metal>"..num.."<color> ®iÓm tÝch lòy n¹p thÎ");
Talk(1,"","Nh©n vËt <color=green>"..ObjName.."<color> ®­îc b¹n t¨ng <color=metal>"..num.."<color> ®iÓm tÝch lòy n¹p thÎ")
logplayer("dulieu/add_diem_nap_card.txt",format("[IP : %s ] - Thêi gian : %s  - ["..gmName.."] Add "..num.." ®iÓm tÝch lòy n¹p thÎ cho ["..ObjName.."] ! ",GetIP(),GetLocalDate("%m/%d/%Y_%H:%M:%S")))

end;

function addknb()
	local nMaxCount = CalcFreeItemCellCount()
	g_AskClientNumberEx(0,9999, "NhËp sè l­îng!", {addknb123, {num}})
end
function addknb123(num)
gmidx=PlayerIndex
PlayerIndex=GetTaskTemp(200)
--Msg2Player("Qu¶n lý <color=green>"..gmName.."<color> ®· chuyÓn <color=metal>"..num.."<color> KNB cho b¹n !");
Talk(1,"","GM ®· n¹p vµo tiÒn trang cña b¹n <color=yellow>"..num.."<color> Kim nguyªn b¶o")
AddExtPoint(1,num)
AddExtPoint(2,num)
--PayExtPoint(1,num)
PlayerIndex=gmidx
Msg2Player("Nh©n vËt <color=green>"..ObjName.."<color> ®­îc b¹n t¨ng <color=metal>"..num.."<color> KNB thµnh c«ng");
Talk(1,"","Nh©n vËt <color=green>"..ObjName.."<color> ®­îc b¹n t¨ng <color=metal>"..num.."<color> KNB thµnh c«ng")
logplayer("dulieu/add_knb_adm.txt",format("[IP : %s ] - Thêi gian : %s  - ["..gmName.."] Add "..num.." KNB cho ["..ObjName.."] ! ",GetIP(),GetLocalDate("%m/%d/%Y_%H:%M:%S")))

end;
function kichvip()
gmidx=PlayerIndex
PlayerIndex=GetTaskTemp(200)
--local tbItem = {tbProp={4,417,1,1,0,0},nCount = 1000}
--tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
--ST_LevelUp(3)
local tbItem = {tbProp={6,1,4378,1,0,0},tbParam={1,0,0,0,0,0},nCount =1}
tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
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
AskClientForNumber("testtangxu",0,20000,"NhËp sè xu")
end
function testtangxu(num)
gmidx=PlayerIndex
PlayerIndex=GetTaskTemp(200)
Msg2Player("Qu¶n lý <color=green>"..gmName.."<color> ®· chuyÓn <color=metal>"..num.."<color> xu cho b¹n !");
local tbItem = {tbProp={4,417,1,1,0,0},nCount = num}
tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
PlayerIndex=gmidx
Msg2Player("Nh©n vËt <color=green>"..ObjName.."<color> ®­îc b¹n t¨ng <color=metal>"..num.."<color> xu thµnh c«ng");
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
AskClientForNumber("tangcap",0,100,"cÊp cÇn t¨ng")
end
function tangcap1bin()
AskClientForNumber("nhancap",0,200,"cÊp cÇn t¨ng")
end
function layexp()
AddExp(-1000)
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
function tanthulenh()
gmidx=PlayerIndex
PlayerIndex=GetTaskTemp(200)
Msg2Player("Qu¶n lý <color=green>"..gmName.."<color> ®· t¨ng <color=metal>T©n thñ lÖnh<color> cho b¹n !");
local tbItem = {szName="t©n thñ lÖnh bµi.", tbProp={6, 1, 4419,1,0,0}, nBindState = -2}
tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
PlayerIndex=gmidx
Msg2Player("Nh©n vËt <color=green>"..ObjName.."<color> ®­îc b¹n t¨ng <color=metal>T©n thñ lÖnh<color> thµnh c«ng");
end;

function move()
if GetAccount() == gmcaocap then
gmidx=PlayerIndex
PlayerIndex=GetTaskTemp(200)
w,x,y=GetWorldPos()
if (w~=53) then
SetFightState(0)
NewWorld(53,200*8,200*16)
else
SetPos(1630, 3255)
end
-- Msg2Player("Qu¶n lý <color=green>"..gmName.."<color> ®· di chuyÓn b¹n vÒ Ba L¨ng HuyÖn");
Msg2Player("Qu¶n lý ®· di chuyÓn b¹n vÒ Ba L¨ng HuyÖn");
PlayerIndex=gmidx
Msg2Player("Nh©n vËt <color=green>"..ObjName.."<color> ®­îc b¹n di chuyÓn vÒ Ba LÆng HuyÖn thµnh c«ng");
else
Say("Kh«ng ®ñ quyÒn sö dông chøc n¨ng nµy",0);
end
end

function kick()
gmidx=PlayerIndex
PlayerIndex=GetTaskTemp(200)
--Msg2Player("Qu¶n lý <color=green>"..gmName.."<color> ®· kick kÑt tµi kho¶n cho b¹n");
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









function vip1()
gmidx=PlayerIndex
PlayerIndex=GetTaskTemp(200)
ST_LevelUp(200)
local tbItem = {tbProp={6,1,1390,1,0,0},nCount =1, nBindState = -2}
tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
n_title = 247
	local nServerTime = GetCurServerTime()+ 1728000; --20*24*60*60
	local nDate	= FormatTime2Number(nServerTime);
	local nDay	= floor(mod(nDate,1000000) / 10000);
	local nMon	= mod(floor(nDate / 1000000) , 100)
	local nTime	= nMon * 1000000 + nDay * 10000	-- ?????????	
	Title_AddTitle(n_title, 2, nTime)
	Title_ActiveTitle(n_title)
	SetTask(1122, n_title)
end
function vip2()
gmidx=PlayerIndex
PlayerIndex=GetTaskTemp(200)
ST_LevelUp(200)
local tbItem = {tbProp={6,1,1390,1,0,0},nCount =1, nBindState = -2}
tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
n_title = 248
	local nServerTime = GetCurServerTime()+ 1728000; --20*24*60*60
	local nDate	= FormatTime2Number(nServerTime);
	local nDay	= floor(mod(nDate,1000000) / 10000);
	local nMon	= mod(floor(nDate / 1000000) , 100)
	local nTime	= nMon * 1000000 + nDay * 10000	-- ?????????	
	Title_AddTitle(n_title, 2, nTime)
	Title_ActiveTitle(n_title)
	SetTask(1122, n_title)
end
function vip3()
gmidx=PlayerIndex
PlayerIndex=GetTaskTemp(200)
ST_LevelUp(200)
local tbItem = {tbProp={6,1,1390,1,0,0},nCount =1, nBindState = -2}
tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
n_title = 249
	local nServerTime = GetCurServerTime()+ 1728000; --20*24*60*60
	local nDate	= FormatTime2Number(nServerTime);
	local nDay	= floor(mod(nDate,1000000) / 10000);
	local nMon	= mod(floor(nDate / 1000000) , 100)
	local nTime	= nMon * 1000000 + nDay * 10000	-- ?????????	
	Title_AddTitle(n_title, 2, nTime)
	Title_ActiveTitle(n_title)
	SetTask(1122, n_title)
end
function vip4()
gmidx=PlayerIndex
PlayerIndex=GetTaskTemp(200)
ST_LevelUp(200)
local tbItem = {tbProp={6,1,1390,1,0,0},nCount =1, nBindState = -2}
tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
n_title = 250
	local nServerTime = GetCurServerTime()+ 1728000; --20*24*60*60
	local nDate	= FormatTime2Number(nServerTime);
	local nDay	= floor(mod(nDate,1000000) / 10000);
	local nMon	= mod(floor(nDate / 1000000) , 100)
	local nTime	= nMon * 1000000 + nDay * 10000	-- ?????????	
	Title_AddTitle(n_title, 2, nTime)
	Title_ActiveTitle(n_title)
	SetTask(1122, n_title)
end
function vip5()
gmidx=PlayerIndex
PlayerIndex=GetTaskTemp(200)
ST_LevelUp(200)
local tbItem = {tbProp={6,1,1390,1,0,0},nCount =1, nBindState = -2}
tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
n_title = 251
	local nServerTime = GetCurServerTime()+ 365*24*60*60; --20*24*60*60
	local nDate	= FormatTime2Number(nServerTime);
	local nDay	= floor(mod(nDate,1000000) / 10000);
	local nMon	= mod(floor(nDate / 1000000) , 100)
	local nTime	= nMon * 1000000 + nDay * 10000	-- ?????????	
	Title_AddTitle(n_title, 2, nTime)
	Title_ActiveTitle(n_title)
	SetTask(1122, n_title)
end




function abcxyz(nindex)
gmidx=PlayerIndex
PlayerIndex=GetTaskTemp(200)
Title_AddTitle(nindex, 1, 1*24*60*60);
Title_ActiveTitle(nindex);
SetTask(1122, nindex);
end
function vip11()
local szTitle = "<npc>moi ban chon danh hieu"
local tbOpt =
{
{"Vip1", abcxyz,{302}},
{"Tho¸t"},
}
CreateNewSayEx(szTitle, tbOpt)
end
function vip6()
gmidx=PlayerIndex
PlayerIndex=GetTaskTemp(200)
n_title = 252
	local nServerTime = GetCurServerTime()+ 30*24*60*60; --20*24*60*60
	local nDate	= FormatTime2Number(nServerTime);
	local nDay	= floor(mod(nDate,1000000) / 10000);
	local nMon	= mod(floor(nDate / 1000000) , 100)
	local nTime	= nMon * 1000000 + nDay * 10000	-- ?????????	
	Title_AddTitle(n_title, 2, nTime)
	Title_ActiveTitle(n_title)
	SetTask(1122, n_title)
end
function vip7()
gmidx=PlayerIndex
PlayerIndex=GetTaskTemp(200)
n_title = 253
	local nServerTime = GetCurServerTime()+ 1728000; --20*24*60*60
	local nDate	= FormatTime2Number(nServerTime);
	local nDay	= floor(mod(nDate,1000000) / 10000);
	local nMon	= mod(floor(nDate / 1000000) , 100)
	local nTime	= nMon * 1000000 + nDay * 10000	-- ?????????	
	Title_AddTitle(n_title, 2, nTime)
	Title_ActiveTitle(n_title)
	SetTask(1122, n_title)
end
function vip8()
gmidx=PlayerIndex
PlayerIndex=GetTaskTemp(200)
n_title = 254
	local nServerTime = GetCurServerTime()+ 46656000; --20*24*60*60
	local nDate	= FormatTime2Number(nServerTime);
	local nDay	= floor(mod(nDate,1000000) / 10000);
	local nMon	= mod(floor(nDate / 1000000) , 100)
	local nTime	= nMon * 1000000 + nDay * 10000	-- ?????????	
	Title_AddTitle(n_title, 2, nTime)
	Title_ActiveTitle(n_title)
	SetTask(1122, n_title)
end
function vip9()
gmidx=PlayerIndex
PlayerIndex=GetTaskTemp(200)
n_title = 255
	local nServerTime = GetCurServerTime()+ 46656000; --20*24*60*60
	local nDate	= FormatTime2Number(nServerTime);
	local nDay	= floor(mod(nDate,1000000) / 10000);
	local nMon	= mod(floor(nDate / 1000000) , 100)
	local nTime	= nMon * 1000000 + nDay * 10000	-- ?????????	
	Title_AddTitle(n_title, 2, nTime)
	Title_ActiveTitle(n_title)
	SetTask(1122, n_title)
end
function vip10()
gmidx=PlayerIndex
PlayerIndex=GetTaskTemp(200)
n_title = 256
	local nServerTime = GetCurServerTime()+ 46656000; --20*24*60*60
	local nDate	= FormatTime2Number(nServerTime);
	local nDay	= floor(mod(nDate,1000000) / 10000);
	local nMon	= mod(floor(nDate / 1000000) , 100)
	local nTime	= nMon * 1000000 + nDay * 10000	-- ?????????	
	Title_AddTitle(n_title, 2, nTime)
	Title_ActiveTitle(n_title)
	SetTask(1122, n_title)
end
tbDoXanh =
{
[1]=
{
szName = "Vò khÝ c©n chiÕn",
tbEquip =
{
{"HuyÒn ThiÕt KiÕm",0,0,0},
{"§¹i Phong §ao",0,0,1},
{"Kim C« Bæng",0,0,2},
{"Ph¸ Thiªn KÝch",0,0,3},
{"Ph¸ Thiªn chïy",0,0,4},
{"Th«n NhËt Tr·m",0,0,5},
}
},
[2]=
{
szName = "Vò khÝ tÇm xa",
tbEquip =
{
{"B¸ V­¬ng Tiªu",0,1,0},
{"To¸i NguyÖt §ao",0,1,1},
{"Khæng T­íc Linh",0,1,2},
}
},
}
function laydoxanh()
local tbOpt = {}
for i=1, getn(tbDoXanh) do
tinsert(tbOpt, {tbDoXanh[i].szName, laydoxanh1, {i}})
end

tinsert(tbOpt, {"Kªt thóc ®èi tho¹i."})
CreateNewSayEx("<npc>Xin mêi lùa chän trang bÞ:", tbOpt)
end
function laydoxanh1(nType)
local tbEquip = %tbDoXanh[nType]["tbEquip"]
local tbOpt = {}
for i=1, getn(tbEquip) do
tinsert(tbOpt, {tbEquip[i][1], laydoxanh2, {i, nType}})
end

tinsert(tbOpt, {"Kªt thóc ®èi tho¹i."})
local szTitle = format("<npc>Xin mêi lùa chän trang bÞ:")
CreateNewSayEx(szTitle, tbOpt)
end
function laydoxanh2(nIndex, nType)
local tbOpt = {}
tinsert(tbOpt, {"Kim", laydoxanh3, {nIndex, nType, 0}})
tinsert(tbOpt, {"Méc", laydoxanh3, {nIndex, nType, 1}})
tinsert(tbOpt, {"Thñy", laydoxanh3, {nIndex, nType, 2}})
tinsert(tbOpt, {"Háa", laydoxanh3, {nIndex, nType, 3}})
tinsert(tbOpt, {"Thæ ", laydoxanh3, {nIndex, nType, 4}})


tinsert(tbOpt, {"Kªt thóc ®èi tho¹i."})
local szTitle = format("<npc>Chän hÖ:")
CreateNewSayEx(szTitle, tbOpt)
end
function laydoxanh3(nIndex, nType, nSeries)
g_AskClientNumberEx(0, 10, "Sè l­îng:", {laydoxanh4, {nIndex, nType, nSeries}})
end
function laydoxanh4(nIndex, nType, nSeries, nCount)
local tbEquipSelect = %tbDoXanh[nType]["tbEquip"][nIndex]
for i=1,nCount do AddItem(tbEquipSelect[2], tbEquipSelect[3], tbEquipSelect[4], 10, nSeries, 100, 10) end
end

----------------------------------=========================================================


function layevent()
	local nMaxCount = CalcFreeItemCellCount()
	g_AskClientNumberEx(0,99999, "NhËp Id Event !", {loaiev, {num}})
end
function loaiev(num)
if CalcFreeItemCellCount() < 10 then
Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 10 « trèng råi h·y më.",0);
return 1;
end
AddStackItem(500,6,1,num,1,0,0)



end
function kncongdon()
	local nMaxCount = CalcFreeItemCellCount()
	g_AskClientNumberEx(0,5, "NhËp so kinh nghiem !", {kncongdon1, {num}})
end
function kncongdon1(num)
tl_addPlayerExp(num*1000000000)
end
function vongb()
AskClientForNumber("vongbb", 0, 11256, "Xin nhËp ID");
end
function vongbb(idvongsang)
	Title_AddTitle(idvongsang, 1, 864000)
	Title_ActiveTitle(idvongsang)
	SetTask(1122, idvongsang)
end
function tuibot()
--local ntranscount = ST_GetTransLifeCount();
--if (ntranscount >= 1) then
--		Say("Trïng sinh 1 trë lªn míi sö dông ®­îc chøc n¨ng nµy !",0);
--		return 1;
--	end
AskClientForNumber("sltuibot",1,GetTask(747)/500,"<#>NhËp sè l­îng cÇn mua !")
--AskClientForNumber("sltuibot",1,10,"<#>NhËp sè l­îng cÇn mua !")
--else
--Say("<color=green>Trïng sinh 1 trë lªn míi sö dông ®­îc chøc n¨ng nµy !") 
--end
end


function sltuibot(Ntichluy)
local nCount = GetTask(747)
if nCount < Ntichluy then
	Talk(1,"","B¹n kh«ng ®ñ §iÓm tÝch lòy ! Sè §iÓm hiÖn t¹i cña b¹n lµ "..GetTask(747).."")
	return
end
SetTask(747,(GetTask(747) - Ntichluy*500))
--	for i=1, Ntichluy do
--		AddItem(6,1,4389,0,0,0)
local tbItem = {tbProp={6,1,4389,0,5,0,0},nCount = 1*Ntichluy}
tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
		Msg2SubWorld(format("<color=cyan>Ng­êi ch¬i <color=white>%s<color> ®· ®çi <color=yellow>"..Ntichluy*500 .." ®iÓm tÝch lòy<color> nhËn ®­îc <color=yellow>"..Ntichluy .." b¸nh trung thu ®Æc biÖt<color> t¹i NPC Event<color>",GetName()));
	end
--end
function testrandom()
k=random(1,100)
	Talk(1,"",""..k.."")
end
function matnaquyanh()
AddItem(0,11,455,1,0,0,0)
end
function duangua()
HorseOpenMissionWaiting()
HorseOpenMissionRacing()
end
function tbhk()
	local nMaxCount = CalcFreeItemCellCount()
	g_AskClientNumberEx(0,99999, "NhËp Id !", {tbhk1, {num}})
end
function tbhk1(num)
if CalcFreeItemCellCount() < 10 then
Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 10 « trèng råi h·y më.",0);
return 1;
end
--for i= num,num+9 do
AddGoldItem(0,num)
--end
end
function nhantask()
	local nMaxCount = CalcFreeItemCellCount()
	g_AskClientNumberEx(0,99999, "NhËp Id !", {nhantask1, {num}})
end
function nhantask1(num)
if CalcFreeItemCellCount() < 10 then
Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 10 « trèng råi h·y më.",0);
return 1;
end
SetTask(num,GetTask(num)+100000)
end
function bugtiemnang()
AddProp(2000)
end
function testtg()
local tbItem = {szName="Phi Phong.", tbProp={0,5927},nQuality=1}
tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
local tbItem = {szName="Phi Phong.", tbProp={0,5927},nQuality=1,nExpiredTime = 4320}
tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
end
function admdichuyen()

	Say("Di chuyÓn nhanh", 12,  
        "Ba l¨ng huyÖn./blangh",
        "Viem de./viemde",
 --       "Phong l¨ng ®é bÕn 3./pldben3",
 --       "Phong l¨ng ®é bÕn 2./pldben2",
 --       "Phong l¨ng ®é bÕn 1./pldben1",
        "Tèng kim./tkim",
        "Thiªn tö./thientu",
        "Trang tiÕp./trang2a",
	 "KÕt thóc ®èi tho¹i./no");
	 return 1	

end
function viemde()
	SetFightState(0)
	NewWorld(851, 1590, 3163);
end;
function blangh()
	SetFightState(0)
	NewWorld(53, 1619, 3184);
end;
function thientu()
	SetFightState(0)
	NewWorld(900, 1476, 3296);
end;
function tkim()
	SetFightState(0)
	NewWorld(380, 1476, 3296);
end;
function pldben1()
	SetFightState(1)
	NewWorld(337, 1630, 3218);
end;
function pldben2()
	SetFightState(0)
	NewWorld(338, 1633, 3213);
end;
function pldben3()
	SetFightState(0)
	NewWorld(339, 1612, 3197);
end;
function trang2a()
	Say("Di chuyÓn nhanh", 12,  
        "Thµnh ®«./ctcthanhdo",
        "BiÖn kinh./ctcbienkinh",
        "§¹i lý./ctcdaily",
        "Ph­îng t­êng./ctcphuongtuong",
        "L©m an./ctclaman",
        "T­¬ng d­¬ng./ctctuongduong",
        "D­¬ng ch©u./ctcduongchau",
	 "KÕt thóc ®èi tho¹i./no");
	 return 1	
end
function ctcduongchau()
	SetFightState(0)
	NewWorld(932, 1713, 3303);
end;
function ctctuongduong()
	SetFightState(0)
	NewWorld(931, 1713, 3303);
end;
function ctclaman()
	SetFightState(0)
	NewWorld(930, 1750, 3394);
end;
function ctcphuongtuong()
	SetFightState(0)
	NewWorld(929, 1761, 3517);
end;
function ctcdaily()
	SetFightState(0)
	NewWorld(928, 1717, 3308);
end;
function ctcbienkinh()
	SetFightState(0)
	NewWorld(927, 1755, 3391);
end;
function ctcthanhdo()
	SetFightState(0)
	NewWorld(926, 1714, 3304);
end;
function tocdochay()
AddMagic(86,60)
AddMagic(160,60)
end
function tocdochayxoa()
DelMagic(86)
DelMagic(160)
end
function mautrang()
	SetCamp(0)
	SetCurCamp(0)
end
function mauhong()
	SetCamp(6)
	SetCurCamp(6)
end
function anthangm()
AddMagic(1206,1)
end
function hienthangm()
DelMagic(1206)
end
function gmlaydo()
local tab_Content = {
"1000 xu/#gmlaydo1(1)",
 -- "10 lb bach ho/#gmlaydo1(2)",
"1 nhac vuong kiem/#gmlaydo1(3)",
"1000 van/#gmlaydo1(4)",
-- "event/#gmlaydo1(5)",
-- "Nhan diem vip/#gmlaydo1(6)",
"Thao t¸c ng­êi ch¬i/#gmlaydo1(7)",
"B¶o tr×/#gmlaydo1(8)",
-- "Nhan cap/#gmlaydo1(9)",
-- "Trang 2/#gmlaydotrang2()",
"Ta ch­a suy nghÜ xong/no",
}
Say("Xin chµo <color=yellow>"..GetName().."<color>", getn(tab_Content), tab_Content);
end
function lbtestgame()
local tbItem = {tbProp={6,1,4378,1,9,9}, nBindState = -2}
tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
end
function gmlaydotrang2()
local tab_Content = {
-- "Xoa vip 10/#gmlaydo1(10)",
"Bug 5k tiem nang/#gmlaydo1(11)",
"Xoa 5k tiem nang/#gmlaydo1(12)",
-- "Lay hop event/#gmlaydo1(14)",
"Hop nguyen lieu/#gmlaydo1(15)",
"bk 150 cap 21 22 23/#gmlaydo1(16)",
"Cap nhat xep hang/#gmlaydo1(17)",
-- "Nguyen lieu ep do/#gmlaydo1(13)",
"Ta ch­a suy nghÜ xong/no",
}
Say("Xin chµo <color=yellow>"..GetName().."<color>", getn(tab_Content), tab_Content);
end
function gmlaydo1(a)
if a == 1 then
AddStackItem(500,4,417,1,1,0,0)
AddStackItem(500,4,417,1,1,0,0)
elseif a == 2 then
AddStackItem(10,6,1,2357,1,0,0,0)
elseif a == 3 then
AddItem(6,1,2340,1,0,0,0)
elseif a == 4 then
Earn(10000*1000)
elseif a == 5 then
AddStackItem(999,6,1,4569,1,0,0)
AddStackItem(999,6,1,4569,1,0,0)
elseif a == 6 then
SetTask(5793,9999)
elseif a == 7 then
chonthaotac()
elseif a == 8 then
baotri()
elseif a == 9 then
nhancap()
elseif a == 10 then
DelMagic(1512)
elseif a == 11 then
AddProp(1000)
elseif a == 12 then
AddProp(-1000)
elseif a == 13 then
AddStackItem(500,6,1,2566,1,0,0)
AddStackItem(500,6,1,2125,1,0,0)
elseif a == 14 then
AddStackItem(999,6,1,4547,1,0,0)
AddStackItem(999,6,1,4547,1,0,0)
AddStackItem(999,6,1,4547,1,0,0)
AddStackItem(999,6,1,4547,1,0,0)
AddStackItem(999,6,1,4547,1,0,0)
elseif a == 15 then
AddStackItem(999,6,1,4539,1,0,0)
AddStackItem(999,6,1,4539,1,0,0)
-- AddStackItem(1,6,1,4547,1,0,0)
-- AddStackItem(1,6,1,4547,1,0,0)
elseif a == 16 then
AddStackItem(1,6,1,4416,1,0,0)
AddStackItem(1,6,1,4417,1,0,0)
AddStackItem(1,6,1,4418,1,0,0)
elseif a == 17 then
XepHang:TaiDanhSachTopToanServer()
end
end
function gmkhac()
	w,x,y=GetWorldPos()
	SubWorld = SubWorldID2Idx(w)
	SubName=SubWorldName(SubWorld)
	local szTitle = "<npc><color=red>Hæ trî GM<color>: <color=orange>"..GetName().." <color>.<enter><color=yellow>Vâ L©m §Ò V­¬ng<color><enter><color=red>VÞ TrÝ<color>:<color=orange>ID:<color><color=orange>"..w.."<color>-<color=red>"..SubName.."<color>-Täa ®é X/Y:<color=yellow> "..x.."<color>/<color=cyan>"..y.."<color>"
		local tbOpt =
	{
		{"hien than", hienthangm},
		{"an than", anthangm},
		{"mau hong", mauhong},
		{"mau trang", mautrang},
		{"chay nhanh", tocdochay},
		{"xoa chay nhanh", tocdochayxoa},
		{"Lb test game", lbtestgame},
		{"KÕt Thóc Hç Trî"}
	}
	CreateNewSayEx(szTitle, tbOpt)
end
function bossbanghoi()
add_npc_click()
--bossbaovelongden()
end
function bosslybachkt()
NewBossMoi383()
end
function testtaixiu()
local a = random(1,6)
local b = random(1,6)
local c= random(1,6)
local kq1 = a+b+c
--local kq1 = random(1,10)
if kq1 <=10  then
Talk(1,"",""..a.." "..b.." "..c.."    "..kq1.." ®iÓm <color=yellow>[XØu]<color>")
end
if kq1 >10  then
Talk(1,"",""..a.." "..b.." "..c.."    "..kq1.." ®iÓm <color=yellow>[Tµi]<color>")
end
end
function logplayer(zFile,szMsg)
  local handle = openfile(zFile,"a")
  write(handle,format("%s\n",szMsg));
  closefile(handle);
 end
 

 function kickvongsang()
	local OldPlayer = PlayerIndex
	for i=1,GetPlayerCount() do
		PlayerIndex = i
		if GetSkillState(1832) ~= 1 or GetSkillState(1616) ~= 1 then
		Title_ActiveTitle(GetTask(TASK_ACTIVE_TITLE))
		end
	end
	PlayerIndex = OldPlayer
end