--两湖区 南岳镇 武当弟子对话

function main(sel)
Talk(3, "select", "Thi猲 h� v� h鋍, 'B綾 t玭 Thi誹 l﹎, nam s飊g V� ng'. Ch綾 ngi  t鮪g nghe qua?", "V� c玭g b鎛 ph竔 l蕐 t躰h ch� ng, l蕐 nhu kh綾 cng, l蕐 ng緉 th緉g d礽, l蕐 ch薽 nh nhanh, l蕐 � v薾 kh�, l蕐 kh� v薾 th﹏, nh sau t韎 trc. Khi猰 t鑞 甶襪 m, l蕐 v� h譶h th緉g h鱱 h譶h,  l� c秐h gi韎 v� h鋍 t鑙 cao!", "V� ngh� b鎛 m玭 c� 'ng� b蕋 truy襫': y誹 畊鑙, hi觤 c, h竜 th緉g, cu錸g t鰑, gian d﹎ s� kh玭g truy襫 v� c玭g")
end;


function select()
Say("C� mu鑞 gia nh藀 b鎛 m玭 kh玭g?", 2, "Gia nh藀. /yes", "Kh玭g gia nh藀/no");
end;


function yes()
if (GetSeries() ~= 4) then								--如果玩家不属于土系
	Say("Ngi kh玭g thu閏 h� Th�, kh玭g th� gia nh藀 b鎛 m玭!", 0)
else
	if (GetFaction() ~= "") then							--如果玩家已经属于土系的某一门派
		Say("Ch璦 gia nh藀 m玭 ph竔 kh竎 m韎 c� th� gia nh藀 b鎛 m玭", 0)
	else
		if (GetLevel() >= 10) then						--等级达到十级
			SetFaction("wudang")      					--玩家加入武当
			--NewWorld(mapID, x, y)						--把玩家传送到门派入口
			--SetFightState(1)						--玩家转换成战斗状态
			--SetRevPos(ID)	 						--设置重生点
			--SetTask(5, 10)
			Say("Hoan Ngh猲h b筺 gia nh藀 V� ng ph竔! ",0)  
		else
			Say("е t� b鎛 m玭 to祅 l� anh h飊g xu蕋 ch髇g. K衜 c鈏 nh� ngi kh玭g x鴑g ng v祇 b鎛 m玭!", 0)
		end		
	end	
end
end;	

function no()
end;

