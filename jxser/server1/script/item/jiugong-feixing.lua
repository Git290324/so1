--Created by fangjieying 2003-5-17
--《飞镖术·九宫飞星》
--学会九宫飞星技能
--唐门，80级以上可用
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(342)
	if(party ~= "tangmen") then							-- 不是唐门
		Msg2Player("B筺 nghi猲 c鴘 Phi Ti猽 Thu藅-C鰑 Cung Phi Tinh 頲 n鯽 ng祔, nh璶g v蒼 ch璦 l躰h ng� 頲 g�. ")
		return 1
	elseif(GetLever < 80) then							-- 是唐门但未到80级
		Msg2Player("B筺 nghi猲 c鴘 Phi Ti猽 Thu藅-C鰑 Cung Phi Tinh 頲 n鯽 ng祔, l躰h ng� 頲 r蕋 輙. ")
		return 1
	elseif(skill ~= -1) then							-- 已学过该技能
		Msg2Player("B筺  nghi猲 c鴘 k� Phi Ti猽 Thu藅-C鰑 Cung Phi Tinh, nh璶g v蒼 ch璦 h鋍 頲 g�. ")
		return 1
	else
		AddMagic(342,1)
		Msg2Player("H鋍 頲 k� n╪g C鰑 Cung Phi Tinh. ")
		return 0
	end
end