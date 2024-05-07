--Á½ºþÇø °ÍÁêÏØ ÔÓ»õµêÀÏ°å¶Ô»°¡¡ÌìÍõ40¼¶ÈÎÎñ
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
	tbDailog.szTitleMsg = "<npc>Tr­íc ®©y ta lµ ®Ö tö thÈm v¹n tam"
	if (GetTask(3) == 40*256+50) and (GetTask(14) == 5) and (HaveItem(148) == 0) then 		--ÌìÍõ°ï40¼¶ÈÎÎñ
		tbDailog:AddOptEntry("Cã b¸n h¹t sen kh«ng?", lotus)
	end
	tbDailog:AddOptEntry("Giao dÞch", yes)

	tbDailog:AddOptEntry("Kh«ng giao dÞch", no)
	tbDailog:Show()
end



function yes()
Sale(151);  			
end;

function no()
end;
