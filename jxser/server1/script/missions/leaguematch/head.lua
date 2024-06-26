
--if (WLLS_HEAD) then
--	return
--end
--
--WLLS_HEAD = 1


IL("FILESYS");
IL("ITEM");
IL("LEAGUE");
IL("SETTING");
IL("TITLE");
IL("RELAYLADDER");

Include("\\script\\missions\\leaguematch\\tb_head.lua")
Include("\\script\\lib\\common.lua")

-- 2006/04/21 加入装备升级任务 - 佩雷斯
--Include("\\script\\task\\equipex\\head.lua");
Include("\\script\\tong\\tong_award_head.lua");--帮会周目标
Include("\\script\\task\\task_addplayerexp.lua")  --给玩家累加经验的公共函数

Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

--Global Value--
GLB_WLLS_PHASE	= 820	--比赛当前所处阶段
GLB_WLLS_SID	= 821	--当前赛季编号
GLB_WLLS_MATCHID= 822	--当前比赛编号
GLB_WLLS_TYPE	= 823	--当前赛季的联赛模式
GLB_WLLS_NEXT	= 824	--下一赛季的联赛模式
GLB_WLLS_TIME	= 825	--计时器计数
GLB_WLLS_CLOSE	= 826	--关闭高级联赛（2） + 关闭新秀联赛（1）

--LG Task ID--
WLLS_LGTASK_MTYPE	= 11	--比赛类型
WLLS_LGTASK_LAST	= 1		--所参加的最后一场比赛编号（进入准备场就算）	
WLLS_LGTASK_SVRID	= 2 	--所参加的最后一场比赛服务器
WLLS_LGTASK_MSCAMP	= 3 	--所参加的最后一场比赛MS阵营
WLLS_LGTASK_POINT	= 4		--战队获得积分
WLLS_LGTASK_RANK	= 5		--战队排名
WLLS_LGTASK_WIN		= 6		--胜利次数
WLLS_LGTASK_TIE		= 7		--平局次数
WLLS_LGTASK_TOTAL	= 8		--参赛次数（失败次数 = TOTAL - WIN - TIE）
WLLS_LGTASK_JOIN	= 9		--已经进入准备场的人数
WLLS_LGTASK_TIME	= 10	--战斗时间总计
WLLS_LGTASK_STYPE	= 12	--组建时的联赛模式
WLLS_LGTASK_EMY1	= 13	--最后的一场比赛遇到的对手（战队名String2ID）
WLLS_LGTASK_EMY2	= 14	--倒数第二场比赛遇到的对手
WLLS_LGTASK_EMY3	= 15	--倒数第三场比赛遇到的对手
WLLS_LGTASK_TOTAL_EX= 16	--使用血战令旗的个数
WLLS_LGTASK_USE_LingQi_COUNT= 17	--扩展次数参加的几次


WLLS_LGMTASK_JOB	= 1	--职位:0、队员；1、队长
WLLS_LGMTASK_STATE	= 2	--战队成员状态：0、在场外；1、进入准备场；2、比赛中
WLLS_LGMTASK_ADDSID	= 3	--在哪个赛季加入了本战队
WLLS_LGMTASK_WIN	= 4	--需要补加的胜利次数
WLLS_LGMTASK_TIE	= 5	--需要补加的平局次数
WLLS_LGMTASK_TOTAL	= 6	--需要补加的参赛次数
WLLS_LGMTASK_OVER	= 7	--在哪个赛季级发生越级

--Task ID--
WLLS_TB	=	1715
WLLS_TASKID_FROMMAP	= WLLS_TB	--来自地图ID
WLLS_TASKID_FROM_X	= WLLS_TB+1	--来自坐标X
WLLS_TASKID_FROM_Y	= WLLS_TB+2	--来自坐标Y
WLLS_TASKID_ORGCAMP	= WLLS_TB+3	--比赛中我方的Mission Camp
WLLS_TASKID_GOTAWARD= WLLS_TB+4	--最后一次领取的奖励 Type:Level:Award:SID

WLLS_TASKID_WIN		= WLLS_TB+5	--个人胜利次数
WLLS_TASKID_TIE		= WLLS_TB+6	--个人平局次数
WLLS_TASKID_TOTAL	= WLLS_TB+7	--个人参赛次数
WLLS_TASKID_POINT	= 2500		--个人累计积分
WLLS_TASKID_HONOUR	= 2501		--个人荣誉点数（可消耗积分）

--WLLS_TASKID_AWIN	= WLLS_TB+8		--用于领取参与奖励的胜利计数
--WLLS_TASKID_ATOTAL	= WLLS_TB+9		--用于领取参与奖励的参赛计数
--WLLS_TASKID_AWARD	= WLLS_TB+10	--已经领取了哪个马，0、无；1、120级；2、150级

WLLS_TASKID_LGTYPE	= WLLS_TB+11	--战队类型
WLLS_TASKID_LGPOINT	= WLLS_TB+12	--战队积分
WLLS_TASKID_LGRANK	= WLLS_TB+13	--战队排名
WLLS_TASKID_LGWIN	= WLLS_TB+14	--战队胜利次数
WLLS_TASKID_LGTIE	= WLLS_TB+15	--战队平局次数
WLLS_TASKID_LGTOTAL	= WLLS_TB+16	--战队参赛次数
WLLS_TASKID_LGTIME	= WLLS_TB+17	--战队战斗时间	(1732)
WLLS_TASKID_EX		= WLLS_TB+18	--额外变量（0~10）
WLLS_TASKID_SWITCH	= WLLS_TB+19	--开关：1.加经验，2.扣除部分经验
WLLS_TASKID_AWARDEX	= WLLS_TB+20	-- 换/给 奖励 (Type:Level:AwardErr:Award)

WLLS_TEMPTASK		= 246
WLLS_STRINGTASK		= 5

--Mission--
WLLS_MSID_SCHEDULE	= 24	-- 准备场 MissionID
WLLS_MSID_COMBAT	= 25	-- 比赛场 MissionID
WLLS_MSID_GLB		= 26	-- 全局 MissionID

WLLS_MSV_MSID	= 1	--本Mission的MissionID

--Mission Timer--
WLLS_TIMERID_SCHEDULE	= 50	--全局计时器
WLLS_TIMERID_COMBAT		= 51	--比赛场计时器

WLLS_FRAME2TIME = 18	--18帧游戏时间相当于1秒钟
WLLS_TIMER_PREP_FREQ	= 10	--准备场计时器触发频率10秒
WLLS_TIMER_PREP_TOTAL	= 24	--准备时间4分钟（24个报告战况时间）
WLLS_TIMER_FIGHT_FREQ	= 5		--战斗场报告战况频率5秒
WLLS_TIMER_FIGHT_PREP	= 2		--战斗准备时间10秒 （2个报告战况时间）
WLLS_TIMER_FIGHT_TOTAL	= 120	--战斗时间10分钟 （10*60/5个报告战况时间）

--Const Value--
WLLS_LGTYPE		= 5	--战队类型
WLLS_REG_LGTYPE	= 2	--登记处战队类型

WLLS_LEVEL_JUNIOR	= 80	--参加新秀赛所需最小级别
WLLS_LEVEL_SENIOR	= 120	--参加武林赛所需最小级别

WLLS_MIN_TEAM	= 2	--比赛场至少多少参赛队伍才可以开战

WLLS_MAPPOS_SIGN	= { 1523, 3024 }	--会场进入坐标
WLLS_MAPPOS_PRE		= { 1596, 2977 }	--准备场进入坐标

WLLS_LingQi_PerCOUNT = 4

--四个城市的相应地图信息
WLLS_CITY_INDEX	= {
	[37]	= {1,1},
	[176]	= {1,2},
	[78]	= {1,3},
	[162]	= {2,1},
	[80]	= {2,2},
	[1]	= {2,3},
	[11]	= {2,4},
}

WLLS_MAX_COUNT	= 200	--每个准备场最多容纳多少战队

WLLS_FILE_DEATHSCRIPT = "\\script\\missions\\leaguematch\\combat\\playerdeath.lua"

--违禁药品
WLLS_FORBID_ITEM = {
	{	"C玭g T鑓 ho祅", {6, 1, 218, -1, 0, 0}, 511	},
	{	"B祇 T鑓 ho祅", {6, 1, 219, -1, 0, 0}, 512	},
	{	"Ph� Ph遪g ho祅", {6, 1, 220, -1, 0, 0}, 513	},
	{	"чc Ph遪g ho祅", {6, 1, 221, -1, 0, 0}, 514	},
	{	"B╪g Ph遪g ho祅", {6, 1, 222, -1, 0, 0}, 515	},
	{	"H醓 Ph遪g ho祅", {6, 1, 223, -1, 0, 0}, 516	},
	{	"L玦 Ph遪g ho祅", {6, 1, 224, -1, 0, 0}, 517	},
	{	"Gi秏 Thng ho祅", {6, 1, 225, -1, 0, 0}, 518	},
	{	"Gi秏 H玭 ho祅", {6, 1, 226, -1, 0, 0}, 519	},
	{	"Gi秏 чc ho祅", {6, 1, 227, -1, 0, 0}, 520	},
	{	"Gi秏 B╪g ho祅", {6, 1, 228, -1, 0, 0}, 521	},
	{	"Ph� C玭g ho祅", {6, 1, 229, -1, 0, 0}, 522	},
	{	"чc C玭g ho祅", {6, 1, 230, -1, 0, 0}, 523	},
	{	"B╪g C玭g ho祅", {6, 1, 231, -1, 0, 0}, 524	},
	{	"H醓 C玭g ho祅", {6, 1, 232, -1, 0, 0}, 525	},
	{	"L玦 C玭g ho祅", {6, 1, 233, -1, 0, 0}, 526	},
	{	"Trng M謓h ho祅", {6, 1, 234, -1, 0, 0}, 527	},
	{	"Trng N閕 ho祅", {6, 1, 235, -1, 0, 0}, 528	},
	{	"Y猲 H錸g 產n", {6, 1, 115, -1, 0, 0}, 450	},
	{	"X� Lam 產n", {6, 1, 116, -1, 0, 0}, 451	},
	{	"N閕 Ph� ho祅", {6, 1, 117, -1, 0, 0}, 453	},
	{	"N閕 чc ho祅", {6, 1, 118, -1, 0, 0}, 454	},
	{	"N閕 B╪g ho祅", {6, 1, 119, -1, 0, 0}, 455	},
	{	"N閕 H醓 ho祅", {6, 1, 120, -1, 0, 0}, 456	},
	{	"N閕 L玦 ho祅", {6, 1, 121, -1, 0, 0}, 457	},
	{	"Trng M謓h ho祅", {6, 0, 1, -1, 0, 0}, 256	},
	{	"Gia B祇 ho祅", {6, 0, 2, -1, 0, 0}, 257	},
	{	"Чi L鵦 ho祅", {6, 0, 3, -1, 0, 0}, 258	},
	{	"Cao Thi觤 ho祅", {6, 0, 4, -1, 0, 0}, 259	},
	{	"Cao Trung ho祅", {6, 0, 5, -1, 0, 0}, 260	},
	{	"Phi T鑓 ho祅", {6, 0, 6, -1, 0, 0}, 261	},
	{	"B╪g Ph遪g ho祅", {6, 0, 7, -1, 0, 0}, 262	},
	{	"L玦 Ph遪g ho祅", {6, 0, 8, -1, 0, 0}, 263	},
	{	"H醓 Ph遪g ho祅", {6, 0, 9, -1, 0, 0}, 264	},
	{	"чc Ph遪g ho祅", {6, 0, 10, -1, 0, 0}, 265	},
	{	"B竛h ch璶g H箃 d� ", {6, 0, 60, -1, 0, 0}, 401	},
	{	"B竛h ch璶g Th辴 heo", {6, 0, 61, -1, 0, 0}, 402	},
	{	"B竛h ch璶g Th辴 b� ", {6, 0, 62, -1, 0, 0}, 403	},
	{	"B竎h Qu� L� ", {6, 1, 73, -1, 0, 0}, 442	},
	{	"C竧 tng h錸g bao", {6, 1, 19, -1, 0, 0}, 442	},
	{	"Ho祅g Kim B秓 rng",	{6,	1,	69,	-1,	0,	0},	442},
	{	"T輓 S� M閏 y猽 b礽",	{6,	1,	885,	-1,	0	,0},	542},
	{	"T輓 S� уng y猽 b礽",	{6,	1,	886,	-1,	0	,0},	543},
	{	"T輓 S� Ng﹏ y猽 b礽",	{6,	1,	887,	-1,	0	,0},	544},
	{	"T輓 S� Kim y猽 b礽",	{6,	1,	888,	-1,	0	,0},	545},
	{	"Ng� T� T輓 S� y猽 b礽",	{6,	1,	889,	-1,	0	,0},	546},
	{	"Bao Dc ho祅 ",	{6,	1,	910,	-1,	0	,0},	635},
	{	"H閜 l� v藅 H錸g bao th莕 b�",	{6,	1,	1074,	-1,	0	,0},	635},
	{	"H閜 l� v藅 [qu� Huy Ho祅g]",	{6,	1,	1075,	-1,	0	,0},	635},
	{	"H譶h n閙",		{6,	1,	1389,	-1,	0,	0},	635	},
	--tinhpn 20100720: forbid item
	{	"C萴 nang thay i tr阨 t", {6, 1, 1781, -1, 0, 0},635},	
	{	"M閏 Ch� B秓 H筽", {6, 1, 2318, -1, 0, 0},635},	
	{	"уng Ch� B秓 H筽", {6, 1, 2319, -1, 0, 0},635},	
	{	"Ng﹏ Ch� B秓 H筽", {6, 1, 2320, -1, 0, 0},635},	
	{	"Ho祅g Kim B秓 rng", {6, 1, 2321, -1, 0, 0},635},	
	{	"B秓 rng B筩h Kim", {6, 1, 2322, -1, 0, 0},635},	
	{	"S竧 Th� B� B秓", {6, 1, 2347, -1, 0, 0},635},	
	{	"B秓 rng th莕 b� c馻 D� T萿", {6, 1, 2374, -1, 0, 0},635},	
	{	"Ch� T玭 B� B秓", {6, 1, 2375, -1, 0, 0},635},	
	{	"T礽 B秓 Th駓 T芻", {6, 1, 2376, -1, 0, 0},635},	
	{	"H錳 thi猲 t竔 t筼 l� bao", {6, 1, 2527, -1, 0, 0},635},
	{	"Phi t鑓 ho祅 l� bao", {6, 1, 2520, -1, 0, 0},635},
	{	"Чi l鵦 ho祅 l� bao", {6, 1, 2517, -1, 0, 0},635},
	--Updated by DinhHQ - 20110425
	{	"C玭g Th祅h Chi課 L� Bao", {6, 1, 2377, -1, 0, 0},635},
	{	"чc ph遪g ho祅 l� bao", {6, 1, 2524, -1, 0, 0},635},
	{	"Trng m謓h ho祅 l� bao", {6, 1, 2515, -1, 0, 0},635},
	{	"Gia t鑓 ho祅 l� bao", {6, 1, 2516, -1, 0, 0},635},
	{	"Cao thi觤 ho祅 l� bao", {6, 1, 2518, -1, 0, 0},635},
	{	"Cao trung ho祅 l� bao", {6, 1, 2519, -1, 0, 0},635},
	{	"Phi t鑓 ho祅 l� bao", {6, 1, 2520, -1, 0, 0},635},
	{	"B╪g ph遪g ho祅 l� bao", {6, 1, 2521, -1, 0, 0},635},
	{	"L玦 ph遪g ho祅 l� bao", {6, 1, 2522, -1, 0, 0},635},
	{	"H醓 ph遪g ho祅 l� bao", {6, 1, 2523, -1, 0, 0},635},
	{	"чc ph遪g ho祅 l� bao", {6, 1, 2524, -1, 0, 0},635},
	{	"L謓h b礽 vi s琻 o l� bao", {6, 1, 2525, -1, 0, 0},635},
	{	"Ho祅 H錸 Кn L� Bao", {6, 1, 2830, -1, 0, 0},635},
	{	"Ti猽 Di猽 T竛", {6, 1, 2831, -1, 0, 0},635},
	{	"Ho祅 H錸 Кn", {6, 1, 2837, -1, 0, 0},635},
}

WLLS_FORBID_STATES = {
	{"B蕋 ng Minh Vng ",	15},
	{"Nh� Lai Thi猲 Di謕 ",	273},
	{"T躰h T﹎ Quy誸",	33},
	{"Kim Chung Tr竜",	42},
	{"C鰑 Thi猲 Cu錸g L玦 ",	67},
	{"X輈h Di謒 Th鵦 Thi猲",	70},
	{"B╪g Lam Huy襫 Tinh",	64},
	{"Xuy猲 Y Ph� Gi竝 ",	356},
	{"V筺 чc Th鵦 T﹎",	73},
	{"Xuy猲 T﹎ чc Th輈h",	72},
	{"筺 C﹏ H� C鑤 ",	390},
	{"B╪g T﹎ Tr竔 秐h",	269},
	{"H� Th� H祅 B╪g ",	100},
	{"Tuy誸 秐h",	109},
	--此技能已改为被动技能，不再清除	{"打狗阵",	124},
	{"Ho箃 B蕋 L璾 Th� ",	277},
	{"T髖 謕 Cu錸g V� ",	130},
	{"H醓 Li猲 Ph莕 Hoa",	136},
	{"秓 秐h Phi H� ",	137},
	{"Thi猲 Ma Gi秈 Th� ",	150},
	{"T鋋 V鋘g V� Ng� ",	157},
	{"Thanh Phong ph� ",	171},
	{"Ki B竛 ph� ",	174},
	{"Nh蕋 Kh� Tam Thanh",	178},
	{"B綾 Minh Цo H秈",	393},
	{"Thi猲 Thanh мa Tr鋍",	173},
	{"Khi H祅 Ng筼 Tuy誸",	175},
	{"T髖 Ti猲 T� C鑤",	394},
	{"l謓h b礽 k� n╪g 1",	631},
	{"l謓h b礽 k� n╪g 2",	632},
	{"l謓h b礽 k� n╪g 3",	633},
	{"l謓h b礽 k� n╪g 4",	634},
	{"l謓h b礽 k� n╪g 5",	635},
	-- 国战宋金技能不能在联赛中使用=====>
	{"K� n╪g Ti猲 Phong",	958},
	{"K� n╪g Nguy猲 So竔",959},		
	{"K� n╪g Th鮝 Tng",	960},
	{"K� n╪g Ho祅g д",	961},
	{"K� n╪g Thi猲 T�",	962},
	-- 国战宋金技能不能在联赛中使用<=====
	--C藀 nh藅 th猰 tr筺g th竔 ﹎ dng ho箃 huy誸 n v� k輈h c玭g tr� l鵦 ho祅 - Modified By DinhHQ - 20110810
	{"K輈h C玭g Tr� L鵦 Ho祅",	1120},
	{"K輈h C玭g Tr� L鵦 Ho祅",261},		
	{"K輈h C玭g Tr� L鵦 Ho祅",	258},
	{"K輈h C玭g Tr� L鵦 Ho祅",	260},
	{" Dng Ho箃 Huy誸 Кn",	1121},
	{" Dng Ho箃 Huy誸 Кn",	256},
	{" Dng Ho箃 Huy誸 Кn",	259},
	{" Dng Ho箃 Huy誸 Кn",	257},
}

WLLS_LEVEL_DESC = {"V� l﹎ li猲 u", "V� l﹎ li猲 u"}
WLLS_AWARD_TITLE = {85, 81}	--新秀、高级称号奖励分别是 85 86 87 88 和 81 82 83 84


WLLS_AWARD_TITLE_EX = 
{
	[1] = {204,205,206,207},
	[2] = {200,201,202,203},
	[3] = {200,201,202,203},
	[4] = {204,205,206,207},
	[5] = {204,205,206,207},
	[6] = {200,201,202,203},
	[7] = {81, 82, 83,84},
}

--武林联赛冠军(加血跑)	200
--武林联赛亚军(加血跑)	201
--武林联赛季军(加血跑)	202
--武林联赛殿军(加血跑)	203
--武林联赛冠军（加血抗）	204
--武林联赛亚军2（加血抗）	205
--武林联赛季军2（加血抗）	206
--武林联赛殿军2（加血抗）	207




----各种模式载入----

--WLLS_TAB = {}
--WLLS_TABCOUNT = {count = 0}
--
--function wllstab_additem(item)
--	local index = WLLS_TABCOUNT.count + 1
--	WLLS_TABCOUNT.count = index
--	WLLS_TAB[index] = item
--end


--function wlls_add_data(nId)
--	WLLS_TAB[nId] = WLLS_DATA
--end


Include("\\script\\missions\\leaguematch\\macthtype\\double.lua")
-- wlls_add_data(1)

Include("\\script\\missions\\leaguematch\\macthtype\\faction.lua")
-- wlls_add_data(2)

Include("\\script\\missions\\leaguematch\\macthtype\\teacher.lua")
-- wlls_add_data(3)
Include("\\script\\missions\\leaguematch\\macthtype\\three.lua")
-- wlls_add_data(4)
Include("\\script\\missions\\leaguematch\\macthtype\\single.lua")
-- wlls_add_data(5)
Include("\\script\\missions\\leaguematch\\macthtype\\series.lua")
-- wlls_add_data(6)
Include("\\script\\missions\\leaguematch\\macthtype\\mixeddoubles.lua")
-- wlls_add_data(7)

----函数定义----

--返回当前角色应该属于的比赛类型，0为不能比赛
function wlls_player_type()
	local n_nexttype = GetGlbValue(GLB_WLLS_NEXT)
	return WLLS_TAB[n_nexttype].player_type()
end

--检查当前角色是否可以加入指定的战队
function wlls_check_addmem(n_capidx, n_lid, n_mtype)
	local n_nexttype = GetGlbValue(GLB_WLLS_NEXT)
	return WLLS_TAB[n_nexttype].check_addmem(n_capidx, n_lid, n_mtype)
end

--每场结束加经验
function wlls_award_pl_exp(n_rate, n_alevel)
	if (GetUUID() == 0) then	--下线的不给经验了
		wlls_award_log("B雐 v� ngi ch琲  tho竧 m筺g, kh玭g th� nh薾 ph莕 thng kinh nghi謒.")
		return
	end
	local n_level = GetLevel()
	if (n_level >= WLLS_LEVEL_SENIOR) then
		n_level = WLLS_LEVEL_SENIOR + n_alevel - 2
	elseif (n_level < 90) then
		n_level = 90
	end
	local n_exp = (700+floor((n_level*4-350)/5)*100)*60*0.6*n_rate
	wlls_add_exp(n_exp)
	local str = "Nh薾 頲 ph莕 thng thi u棗<color=yellow>"..n_exp.."<color>甶觤 kinh nghi謒"
	wlls_award_log(str)
	Msg2Player(str)
end

--根据参赛类型，确定比赛级别（1、新秀；2、联赛）
function wlls_get_level(n_mtype)
	local n_type = GetGlbValue(GLB_WLLS_TYPE)
	return WLLS_TAB[n_type].match_type[n_mtype].level
end

--如果为nil或0，返回1，否则返回0
function FALSE(value)
	if (value == 0 or value == nil) then
		return 1
	else
		return nil
	end
end

--返回当前角色应该属于的比赛级别，0为不能比赛
function wlls_player_level()
	local n_level = GetLevel()
	if (n_level >= WLLS_LEVEL_SENIOR) then
		return 2
	elseif (n_level >= WLLS_LEVEL_JUNIOR) then
		return 1
	else
		return 0
	end
end

--得到指定地图，n_whichmap：1、会场；2、准备场；3、比赛场
--n_mtype, n_groupid默认为与当前地图对应的
function wlls_get_mapid(n_whichmap, n_mtype, n_groupid)
	if (FALSE(n_mtype)) then
		n_mtype, n_groupid = wlls_get_mapinfo()
		if (FALSE(n_mtype)) then
			return nil
		end
	end
	local n_type = GetGlbValue(GLB_WLLS_TYPE)
	local tb = WLLS_TAB[n_type].match_type[n_mtype]
	if (not tb) then
		return nil
	end
	tb = tb.map[n_groupid]
	if (not tb) then
		return nil
	end
	return tb[n_whichmap]
end

--得到当前地图的相关信息，默认为全部信息
--1、比赛类型；2、场地组编号；3、场地类型
function wlls_get_mapinfo(n_idx)
	local n_mapid = SubWorldIdx2ID(SubWorld)
	local n_type = GetGlbValue(GLB_WLLS_TYPE)
	local tb = WLLS_TAB[n_type].map_index[n_mapid]
	if (not tb) then
		return nil
	end
	if (n_idx) then
		return tb[n_idx]
	else
		return unpack(tb)
	end
end

--得到当前城市地图的信息（返回值：1新秀/2武林，第几个(1/2/3)）
function wlls_getcityinfo()
	local n_mapid = SubWorldIdx2ID(SubWorld)
	local tb = WLLS_CITY_INDEX[n_mapid]
	if (not tb) then
		return nil
	end
	return unpack(tb)
end

--得到当前/指定地图的汉字描述
--n_style：1、级别名；2、级别名+类型名；3、级别名+类型名+场地名
function wlls_get_desc(n_style, n_mtype, n_group, n_type)
	if (not n_mtype) then
		n_mtype, n_group = wlls_get_mapinfo()
		if (not n_mtype) then
			return WLLS_LEVEL_DESC[wlls_getcityinfo()]
		end
	end
	if not n_type then
		n_type = GetGlbValue(GLB_WLLS_TYPE)
	end
	local tb = WLLS_TAB[n_type].match_type[n_mtype]
	if (n_style == 2) then
		return WLLS_LEVEL_DESC[tb.level] .. tb.name
	elseif (n_style == 3) then
		return WLLS_LEVEL_DESC[tb.level] .. tb.name .. tb.map[n_group][4]
	else
		return WLLS_LEVEL_DESC[tb.level]
	end
end

--检查str_plname是否是指定类型比赛的参赛选手，是则返回n_lid，否则返回nil
function wlls_check_player(str_plname, n_level, n_needtype)
	local n_lid = LG_GetLeagueObjByRole(WLLS_LGTYPE, str_plname)
	if (FALSE(n_lid)) then
		return nil
	end
	local n_stype = LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
	local n_type = GetGlbValue(GLB_WLLS_TYPE)
	if (n_stype ~= n_type) then
		return nil
	end
	local n_mtype = LG_GetLeagueTask(n_lid, WLLS_LGTASK_MTYPE)
	if (n_needtype) then
		if (n_needtype ~= n_mtype) then
			return nil
		else
			return n_lid
		end
	elseif (n_level == wlls_get_level(n_mtype)) then
		return n_lid, n_mtype
	else
		return nil
	end
end

--获得当前玩家所在的战队ID、参赛类型、担任职务、战队名字、战队人数
function wlls_lg_info(str_plname)
	if (not str_plname) then
		str_plname = GetName()
	end
	
	local n_lid = LG_GetLeagueObjByRole(WLLS_LGTYPE, str_plname)
	if (FALSE(n_lid)) then
		return nil
	end
	
	local n_mtype = LG_GetLeagueTask(n_lid, WLLS_LGTASK_MTYPE)
	local str_lgname, _, n_mcount = LG_GetLeagueInfo(n_lid)
	local n_job = LG_GetMemberTask(WLLS_LGTYPE, str_lgname, str_plname, WLLS_LGMTASK_JOB)
	return n_lid, n_mtype, n_job, str_lgname, n_mcount
end

--获得当前玩家所在的战队信息（面向对象风格）
function wlls_GetLGInfo(szPlayerName)
	if (not szPlayerName) then
		szPlayerName = GetName()
	end
	
	local tbLG	= {}
	
	tbLG.nLGID = LG_GetLeagueObjByRole(WLLS_LGTYPE, szPlayerName)
	if (FALSE(tbLG.nLGID)) then
		return nil
	end
	
	tbLG.szName, _, tbLG.nMemCount = LG_GetLeagueInfo(tbLG.nLGID)
	tbLG.nNameID= Number2Int(String2Id(tbLG.szName))
	tbLG.nMType	= LG_GetLeagueTask(tbLG.nLGID, WLLS_LGTASK_MTYPE)
	tbLG.nPoint	= LG_GetLeagueTask(tbLG.nLGID, WLLS_LGTASK_POINT)
	tbLG.nWin	= LG_GetLeagueTask(tbLG.nLGID, WLLS_LGTASK_WIN)
	tbLG.nTie	= LG_GetLeagueTask(tbLG.nLGID, WLLS_LGTASK_TIE)
	tbLG.nTotal	= LG_GetLeagueTask(tbLG.nLGID, WLLS_LGTASK_TOTAL)
	tbLG.tbEmys	= {}
	tbLG.tbEmys[LG_GetLeagueTask(tbLG.nLGID, WLLS_LGTASK_EMY1)]	= 1
	tbLG.tbEmys[LG_GetLeagueTask(tbLG.nLGID, WLLS_LGTASK_EMY2)]	= 2
	tbLG.tbEmys[LG_GetLeagueTask(tbLG.nLGID, WLLS_LGTASK_EMY3)]	= 3
	return tbLG
end

--取得指定Map上的MissionV
function wlls_getmapmissionv(n_mapid, n_valueid)
	local OldSubWorld = SubWorld
	SubWorld = SubWorldID2Idx(n_mapid)
	local n_value = GetMissionV(n_valueid) 
	SubWorld = OldSubWorld
	return n_value
end

--设置指定Map上的MissionV
function wlls_setmapmissionv(n_mapid, n_valueid, n_value)
	local OldSubWorld = SubWorld
	SubWorld = SubWorldID2Idx(n_mapid)
	SetMissionV(n_valueid, n_value)
	SubWorld = OldSubWorld
end

--设置玩家状态
function wlls_set_pl_state()
	SetTaskTemp(200, 1)		--禁止更换阵营
	SetLogoutRV(1);		--断线与死亡为一个重生点
	SetPunish(0);		--无死亡惩罚
	DisabledStall(1)	--禁止摆摊
	ForbitTrade(1);		--禁止交易
	DisabledUseTownP(1)	--限制其在准备席和比赛用地内使用回城符
	SetFightState(0);	--置为非战斗状态
	ForbitStamina(1)	--禁止回体
end

--恢复玩家状态
function wlls_clear_pl_state()
	SetCurCamp(GetCamp());	--临时阵营与真实阵营一致
	DisabledStall(0);	--允许摆摊
	SetTaskTemp(200, 0);	--允许更换帮派阵营
	SetPunish(1);	--有死亡惩罚
	ForbitTrade(0);		--允许交易
	SetDeathScript("");--设置死亡脚本为空
	RestoreOwnFeature();
	SetFightState(0);	--置为非战斗状态
	DisabledUseTownP(0)
	ForbitStamina(0)	--允许回体
end

--返回Mission中所有不为空的阵营
function wlls_get_ms_troop()
	local tb_troop = {}
	local n_msid = GetMissionV(WLLS_MSV_MSID);
	
	for i = 1, WLLS_MAX_COUNT do
		if (GetMSPlayerCount(n_msid, i) > 0) then
			tb_troop[getn(tb_troop)+1] = i
		end
	end
	return tb_troop
end

--得到阵营中所有成员
function wlls_get_ms_plidx(n_camp)
	local tb_idx = {}
	local n_msid = GetMissionV(WLLS_MSV_MSID)
	local n_idx = 0
	local n_pidx
	repeat
		n_idx, n_pidx = GetNextPlayer(n_msid, n_idx, n_camp)
		if (n_pidx > 0 ) then
			tb_idx[getn(tb_idx)+1] = n_pidx
		end
	until (n_idx == 0)
	return tb_idx
end

--由Mission Camp编号，得到战队ID、名称
function wlls_camp2league(n_camp)
	_M("wlls_camp2league", n_camp)
	local n_msid = GetMissionV(WLLS_MSV_MSID);
	local _, n_pidx = GetNextPlayer(n_msid, 0, n_camp);
	if (n_pidx <= 0) then
		wlls_error_log("wlls_camp2league", "n_pidx <= 0", n_pidx, n_camp)
		return 0, ""
	end
	
	local n_oldidx = PlayerIndex
	PlayerIndex = n_pidx
	local str_plname = GetName()
	PlayerIndex = n_oldidx
	
	local n_lid = LG_GetLeagueObjByRole(WLLS_LGTYPE, str_plname)
	if (FALSE(n_lid)) then
		wlls_error_log("wlls_camp2league", "FALSE(n_lid)", str_plname)
		return 0, ""
	end

	return n_lid, LG_GetLeagueInfo(n_lid)
end

--得到一个阵营中所有玩家的有效伤害总数
function wlls_get_ms_damage(n_camp)
	_M("wlls_get_ms_damage", n_camp)
	
	local n_damage	= 0
	
	-- 每个在场人员伤害数累加
	local n_oldidx	= PlayerIndex
	local tb_pidx	= wlls_get_ms_plidx(n_camp);
	for i = 1, getn(tb_pidx) do
	 	PlayerIndex = tb_pidx[i];
	 	n_damage	= n_damage + ST_GetDamageCounter();
	end
	PlayerIndex	= n_oldidx
	
	return n_damage
end

--将指定阵营中的全部玩家移至会场
function wlls_remove_camp(n_camp)
	_M("wlls_remove_camp", n_camp)
	local tb_idx = wlls_get_ms_plidx(n_camp)
	local n_signmap = wlls_get_mapid(1)
	local n_oldidx = PlayerIndex
	for i = 1, getn(tb_idx) do
		PlayerIndex = tb_idx[i]
		SetLogoutRV(0);		--死亡重生与断线重生点不在同一地点
		NewWorld(n_signmap, WLLS_MAPPOS_SIGN[1], WLLS_MAPPOS_SIGN[2])
	end
	PlayerIndex = n_oldidx
end




--个人参赛记录
function wlls_award_pl(nLevel, nWin, nTie, nTotal)
	_M("wlls_award_pl", nLevel, nWin, nTie, nTotal)
	--参赛计数
	if (nWin > 0) then	SetTask(WLLS_TASKID_WIN, GetTask(WLLS_TASKID_WIN) + nWin) end
	if (nTie > 0) then	SetTask(WLLS_TASKID_TIE, GetTask(WLLS_TASKID_TIE) + nTie) end
	if (nWin > 0 or nTie > 0) then
		local nPoint	= wlls_GetAddPoint(nLevel, nWin, nTie)
		SetTask(WLLS_TASKID_POINT, GetTask(WLLS_TASKID_POINT) + nPoint)
		SetTask(WLLS_TASKID_HONOUR, GetTask(WLLS_TASKID_HONOUR) + nPoint)
		Msg2Player(format("Ch骳 m鮪g b筺  nh薾 頲 ph莕 thng --- 觤 vinh d� l� %d 甶觤", nPoint))
		wlls_award_log(format("Ch骳 m鮪g b筺  nh薾 頲 ph莕 thng li猲 u - 觤 vinh d� l� %d 甶觤. T鎛g c閚g c� %d 甶觤", nPoint, GetTask(WLLS_TASKID_HONOUR)))
	end
	SetTask(WLLS_TASKID_TOTAL, GetTask(WLLS_TASKID_TOTAL) + nTotal)
end

--记录战绩，影响排名
function wlls_record_one_match_result(n_level, str_lgname, n_result, n_usedtime)
	local n_lid = LG_GetLeagueObj(WLLS_LGTYPE, str_lgname)
	if (FALSE(n_lid)) then
		wlls_error_log("wlls_award_lg: FALSE(n_lid)")
		return
	end
	local nWin, nTie	= 0, 0
	if (n_result == 1) then	--胜
		nWin = 1
		LG_ApplyAppendLeagueTask(WLLS_LGTYPE, str_lgname, WLLS_LGTASK_WIN, 1)
	elseif (n_result == 0) then	--平
		nTie = 1
		LG_ApplyAppendLeagueTask(WLLS_LGTYPE, str_lgname, WLLS_LGTASK_TIE, 1)
	end
	local n_point	= wlls_GetAddPoint(n_level, nWin, nTie)
	LG_ApplyAppendLeagueTask(WLLS_LGTYPE, str_lgname, WLLS_LGTASK_POINT, n_point)
	LG_ApplyAppendLeagueTask(WLLS_LGTYPE, str_lgname, WLLS_LGTASK_TIME, n_usedtime)
	_M("Th阨 gian thi u t鎛g c閚g: "..(n_usedtime/18).." gi﹜")
	
	local _, _, n_memcount = LG_GetLeagueInfo(n_lid)
	local n_oldidx = PlayerIndex
	for i = 0, n_memcount-1 do
		local str_plname = LG_GetMemberInfo(n_lid, i)
		local n_plidx = SearchPlayer(str_plname)
		if (n_plidx > 0) then
			PlayerIndex = n_plidx
			--start
			if (n_result == 1) then	--胜
				
				SetTask(WLLS_TASKID_LGWIN, GetTask(WLLS_TASKID_LGWIN) + 1)
				if n_level == 2 then --武林联赛取得胜利加活跃度
					DynamicExecuteByPlayer(n_plidx, "\\script\\huoyuedu\\huoyuedu.lua", "tbHuoYueDu:AddHuoYueDu", "wulinliansai")
				end
			elseif (n_result == 0) then	--平
				
				SetTask(WLLS_TASKID_LGTIE, GetTask(WLLS_TASKID_LGTIE) + 1)
			else	--负
				
			end
			wlls_award_pl(n_level, nWin, nTie, 1)
			SetTask(WLLS_TASKID_LGPOINT, GetTask(WLLS_TASKID_LGPOINT) + n_point)
			SetTask(WLLS_TASKID_LGTOTAL, GetTask(WLLS_TASKID_LGTOTAL) + 1)
			SetTask(WLLS_TASKID_LGTIME, GetTask(WLLS_TASKID_LGTIME) + n_usedtime)
			SyncTaskValueMore(WLLS_TASKID_WIN, WLLS_TASKID_LGTIME)
			SyncTaskValueMore(WLLS_TASKID_POINT, WLLS_TASKID_HONOUR)
		else	--人不在，补加参赛记录
			if (n_result == 1) then	--胜
				LG_ApplyAppendMemberTask(WLLS_LGTYPE, str_lgname, str_plname, WLLS_LGMTASK_WIN, 1, "", "")
			elseif (n_result == 0) then	--平
				LG_ApplyAppendMemberTask(WLLS_LGTYPE, str_lgname, str_plname, WLLS_LGMTASK_TIE, 1, "", "")
			end
			LG_ApplyAppendMemberTask(WLLS_LGTYPE, str_lgname, str_plname, WLLS_LGMTASK_TOTAL, 1, "", "")
		end
	end
	PlayerIndex = n_oldidx
end


function wlls_AddMatchCount(str_lgname, nCount)
	local n_lid = LG_GetLeagueObj(WLLS_LGTYPE, str_lgname)
	if (FALSE(n_lid)) then
		wlls_error_log("wlls_award_lg: FALSE(n_lid)")
		return
	end
	if LG_GetLeagueTask(n_lid, WLLS_LGTASK_TOTAL) >= 48 then --大于48场的话，增加扩展次数，否则增加一次参加次数
		
		
		LG_ApplyAppendLeagueTask(WLLS_LGTYPE, str_lgname, WLLS_LGTASK_TOTAL_EX, nCount)
	else
		LG_ApplyAppendLeagueTask(WLLS_LGTYPE, str_lgname, WLLS_LGTASK_TOTAL, nCount)	
	end
end


function wlls_award_pl_Respect(nRespect)
	
	AddRespect(nRespect)
	Msg2Player(format("Uy danh t╪g %d", nRespect))
	wlls_award_log(format("Nh薾 頲 ph莕 thng 1 tr薾 li猲 u棗uy danh %d 甶觤, t鎛g c閚g c� %d 甶觤 uy danh", nRespect, GetRespect()))
end

--战队参赛记录
function wlls_award_lg(n_level, str_lgname, n_result, n_usedtime)
	
	
	
	_M("wlls_award_lg", n_level, str_lgname, n_result, n_usedtime)
	local n_lid = LG_GetLeagueObj(WLLS_LGTYPE, str_lgname)
	if (FALSE(n_lid)) then
		wlls_error_log("wlls_award_lg: FALSE(n_lid)")
		return
	end
	
	local n_total = LG_GetLeagueTask(n_lid, WLLS_LGTASK_TOTAL) + 1
	local nTotalEx = LG_GetLeagueTask(n_lid, WLLS_LGTASK_TOTAL_EX) + 1
	local nMaxCountEx = LG_GetLeagueTask(n_lid, WLLS_LGTASK_USE_LingQi_COUNT) * WLLS_LingQi_PerCOUNT
	
	wlls_AddMatchCount(str_lgname, 1)--必须注意调用时机，否则可能出现问题
	
	if n_total <= 48 then
		wlls_record_one_match_result(n_level, str_lgname, n_result, n_usedtime)
	end
	
	local _, _, n_memcount = LG_GetLeagueInfo(n_lid)
	local n_oldidx = PlayerIndex
	for i = 0, n_memcount-1 do
		local str_plname = LG_GetMemberInfo(n_lid, i)
		local n_plidx = SearchPlayer(str_plname)
		if (n_plidx > 0) then
			PlayerIndex = n_plidx
			
			G_ACTIVITY:OnMessage("LeagueResult", n_level, n_result);
			
			tongaward_league()--帮会周目标，武林联赛\script\tong\tong_award_head.lua
			--start
			if (n_result == 1) then	--胜
				wlls_award_pl_exp(20 * 4, n_level)
				wlls_award_pl_Respect(3)
				
				
			elseif (n_result == 0) then	--平
				wlls_award_pl_exp(10 * 4, n_level)
				wlls_award_pl_Respect(2)
			else	--负
				wlls_award_pl_exp(8 * 4, n_level)
				wlls_award_pl_Respect(1)
			end
			--end
			
			SetTask(WLLS_TASKID_ORGCAMP, 0)
			ST_StopDamageCounter()	-- 停止伤害计算
			if (n_total > 48 ) then
				local szMsg = format("Х tham gia %d tr薾 li猲 u m� r閚g v� c遪 %d tr薾 m� r閚g", nTotalEx, nMaxCountEx - nTotalEx)
				Msg2Player(szMsg)
			end
		end
	end
	PlayerIndex = n_oldidx
end

--得出最终比赛结果
function wlls_matchresult(str_league1, str_league2, result, n_usedtime)
	_M("wlls_matchresult", str_league1, str_league2, result, n_usedtime)
	local n_mtype = wlls_get_mapinfo(1)
	local n_level = wlls_get_level(n_mtype)
	local str = wlls_get_desc(2, n_mtype)
	if (not str_league2) then
		--轮空的（注意：这时人在准备场）
		str_league2 = ""
		result = 1
		str = str.." i ["..str_league1.."] gi祅h th緉g l頸"
		wlls_award_lg(n_level, str_league1, 1, n_usedtime)
	else
		if (result == 1) then	--胜
			str = str.." i ["..str_league1.."]chi課 th緉g ["..str_league2.."]!"
			wlls_award_lg(n_level, str_league1, 1, n_usedtime)
			wlls_award_lg(n_level, str_league2, 2, n_usedtime)
		else		--平
			str = str.." i ["..str_league1.."]c飊g i ["..str_league2.."] h遖 nhau!"
			wlls_award_lg(n_level, str_league1, 0, n_usedtime)
			wlls_award_lg(n_level, str_league2, 0, n_usedtime)
		end
	end
	Msg2SubWorld("<color=cyan>"..str)
	--Msg2MSAll(WLLS_MSID_COMBAT, "<color=cyan>"..str)
	local n_mid = GetGlbValue(GLB_WLLS_MATCHID)
	local szResult = n_mtype.." "..n_mid.." "..str_league1.." "..str_league2.." "..result 
	LG_ApplyDoScript(0, "", "", "\\script\\leaguematch\\log.lua", "OnReceiveMatchResult", szResult , "", "")
	WriteLog(n_mid.."\t"..szResult)
end

--检查玩家是否在Mission内，是则返回mscamp
function wlls_in_mission(n_msid, str_plname)
	local n_plidx = SearchPlayer(str_plname)
	if (n_plidx > 0) then
		local n_plmsidx = PIdx2MSDIdx(n_msid, n_plidx)
		if (n_plmsidx > 0) then
			return GetMSIdxGroup(n_msid, n_plmsidx)
		end
	end
end

--查找是否有队友在指定Mission内，是则返回mscamp, lgname
function wlls_findfriend(n_msid, str_plname)
	local n_lid = LG_GetLeagueObjByRole(WLLS_LGTYPE, str_plname)
	if (n_lid == 0) then
		--wlls_error_log("wlls_findfriend", "n_lid == 0")
		return
	end
	
	local str_lgname, _, n_memcount = LG_GetLeagueInfo(n_lid)
	for i = 0, n_memcount-1 do
		local str_friendname = LG_GetMemberInfo(n_lid, i)
		local n_mscamp = wlls_in_mission(n_msid, str_friendname)
		if (n_mscamp) then
			return n_mscamp, str_lgname
		end
	end
	return nil, str_lgname
end

function OnCancel()
end

--入场检查
function wlls_en_check()
	local forbiditem_con = 0
	local forbiditem_key = 0
	local keyitem = {}
	local keyitem_g = {}
	local keyitem_d = {}
	local keyitem_p = {}
	for i = 1, 3 do
		keyitem[i] = ITEM_GetImmediaItemIndex (i)
		if (keyitem[i] ~= 0) then
			keyitem_g[i], keyitem_d[i], keyitem_p[i] = GetItemProp(keyitem[i])
		else
			keyitem_g[i] = 0
			keyitem_d[i] = 0
			keyitem_p[i] = 0
		end
	end
	for i = 1, getn(WLLS_FORBID_ITEM) do
		forbiditem_con = CalcEquiproomItemCount( WLLS_FORBID_ITEM[i][2][1], WLLS_FORBID_ITEM[i][2][2], WLLS_FORBID_ITEM[i][2][3], WLLS_FORBID_ITEM[i][2][4] )
		if (forbiditem_con > 0) then
			break
		end
		forbiditem_con = CalcItemCount( 1, WLLS_FORBID_ITEM[i][2][1], WLLS_FORBID_ITEM[i][2][2], WLLS_FORBID_ITEM[i][2][3], WLLS_FORBID_ITEM[i][2][4] )
		if (forbiditem_con > 0) then
			break
		end
		for j = 1, 3 do 
			if (keyitem_g[j] == WLLS_FORBID_ITEM[i][2][1] and keyitem_d[j] == WLLS_FORBID_ITEM[i][2][2] and keyitem_p[j] == WLLS_FORBID_ITEM[i][2][3]) then
				forbiditem_key = 1
				break
			end
		end
	end
	if(forbiditem_con > 0 or forbiditem_key > 0) then
		Say("Ngi th藅 to gan! D竚 kh玭g tu﹏ l謓h c馻 V� L﹎ Minh Ch�, t� � 甧m dc ph萴 c蕀 v祇, mau r阨 kh醝 y!", 0)
		return nil
	end
	
--	if (keyitem[1] == 0 and keyitem[2] == 0 and keyitem[3] == 0) then
--		Say("会场官员：你的快捷栏目前没有摆放任何药品，你还是把药品放入快捷栏吧！<color=red>进场后将禁止移动任何物品，请确认你的快捷栏物品已经摆放完毕！<color>", 0)
--		return nil
--	end
	
	return 1
end

--同步战队信息到个人
function wlls_sync_lginfo(n_lid)
	_M("wlls_sync_lginfo("..n_lid..")")
	if (n_lid ~= 0) then
		local n_mtype = LG_GetLeagueTask(n_lid, WLLS_LGTASK_MTYPE)
		local n_type = LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
		SetTask(WLLS_TASKID_LGTYPE, WLLS_TAB[n_type].match_type[n_mtype].level)
		SetTask(WLLS_TASKID_LGRANK, LG_GetLeagueTask(n_lid, WLLS_LGTASK_RANK))
		SetTask(WLLS_TASKID_LGPOINT, LG_GetLeagueTask(n_lid, WLLS_LGTASK_POINT))
		SetTask(WLLS_TASKID_LGWIN, LG_GetLeagueTask(n_lid, WLLS_LGTASK_WIN))
		SetTask(WLLS_TASKID_LGTIE, LG_GetLeagueTask(n_lid, WLLS_LGTASK_TIE))
		SetTask(WLLS_TASKID_LGTOTAL, LG_GetLeagueTask(n_lid, WLLS_LGTASK_TOTAL))
		SetTask(WLLS_TASKID_LGTIME, LG_GetLeagueTask(n_lid, WLLS_LGTASK_TIME))
		SyncTaskValueMore(WLLS_TASKID_WIN, WLLS_TASKID_LGTIME)
	else
		SetTask(WLLS_TASKID_LGTYPE, 0)
		SyncTaskValue(WLLS_TASKID_LGTYPE)
		SyncTaskValueMore(WLLS_TASKID_WIN, WLLS_TASKID_TOTAL, 1)
	end
	SyncTaskValue(WLLS_TASKID_POINT)
	-- WLLS_TASKID_HONOUR 已自动同步
end

--可升级的加经验
function wlls_add_exp(n_exp)
	local n_switch	= GetTask(WLLS_TASKID_SWITCH)
	local b_expswt	= GetBit(n_switch, 1)
	local b_expsub	= GetBit(n_switch, 2)
	if (b_expswt ~= 0) then
		Msg2Player("B筺  thi誸 l藀 ng ph莕 thng kinh nghi謒 li猲 u, ph莕 thng kinh nghi謒 c馻 b筺  b� h駓 b�. N誹 c莕 c� th� n g苝 Quan vi猲 li猲 u thay i l筰 thi誸 l藀 n祔.")
		return
	end
	if (b_expsub ~= 0) then
		n_exp	= n_exp - GetTaskTemp(WLLS_TEMPTASK)
		Msg2Player("B筺 ch� nh薾 頲 trong s� "..n_exp.."甶觤 kinh nghi謒")
	end
	tl_addPlayerExp(n_exp)
end

--写入奖励日志
function wlls_award_log(str)
	_M(str)
	WriteLog("[WLLS_AWARD]"..date("%y-%m-%d,%H:%M:%S").."\t"..GetAccount().."\t"..GetName().."\t"..str)
end

--检查是否可以参加本赛季比赛，不能参加返回说明文字，可以参加则返回nil
function wlls_levelcheck()
	local str_myname = GetName()
	local n_lid = LG_GetLeagueObjByRole(WLLS_LGTYPE, str_myname)
	if (FALSE(n_lid)) then
		return nil
	end
	local str_lgname, _, n_memcount = LG_GetLeagueInfo(n_lid)
	local n_sid = GetGlbValue(GLB_WLLS_SID)
	if (GetGlbValue(GLB_WLLS_PHASE) == 1) then	--间歇期算下一个赛季
		n_sid = n_sid + 1
	end
	local tb = {}
	for i = 0, n_memcount-1 do
		local str_plname = LG_GetMemberInfo(n_lid, i)
		local n_over = LG_GetMemberTask(WLLS_LGTYPE, str_lgname, str_plname, WLLS_LGMTASK_OVER)
		if (n_over > 0 and n_sid > n_over) then	--已经越级，且是在以前赛季越级的
			if (str_plname == str_myname) then
				return "Xin l鏸, t� c竎h tham gia c馻 b筺  b� h駓 b�. Nguy猲 nh﹏ c� th� trong l莕 thi u c馻 b筺 k� trc qu� <color=red>ng c蕄 h筺 ch�<color>, i thi u ho芻 <color=red>i trng (s� ph�) c馻 b筺  r阨 kh醝 i thi u<color>. M阨 b筺 r阨 kh醝 i thi u hi謓 t筰, n誹 kh玭g i b筺 s� kh玭g 頲 tham gia thi u."
			end
			tb[getn(tb)+1] = str_plname
		end
	end
	if (getn(tb) == 0) then
		return nil
	end
	return "Xin l鏸! m閠 s� th祅h vi猲 trong i  qu� ng c蕄 h筺 ch� trong thi u k� trc: <color=red>"..join(tb, "  ").."<color><enter>Nh鉳 c馻 b筺 kh玭g th� tham gia m颽 thi u n祔. N誹 mu鑞 b筺 c� th� r阨 nh鉳."
end

--得到当前服务器上所有指定类型的地图（格式：[SubWorld] = GroupIdx）
function wlls_get_subworld(nMapType)
	local tbSub = {}
	local nSType = GetGlbValue(GLB_WLLS_TYPE)
	local tb = WLLS_TAB[nSType].match_type
	for nMType = 1, getn(tb) do
		local tbMaps = tb[nMType].map
		local nGroups	= getn(tbMaps)
		for nGroupIdx = 1, nGroups do
			local nSubIdx = SubWorldID2Idx(tbMaps[nGroupIdx][nMapType])
			if (nSubIdx >= 0) then
				tbSub[nSubIdx] = (nMType-1)*nGroups + nGroupIdx
			end
		end
	end
	return tbSub
end

--送到进入联赛之前的地方
function wlls_transback()
	SetLogoutRV(0);
	NewWorld(GetTask(WLLS_TASKID_FROMMAP), GetTask(WLLS_TASKID_FROM_X), GetTask(WLLS_TASKID_FROM_Y))
end

--根据 参赛级别、胜平场数，计算应得积分
function wlls_GetAddPoint(nLevel, nWin, nTie)
	return nWin * 5 * nLevel + nTie * 2 * nLevel
end

--判断当前联赛是否开启
function wlls_CheckIsOpen(nLevel)
	local nClose = GetGlbValue(GLB_WLLS_CLOSE)
	if (nClose) then
		if (GetBit(nClose, nLevel) ~= 0) then
			Say(wlls_npcname().."Xin l鏸! M竬 ch� "..WLLS_LEVEL_DESC[nLevel].."hi謓 產ng t筸 d鮪g!", 0)
			return nil
		end
	end
	return 1
end

--错误日志
function wlls_error_log(...)
	local str = "WLLS_ERROR["..tostring(GetName()).."]("..tostring(SubWorldIdx2ID(SubWorld))..")"..date("%y-%m-%d,%H:%M:%S")..": "..join(arg)
	WriteLog(str)
	_ERRORMESSAGE(str)
	--error(str)
end

--调试用输出
function _M(...)
	--local str = join(arg)
	--Msg2Player("DEBUG:<color=white>"..str)
	--str = "DEBUG["..tostring(GetName()).."]("..tostring(SubWorldIdx2ID(SubWorld))..")"..date("%y-%m-%d,%H:%M:%S")..": "..str
	--print(str)
	--WriteLog(str)
end
