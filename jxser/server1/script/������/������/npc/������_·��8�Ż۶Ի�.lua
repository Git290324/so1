--两湖区 南岳镇 路人8闻慧对话

function main(sel)

	if ( GetTask(1256) == 1 ) then
		 SetTaskTemp(111,GetTaskTemp(111)+1)
		 if ( GetTaskTemp(111) > 3 ) then
		 	Talk(1,"","Nghe n鉯 c� m閠 v� s� th竔 kh玭g bi誸 t� mi誹 n祇 n, ph竝 l鵦 v� bi猲 ngi 甶 h醝 th� xem sao.")
		 	SetTask(1256, 2);
		 	return
		 else
		 	Talk(1,"","C竔 b謓h d辌h qu竔 竎 n祔  phong t醓 阯g l猲 n骾 Ho祅h S琻, l祄 ta h誸 頲 di謓 ki課 чc C� Чi Hi謕 r錳.")
		 	return
		 end
		 return
	elseif ( GetTask(1256) == 2 ) then
		Talk(1,"","Nghe n鉯 c� m閠 v� s� th竔 kh玭g bi誸 t� mi誹 n祇 n, ph竝 l鵦 v� bi猲 ngi 甶 h醝 th� xem sao.")
		return
	end

Say("Ngi c騨g l猲 n骾 b竔 ki課 чc C� Чi hi謕 sao? Nh璶g 玭g 蕐 l� th莕 tng c馻 ta. G苝 頲 玭g ta, phi襫 玭g 蕐 vi誸 cho ta m閠 ch� ",0)

end;

