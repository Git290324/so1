-- 少林木人巷 战斗NPC ？？ （少林10级任务、拳倾天下任务）
-- by：Dan_Deng(2003-08-01)

function OnDeath()
	UTask_sl = GetTask(7);
	if (UTask_sl == 10*256+10) and (HaveItem(26) == 0) and (random(0,99) < 80) then
		AddEventItem(26) 
		Msg2Player("L蕐 琧 Kim Li猲 Hoa. ")
		AddNote("T譵 th蕐 Kim Li猲 Hoa. ")
	elseif (GetTask(75) == 10) and (GetTask(54) == 10) and (HaveItem(26) == 0) and (random(0,99) < 40) then		-- 拳倾天下任务，按机率得到
		AddEventItem(26)
		Msg2Player("L蕐 琧 Kim Li猲 Hoa, c� th� quay l筰 g苝 Th竔 i th骳. ")
	end
end;
