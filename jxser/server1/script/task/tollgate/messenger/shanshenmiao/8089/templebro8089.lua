-------------------------------------------------------------------------
-- FileName		:	templebro8089.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-18 15:09:14
-- Desc			:   山神庙关卡的刀妖兄弟死亡脚本[80-89级]
-------------------------------------------------------------------------
IncludeLib( "FILESYS" );
Include("\\script\\task\\tollgate\\messenger\\shanshenmiao\\enemy_temrefresh.lua") 
Include("\\script\\task\\newtask\\newtask_head.lua") --调用 nt_getTask 同步变量到客户端的类
Include("\\script\\task\\tollgate\\messenger\\messenger_losetask.lua")  --取消任务
Include("\\script\\task\\tollgate\\messenger\\messenger_timeer.lua")    --调用计时器
TabFile_Load( "\\settings\\task\\tollgate\\messenger\\messenger_tollprize.txt" , "tollprize");	 --获得同伴修练的表格

TEMREFRESH_EXP = tonumber( TabFile_GetCell( "tollprize" ,6 ,"shuachu_exp"))  --小怪经验
TEMREFRESH_MAPID= 391  --山神庙的地图id
TEMREFRESH_MESSENGEREXP= tonumber( TabFile_GetCell( "tollprize" ,6 ,"shuachu_jifen"))  --小怪经验


function OnDeath()
	local name = GetName()
	local Uworld1215 = nt_getTask(1215)  --boss身边刷怪的打怪开关
	if (  messenger_middletime() == 10 ) then --玩家在地图中的时间
		Msg2Player("Xin l鏸! "..name.."! B筺  h誸 th阨 gian th鵦 hi謓 nhi謒 v� T輓 s�! Nhi謒 v� th蕋 b筰!.")
		losemessengertask()
	--elseif ( Uworld1215 == 0 ) then  --没有刷怪的任务
		--Msg2Player("这个家伙已经被别人包了，你打他是不会有任何奖励得。")
		--return
	else
		temple_killrefresh()
	end
end