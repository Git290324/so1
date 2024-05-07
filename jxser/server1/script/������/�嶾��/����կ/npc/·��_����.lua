-- 五毒 路人NPC 青蜈寨寨主汤弼 50级任务
-- by：Dan_Deng(2003-08-05)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_wu = GetTask(10)
	if (GetSeries() == 1) and (GetFaction() == "wudu") then
		if ((UTask_wu == 50*256+20) and (HaveItem(88) == 1)) then		-- 任务进行中
			L40_prise()
		elseif ((UTask_wu == 50*256) and (GetLevel() >= 50)) then		--50级任务
			Talk(1,"L50_get","B� t竛h 100 d苖 trong v飊g n祔 u ph秈 n閜 ph�  頲 Ng� чc gi竜 c馻 ch髇g ta b秓 h�. Nh璶g m� g莕 y c� m閠 t猲 g鋓 l� L璾 Kh蕌,  t藀 h頿   � Ng鋍 Hoa ng tr猲 n骾 V� Di. H緉 l筰 d竚 leo l猲 l璶g c鋚, tung ho祅h kh玭g coi b鎛 gi竜 ra g�. M韎 y ch髇g  cp 甶 Ng鋍 San H� c馻 b鎛 gi竜. Chuy謓 n祔 khi課 cho ta th藅 l� m蕋 m苩. Kh玭g th� b� qua cho ch髇g!")
		else							-- 常规对话
			Talk(1,"","Ch� c莕 luy謓 th祅h v� c玭g, th� kim ng﹏ m� n� s� t� 飊 飊 m� n ")
		end
	else
		Talk(1,"","Nh綾 n con g竔,ta l筰 nh� n c竎 c� nng c馻 Th髖 Y猲 m玭. ! Th藅 l� p! Kh玭g ng� con g竔 c馻 c� ta l筰 p n nh� v藋. M韎 ngh� n th� l鯽 trong ngi ta l筰 b鑓 l猲 r錳! Kh�!Kh�! ")
	end
end;

function L50_get()
	Say("Ngi h穣 甶 d箉 cho b鋘 L璾 Kh蕌 kia m閠 b礽 h鋍, cho ch髇g th蕐 頲 s� l頸 h筰 c馻 b鎛 m玭",2,"Tu﹏ l謓h!/L50_get_yes","уng ng b鋘 ch髇g qu� ng, thu閏 h� e l�. /L50_get_no")
end;

function L50_get_yes()
	SetTask(10,50*256+10)
	AddNote("дn Ng鋍 Hoa ng tr猲 V� Di s琻 s琻 nh L璾 Kh蕌  l蕐 l筰 Ng鋍 San H�. ")
	Msg2Player("дn Ng鋍 Hoa ng tr猲 V� Di s琻 s琻 nh L璾 Kh蕌  l蕐 l筰 Ng鋍 San H�. ")
end;

function L50_get_no()
end;

function L40_prise()
	Talk(2,"","Ngic� th� n thng c m� m� 畂箃 l筰 頲 Ng鋍 San H�, qu� l� b秐 l躰h b蕋 ph祄. B鎛 tr筰 ch� xem nging l� m閠 k� t礽,phong cho ngil祄 Co чc T玭 Gi�. Sau n祔 ngic� th� thay ta m� 甶襲 h祅h m鋓 vi謈 trong tr筰","Tu﹏ l謓h!")
	SetTask(10,60*256)
	DelItem(88)
	SetRank(54)
--	AddMagic(72)
	add_wu(60)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	AddNote("Mang Ng鋍 San H� v� cho Thang B藅, 頲 th╪g l� Co чc T玭 Gi� ")
	Msg2Player("Ch骳 m鮪g B筺! Х 頲 th╪g l祄 Co чc T玭 Gi�. H鋍 頲 v� c玭g Xuy猲 T﹎ чc Th輈h ")
end;
