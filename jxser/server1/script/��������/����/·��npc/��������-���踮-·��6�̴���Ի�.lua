--西北南区 凤翔府 路人6蔡大叔对话　（拳倾天下任务）
-- By: Dan_Deng(2004-05-24)

function main(sel)
	Uworld75 = GetTask(75)
	U75_sub3 = GetTask(54)
	if (Uworld75 == 10) and (U75_sub3 < 10) then		-- 任务中，接取子任务
		if (HaveItem(384) == 1) then
			SetTask(54,10)
			AddNote("дn h蝝 Thi誹 L﹎ M閏 Nh﹏ gi髉 Th竔 i th骳 t譵 hoa sen v祅g. ")
			Msg2Player("дn h蝝 Thi誹 L﹎ M閏 Nh﹏ gi髉 Th竔 i th骳 t譵 hoa sen v祅g. ")
			Talk(1,"","Ti誧 l� c� i ta nghi猲 c鴘 v� h鋍, v蒼 ch璦 c� con. Nghe n鉯 trong Thi誹 L﹎ M閏 Nh﹏ H筺g c� hoa sen v祅g, 頲 ph藅 t� ph� h�, c� th� gi髉 ngi ta c� con")
		else
		 	Talk(1,"","Ngay c� b鴆 th� c騨g kh玭g c�, ch� d鵤 v祇 l阨 n鉯 l祄 sao tin ngi?")
		end
	elseif (Uworld75 == 10) and (U75_sub3 == 10) then		-- 子任务完成判断
		if (HaveItem(26) == 1) then
			DelItem(26)
			SetTask(54,20)
			AddNote("T譵 ra hoa sen v祅g, nhi謒 v� ho祅 th祅h. ")
			Msg2Player("T譵 ra hoa sen v祅g, nhi謒 v� ho祅 th祅h. ")
			Talk(1,"","Ha ha! C� ph秈  l� ng鋍 b鑙 trong truy襫 thuy誸 kh玭g? H秓 ti觰 t�! C秏 琻 ngi! Vi謈 ngi h鋍 quy襫 ph竝, ta ho祅 to祅 t竛 th祅h.")
		else
			Talk(1,"","C遪 ch璦 t譵 頲 hoa sen v祅g � ")
		end
	else
		i = random(0,1)
		if (i == 0) then
			Talk(1,"","L穙 th竔 gia ch髇g ta m蕐 i n truy襫, kh玭g c� con trai, th藅 c� l鏸 v韎 li謙 t� li謙 t玭g!")
		else
			Talk(1,"","B蕋 hi誹 c� 3 甶襲, kh玭g c� ngi n鑙 d鈏 l� 甶襲 l韓 nh蕋!")
		end
	end
end;
