--两湖区 巴陵县 杂货店老板对话　天王40级任务
-- Update: Dan_Deng(2003-08-16)
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\global\\global_zahuodian.lua");
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\npcfunlib.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
function main(sel)
	local nNpcIdx = GetLastDiagNpc()
	local dwNpcId = GetNpcId(nNpcIdx)
	local szNpcName = GetNpcName(nNpcIdx)
	local tbDailog = DailogClass:new(szNpcName)
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog)
	tbDailog.szTitleMsg = "<npc>Trc y ta l�  t� th萴 v筺 tam"
	if (GetTask(3) == 40*256+50) and (GetTask(14) == 5) and (HaveItem(148) == 0) then 		--天王帮40级任务
		tbDailog:AddOptEntry("C� b竛 h箃 sen kh玭g?", lotus)
	end
	tbDailog:AddOptEntry("Giao d辌h", yes)

	tbDailog:AddOptEntry("Kh玭g giao d辌h", no)
	tbDailog:Show()
end



function yes()
Sale(151);  			
end;

function no()
end;
