--两湖区 南岳镇 路人5王守义对话

function main(sel)

	if ( GetTask(1256) == 1 ) then
		 SetTaskTemp(111,GetTaskTemp(111)+1)

		 if ( GetTaskTemp(111) > 3 ) then
		 	Talk(1,"","Nghe n鉯 c� m閠 v� s� th竔 kh玭g bi誸 t� mi誹 n祇 n, ph竝 l鵦 v� bi猲 ngi 甶 h醝 th� xem sao.")
		 	SetTask(1256, 2)
		 else
		 	Talk(1,"","Ngi l筰 h醝 th╩ c竔 ch誸 c馻 Th� Lang 礹? ta c� bi誸 u? Nghe n鉯 чc C� Чi Hi謕 c蕀 con g竔 玭g ta чc C� V╪ xu鑞g n骾 n鱝 y,  th蕐 c竔 d辌h b謓h n祔 gh� g韒 bi誸 ch鮪g n祇, hix......")
		 	return		
		 end
		 return
	elseif ( GetTask(1256) == 2 ) then
		Talk(1,"","Nghe n鉯 c� m閠 v� s� th竔 kh玭g bi誸 t� mi誹 n祇 n, ph竝 l鵦 v� bi猲 ngi 甶 h醝 th� xem sao.");
		return
	end

i = random(0,2)

if (i == 0) then
Say("Nghe n鉯 phu nh﹏ c馻 чc C� Чi Hi謕 kh玭g ch� r� v� ngh� cao cng, m� c遪 l� m閠 m� nh﹏ n鱝 ",0)
return
end;

if (i == 1) then
Say("Nghe n鉯 чc C� Чi Hi謕 v� чc C� phu nh﹏ v鑞 l� k� th�, kh玭g ng� l筰 y猽 nhau v鴗 b� hi襪 nghi,k誸 th祅h gia quy課. Tr猲 giang h� c遪 l璾 l筰 m閠 giai tho筰 y. ",0)
return
end;

if (i == 2) then
Say("Con g竔 чc C� Чi Hi謕 чc C� V╪ thng n th� tr蕁 ch琲, l� ngi ngh辌h ng頼 lanh l頸",0)
end;

end;

