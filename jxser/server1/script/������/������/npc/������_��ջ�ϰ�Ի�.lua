--两湖区 南岳镇 客栈老板对话

function main(sel)

	if ( GetTask(1256) == 1 ) then
		 SetTaskTemp(111,GetTaskTemp(111)+1)

		 if ( GetTaskTemp(111) > 3 ) then
		 	Talk(1,"","Nghe n鉯 c� m閠 v� s� th竔 kh玭g bi誸 t� mi誹 n祇 n, ph竝 l鵦 v� bi猲 ngi 甶 h醝 th� xem sao.")
		 	SetTask(1256, 2);
		 else
		 	Talk(1,"","Kh竎h quan xin m阨 v祇, ng s�, ng s�, tuy trong s穘h 阯g c� m蕐 c竔 quan t礽 nh璶g ch髇g ta v蒼 m� c鯽 n kh竎 ng  � n m蕐 v� d辌h b謓h 蕐. C竔 g�? ta kh玭g s� m韎 l� , l� l╪ ra ch誸 m閠 ng th� sao y. Hihihi, ti觰 甶誱 y an to祅 m�, 琻g nhi猲 trong th阨 bu鎖 lo筺 l筩 n祔 ti襫 thu� ph遪g c� h琲 cao m閠 ch髏 y.")		 
		 end
		 return
	elseif ( GetTask(1256) == 2 ) then
		Talk(1,"","Nghe n鉯 c� m閠 v� s� th竔 kh玭g bi誸 t� mi誹 n祇 n, ph竝 l鵦 v� bi猲 ngi 甶 h醝 th� xem sao.")
		return
	end
	
Say("Ngi c騨g l猲 n骾 b竔 ki課 чc C� Чi hi謕 sao? Nh璶g 玭g 蕐 l� th莕 tng c馻 ta. G苝 頲 玭g ta, phi襫 玭g 蕐 vi誸 cho ta m閠 ch� ",0);

end;

