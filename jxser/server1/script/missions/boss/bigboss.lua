Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\lib\\sharedata.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
--Fix bug missing lib - modified by DinhHQ - 20110425
Include("\\script\\lib\\droptemplet.lua")
IncludeLib("LEAGUE")

BigBoss = {}

BigBoss.TSK_PLAYER_BOSSKILLED = 2598; -- 玩家击杀BOSS数量统计
BigBoss.TSK_BIGBOSS_REWARD = 2661; -- 记录玩家当天是否领奖和领奖类型 日期 | 获得闯关翻倍 | 获得宋金翻倍 |获得经验翻倍奖励 | 是否领奖
BigBoss.CAN_GET_REWARD_BIT = 1;
BigBoss.EXP_REWARD_BIT = 2;
BigBoss.SONGJIN_REWARD_BIT = 3;
BigBoss.CHUANGGUAN_REWARD_BIT = 4;

BigBoss.tbKillRecord = {};
BigBoss.IsBigBossDead = 0;
BigBoss.CallBackParam = {}

BigBoss.tbGlobalReward = 
{
	{szName="H玬 nay tr薾 T鑞g Kim 21:00, 甶觤 t輈h l騳 s� 頲 nh﹏ i", nRate=25, pFun=function() PlayerFunLib:SetTaskBit(BigBoss.TSK_BIGBOSS_REWARD, BigBoss.SONGJIN_REWARD_BIT, 1); Msg2Player(format("Чi hi謕 nh薾 頲 ph莕 thng <color=yellow>%s<color>","H玬 nay tr薾 T鑞g Kim 21:00, 甶觤 t輈h l騳 s� 頲 nh﹏ i"))end},
	{szName="H玬 nay vt 秈 t 21:00, 甶觤 kinh nghi謒 s� 頲 nh﹏ i", nRate=25, pFun=function() PlayerFunLib:SetTaskBit(BigBoss.TSK_BIGBOSS_REWARD, BigBoss.CHUANGGUAN_REWARD_BIT, 1); Msg2Player(format("Чi hi謕 nh薾 頲 ph莕 thng <color=yellow>%s<color>","H玬 nay vt 秈 t 21:00, 甶觤 kinh nghi謒 s� 頲 nh﹏ i"))end},
	{szName="Nh﹏ i kinh nghi謒 khi nh qu竔 trong 1 gi�", nRate=25, pFun=function() AddSkillState(967, 1, 1, 64800); PlayerFunLib:SetTaskBit(BigBoss.TSK_BIGBOSS_REWARD, BigBoss.EXP_REWARD_BIT, 1); Msg2Player(format("Чi hi謕 nh薾 頲 ph莕 thng <color=yellow>%s<color>","Nh﹏ i kinh nghi謒 khi nh qu竔 trong 1 gi�"))end},
	{nExp = 10000000, nRate=25},
}

BigBoss.tbKillerReward = 
{
	{tbProp = {6,1,2127,1,0,0}, nCount=1, nExpiredTime=43200},
	{tbProp = {4,239,1,1,0,0}, nCount=10},
	{tbProp = {4,238,1,1,0,0}, nCount=10},
	{tbProp = {4,240,1,1,0,0}, nCount=10},
	{tbProp = {4,353,1,1,0,0}, nCount=20},
	{tbProp = {0,11,450,1,0,0}, nCount=1, nExpiredTime=10080},
	{tbProp = {6,1,907,1,0,0}, nCount=8, nExpiredTime=10080},
	{tbProp = {6,1,1075,1,0,0}, nCount=8},
	{tbProp = {6,1,2126,1,0,0}, nCount=1, nExpiredTime=10080},
}

BigBoss.tbNormalDrop = 
{
	{tbProp = {6,1,1075,1,0,0}, nCount=3},
	{tbProp = {4,239,1,1,0,0}, nCount=20},
	{tbProp = {4,238,1,1,0,0}, nCount=20},
	{tbProp = {4,240,1,1,0,0}, nCount=20},
	{tbProp = {4,353,1,1,0,0}, nCount=20},
	{tbProp = {6,1,1672,1,0,0}, nCount=10},
	{tbProp = {0,11,450,1,0,0}, nCount=1, nExpiredTime=10080},
	{tbProp = {6,1,2115,1,0,0}, nCount=10},
	{tbProp = {6,1,2117,1,0,0}, nCount=10},
	{tbProp = {6,0,6,1,0,0}, nCount=20},
	{tbProp = {6,0,3,1,0,0}, nCount=20},
	{tbProp = {6,1,71,1,0,0}, nCount=20},
	{tbProp = {6,1,1765,1,0,0}, nCount=10},
	{tbProp = {6,1,26,1,0,0}, nCount=10},
	{tbProp = {6,1,22,1,0,0}, nCount=10},
}

--DC ph莕 thng boss чc C� - Modified By DinhHQ - 20111010
BigBoss.tbVngNewDropItem = {
	[1] = {
		[1]={{szName="у Ph� T� M穘g Kh玦",tbProp={6,1,2714,1,0,0},nCount=1,nRate=13},},
		[2]={{szName="у Ph� T� M穘g Y",tbProp={6,1,2715,1,0,0},nCount=1,nRate=13},},
		[3]={{szName="у Ph� T� M穘g Y猽 Цi",tbProp={6,1,2717,1,0,0},nCount=1,nRate=13},},
		[4]={{szName="у Ph� T� M穘g H� Uy觧",tbProp={6,1,2718,1,0,0},nCount=1,nRate=13},},
		[5]={{szName="у Ph� T� M穘g H筺g Li猲",tbProp={6,1,2719,1,0,0},nCount=1,nRate=13},},
		[6]={{szName="у Ph� T� M穘g B閕",tbProp={6,1,2720,1,0,0},nCount=1,nRate=13},},
		[7]={{szName="у Ph� T� M穘g H礽",tbProp={6,1,2716,1,0,0},nCount=1,nRate=13},},
		[8]={{szName="у Ph� T� M穘g Thng Gi韎 Ch�",tbProp={6,1,2721,1,0,0},nCount=1,nRate=8},},
		[9]={{szName="у Ph� T� M穘g H� Gi韎 Ch�",tbProp={6,1,2722,1,0,0},nCount=1,nRate=8},},
		[10]={{szName="у Ph� T� M穘g Kh� Gi韎",tbProp={6,1,2723,1,0,0},nCount=1,nRate=8},},
		[11]={{szName="T� M穘g L謓h",tbProp={6,1,2350,1,0,0},nCount=1,nRate=10},},
		[12]={{szName="Ch譨 Kh鉧 Nh� �",tbProp={6,1,2744,1,0,0},nCount=1,nRate=30},},
		[13]={{szName="Phi t鑓 ho祅 l� bao",tbProp={6,1,2520,1,0,0},nCount=1,nRate=60},},
		[14]={{szName="Чi l鵦 ho祅 l� bao",tbProp={6,1,2517,1,0,0},nCount=1,nRate=60},},
		[15]={{szName="Thanh C﹗ L謓h",tbProp={6,1,2369,1,0,0},nCount=1,nRate=15},},
		[16]={{szName="V﹏ L閏 L謓h",tbProp={6,1,2353,1,0,0},nCount=1,nRate=20},},
		[17]={{szName="T� Th駓 Tinh",tbProp={4,239,1,1,0,0},nCount=1,nRate=80},},
		[18]={{szName="Lam Th駓 Tinh",tbProp={4,238,1,1,0,0},nCount=1,nRate=80},},
		[19]={{szName="L鬰 Th駓 Tinh",tbProp={4,240,1,1,0,0},nCount=1,nRate=80},},
		[20]={{szName="Tinh H錸g B秓 Th筩h",tbProp={4,353,1,1,0,0},nCount=1,nRate=80},},
		[21]={{szName="Thi誸 La H竛",tbProp={6,1,23,1,0,0},nCount=2,nRate=80},},
		[22]={{szName="Ti猲 Th秓 L� c bi謙",tbProp={6,1,1181,1,0,0},nCount=1,nRate=30},},
		[23]={{szName="H鏽 Nguy猲 Linh L�",tbProp={6,1,2312,1,0,0},nCount=1,nRate=25},},
		[24]={{szName="Ho祅g Kim 蕁 (Cng h鉧)",tbProp={0,3209},nCount=1,nRate=20,nQuality = 1,nExpiredTime=20160,},},
		[25]={{szName="Ho祅g Kim 蕁 (Nhc h鉧)",tbProp={0,3219},nCount=1,nRate=20,nQuality = 1,nExpiredTime=20160,},},
	},
	[2] = {
		{szName="у Ph� T� M穘g Kh玦",tbProp={6,1,2714,1,0,0},nCount=1,nRate=12},
		{szName="у Ph� T� M穘g Y",tbProp={6,1,2715,1,0,0},nCount=1,nRate=13},
		{szName="у Ph� T� M穘g Y猽 Цi",tbProp={6,1,2717,1,0,0},nCount=1,nRate=14},
		{szName="у Ph� T� M穘g H� Uy觧",tbProp={6,1,2718,1,0,0},nCount=1,nRate=12},		
		{szName="у Ph� T� M穘g B閕",tbProp={6,1,2720,1,0,0},nCount=1,nRate=12},		
		{szName="у Ph� T� M穘g H礽",tbProp={6,1,2716,1,0,0},nCount=1,nRate=13},
		{szName="у Ph� T� M穘g H筺g Li猲",tbProp={6,1,2719,1,0,0},nCount=1,nRate=11},
		{szName="у Ph� T� M穘g Thng Gi韎 Ch�",tbProp={6,1,2721,1,0,0},nCount=1,nRate=5},
		{szName="у Ph� T� M穘g H� Gi韎 Ch�",tbProp={6,1,2722,1,0,0},nCount=1,nRate=5},
		{szName="у Ph� T� M穘g Kh� Gi韎",tbProp={6,1,2723,1,0,0},nCount=1,nRate=3},
	},	
	[3] = {
		{szName="Thi猲 Linh Кn",tbProp={6,1,3022,1,0,0},nCount = 30, nExpiredTime = 7 * 24 * 60},
	},
}

BigBoss.tbVngNewDropEquip = 
{
	{szName="T� M穘g V� Tng Ch﹗ Li猲",tbProp={0,1825},nCount=1,nRate=0.1,nQuality = 1,},
	{szName="T� M穘g T� Kh玭g Ph藅 Ch﹗",tbProp={0,1835},nCount=1,nRate=0.1,nQuality = 1,},
	{szName="T� M穘g Thanh T辬h H筺g Li猲",tbProp={0,1845},nCount=1,nRate=0.1,nQuality = 1,},
	{szName="T� M穘g S飊g Minh Li猲",tbProp={0,1855},nCount=1,nRate=0.1,nQuality = 1,},
	{szName="T� M穘g мnh H秈 H筺g Li猲",tbProp={0,1865},nCount=1,nRate=0.1,nQuality = 1,},
	{szName="T� M穘g Tuy猲 Uy H筺g Li猲",tbProp={0,1875},nCount=1,nRate=0.1,nQuality = 1,},
	{szName="T� M穘g Xu蕋 Tr莕 Ch﹗ Li猲",tbProp={0,1885},nCount=1,nRate=0.1,nQuality = 1,},
	{szName="T� M穘g M閏 Tuy誸 Ch﹗ Li猲",tbProp={0,1895},nCount=1,nRate=0.1,nQuality = 1,},
	{szName="T� M穘g Thanh Sng Ch﹗ Li猲",tbProp={0,1905},nCount=1,nRate=0.1,nQuality = 1,},
	{szName="T� M穘g Th� Hng Ch﹗ Li猲",tbProp={0,1915},nCount=1,nRate=0.1,nQuality = 1,},
	{szName="T� M穘g Th鵦 C鑤 H筺g Li猲",tbProp={0,1925},nCount=1,nRate=0.1,nQuality = 1,},
	{szName="T� M穘g Xuy猲 T﹎ H筺g Li猲",tbProp={0,1935},nCount=1,nRate=0.1,nQuality = 1,},
	{szName="T� M穘g Lang Nha H筺g Li猲",tbProp={0,1945},nCount=1,nRate=0.1,nQuality = 1,},
	{szName="T� M穘g Thanh V� H筺g Li猲",tbProp={0,1955},nCount=1,nRate=0.1,nQuality = 1,},
	{szName="T� M穘g Phong Sng H筺g Li猲",tbProp={0,1965},nCount=1,nRate=0.1,nQuality = 1,},
	{szName="T� M穘g M藅 V﹏ H筺g Li猲",tbProp={0,1975},nCount=1,nRate=0.1,nQuality = 1,},
	{szName="T� M穘g H醓 V﹏ H筺g Li猲",tbProp={0,1985},nCount=1,nRate=0.1,nQuality = 1,},
	{szName="T� M穘g Dung Kim H筺g Khuy猲",tbProp={0,1995},nCount=1,nRate=0.1,nQuality = 1,},
	{szName="T� M穘g Li猽 Nguy猲 H筺g Li猲",tbProp={0,2005},nCount=1,nRate=0.1,nQuality = 1,},
	{szName="T� M穘g Ch﹏ Vi猲 Ph�",tbProp={0,2015},nCount=1,nRate=0.1,nQuality = 1,},
	{szName="T� M穘g Ch﹏ V� Ph�",tbProp={0,2025},nCount=1,nRate=0.1,nQuality = 1,},
	{szName="T� M穘g 筺 Th駓 H筺g Li猲",tbProp={0,2035},nCount=1,nRate=0.1,nQuality = 1,},
	{szName="T� M穘g Tr輈h Tinh Ph�",tbProp={0,2045},nCount=1,nRate=0.09,nQuality = 1,},
	{szName="T� M穘g V� Tng Thng Gi韎",tbProp={0,1827},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="T� M穘g T� Kh玭g Thng Gi韎",tbProp={0,1837},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="T� M穘g Thanh T辬h Thng Gi韎",tbProp={0,1847},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="T� M穘g S飊g Minh Thng Gi韎",tbProp={0,1857},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="T� M穘g мnh H秈 Thng Gi韎",tbProp={0,1867},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="T� M穘g Tuy猲 Uy Thng Gi韎",tbProp={0,1877},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="T� M穘g Xu蕋 Tr莕 Thng Gi韎",tbProp={0,1887},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="T� M穘g M閏 Tuy誸 Thng Gi韎",tbProp={0,1897},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="T� M穘g Thanh Sng Thng Gi韎",tbProp={0,1907},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="T� M穘g Th� Hng Thng Gi韎",tbProp={0,1917},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="T� M穘g Th鵦 C鑤 Thng Gi韎",tbProp={0,1927},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="T� M穘g Xuy猲 T﹎ Thng Gi韎",tbProp={0,1937},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="T� M穘g Lang Nha Thng Gi韎",tbProp={0,1947},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="T� M穘g Thanh V� Thng Gi韎",tbProp={0,1957},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="T� M穘g Phong Sng Thng Gi韎",tbProp={0,1967},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="T� M穘g M藅 V﹏ Thng Gi韎",tbProp={0,1977},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="T� M穘g H醓 V﹏ Thng Gi韎",tbProp={0,1987},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="T� M穘g Dung Kim Thng Gi韎",tbProp={0,1997},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="T� M穘g Li猽 Nguy猲 Thng Gi韎",tbProp={0,2007},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="T� M穘g Ch﹏ Vi猲 Thng Gi韎",tbProp={0,2017},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="T� M穘g Ch﹏ V� Thng Gi韎",tbProp={0,2027},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="T� M穘g 筺 Th駓 Thng Gi韎",tbProp={0,2037},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="T� M穘g Tr輈h Tinh Thng Gi韎",tbProp={0,2047},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="T� M穘g V� Tng H� Gi韎",tbProp={0,1834},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="T� M穘g T� Kh玭g H� Gi韎",tbProp={0,1844},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="T� M穘g Thanh T辬h H� Gi韎",tbProp={0,1854},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="T� M穘g S飊g Minh H� Gi韎",tbProp={0,1864},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="T� M穘g мnh H秈 H� Gi韎",tbProp={0,1874},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="T� M穘g Tuy猲 Uy H� Gi韎",tbProp={0,1884},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="T� M穘g Xu蕋 Tr莕 H� Gi韎",tbProp={0,1894},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="T� M穘g M閏 Tuy誸 H� Gi韎",tbProp={0,1904},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="T� M穘g Thanh Sng H� Gi韎",tbProp={0,1914},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="T� M穘g Th� Hng H� Gi韎",tbProp={0,1924},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="T� M穘g Th鵦 C鑤 H� Gi韎",tbProp={0,1934},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="T� M穘g Xuy猲 T﹎ H� Gi韎",tbProp={0,1944},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="T� M穘g Lang Nha H� Gi韎",tbProp={0,1954},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="T� M穘g Thanh V� H� Gi韎",tbProp={0,1964},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="T� M穘g Phong Sng H� Gi韎",tbProp={0,1974},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="T� M穘g M藅 V﹏ H� Gi韎",tbProp={0,1984},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="T� M穘g H醓 V﹏ H� Gi韎",tbProp={0,1994},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="T� M穘g Dung Kim H� Gi韎",tbProp={0,2004},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="T� M穘g Li猽 Nguy猲 H� Gi韎",tbProp={0,2014},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="T� M穘g Ch﹏ Vi猲 H� Gi韎",tbProp={0,2024},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="T� M穘g Ch﹏ V� H� Gi韎",tbProp={0,2034},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="T� M穘g 筺 Th駓 H� Gi韎",tbProp={0,2044},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="T� M穘g Tr輈h Tinh H� Gi韎",tbProp={0,2054},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="T� M穘g V� Tng Tri襫 Th�",tbProp={0,1831},nCount=1,nRate=0.05,nQuality = 1,},
	{szName="T� M穘g T� Kh玭g T╪g C玭",tbProp={0,1841},nCount=1,nRate=0.05,nQuality = 1,},
	{szName="T� M穘g Thanh T辬h Gi韎 o",tbProp={0,1851},nCount=1,nRate=0.05,nQuality = 1,},
	{szName="T� M穘g S飊g Minh Ch飝",tbProp={0,1861},nCount=1,nRate=0.05,nQuality = 1,},
	{szName="T� M穘g мnh H秈 Thng",tbProp={0,1871},nCount=1,nRate=0.05,nQuality = 1,},
	{szName="T� M穘g Tuy猲 Uy B秓 o",tbProp={0,1881},nCount=1,nRate=0.05,nQuality = 1,},
	{szName="T� M穘g Xu蕋 Tr莕 Ki誱",tbProp={0,1891},nCount=1,nRate=0.05,nQuality = 1,},
	{szName="T� M穘g M閏 Tuy誸 Tri襫 Th�",tbProp={0,1901},nCount=1,nRate=0.05,nQuality = 1,},
	{szName="T� M穘g Thanh Sng o",tbProp={0,1911},nCount=1,nRate=0.05,nQuality = 1,},
	{szName="T� M穘g Th� Hng Uy猲 Μng o",tbProp={0,1921},nCount=1,nRate=0.05,nQuality = 1,},
	{szName="T� M穘g Th鵦 C鑤 Tri襫 Th�",tbProp={0,1931},nCount=1,nRate=0.05,nQuality = 1,},
	{szName="T� M穘g Xuy猲 T﹎ o",tbProp={0,1941},nCount=1,nRate=0.05,nQuality = 1,},
	{szName="T� M穘g Lang Nha Phi o",tbProp={0,1951},nCount=1,nRate=0.05,nQuality = 1,},
	{szName="T� M穘g Thanh V� T� Ti詎",tbProp={0,1961},nCount=1,nRate=0.05,nQuality = 1,},
	{szName="T� M穘g Phong Sng Ti猽",tbProp={0,1971},nCount=1,nRate=0.05,nQuality = 1,},
	{szName="T� M穘g M藅 V﹏ Tri襫 Th�",tbProp={0,1981},nCount=1,nRate=0.05,nQuality = 1,},
	{szName="T� M穘g H醓 V﹏ Trng",tbProp={0,1991},nCount=1,nRate=0.05,nQuality = 1,},
	{szName="T� M穘g Dung Kim Thng",tbProp={0,2001},nCount=1,nRate=0.05,nQuality = 1,},
	{szName="T� M穘g Li猽 Nguy猲 o",tbProp={0,2011},nCount=1,nRate=0.05,nQuality = 1,},
	{szName="T� M穘g Ch﹏ Vi猲 Ki誱",tbProp={0,2021},nCount=1,nRate=0.05,nQuality = 1,},
	{szName="T� M穘g Ch﹏ V� Ki誱",tbProp={0,2031},nCount=1,nRate=0.05,nQuality = 1,},
	{szName="T� M穘g 筺 Th駓 o",tbProp={0,2041},nCount=1,nRate=0.05,nQuality = 1,},
	{szName="T� M穘g Tr輈h Tinh Ki誱",tbProp={0,2051},nCount=1,nRate=0.05,nQuality = 1,},
}	


function AddKillRecord_CallBack(Param, ResultHandle)
	szName = BigBoss.CallBackParam[Param][1];
	nSecondes = BigBoss.CallBackParam[Param][2];
	BigBoss.CallBackParam[Param] = nil;
	if (OB_IsEmpty(ResultHandle) == 0) then
		BigBoss.tbKillRecord = ObjBuffer:PopObject(ResultHandle);
	end
	
	local nIdx = 0;
	
	local nIdx = 0;
	for i=1,getn(BigBoss.tbKillRecord) do
		if (BigBoss.tbKillRecord[i][2] > nSecondes) then
			nIdx = i;
			break;
		end
	end
	
	if (nIdx == 0) then
		nIdx = getn(BigBoss.tbKillRecord) + 1;
	end
	
	tinsert(BigBoss.tbKillRecord, nIdx, {szName, nSecondes});
	
	local nCount = 0;
	
	-- 保留最好成绩
	for i=1,getn(BigBoss.tbKillRecord) do
		if (BigBoss.tbKillRecord[i] and BigBoss.tbKillRecord[i][1] == szName) then
			nCount = nCount + 1;
			if (nCount > 1) then
				tremove(BigBoss.tbKillRecord, nIdx);
			end
		end
	end
	
	SaveShareData("FUNC_BIGBOSS_LADDER", 0, 0, BigBoss.tbKillRecord);
end

function BigBoss:AddKillRecord(szName, nSecondes)
	self.CallBackParam[getn(self.CallBackParam)+1] = {szName, nSecondes};
	
	LoadShareData("FUNC_BIGBOSS_LADDER", 0, 0, "AddKillRecord_CallBack", getn(self.CallBackParam));
end

function BigBoss:GetKillRecord(szCallBack, nParam)
	nParam = nParam or 0;
	LoadShareData("FUNC_BIGBOSS_LADDER", 0, 0, szCallBack, nParam);
end

function BigBoss:BigBossGlobalReward()
	self.CallBackParam[getn(self.CallBackParam) + 1] = PlayerIndex;
	RemoteExecute("\\script\\mission\\boss\\bigboss.lua", "IsBigBossDead", 0, "BigBossGlobalReward_CallBack", getn(self.CallBackParam));
end

function BigBossGlobalReward_CallBack(Param, ResultHandle)
	local Index = BigBoss.CallBackParam[Param]
	if (Index and Index > 0) then
		local OldPlayerIndex = PlayerIndex
		PlayerIndex = Index
		if (OB_IsEmpty(ResultHandle) == 0) then
			IsBigBossDead = ObjBuffer:PopObject(ResultHandle);
			if (IsBigBossDead == 1) then
				PlayerFunLib:AddTaskDaily(BigBoss.TSK_BIGBOSS_REWARD, 0);	-- 重置变量,以防意外
				if (PlayerFunLib:CheckTaskBit(BigBoss.TSK_BIGBOSS_REWARD, BigBoss.CAN_GET_REWARD_BIT, 1, "H玬 nay i hi謕  nh薾 thng r錳!") == 1) then
					PlayerFunLib:SetTaskBit(BigBoss.TSK_BIGBOSS_REWARD, BigBoss.CAN_GET_REWARD_BIT, 0);
					tbAwardTemplet:GiveAwardByList(BigBoss.tbGlobalReward, format("[%s] big boss global reward",date("%Y%m%d")));
				end
			else
				Talk(1, "", format("H玬 nay v蒼 ch璦 nh b筰 <color=red>%s<color>","чc C� Thi猲 Phong"));
			end
		end
		--
		PlayerIndex = OldPlayerIndex
		BigBoss.CallBackParam[Param] = nil
	end
end

function BigBoss:BigBossDeath(nNpcIndex)
	-- 记录时间
	local nTime = tonumber(GetLocalDate("%H%M%S"))-194500; -- 死亡时间 - 召唤时间
	
	-- 给最高伤害的人或队伍奖励
	local nTeamSize = GetTeamSize();
	local szName;
	
	if (nTeamSize > 1) then
		for i=1,nTeamSize do
			if(doFunByPlayer(GetTeamMember(i), IsCaptain)==1)then
				szName = doFunByPlayer(GetTeamMember(i), GetName);
			end
			doFunByPlayer(GetTeamMember(i), PlayerFunLib.AddExp, PlayerFunLib, 100000000, 0, format("%s ph莕 thng","Ph莕 thng kinh nghi謒 cho ngi c� c玭g k輈h m筺h nh蕋 v祇 чc C� Thi猲 Phong"));
		end
	else -- 一个人
		szName = GetName();
		PlayerFunLib:AddExp(100000000, 0, format("%s ph莕 thng","Ph莕 thng kinh nghi謒 cho ngi c� c玭g k輈h m筺h nh蕋 v祇 чc C� Thi猲 Phong"));
	end
	
	local tbRoundPlayer, nCount = GetNpcAroundPlayerList(nNpcIndex, 20);
	
	for i=1,nCount do
		doFunByPlayer(tbRoundPlayer[i], PlayerFunLib.AddExp, PlayerFunLib, 50000000, 0, format("%s ph莕 thng","Ph莕 thng kinh nghi謒 cho ngi ng g莕 khi  b筰 чc C� Thi猲 Phong"));
	end
	
	--tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex, self.tbKillerReward, format("%s r韙","чc C� Thi猲 Phong"), 1);
	
	--tbDropTemplet:GiveAwardByList(nNpcIndex, -1, self.tbNormalDrop, format("%s r韙","чc C� Thi猲 Phong"), 1);
	
	--DC Ph莕 thng - Modified By DinhHQ - 20111010
	--item
	tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex, self.tbVngNewDropItem, format("%s r韙","чc C� Thi猲 Phong"), 1);
	--trang b�
	tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex, self.tbVngNewDropEquip, format("%s r韙","чc C� Thi猲 Phong"), 1);
	
	-- BOSS击杀统计
	local nCount = GetTask(self.TSK_PLAYER_BOSSKILLED);
	nCount = nCount + 1;
	SetTask(self.TSK_PLAYER_BOSSKILLED, nCount);
	
	-- BIGBOSS死亡
	local Handle = OB_Create()
	if (Handle > 0) then
		ObjBuffer:PushObject(Handle, 1)
		RemoteExecute("\\script\\mission\\boss\\bigboss.lua", "SetBigBossDead", Handle);
		OB_Release(Handle)
	end
	
	local szNews = format("T� i <color=yellow>%s<color>  ti猽 di謙 th祅h c玭g  <color=yellow>чc C� Thi猲 Phong<color>, h穣 nhanh ch鉵g n l� quan nh薾 thng!",szName);
	AddGlobalNews(szNews);
	LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szNews , "", "");
	
	self:AddKillRecord(szName, nTime);
end

function BigBoss:RemoveSongJinBonus()
	PlayerFunLib:AddTaskDaily(self.TSK_BIGBOSS_REWARD, 0);	-- 重置变量,以防意外
	PlayerFunLib:SetTaskBit(self.TSK_BIGBOSS_REWARD, self.SONGJIN_REWARD_BIT, 0);
end

function BigBoss:RemoveChuangGuanBonus()
	PlayerFunLib:AddTaskDaily(self.TSK_BIGBOSS_REWARD, 0);	-- 重置变量,以防意外
	PlayerFunLib:SetTaskBit(self.TSK_BIGBOSS_REWARD, self.CHUANGGUAN_REWARD_BIT, 0);
end

function BigBoss:AddSongJinPoint(nBasePoint)
	PlayerFunLib:AddTaskDaily(self.TSK_BIGBOSS_REWARD, 0);	-- 重置变量,以防意外
	local nType = GetBit(PlayerFunLib:GetActivityTask(self.TSK_BIGBOSS_REWARD), self.SONGJIN_REWARD_BIT);
	if (nType == 1) then
		local nHour = tonumber(GetLocalDate("%H"));
		if (nHour <= 22) then -- 21点的宋金22:30结束
			nBasePoint = nBasePoint * 2;
		end
		
	end
	--Lunar new year 2011 - Bobus award - Modified By DinhHQ - 20120103
	local nNowDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	if nNowDate >= 201201200000 and nNowDate < 201201252400 and nType ~= 1 then
		nBasePoint = nBasePoint * 2;
	end
	return nBasePoint;
end

function BigBoss:AddChuangGuanPoint(nBasePoint)
	PlayerFunLib:AddTaskDaily(self.TSK_BIGBOSS_REWARD, 0);	-- 重置变量,以防意外
	local nType = GetBit(PlayerFunLib:GetActivityTask(self.TSK_BIGBOSS_REWARD), self.CHUANGGUAN_REWARD_BIT);
	if (nType == 1) then
		nBasePoint = nBasePoint * 2;
	end
	--Lunar new year 2011 - Bobus award - Modified By DinhHQ - 20120103
	local nNowDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	if nNowDate >= 201201200000 and nNowDate < 201201252400 and nType ~= 1 then
		nBasePoint = nBasePoint * 2;
	end
	return nBasePoint;
end

function BigBoss:MakeAllPlayerCanGetReward()
	local nIdx = GetFirstPlayerAtServer();
	while(nIdx > 0) do
		doFunByPlayer(nIdx, PlayerFunLib.AddTaskDaily, PlayerFunLib, self.TSK_BIGBOSS_REWARD, 0);
		doFunByPlayer(nIdx, PlayerFunLib.SetTaskBit, PlayerFunLib, self.TSK_BIGBOSS_REWARD, self.CAN_GET_REWARD_BIT, 1);
		nIdx = GetNextPlayerAtServer();
	end
end