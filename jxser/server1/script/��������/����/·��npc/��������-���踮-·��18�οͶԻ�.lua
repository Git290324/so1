--西北南区 凤翔府 路人18嫖客对话
--西北南区 凤翔府 华山绝顶传送NPC 199,201
function main(sel)
	if(GetLevel() >= 60)then
		Say("Nh譶 qua l� bi誸 ngi l� tuy謙 th� i hi謕. C� ph秈 nh n nh Hoa S琻 t� v� ph秈 kh玭g? Ch� c莕 b� ra 500 lng, ta s� a ngi n t薾 n琲!",2,"Th� v� y, 甶 xem th�! /yes","Kh玭g quan t﹎, kh玭g mu鑞 甶. /no")
	else
		Say("жnh Hoa S琻 ph輆 ng c� m蕐 t猲 c� su鑤 ng祔 ch衜 gi誸,tranh gi祅h thi猲 h�  nh蕋 g� . B鋘 ta a c竎 ngi n , th藅 c騨g ch糿g ph秈 l� chuy謓 hay!",0)
	end
end;

function yes()
	if(GetCash() >= 500)then
		Pay(500);
		NewWorld(2, 2600, 3600);		
	else
		Say("500 lng m� c騨g kh玭g c� l祄 sao 甶?",0)
	end
end;

function no()
	Say("L骳 xu鑞g n骾 nh� t譵 D� V� n祔 nh�!",0)
end;