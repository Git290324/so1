--中原北区 汴京府 路人18陈三宝对话

-- 修改后与邪教主线相关的汴京陈三宝脚本
-- Edited by peres
-- 2005/01/18

Include("\\script\\task\\newtask\\newtask_head.lua");
Include("\\script\\task\\newtask\\lib_setmembertask.lua");
Include("\\script\\task\\newtask\\master\\xiepai\\maintask.lua");

function main(sel)

-- 新任务系统与邪教主线相关的脚本 --

local myTaskValue = GetTask(1003)
local myCamp = nt_getCamp()

	if (myTaskValue==310) then
		task_level50_05();
		return
	elseif (myTaskValue==329) then
		task_level50_06();
		return
	elseif (myTaskValue==330) then -- 玩家拿到了蓝花瓷瓶后回来与陈三宝的对话
		Say("N誹 nh� ngi c� th� t譵 gi髉 ta b譶h hoa  th� xem nh� ngi l� ﹏ nh﹏ c馻 c� gia t閏 ta!",0);
		return
	elseif (myTaskValue==340) then
		task_level50_10();
		return
	end

	
-- 新任务系统与邪教主线相关的脚本 --

Say("To祅 l� h祅g s祅h s� h秓 h筺g y! Kim c� u c�! Kh竎h quan! Chj鋘 1 c竔 甶!",0)

end;

