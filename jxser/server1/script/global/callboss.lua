Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\activitysys\\functionlib.lua")

----Youtube/c/PYTAGAMING---------
----HAM TEST GOI BOSS KHU VUC
TBBOSS  = 
{ --tªn boss,id boss, tû lÖ r¬i ®å,series boss,nLevel
        [1]={	szName = "DiÖu Nh­",			nBossId = 513,	nRate = 322,	nSeries = 2,	nLevel = 95},
        [2]={	szName = "Tr­¬ng T«ng ChÝnh",			nBossId = 511,	nRate = 322,	nSeries = 4,	nLevel = 95},
	[3]={	szName = "LiÔu Thanh Thanh",			nBossId = 523,	nRate = 322,	nSeries = 1,	nLevel = 95},
        [4]={	szName = "Hµn M«ng",				nBossId = 748,	nRate = 342,	nSeries = 3,	nLevel = 95},
        [5]={	szName = "§¬n Tö Nam",				nBossId = 746,	nRate = 341,	nSeries = 4,	nLevel = 95},
        [6]={	szName = "Kim Quang T­íng Qu©n",		nBossId = 1284,	nRate = 322,	nSeries = 1,	nLevel = 95},
	[7]={	szName = "HuyÒn Gi¸c §¹i S­",		nBossId = 740,	nRate = 322,	nSeries = 0,	nLevel = 95},
	[8]={	szName = "§­êng BÊt NhiÔm",			nBossId = 741,	nRate = 336,	nSeries = 1,	nLevel = 95},
	[9]={	szName = "B¹ch Doanh Doanh",		nBossId = 742,	nRate = 336,	nSeries = 1,	nLevel = 95},
	[10]={	szName = "Thanh TuyÖt S­ Th¸i",		nBossId = 743,	nRate = 341,	nSeries = 2,	nLevel = 95},
	[11]={	szName = "Yªn HiÓu Tr¸i",			nBossId = 744,	nRate = 336,	nSeries = 2,	nLevel = 95},
	[12]={	szName = "Hµ Nh©n Ng·",				nBossId = 745,	nRate = 321,	nSeries = 3,	nLevel = 95},
	[13]={	szName = "TuyÒn C¬ Tö",				nBossId = 747,	nRate = 341,	nSeries = 4,	nLevel = 95},
}

TBBOSS2  = 
{ --tªn boss,id boss, tû lÖ r¬i ®å,series boss,nLevel
        [1]={	szName = "§o¹n Méc DuÖ",			nBossId = 565,	nRate = 227,	nSeries = 3,	nLevel = 95},
	[2]={	szName = "Gia LuËt TÞ Ly",			nBossId = 563,	nRate = 227,	nSeries = 3,	nLevel = 95},
	[3]={	szName = "§­êng Phi YÕn",			nBossId = 1366,	nRate = 342,	nSeries = 1,	nLevel = 95},
	[4]={	szName = "Tõ §¹i Nh¹c",				nBossId = 1367,	nRate = 342,	nSeries = 4,	nLevel = 95},	
        [5]={	szName = "Cæ B¸ch",						nBossId = 566,	nRate = 322,	nSeries = 0,	nLevel = 95},
	[6]={	szName = "M¹nh Th­¬ng L­¬ng",			nBossId = 583,	nRate = 321,	nSeries = 3,	nLevel = 95},
	[7]={	szName = "Chung Linh Tó",				nBossId = 567,	nRate = 336,	nSeries = 2,	nLevel = 95},
	[8]={	szName = "§¹o Thanh Ch©n Nh©n",			nBossId = 562,	nRate = 341,	nSeries = 4,	nLevel = 95},
	[9]={	szName = "Hµ Linh Phiªu",				nBossId = 568,	nRate = 336,	nSeries = 2,	nLevel = 95},
	[10]={	szName = "Lam Y Y",						nBossId = 582,	nRate = 336,	nSeries = 1,	nLevel = 95},
	[11]={	szName = "V­¬ng T¸",					nBossId = 739,	nRate = 322,	nSeries = 0,	nLevel = 95},	
	[12]={	szName = "HuyÒn Nan §¹i S­",			nBossId = 1365,	nRate = 342,	nSeries = 0,	nLevel = 95},
	[13]={	szName = "Thanh Liªn Tö",				nBossId = 1368,	nRate = 875,	nSeries = 2,	nLevel = 95},
}

TBBOSSCAONHAN  = 
{ --tªn boss,id boss, tû lÖ r¬i ®å,series boss,nLevel
	[1]={	szName = "ThiÕu L©m Hé Tù Vâ T¨ng",				nBossId = 1194,	nRate = 300,	nSeries = 0,	nLevel = 95},
	[2]={	szName = "Thiªn V­¬ng TrÊn Bang Hé VÖ",			nBossId = 1193,	nRate = 300,	nSeries = 4,	nLevel = 95},
	[3]={	szName = "D­¬ng Gia Trang HiÖp Kh¸ch",			nBossId = 1195,	nRate = 300,	nSeries = 3,	nLevel = 95},
	[4]={	szName = "Ngò §éc V« S¾c La S¸t",				nBossId = 1196,	nRate = 300,	nSeries = 1,	nLevel = 95},
	[5]={	szName = "Nga Mi Kim §Ønh S­ Th¸i",				nBossId = 1197,	nRate = 300,	nSeries = 2,	nLevel = 95},
	[6]={	szName = "Thóy Yªn M«n V« ¶nh S¸t Thñ",			nBossId = 1198,	nRate = 300,	nSeries = 2,	nLevel = 95},
	[7]={	szName = "C¸i Bang Tiªu Dao ThÇn C¸i",			nBossId = 1199,	nRate = 300,	nSeries = 3,	nLevel = 95},
	[8]={	szName = "Thiªn NhÉn Hé Gi¸o Th¸nh Sø",			nBossId = 1200,	nRate = 300,	nSeries = 3,	nLevel = 95},
	[9]={	szName = "Vâ §ang Th¸i Êt Ch©n Qu©n",			nBossId = 1201,	nRate = 300,	nSeries = 4,	nLevel = 95},
	[10]={	szName = "C«n L«n Hé Ph¸i Thiªn Qu©n",			nBossId = 1202,	nRate = 300,	nSeries = 4,	nLevel = 95},
	[11]={	szName = "Hoa S¬n §éc C« KiÕm Tiªn",			nBossId = 1231,	nRate = 300,	nSeries = 2,	nLevel = 95},

}

TBBOSSCAOCAP  = 
{ --tªn boss,id boss, tû lÖ r¬i ®å,series boss,nLevel
	[1]={	szName = "Mé Dung Toµn",						nBossId = 1875,	nRate = 300,	nSeries = 2,	nLevel = 95},
	[2]={	szName = "Kim ThÝ L­îng",						nBossId = 1874,	nRate = 300,	nSeries = 0,	nLevel = 95},
	[3]={	szName = "Tr­¬ng Tuyªn",						nBossId = 1873,	nRate = 300,	nSeries = 3,	nLevel = 95},
}

function Auto_TestBoss()
	tb = {"<color=red>"..GetName().."<color> b¹n muèn th¶ boss nµo?"}
	for k=1,getn(TBBOSS) do 
		tinsert(tb,format("%s/#PickBoss(%d)",TBBOSS[k].szName,k));
	end	
	tinsert(tb,"Trang KÕ/Auto_TestBoss2");
	tinsert(tb,"Tho¸t/cancel");
	CreateTaskSay(tb)
end
function Auto_TestBoss2()
	tb = {"<color=red>"..GetName().."<color> b¹n muèn th¶ boss nµo?"}
	for k=1,getn(TBBOSS2) do 
		tinsert(tb,format("%s/#PickBoss2(%d)",TBBOSS2[k].szName,k));
	end	
	tinsert(tb,"Trang KÕ/Auto_TestBoss3");
	tinsert(tb,"Tho¸t/cancel");
	CreateTaskSay(tb)
end

function Auto_TestBoss3()
	tb = {"<color=red>"..GetName().."<color> b¹n muèn th¶ boss nµo?"}
	for k=1,getn(TBBOSSCAONHAN) do 
		tinsert(tb,format("%s/#PickBoss3(%d)",TBBOSSCAONHAN[k].szName,k));
	end	
	tinsert(tb,"Trang KÕ/Auto_TestBoss4");
	tinsert(tb,"Tho¸t/cancel");
	CreateTaskSay(tb)
end

function Auto_TestBoss4()
	tb = {"<color=red>"..GetName().."<color> b¹n muèn th¶ boss nµo?"}
	for k=1,getn(TBBOSSCAOCAP) do 
		tinsert(tb,format("%s/#PickBoss4(%d)",TBBOSSCAOCAP[k].szName,k));
	end	
	tinsert(tb,"Tho¸t/cancel");
	CreateTaskSay(tb)
end

function PickBoss(nIndex)
	if GetFightState() == 0 then 
		Talk(1,"","Kh«ng thÓ th¶ boss ë nh÷ng n¬i phi chiÕn ®Êu ®­îc.")
		return 
	end
	local item = TBBOSS[nIndex];
	local nw,nx,ny = GetWorldPos();
	local index = AddNpcEx(item.nBossId,item.nLevel,item.nSeries,SubWorldID2Idx(nw),nx*32,ny*32,1,item.szName,1);
	SetNpcDeathScript(index,"\\script\\darkscript\\missions\\bosshoangkim\\bossdai\\goldboss_death.lua")		
	SetNpcParam(index,1,item.nBossId); --l­u id boss.
	SetNpcTimer(index,120*60*18)
	Msg2Player(item.szName.." ®· xuÊt hiÖn");
end

function PickBoss2(nIndex)
	if GetFightState() == 0 then 
		Talk(1,"","Kh«ng thÓ th¶ boss ë nh÷ng n¬i phi chiÕn ®Êu ®­îc.")
		return 
	end
	local item = TBBOSS2[nIndex];
	local nw,nx,ny = GetWorldPos();
	local index = AddNpcEx(item.nBossId,item.nLevel,item.nSeries,SubWorldID2Idx(nw),nx*32,ny*32,1,item.szName,1);
	SetNpcDeathScript(index,"\\script\\darkscript\\missions\\bosshoangkim\\bossdai\\goldboss_death.lua")		
	SetNpcParam(index,1,item.nBossId); --l­u id boss.
	SetNpcTimer(index,120*60*18)
	Msg2Player(item.szName.." ®· xuÊt hiÖn");
end

function PickBoss3(nIndex)
	if GetFightState() == 0 then 
		Talk(1,"","Kh«ng thÓ th¶ boss ë nh÷ng n¬i phi chiÕn ®Êu ®­îc.")
		return 
	end
	local item = TBBOSSCAONHAN[nIndex];
	local nw,nx,ny = GetWorldPos();
	local index = AddNpcEx(item.nBossId,item.nLevel,item.nSeries,SubWorldID2Idx(nw),nx*32,ny*32,1,item.szName,1);
	SetNpcDeathScript(index,"\\script\\misc\\boss\\callbossdeath.lua")		
	SetNpcParam(index,1,item.nBossId); --l­u id boss.
	SetNpcTimer(index,120*60*18)
	Msg2Player(item.szName.." ®· xuÊt hiÖn");
end
function PickBoss4(nIndex)
	if GetFightState() == 0 then 
		Talk(1,"","Kh«ng thÓ th¶ boss ë nh÷ng n¬i phi chiÕn ®Êu ®­îc.")
		return 
	end
	local item = TBBOSSCAOCAP[nIndex];
	local nw,nx,ny = GetWorldPos();
	local index = AddNpcEx(item.nBossId,item.nLevel,item.nSeries,SubWorldID2Idx(nw),nx*32,ny*32,1,item.szName,1);		
	SetNpcParam(index,1,item.nBossId); --l­u id boss.
	SetNpcTimer(index,120*60*18)
	Msg2Player(item.szName.." ®· xuÊt hiÖn");
end

function cancel()
end