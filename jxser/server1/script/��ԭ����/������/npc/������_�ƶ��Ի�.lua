
-- 朱仙镇云儿脚本
-- Edited by peres
-- 2005/01/17

Include("\\script\\task\\newtask\\newtask_head.lua");
Include("\\script\\task\\newtask\\lib_setmembertask.lua");
Include("\\script\\task\\newtask\\master\\xiepai\\maintask.lua");

function main()

local myTaskValue = GetTask(1003)
local myCamp = nt_getCamp()


	if (myTaskValue == 10) then -- 邪教主线正式启动
		task_level20_00();
		return
	elseif (myTaskValue == 20) then
		Say("C遪 ch璦 chiu 甶? Th竔 C玭g c玭g � c筺h th祅h m玭 ho祅g cung � L﹎ An.",0);
		return
	elseif (myTaskValue == 50) then -- 与汴京的蔡公公对话结束，得到天香玉脂膏
		task_level30_01();
		return
	elseif (myTaskValue == 130) or (myTaskValue == 120) then -- 回到朱仙镇与云儿的对话
		task_level30_07();
		return
	end

	
	Say("Nh譶 nc ch秠 di c莡 khi課 ta c� th蕐 l遪g m譶h b﹏g khu﹏g! Gi� nh� hi謓 gi� l� th阨 b譶h th� hay bi誸 m蕐!",0);

end