-- 西北北区 药王谷 战斗NPC ？？ （昆仑10级任务、成都采药任务、拳倾天下任务）
-- by：Dan_Deng(2003-07-30)
-- Update: Dan_Deng(2004-05-24)		拳倾天下任务

function OnDeath()
	UTask_kl = GetTask(9);
	Uworld132 = GetTask(132)
	if (UTask_kl == 10*256+10) or (Uworld132 == 10) then		--任务中
		if (HaveItem(112) == 0) then
			AddEventItem(112)
			Msg2Player("L蕐 頲 T� M鬰 T骳 ")
		elseif (HaveItem(113) == 0) then
			AddEventItem(113)
			Msg2Player("L蕐 頲 мa c萴 th秓 ")
		elseif (HaveItem(114) == 0) then
			AddEventItem(114)
			Msg2Player("L蕐 頲 Thi課 Th秓 ")
		elseif (HaveItem(115) == 0) then
			AddEventItem(115)
			Msg2Player("L蕐 頲 H� Nh� Th秓 ")
		elseif (random(0,99) < 50) then
			AddEventItem(116)			-- 得到另外四样后，如果没有灵芝就有50%机会出灵芝
			Msg2Player("L蕐 頲 Linh Chi ")
		end
	elseif (GetTask(75) == 10) and (GetTask(53) == 10) and (random(0,99) < 60) then		-- 拳倾天下任务，按机率得到
		AddEventItem(112)
		if (GetItemCount(112) >= 3) then
			Msg2Player("Х h竔 頲 3 a T� M鬰 T骳, c� th� quay v� ph鬰 m謓h ")
		else
			Msg2Player("H竔 頲 1 a T� M鬰 T骳 ")
		end
	end
end;
