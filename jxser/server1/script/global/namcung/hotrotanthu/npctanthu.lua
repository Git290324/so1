IncludeLib("SETTING")
IncludeLib("TONG")
IncludeLib("RELAYLADDER");
Include( "\\script\\item\\compound\\compound_header.lua" );
Include( "\\script\\item\\compound\\atlas.lua" );
Include("\\script\\global\\紫色及黄金装备铸造.lua")
Include("\\script\\global\\rename_head.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\global\\fuyuan.lua")
Include("\\script\\missions\\leaguematch\\npc\\officer.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\global\\gmrole.lua")
Include("\\script\\global\\namcung\\hotrotanthu\\itemblue.lua")
Include("\\script\\global\\namcung\\\hotrotanthu\\duatop.lua")
Include("\\script\\tagnewplayer\\tbitemHK.lua");
Include("\\script\\global\\namcung\\hotroitem.lua")
szNpcName = "<color=yellow>H?tr?T﹏ th?color>: "

szPlayer = "Чi Hi謕"
if GetSex() == 1 then
	szPlayer = "N?Hi謕"
end

tbSkillBook90 = {
	shaolin = {56,57,58},
	tianwang = {37,38,39},
	tangmen = {27,28,45,46},
	wudu = {47,48,49},
	emei = {42,43,59},
	cuiyan = {40,41},
	gaibang = {54,55},
	tianren = {35,36,53},
	wudang = {33,34},
	kunlun = {50,51,52},
}

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

function main()
   dofile("script/global/hotrotanthu/npctanthu.lua");
	local tbSay = {}
	tinsert(tbSay,"V藅 ph萴 h?tr?/vpht")
	tinsert(tbSay,"Ta mu鑞 nh薾 trang b?ho祅g kim/hoangkim")
	tinsert(tbSay,"Ta mu鑞 th╪g c蕄 180/HoTroLevel180")
	tinsert(tbSay,"Ta c莕 ng﹏ lng/HoTroNganLuong")
	tinsert(tbSay,"Ta mu鑞 mn Chi誹 D?Ng鋍 S?T?HoTroChieuDa")
	tinsert(tbSay,"Ta mu鑞 t筼 bang h閕/BuildTong")
	tinsert(tbSay,"Ta mu鑞 tr筺g th竔 S竧 th?/ChuDo")
	tinsert(tbSay,"Ta mu鑞 mn trang b?xanh/MaiGap")
	tinsert(tbSay,"Ta mu鑞 mn v?kh?MaiGap")
	tinsert(tbSay,"Ta mu鑞 h鋍 v?c玭g/HoTroSkill")
	tinsert(tbSay,"G苝 l筰 ta sau/Quit")
	Say(szNpcName.."ta 頲 H醓 Ph鬾g Thi猲 T?ph竔 xu鑞g y h?tr?cho b?t竛h bu鎖 u l藀 nghi謕. "..szPlayer.." c莕 g?c?g苝 ta.", getn(tbSay), tbSay)
end
	local szTitle = "<npc>H?tr?t﹏ th? hoan ngh猲h c竎 anh h飊g h祇 ki謙..."
	local tbOpt =
	{
		{"Ta mu鑞 nh薾 thng theo c蕄 ", topser},
		{"Ta mu鑞 v藅 ph萴 h?tr?", vpht},
		{"Ta mu鑞 h鋍 v?c玭g", HoTroSkill},
		{"Ta mu鑞 nh薾 trang b?Xanh", trangbiblue},
		{"Ta mu鑞 nh薾 trang b?ho祅g kim", hoangkim},
		{"Ta mu鑞 th╪g c蕄", HoTroLevel180},
		{"Ta c莕 ng﹏ lng", HoTroNganLuong},
		{"Ta mu鑞 mn Chi誹 D?Ng鋍 S?T?, HoTroChieuDa},
		{"Ta mu鑞 t筼 bang h閕", BuildTong},
		{"Ta mu鑞 tr筺g th竔 S竧 th?, ChuDo},
		{"Ta mu鑞 mn trang b?xanh", MaiGap},
        		{"Ta mu鑞 mn v?kh?, MaiGap},
		{"Ta mu鑞 ch?t筼 trang b?Huy襫 Tinh", chetao},
		{"Ta mu鑞 trang b?Huy襫 Tinh", dotim},		
        	{"G苝 l筰 ngi sau", Quit},
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function trangbiblue()
nhantrangbi()
end

function topser()
duatop()
end

function hotrotanthu()
	if GetLevel()<50 then
		AddSkillState(512,20,1,60*60*18)--40跑速
		AddSkillState(527,5,1,60*60*18)--500血
		AddSkillState(313,5,1,60*60*18)--20全抗
		AddSkillState(314,12,1,60*60*18)--7回复血，5回复内
		AddSkillState(546,1,1,60*60*18)--御赐光环
	end
end

function MaiGap()
	Talk(1,"",szNpcName .. "H玬 nay ta ch璦 k辮 chu萵 b? mai "..szPlayer.." quay l筰 nh?")
end

function vpht()
local tbSay = {}
tinsert(tbSay,"Ta mu鑞 Qu?hoa T鰑 (May M緉)/quehoatuu")
tinsert(tbSay,"Ta mu鑞 Huy襫 tinh/huytin")
tinsert(tbSay,"Ta mu鑞 Ph骳 Duy猲 L?/Phucduyen")
tinsert(tbSay,"Ta mu鑞 kho竛g th筩h/kdb")
tinsert(tbSay,"L謓h B礽 Boss Ho祅g Kim/LBBoss")
tinsert(tbSay,"Чi th祅h b?ki誴 90/daithanhbikiep90")
tinsert(tbSay,"Чi th祅h b?ki誴 120/daithanhbikiep120")
tinsert(tbSay,"Ta c莕 Th莕 H祅h Ph?HoTroThanHanh")
tinsert(tbSay,"Ta c莕 b?k輕 k?n╪g 90/HoTroBiKip90")
tinsert(tbSay,"Ta c莕 b?k輕 k?n╪g 120/HoTroBiKip120")
tinsert(tbSay,"Ta c莕 6 Tinh H錸g B秓 Th筩h/HoTroTinhHong")
tinsert(tbSay,"Ta c莕 3 Lo筰 Th駓 Tinh/HoTroThuyTinh")
tinsert(tbSay,"Ta mu鑞 ti襫 ng/TienDong")
tinsert(tbSay,"G苝 l筰 ngi sau/Quit")
Say(szNpcName.."ta 頲 H醓 Ph鬾g Thi猲 T?ph竔 xu鑞g y h?tr?cho b?t竛h bu鎖 u l藀 nghi謕. "..szPlayer.." c莕 g?c?g苝 ta.", getn(tbSay), tbSay)
end

function chetao()
Say( "N誹 i hi謕 mu鑞 c?m閠 m鉵  v鮝 ?th?甧m y  nguy猲 li謚 t韎 y. Ta s?c luy謓 m閠 v藅 ph萴 ngi th輈h nh蕋!", 4, "B総 u ch?t筼/onFoundryItem", "Li猲 quan ch?t筼/onAbout", "T譵 hi觰 m秐h Ho祅g Kim./onQueryPiece","в ta suy ngh?k?l筰 xem/onCancel");
end
function hoangkimmp()
hoangkimmpfull()
end

function GetBonusHK(nID)
	local nIndex = AddGoldItem(0, nID)
	local strItemName = GetItemName(nIndex)
	Msg2Player("B筺 nh薾 頲 "..strItemName)
end

function daithanhbikiep90()
	AddItem(6, 1, 2424,1,0,0)
end
function daithanhbikiep120()
	AddItem(6, 1, 2425,1,0,0)
end


function hoangkim()
	if CalcFreeItemCellCount() < 30 then
		Say("H祅h trang i hi謕 nhi襲 qu? c?kh?n╪g s?nh薾 頲 trang b?chi誱 nhi襲 ? H穣 c蕋 b韙 v藅 ph萴  m b秓 c?30 ?tr鑞g r錳 h穣 m?",0);
		return 1;
	end
	local TabSayPotion = {
		"Nh薾 An Bang./item",
		"Nh薾 мnh Qu鑓./item",
		"Nh薾 Nhu T譶h./item",
		"Nh薾 Hi誴 C鑤./item",
		"Nh薾 Thi猲 Ho祅g/item",
		"Nh薾 чng S竧./item",
		"Nh薾 HKMP./hoangkimmp",
		"K誸 th骳 i tho筰./Quit",
	}
	Say("H?tr?,getn(TabSayPotion),TabSayPotion)
end
function item(sel)
if sel==0 then
	for i=164,167 do
		local ItemIdx=AddGoldItem(0, i);
		--SetItemBindState(ItemIdx, -2);
	end
elseif sel==1 then
	for i=159,163 do
		local ItemIdx=AddGoldItem(0, i);
		--SetItemBindState(ItemIdx, -2);
	end
elseif sel==2 then
	for i=190,193 do
		local ItemIdx=AddGoldItem(0, i);
		--SetItemBindState(ItemIdx, -2);
	end
elseif sel==3 then
	for i=186,189 do
		local ItemIdx=AddGoldItem(0, i);
		--SetItemBindState(ItemIdx, -2);
	end
elseif sel==4 then
	for i=168,176 do
		local ItemIdx=AddGoldItem(0, i);
		--SetItemBindState(ItemIdx, -2);
	end
elseif sel==5 then
	for i=143,146 do
		local ItemIdx=AddGoldItem(0, i);
	end
end
print(GetName()..sel)
end

function ChuDo()
	local szTongName, nTongID = GetTongName();	
	if szTongName == nil or szTongName == "" then
		SetCurCamp(4)
		SetCamp(4)
	end
end
function BuildTong()			-- 完成建帮的准备工作
if GetLevel()<5 then
	return
end
local szTongName, nTongID = GetTongName();	
	if szTongName == nil or szTongName == "" then
		SetCurCamp(4)
		SetCamp(4)
		Earn(10^9)
		AddLeadExp(10011100)
		AddRepute(500)
		AddEventItem(195)
		NewWorld(2,2350,3493)
	end
end;
function HoTroThuyTinh()
	for i=238,240 do
		AddItem(4, i, 1, 1, 0, 0)
	end
	Talk(1,"",szNpcName .. " th?".. szPlayer .."  c莕 y ,".. szPlayer .." c莔 甶, ng ng筰.")
end

function TienDong()
AddStackItem(100, 4, 417, 1, 1, 0, 0, 0);
end

function Phucduyen()
	for i=1,5 do
		AddItem(6,1,124,1,0,0)
	end
end

function quehoatuu()
AddItem(6, 1, 125, 1, 0, 0)
end

function HoTroTinhHong()
	for i=1,6 do
		AddItem(4, 353, 1, 1, 0, 0)
	end
	Talk(1,"",szNpcName .. " th?".. szPlayer .."  c莕 y ,".. szPlayer .." c莔 甶, ng ng筰.")
end

function HoTroNganLuong()
	Earn(1000000000)
	Talk(1,"",szNpcName .. " ta c?1000 v筺 lng, ".. szPlayer .." c莔 甶, ng ng筰.")
end


function HoTroLevel180()

	local TabSayPotion = {
		"Ta mu鑞 l猲 75 c蕄./HoTroLevel75",
		"Ta mu鑞 l猲 100 c蕄./HoTroLevel100",
		"Ta mu鑞 l猲 150 c蕄./HoTroLevel150",
		"K誸 th骳 i tho筰./Quit",
	}
	Say("B筺 mu鑞 c蕄  n祇 ?",getn(TabSayPotion),TabSayPotion)
end

function HoTroLevel150()
	local nLevel = GetLevel()
	if nLevel < 150 then
		ST_LevelUp(150 - nLevel)
		if random(1,2)==1 then
			AddItem(0,10,random(14,18),5,0,0);
		else
			AddItem(0,10,random(6,8),5,0,0);
		end
		AddItem(6,1,1266,1,0,0);
	end
end

function HoTroLevel100()
	local nLevel = GetLevel()
	if nLevel < 100 then
		ST_LevelUp(100 - nLevel)
		if random(1,2)==1 then
			AddItem(0,10,random(14,18),5,0,0);
		else
			AddItem(0,10,random(6,8),5,0,0);
		end
		AddItem(6,1,1266,1,0,0);
	end
end

function HoTroLevel75()
	local nLevel = GetLevel()
	if nLevel < 75 then
		ST_LevelUp(75 - nLevel)
		if random(1,2)==1 then
			AddItem(0,10,random(14,18),5,0,0);
		else
			AddItem(0,10,random(6,8),5,0,0);
		end
		AddItem(6,1,1266,1,0,0);
	end
end

function LBBoss()
if GetLevel()>=120 then
		AddItem(6,1,1480,1,0,0);		
	end

AddItem(6,1,1478,1,0,0);
end

function HoTroChieuDa()
	AddItem(0,10,5,5,0,0);
end


function HoTroThanHanh()
	AddItem(6,1,1266,1,0,0);
end


function HoTroBiKip90()
	local nFact = GetLastFactionNumber()
	if nFact == nil or nFact < 0 or  nFact > 9 then
		return
	end
	local szFaction = GetFaction()
	if tbSkillBook90[szFaction] == nil then
		return
	end
	for i=1, getn(tbSkillBook90[szFaction]) do
		AddItem(6,1,tbSkillBook90[szFaction][i],1,0,0)
	end
end
function HoTroBiKip120()
AddItem(6, 1, 1125,1,0,0)
end

function HoTroSkill()
	local nIndex = floor(GetLevel()/10)
	local szFaction = GetFaction()
	if tbAllSkill[szFaction] == nil then
		return
	end
	if nIndex >= 1 then
		for i=1, min(9,nIndex) do
			if tbAllSkill[szFaction][i] ~= nil then
				for j=1, getn(tbAllSkill[szFaction][i]) do
					if i ==9 then
						if HaveMagic(tbAllSkill[szFaction][i][j]) == -1 then
							AddMagic(tbAllSkill[szFaction][i][j],20)
						end
					else
						if HaveMagic(tbAllSkill[szFaction][i][j]) == -1 then
							AddMagic(tbAllSkill[szFaction][i][j])
						end
					end
				end
			end
		end
	end
	Talk(1,"",szNpcName.."V?h鋍  頲 truy襫 th? "..szPlayer .." h穣 th?v薾 c玭g n﹏g th祅h xem sao.")
end

function dotim()	
	if CalcFreeItemCellCount() < 30 then
		Say("H穣 c蕋 b韙 v藅 ph萴  m b秓 c?30 ?tr鑞g r錳 h穣 m?",0);
		return 1;
	end
	local tab_Content = {
		"V?Kh?weapon",
		"Y Ph鬰/shirt",
		"жnh M筼/hat",
		"H?Uy觧/glove",
		"Y猽 Цi/belt",
		"H礽 T?shoe",
		"K誸 th骳 i tho筰."
	}
	Say(" Mu鑞 l蕐 th猰 c竔 g?n祇 ? ", getn(tab_Content), tab_Content);
end;


function weapon()
	local tab_Content = {
		"Ki誱/kiem",
		"o/dao",
		"B鎛g/bong",
		"Thng/kick",
		"Ch飝/chuy",
		"Song o/songdao",
		"Phi Ti猽/phitieu",
		"Phi o/phidao",
		"T?Ti詎/tutien",
		"K誸 th骳 i tho筰."
	}
	Say(" Mu鑞 l蕐 th猰 c竔 g?n祇 ? ", getn(tab_Content), tab_Content);
end;


function kiem()
		AddQualityItem(2,0,0,0,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,0,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,0,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,0,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,0,10,4,0,-1,-1,-1,-1,-1,-1)	
end


function dao()
		AddQualityItem(2,0,0,1,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,1,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,1,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,1,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,1,10,4,0,-1,-1,-1,-1,-1,-1)	
end


function bong()
		AddQualityItem(2,0,0,2,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,2,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,2,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,2,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,2,10,4,0,-1,-1,-1,-1,-1,-1)	
end


function kick()
		AddQualityItem(2,0,0,3,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,3,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,3,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,3,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,3,10,4,0,-1,-1,-1,-1,-1,-1)	
end


function chuy()
		AddQualityItem(2,0,0,4,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,4,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,4,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,4,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,4,10,4,0,-1,-1,-1,-1,-1,-1)	
end


function songdao()
		AddQualityItem(2,0,0,5,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,5,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,5,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,5,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,5,10,4,0,-1,-1,-1,-1,-1,-1)	
end


function phitieu()
		AddQualityItem(2,0,1,0,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,1,0,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,1,0,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,1,0,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,1,0,10,4,0,-1,-1,-1,-1,-1,-1)	
end


function phidao()
		AddQualityItem(2,0,1,1,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,1,1,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,1,1,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,1,1,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,1,1,10,4,0,-1,-1,-1,-1,-1,-1)	
end


function tutien()
		AddQualityItem(2,0,1,2,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,1,2,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,1,2,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,1,2,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,1,2,10,4,0,-1,-1,-1,-1,-1,-1)	
end


function shirt()
	local tab_Content = {
		"Th蕋 B秓 C?Sa/aothieulam",
		"Ch﹏ V?Th竛h Y/aovodang",
		"Thi猲 Nh蒼 M藅 Trang/aothiennhan",
		"Gi竛g Sa B祇/sabao",
		"Л阯g Ngh?Gi竝/dng",
		"V筺 L璾 Quy T玭g Y/aocaibang",
		"Tuy襫 Long B祇/longbao",
		"Long Ti猽 Чo Y/daoy",
		"C鰑 V?B筩h H?Trang/hotrang",
		"Tr莔 Hng Sam/huongsam",
		"T輈h L辌h Kim Ph鬾g Gi竝/kimphung",
		"V筺 Ch髇g T?T﹎ Y/tamy",
		"L璾 Ti猲 Qu莕/tienquan",
		"K誸 th骳 i tho筰."
	}
	Say(" Mu鑞 l蕐 th猰 c竔 g?n祇 ? ", getn(tab_Content), tab_Content);
end;


function aothieulam()
		AddQualityItem(2,0,2,0,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,0,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,0,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,0,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,0,10,4,0,-1,-1,-1,-1,-1,-1)
end


function aovodang()
		AddQualityItem(2,0,2,1,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,1,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,1,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,1,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,1,10,4,0,-1,-1,-1,-1,-1,-1)
end


function aothiennhan()
		AddQualityItem(2,0,2,2,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,2,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,2,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,2,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,2,10,4,0,-1,-1,-1,-1,-1,-1)
end


function sabao()
		AddQualityItem(2,0,2,3,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,3,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,3,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,3,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,3,10,4,0,-1,-1,-1,-1,-1,-1)
end


function dng()
		AddQualityItem(2,0,2,4,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,4,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,4,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,4,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,4,10,4,0,-1,-1,-1,-1,-1,-1)
end


function aocaibang()
		AddQualityItem(2,0,2,5,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,5,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,5,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,5,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,5,10,4,0,-1,-1,-1,-1,-1,-1)
end


function longbao()
		AddQualityItem(2,0,2,6,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,6,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,6,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,6,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,6,10,4,0,-1,-1,-1,-1,-1,-1)
end


function daoy()
		AddQualityItem(2,0,2,8,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,8,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,8,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,8,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,8,10,4,0,-1,-1,-1,-1,-1,-1)
end


function hotrang()
		AddQualityItem(2,0,2,9,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,9,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,9,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,9,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,9,10,4,0,-1,-1,-1,-1,-1,-1)
end


function huongsam()
		AddQualityItem(2,0,2,10,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,10,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,10,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,10,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,10,10,4,0,-1,-1,-1,-1,-1,-1)
end


function kimphung()
		AddQualityItem(2,0,2,11,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,11,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,11,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,11,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,11,10,4,0,-1,-1,-1,-1,-1,-1)
end


function tamy()
		AddQualityItem(2,0,2,12,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,12,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,12,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,12,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,12,10,4,0,-1,-1,-1,-1,-1,-1)
end


function tienquan()
		AddQualityItem(2,0,2,13,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,13,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,13,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,13,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,13,10,4,0,-1,-1,-1,-1,-1,-1)
end


function hat()
	local tab_Content = {
		"T?L?M穙/lomao",
		"Ng?L穙 Qu竛/laoquan",
		"Tu La Ph竧 K誸/phatket",
		"Th玭g Thi猲 Ph竧 Qu竛/phatquan",
		"Y觤 Nh藅 Kh玦/nhatkhoi",
		"Tr輈h Tinh Ho祅/tinhhoan",
		"?T祄 M穙/tammao",
		"Quan  Ph竧 Qu竛/quanam",
		" Dng V?C鵦 Qu竛/amduong",
		"Huy襫 T?Di謓 Tr竜/dientrao",
		"Long Huy誸 u Ho祅/longhuyet",
		"Long L﹏ Kh玦/lankhoi",
		"Thanh Tinh Thoa/tinhthoa",
		"Kim Ph鬾g Tri觧 S?triensi",
		"K誸 th骳 i tho筰."
	}
	Say(" Mu鑞 l蕐 th猰 c竔 g?n祇 ? ", getn(tab_Content), tab_Content);
end;


function lomao()
		AddQualityItem(2,0,7,0,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,0,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,0,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,0,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,0,10,4,0,-1,-1,-1,-1,-1,-1)
end


function laoquan()
		AddQualityItem(2,0,7,1,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,1,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,1,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,1,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,1,10,4,0,-1,-1,-1,-1,-1,-1)
end


function phatket()
		AddQualityItem(2,0,7,2,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,2,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,2,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,2,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,2,10,4,0,-1,-1,-1,-1,-1,-1)
end


function phatquan()
		AddQualityItem(2,0,7,3,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,3,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,3,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,3,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,3,10,4,0,-1,-1,-1,-1,-1,-1)
end


function nhatkhoi()
		AddQualityItem(2,0,7,4,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,4,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,4,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,4,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,4,10,4,0,-1,-1,-1,-1,-1,-1)
end


function tinhhoan()
		AddQualityItem(2,0,7,5,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,5,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,5,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,5,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,5,10,4,0,-1,-1,-1,-1,-1,-1)
end


function tammao()
		AddQualityItem(2,0,7,6,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,6,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,6,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,6,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,6,10,4,0,-1,-1,-1,-1,-1,-1)
end


function quanam()
		AddQualityItem(2,0,7,7,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,7,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,7,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,7,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,7,10,4,0,-1,-1,-1,-1,-1,-1)
end


function amduong()
		AddQualityItem(2,0,7,8,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,8,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,8,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,8,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,8,10,4,0,-1,-1,-1,-1,-1,-1)
end


function dientrao()
		AddQualityItem(2,0,7,9,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,9,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,9,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,9,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,9,10,4,0,-1,-1,-1,-1,-1,-1)
end


function longhuyet()
		AddQualityItem(2,0,7,10,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,10,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,10,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,10,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,10,10,4,0,-1,-1,-1,-1,-1,-1)
end


function lankhoi()
		AddQualityItem(2,0,7,11,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,11,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,11,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,11,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,11,10,4,0,-1,-1,-1,-1,-1,-1)
end


function tinhthoa()
		AddQualityItem(2,0,7,12,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,12,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,12,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,12,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,12,10,4,0,-1,-1,-1,-1,-1,-1)
end


function triensi()
		AddQualityItem(2,0,7,13,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,13,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,13,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,13,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,13,10,4,0,-1,-1,-1,-1,-1,-1)
end


function glove()
	local tab_Content = {
		"Long Ph鬾g Huy誸 Ng鋍 Tr筩/ngoctrac",
		"Thi猲 T祄 H?Uy觧/houyen",
		"K誸 th骳 i tho筰."
	}
	Say(" Mu鑞 l蕐 th猰 c竔 g?n祇 ? ", getn(tab_Content), tab_Content);
end;


function ngoctrac()
		AddQualityItem(2,0,8,0,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,8,0,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,8,0,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,8,0,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,8,0,10,4,0,-1,-1,-1,-1,-1,-1)
end


function houyen()
		AddQualityItem(2,0,8,1,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,8,1,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,8,1,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,8,1,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,8,1,10,4,0,-1,-1,-1,-1,-1,-1)
end


function belt()
	local tab_Content = {
		"Thi猲 T祄 Y猽 Цi/thientamyeu",
		"B筩h Kim Y猽 Цi/bachkim",
		"K誸 th骳 i tho筰."
	}
	Say(" Mu鑞 l蕐 th猰 c竔 g?n祇 ? ", getn(tab_Content), tab_Content);
end;


function thientamyeu()
		AddQualityItem(2,0,6,0,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,6,0,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,6,0,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,6,0,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,6,0,10,4,0,-1,-1,-1,-1,-1,-1)
end


function bachkim()
		AddQualityItem(2,0,6,1,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,6,1,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,6,1,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,6,1,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,6,1,10,4,0,-1,-1,-1,-1,-1,-1)
end


function shoe()
	local tab_Content = {
		"C鰑 Ti誸 Xng V?Ngoa/cuutien",
		"Thi猲 T祄 Ngoa/thientam",
		"Kim L?H礽/kimlu",
		"Phi Ph鬾g Ngoa/phiphung",
		"K誸 th骳 i tho筰."
	}
	Say(" Mu鑞 l蕐 th猰 c竔 g?n祇 ? ", getn(tab_Content), tab_Content);
end;


function cuutien()
		AddQualityItem(2,0,5,0,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,5,0,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,5,0,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,5,0,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,5,0,10,4,0,-1,-1,-1,-1,-1,-1)
end


function thientam()
		AddQualityItem(2,0,5,1,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,5,1,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,5,1,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,5,1,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,5,1,10,4,0,-1,-1,-1,-1,-1,-1)
end


function kimlu()
		AddQualityItem(2,0,5,2,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,5,2,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,5,2,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,5,2,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,5,2,10,4,0,-1,-1,-1,-1,-1,-1)
end


function phiphung()
		AddQualityItem(2,0,5,3,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,5,3,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,5,3,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,5,3,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,5,3,10,4,0,-1,-1,-1,-1,-1,-1)
end

function huytin()
AddItem(6,1,147,10,0,0,0) 	
AddItem(6,1,147,10,0,0,0) 	
AddItem(6,1,147,10,0,0,0) 	
end


function kdb()
AddItem(6,1,149,1,0,0,0) 
AddItem(6,1,150,1,1,0,0) 
AddItem(6,1,150,1,2,0,0) 
AddItem(6,1,150,1,3,0,0) 
AddItem(6,1,150,1,4,0,0) 

AddItem(6,1,151,1,0,0,0) 
AddItem(6,1,152,1,1,0,0) 
AddItem(6,1,152,1,2,0,0)
AddItem(6,1,152,1,3,0,0)
AddItem(6,1,152,1,4,0,0)

AddItem(6,1,153,1,0,0,0) 
AddItem(6,1,154,1,1,0,0) 	
AddItem(6,1,154,1,2,0,0) 	
AddItem(6,1,154,1,3,0,0) 	
AddItem(6,1,154,1,4,0,0) 	
end
