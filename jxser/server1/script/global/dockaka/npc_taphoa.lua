--������ ������ �ӻ����ϰ�Ի�������40������
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
	tbDailog.szTitleMsg = "<npc>Tr��c ��y ta l� �� t� th�m v�n tam"
	if (GetTask(3) == 40*256+50) and (GetTask(14) == 5) and (HaveItem(148) == 0) then 		--������40������
		tbDailog:AddOptEntry("C� b�n h�t sen kh�ng?", lotus)
	end
	tbDailog:AddOptEntry("Giao d�ch", yes)

	tbDailog:AddOptEntry("Kh�ng giao d�ch", no)
	tbDailog:Show()
end



function yes()
Sale(151);  			
end;

function no()
end;
