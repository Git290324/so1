-- 炎帝宝藏
-- by 小浪多多
-- 2007.10.24
-- 我..
-- 正在尝试着..
-- 寻找着属于我的天地..

IncludeLib("RELAYLADDER")
IncludeLib("FILESYS")
IncludeLib("TITLE");
IncludeLib("SETTING");

-- Message khi gi誸 頲 Boss cu鑙 t輓h n╪g Vi猰 д -Modifiled by AnhHH - 20110725
Include("\\script\\lib\\objbuffer_head.lua")

YDBZ_MISSION_MATCH			= 50		-- 比赛mission
YDBZ_TIMER_MATCH				= 87		-- 比赛开始定时器
YDBZ_TIMER_FIGHTSTATE 	= 89		-- 检测玩家战斗状态计时器
YDBZ_NPC_BOSS_COUNT			= 1			-- 争夺地boss数量计算
YDBZ_VARV_STATE 				= 4			-- mission状态，1表示报名，2准备阶段，停止报名，3开始比赛
YDBZ_SIGNUP_WORLD				= 5			-- 报名地图
YDBZ_SIGNUP_POSX				= 6			-- 报名地点的X坐标
YDBZ_SIGNUP_POSY				= 7			-- 报名地点的Y坐标 
YDBZ_NPC_COUNT					= {8,9,10}		-- 各小关小怪叠加
YDBZ_NPC_BOSS_COUNT			= 11		-- 争夺地boss
YDBZ_NPC_WAY						= {12,13,14}	-- 达到的关
YDBZ_STATE_SIGN					= 15 		--进度,YDBZ_STATE_SIGN
YDBZ_TEAM_COUNT					= 16		--参加争夺的队伍数，计算器
YDBZ_TEAM_SUM						=	17		--参加争夺的队伍总数，常量
YDBZ_NPC_TYPE						= {
	{20,21,22,23,24,25,26,27,28,29},		--A路记录怪物类型			
	{30,31,32,33,34,35,36,37,38,39},		--B路记录怪物类型	
	{40,41,42,43,44,45,46,47,48,49},		--C路记录怪物类型	
}


YDBZ_TEAM_NAME					= {1,2,3}						--A队伍名	--B队伍名	--C队伍名					

YDBZ_TEAMS_TASKID				=	1851			-- 记录玩家所在group任务变量
YDBZ_PLAY_LIMIT_COUNT   = 1852			-- 参加次数变量，1，今年的第几周，2次数 ，3日 ，4次数
YDBZ_ITEM_YANDILING			= 1853			-- 炎帝令使用变量记录,1炎帝令 2记录临时阵营
YDBZ_MISSIOM_PLAYER_KEY = 1854			-- 炎帝记录玩家身上的key
YDBZ_ITEM_YANDILING_SUM	= 1855			-- 炎帝令使用总数
YDBZ_LIMIT_SIGNUP				= 5					-- 开始刷怪之间的时间：10秒
YDBZ_LIMIT_FINISH 			= 30 * 60		-- 任务时间期限（秒）：30分钟
YDBZ_LIMIT_BOARDTIME		= 5	* 60		-- 公告时间,每5分钟公告一次时间
YDBZ_TIME_WAIT_STATE1		= 10				-- 杀完争夺地boss后等级10秒进入争夺阶段
YDBZ_TIME_WAIT_STATE3		= 30				-- 闯关成功结束后，等待30秒被传送出场地
YDBZ_LIMIT_SETFIGHTSTATE= 3					-- 争夺阶段，玩家被杀后无敌状态时间3秒
YDBZ_LIMIT_TEAMS_COUNT	= 15				-- 队伍数量的最大限制
YDBZ_LIMIT_PLAYER_LEVEL = 120				-- 玩家最低等级限制
YDBZ_LIMIT_WEEK_COUNT		= 10 				-- 一周参加最大次数
YDBZ_LIMIT_DAY_COUNT		= 4 				-- 每天参加最大次数
YDBZ_PAIHANG_ID					=	10252			--排行榜ID
YDBZ_LIMIT_ITEM					= {{6,1,1604},1,"Anh H飊g Thi誴"}	--需要信物，英雄帖，tb1，图谱ID，tb2，需要数量
YDBZ_LIMIT_DOUBEL_ITEM	= {{6,1,1617},1,"Vi猰 д L謓h"}	--炎帝令，可获得双倍的奖励
YDBZ_AWARD_EXP 					= 600000									--每通过一关整队获得的经验
YDBZ_Faninl_AWARD_EXP		=	300000									--争夺地boss经验
YDBZ_KILLPLAYER_EXP 		= 200000									--杀死一个敌人获得经验（杀玩家得经验）
YDBZ_KILLLASTBOSS_EXP		= 1000000									--杀死最终boss获得经验
YDBZ_BOAT_POS 					=													--玩家被传送宝藏场的3个点x,y坐标。
{
	[1]={60032,104832},
	[2]={59744,123296},
	[3]={52960,121952},
}
YDBZ_FIGHTING_RELIFT = 		--玩家争夺区传送点和重生点，随机
{
	[1]=
	{
		{57408,112000},
		{57504,112160},
		{57664,112160},
	},
	[2]=
	{
		{58016,114464},
		{57888,114688},
		{58048,114784},
	},
	[3]=
	{
		{56288,112544},
		{56160,112736},
		{56320,112736},
	},
}
-- 比赛地图ID
YDBZ_MAP_MAP = {
	853,
	854,
	855,
	856,
	857,
	858,
	859,
	860,
	861,
	862,
};

-- Message khi gi誸 頲 Boss cu鑙 t輓h n╪g Vi猰 д -Modifiled by AnhHH - 20110725
local  _Message =  function (nItemIndex)
	local handle = OB_Create()
	local msg = format("Ch骳 m鮪g cao th� <color=yellow>%s<color> thu閏 t� i ti猽 di謙 [Lng Mi Nhi]  nh薾 頲 ph莕 thng [%s] " ,GetName(),GetItemName(nItemIndex))
	local _, nTongId = GetTongName()
	if (nTongId ~= 0) then
		Msg2Tong(nTongId, msg)
	end
	ObjBuffer:PushObject(handle, msg)
	RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
	OB_Release(handle)
	Msg2Team(msg)
end

--奖励
YDBZ_ZUANYONG_ITEM =				--专用物品
{
	[1] = {"H譶h nh﹏",6,1,1605}, -- 1固定为傀儡
	[2] = {"Vi猰 д trng m謓h ho祅",	6,	0,	1607}, 
	[3] = {"Vi猰 д gia b祇 ho祅",	6,	0,	1608}, 
	[4] = {"Vi猰 д i l鵦 ho祅",	6,	0,	1609}, 
	[5] = {"Vi猰 д cao thi觤 ho祅",	6,	0,	1610}, 
	[6] = {"Vi猰 д cao trung ho祅",	6,	0,	1611}, 
	[7] = {"Vi猰 д phi t鑓 ho祅",	6,	0,	1612}, 
	[8] = {"Vi猰 д b╪g ph遪g ho祅",	6,	0,	1613}, 
	[9] = {"Vi猰 д l玦 ph遪g ho祅",	6,	0,	1614}, 
	[10] = {"Vi猰 д h遖 ph遪g ho祅",	6,	0,	1615}, 
	[11] = {"Vi猰 д c ph遪g ho祅",	6,	0,	1616}, 

}

-- 掉落物品
YDBZ_tbaward_item ={
	[1]=--小怪
	{
	},
	[2]=--小关boss
	{--几率%,个数,物品ID,是否掉地上(0,掉地上，1直接随机掉一个队员身上),名称,双倍丸是否有效
		{50,1,{6,1,1605,1,0,0},1,"H譶h nh﹏",1},		--傀儡
		{100,15,{1, 2, 0, 5, 0, 0},0,"Ng� Hoa Ng鋍 L� Ho祅",0}, --五花
--		{10,1,{6,1,1606,1,0,0},1,"Vi猰 д у Щng",1},			--碎片
--		{10,1,{6,0,1591,1,0,0},1,"炎帝宝藏专用长命丸",0},
--		{10,1,{6,0,1592,1,0,0},1,"炎帝宝藏专用加跑丸",0},
--		{10,1,{6,0,1593,1,0,0},1,"炎帝宝藏专用大力丸",0},
--		{10,1,{6,0,1594,1,0,0},1,"炎帝宝藏专用高闪丸",0},
--		{10,1,{6,0,1595,1,0,0},1,"炎帝宝藏专用高中丸",0},
--		{10,1,{6,0,1596,1,0,0},1,"炎帝宝藏专用飞速丸",0},
--		{10,1,{6,0,1597,1,0,0},1,"炎帝宝藏专用冰防丸",0},
--		{10,1,{6,0,1598,1,0,0},1,"炎帝宝藏专用雷防丸",0},
--		{10,1,{6,0,1599,1,0,0},1,"炎帝宝藏专用火防丸",0},
--		{10,1,{6,0,1600,1,0,0},1,"炎帝宝藏专用毒防丸",0},
	},
	[3]=--争夺地小boss
	{
		{100,1,{6,1,1605,1,0,0},1,"H譶h nh﹏",1},		--傀儡
		{100,30,{1, 2, 0, 5, 0, 0},0,"Ng� Hoa Ng鋍 L� Ho祅",0},--五花
--		{30,1,{6,1,1606,1,0,0},1,"Vi猰 д у Щng",1}			--碎片
	},
	-- Thay i ph莕 thng Boss cu鑙 t輓h n╪g Vi猰 д -Modifiled by DinhHQ - 20120314
	[4]=--最终boss
	{			
		[1]={{szName="у Ph� Kim � Kh玦",tbProp={6,1,2982,1,0,0},nCount=1,nRate=0.5},},
		[2]={{szName="у Ph� Kim � Y",tbProp={6,1,2983,1,0,0},nCount=1,nRate=0.5},},
		[3]={{szName="у Ph� Kim � H礽",tbProp={6,1,2984,1,0,0},nCount=1,nRate=0.5},},
		[4]={{szName="у Ph� Kim � Y猽 Цi",tbProp={6,1,2985,1,0,0},nCount=1,nRate=0.5},},
		[5]={{szName="у Ph� Kim � H� Uy觧",tbProp={6,1,2986,1,0,0},nCount=1,nRate=0.5},},
		[6]={{szName="у Ph� Kim � H筺g Li猲",tbProp={6,1,2987,1,0,0},nCount=1,nRate=0.5},},
		[7]={{szName="у Ph� Kim � B閕",tbProp={6,1,2988,1,0,0},nCount=1,nRate=0.5},},
		[8]={{szName="у Ph� Kim � Thng Gi韎",tbProp={6,1,2989,1,0,0},nCount=1,nRate=0.3},},
		[9]={{szName="у Ph� Kim � H� Gi韎",tbProp={6,1,2990,1,0,0},nCount=1,nRate=0.3},},
		[10]={{szName="у Ph� Kim � Kh� Gi韎",tbProp={6,1,2991,1,0,0},nCount=1,nRate=0.2},},
		[11]={{szName="Kim � L謓h",tbProp={6,1,2349,1,0,0},nCount=1,nRate=0.2},},
		[12]={{szName="B秓 Rng Kim � H筺g Li猲",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={1,0,0,0,0,0},nRate=0.1, CallBack = _Message},},		
		[13]={{szName="B秓 Rng Kim � B閕",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={9,0,0,0,0,0}, nRate=0.05, CallBack = _Message},},
		[14]={{szName="B秓 Rng Kim � Y",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={6,0,0,0,0,0},nRate=0.1, CallBack = _Message},},
		[15]={{szName="B秓 Rng Kim � H� Gi韎",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={10,0,0,0,0,0},nRate=0.1, CallBack = _Message},},
		[16]={{szName="B秓 Rng Kim � V� Kh�",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={7,0,0,0,0,0},nRate=0.05, CallBack = _Message},},	
		[17]={{szName="Anh H飊g Thi誴",tbProp={6,1,1604,1,0,0},nCount=1,nRate=5,nExpiredTime=10080},},
		[18]={{szName="M筩 B綾 Truy襫 T鑞g L謓h",tbProp={6,1,1448,1,0,0},nCount=1,nRate=5},},
		[19]={{szName="Bao Dc ho祅 ",tbProp={6,1,910,1,0,0},nCount=1,nRate=8.75},},
		[20]={{szName="Thi猲 C� L謓h",tbProp={6,1,1091,1,0,0},nCount=1,nRate=7.5},},
		[21]={{szName="у Ph� B筩h H� H筺g Li猲",tbProp={6,1,3178,1,0,0},nCount=1,nRate=0.2},},
		[22]={{szName="у Ph� B筩h H� V� Kh�",tbProp={6,1,3182,1,0,0},nCount=1,nRate=0.1},},
		[23]={{szName="B筩h H� L謓h",tbProp={6,1,2357,1,0,0},nCount=1,nRate=0.05},},
	},
}

-- 2011.03.23
YDBZ_tbaward_item_ex = 
{
	[1] = {szName="Vi猰 д B� B秓",tbProp={6,1,2805,1,0,0}},		-- 炎帝秘宝p有待修改
}

--
-- NPC表格列含义
-- NPC参数各列的含义：后续处理、ID、名字、等级、五行、是否BOSS(0,1)、数量、位置
YDBZ_NPC_ATTRIDX_PROCEED		= 1			-- NPC后续处理
YDBZ_NPC_ATTRIDX_ID			= 2			-- NPC的ID
YDBZ_NPC_ATTRIDX_NAME		= 3			-- NPC名字
YDBZ_NPC_ATTRIDX_LEVEL		= 4			-- NPC等级
YDBZ_NPC_ATTRIDX_SERIES		= 5			-- NPC五行
YDBZ_NPC_ATTRIDX_ISBOSS		= 6			-- 是否BOSS
YDBZ_NPC_ATTRIDX_COUNT		= 7			-- NPC数量
YDBZ_NPC_ATTRIDX_POSITION	= 8			-- NPC位置
--

YDBZ_SCRIPT_NPC_DEATH 	= "\\script\\missions\\yandibaozang\\npc_death.lua"
YDBZ_SCRIPT_PLAYER_DEATH = "\\script\\missions\\yandibaozang\\player_death.lua"
--
---- 五行
YDBZ_map_series = {
	0,	-- 金
	1,	-- 木
	2,	-- 水
	3,	-- 火
	4,	-- 土
};


YDBZ_mapfile_trap =
{
	{"\\settings\\maps\\yandibaozang\\trap\\a","\\script\\missions\\yandibaozang\\trap\\a",10,"\\settings\\maps\\yandibaozang\\trap\\clear\\a"},
	{"\\settings\\maps\\yandibaozang\\trap\\b","\\script\\missions\\yandibaozang\\trap\\b",10,"\\settings\\maps\\yandibaozang\\trap\\clear\\b"},
	{"\\settings\\maps\\yandibaozang\\trap\\c","\\script\\missions\\yandibaozang\\trap\\c",10,"\\settings\\maps\\yandibaozang\\trap\\clear\\c"},
}