-- 丐帮秘洞 战斗NPC03 出师任务（对应宝箱5）
-- by：Dan_Deng(2003-07-29)

function OnDeath()
	UTask_gb = GetTask(8);
	if (UTask_gb == 60*256+10) and (HaveItem(202) == 0) then			--带着任务并且没有钥匙
		AddEventItem(202)
		AddNote("T筰 t莕g th� n╩ c馻 m藅 ng, l蕐 頲 m閠 chi誧 ch譨 kh鉧 ")
		Msg2Player("T筰 t莕g th� n╩ c馻 m藅 ng, l蕐 頲 m閠 chi誧 ch譨 kh鉧 ")
	end
end;
