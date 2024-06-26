-- Created by Danielsun 2006-12-07
-- 圣诞节活动
-- xmas_entry()
Include("\\script\\task\\system\\task_string.lua")
Include("\\script\\lib\\basic.lua")

TB_SnowMan = {
	-- 1.[成功]雪人名 2.[成功]雪人ID 3.[成功]几率 4.[失败]雪人名 5.[失败]雪人ID 6.[失败]几率 7,金钱 8,换取礼品名 9,换取礼品ID
	{"Ngi tuy誸 cho祅g kh╪ xanh (c bi謙)",  1319,   60,   "Ngi tuy誸 cho祅g kh╪ xanh (thng)",    1322,  40,	1000,	"B竛h b� ", 1325},
	{"Ngi tuy誸 cho祅g kh╪  (c bi謙)",  1320,   60,   "Ngi tuy誸 cho祅g kh╪  (thng)",    1323,  40,	3000,	"B竛h kem",	1326},
	{"Ngi tuy誸 c bi謙",  					1321,   80,   					 "Ngi tuy誸 thng",    1324,  20,	5000,			"G� l玦", 1327},
}

TB_Material = {
 --1.物品名	2.数量
 [1319] ={
	["6,1,1312"] = {"Hoa Tuy誸 ",			10	},
	["6,1,1313"] =	{"C� r鑤",		1	},
	["6,1,1314"] =	{"C祅h th玭g",	2	},
	["6,1,1315"] =	{"N鉵 gi竛g sinh",		1	},
	["6,1,1316"] =	{"Kh╪ cho祅g xanh",	1	},
	},
 [1320] ={
	["6,1,1312"] = {"Hoa Tuy誸 ",			10	},
	["6,1,1313"] =	{"C� r鑤",		1	},
	["6,1,1314"] =	{"C祅h th玭g",	2	},
	["6,1,1315"] =	{"N鉵 gi竛g sinh",		1	},
	["6,1,1317"] =	{"Kh╪ cho祅g ",	1	},
	},
 [1321] ={
	["6,1,1312"] = {"Hoa Tuy誸 ",			10	},
	["6,1,1313"] =	{"C� r鑤",		1	},
	["6,1,1314"] =	{"C祅h th玭g",	2	},
	["6,1,1315"] =	{"N鉵 gi竛g sinh",		1	},
	["6,1,1318"] =	{"C﹜ th玭g ",		1	},
	},
}

TB_Message = {
	-- 制作描述
	"L祄 ngi tuy誸 cho祅g kh╪ xanh (c bi謙) c莕 10 b玭g tuy誸, 1 c� r鑤, 2 c祅h th玭g, 1 n鉵, 1 kh╪ cho祅g xanh v� 1000 lng.",
	"L祄 ngi tuy誸 cho祅g kh╪  (c bi謙) c莕 10 b玭g tuy誸, 1 c� r鑤, 2 c祅h th玭g, 1 n鉵, 1 kh╪ cho祅g  v� 3000 l頽g.",
	"L祄 ngi tuy誸 (c bi謙) c莕 10 b玭g tuy誸, 1 c� r鑤, 2 c祅h th玭g, 1 n鉵, 1 c﹜ th玭g v� 5000 lng.",
}

GiftMsg = {
	-- 换取礼物描述
	"фi b竛h b�  c莕 m閠 ngi tuy誸 cho祅g kh╪  (c bi謙)",
	"фi b竛h kem c莕 m閠 ngi tuy誸 cho祅g kh╪ xanh (c bi謙)",
	"фi g� l玦 c莕 m閠 ngi tuy誸 c bi謙",
}

TSKTMP_ITEM_NUMC = 20;

function xmas_entry()
	aryDescribe = {
		"<dec><npc>фi qu� gi竛g sinh",
		"L祄 ngi tuy誸/want_snowman",
		"фi qu�/want_gift",
		"Ta c� vi謈, khi kh竎 quay l筰/cancel",
		}
	CreateTaskSay(aryDescribe)
end
	
function want_snowman()
	--if (isXmasTime() == 0) then
	--	CreateTaskSay({"<dec><npc>Ho箃 ng  k誸 th骳.", "Ta bi誸 r錳/cancel"});
	--	return 
	--end;
	aryDescribe = {
		"<dec><npc>C� nhi襲 lo筰 ngi tuy誸, nguy猲 li謚 m鏸 lo筰 s� kh竎 nhau, ngi mu鑞 l祄 lo筰 n祇?",
		"T筼 ngi tuy誸 cho祅g kh╪ xanh (c bi謙)/#do_snowman(1)",
		"T筼 ngi tuy誸 cho祅g kh╪  (c bi謙)/#do_snowman(2)",
		"T筼 ngi tuy誸 c bi謙/#do_snowman(3)",
		"Ta c� vi謈, khi kh竎 quay l筰/cancel",
	}
	CreateTaskSay(aryDescribe)
end

function do_snowman(snown)
	SetTaskTemp(TSKTMP_ITEM_NUMC, snown);
	aryDescribe = TB_Message[snown]
	GiveItemUI("L祄 ngi tuy誸",aryDescribe,"do_snow_process","cancel",1)
end

function do_snow_process(nItemCount)
	local nItemNumC = GetTaskTemp(TSKTMP_ITEM_NUMC);
	local nItemPart = TB_SnowMan[nItemNumC][2]
	
	local tb_enhanceitem_count = {};
	for szkey, tb_item in TB_Material[nItemPart] do
		tb_enhanceitem_count[szkey] = {};
		tb_enhanceitem_count[szkey][1] = 0;
	end
	
	--检测物品匹配
	for i = 1, nItemCount do
		local nCurItemIdx = GetGiveItemUnit(i);
		local nCurItemName = GetItemName(nCurItemIdx);
		local nCurItemQuality = GetItemQuality(nCurItemIdx);
		local tbCurItemProp = pack(GetItemProp(nCurItemIdx));
		
		local szItemKey = tbCurItemProp[1]..","..tbCurItemProp[2]..","..tbCurItemProp[3];
		
		if(GetCash() < TB_SnowMan[nItemNumC][7]) then
			aryDescribe = {
				"<dec><npc>L祄 ngi tuy誸 c莕 ph秈 c�"..TB_SnowMan[nItemNumC][7].."ti襫 , ti襫 tr猲 ngi ngi kh玭g ",
				"Bi誸 r錳/cancel"
				}
			CreateTaskSay(aryDescribe)
			return
		end
		
		if (TB_Material[nItemPart][szItemKey] == nil) then
				CreateTaskSay(	{	"<dec><npc>"..TB_Message[nItemNumC]..", c竔 n祔"..GetItemName(nCurItemIdx)..", ta kh玭g c莕 c竔 n祔, ngi h穣 nh薾 l筰 甶",
												"в ta l祄 l筰!/#do_snowman("..nItemNumC..")",
												"Ta s� quay l筰 sau./cancel"	}	);
				return
		end
		tb_enhanceitem_count[szItemKey][1] = tb_enhanceitem_count[szItemKey][1] + GetItemStackCount(nCurItemIdx);
		tb_enhanceitem_count[szItemKey][2] = nCurItemName;
		if(tb_enhanceitem_count[szItemKey][1] > TB_Material[nItemPart][szItemKey][2] ) then
				CreateTaskSay(	{	"<dec><npc>"..TB_Message[nItemNumC]..", nh璶g ta kh玭g c莕 nhi襲 n th� <color=yellow>"..nCurItemName.."<color>Vui l遪g b� nh鱪g m鉵 kh玭g c莕 thi誸 ra ngo礽.",
													"в ta l祄 l筰!/#do_snowman("..nItemNumC..")",
													"Ta s� quay l筰 sau./cancel"	}	);
				return
		end
	end
	
	for szkey, tb_item in TB_Material[nItemPart] do
			if (tb_enhanceitem_count[szkey][1] ~= TB_Material[nItemPart][szkey][2]) then
				CreateTaskSay( { "<dec><npc> Ngi qu猲 b� nguy猲 li謚 v祇 r錳 <color=yellow>"..tb_enhanceitem_count[szkey][2].."<color> kh玭g . Kh玭g  nguy猲 li謚, ta kh玭g l祄 頲.",
			"в ta l祄 l筰!/#do_snowman("..nItemNumC..")",
			"Ta s� quay l筰 sau./cancel"	}	);
				return
			end
	end
		
	--删材料
	for i=1, nItemCount do
		local nIdx = GetGiveItemUnit(i)
		if (RemoveItemByIndex(nIdx) ~= 1) then
			WriteLog("[T筼 ngi tuy誸]"..GetLocalDate("%Y-%m-%d %H:%M:%S").."\t"..GetAccount().."\t"..GetName().."\t X鉧 v藅 ph萴 th蕋 b筰\t"..GetItemName(GetGiveItemUnit(i)));
			return
		end
	end
	Pay(TB_SnowMan[nItemNumC][7])
	
	 --给物品
	 local str = "";
	 PItem = random() * 100;
	if(PItem < TB_SnowMan[nItemNumC][3]) then
	 
		str = "Ch� t筼 th祅h c玭g <color=yellow>"..TB_SnowMan[nItemNumC][1].."<color>!"
		AddItem(6,1,TB_SnowMan[nItemNumC][2],1,0,0)
	else
		str = "Ch� t筼 th祅h c玭g <color=yellow>"..TB_SnowMan[nItemNumC][4].."<color>!"
		AddItem(6,1,TB_SnowMan[nItemNumC][5],1,0,0)
	end
	Msg2Player(str)
	WriteLog("[T筼 ngi tuy誸]"..GetLocalDate("%Y-%m-%d %H:%M:%S").."\t"..GetAccount().."\t"..GetName().."\t"..str);
end

function want_gift()
	if (isXmasTime() == 0) then
		CreateTaskSay({"<dec><npc>Ho箃 ng  k誸 th骳.", "Ta bi誸 r錳/cancel"});
		return 
	end;
	aryDescribe = {"<dec><npc>фi c竎 m鉵 qu� tng 鴑g sau:\n Ngi tuy誸 th総 kh╪ xanh---B竛h b� \n Ngi tuy誸 th総 kh╪ ---B竛h kem\n Ngi tuy誸 c bi謙---G� l玦 \n L鵤 ch鋘 i qu�.",
								 "B竛h b� /#do_gift(1)",
								 "B竛h kem/#do_gift(2)",
								 "G� l玦/#do_gift(3)",
								 "T筸 th阨 kh玭g i/cancel",
		}
		CreateTaskSay(aryDescribe)
end

function do_gift(ngift)
		local Gcount = CalcEquiproomItemCount(6,1,TB_SnowMan[ngift][2],1)
		if(Gcount == 0) then
			Talk(1,"","Tr猲 ngi ngi kh玭g c�"..TB_SnowMan[ngift][1]..". Kh玭g th� i qu�"..TB_SnowMan[ngift][8]..".")
		else  
			ConsumeEquiproomItem(1,6,1,TB_SnowMan[ngift][2],1)
			AddItem(6,1,TB_SnowMan[ngift][9],1,0,0)
			Msg = "B筺  i th祅h c玭g"..TB_SnowMan[ngift][8]
			Msg2Player(Msg)
			WriteLog("[T筼 ngi tuy誸]"..GetLocalDate("%Y-%m-%d %H:%M:%S").."\t"..GetAccount().."\t"..GetName().."\t exchange "..GetItemName(GetGiveItemUnit(i)).." for "..TB_SnowMan[ngift][8]);
		end
end


function pack(...)
	return arg
end

function cancel()
	SetTaskTemp(TSKTMP_ITEM_NUMC, 0);
end