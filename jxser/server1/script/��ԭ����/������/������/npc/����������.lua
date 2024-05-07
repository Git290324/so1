--少林派 卖兵器的弟子对话
-- Update: Dan_Deng(2003-08-21) 加入卖道具只卖给本帮
-- Update: xiaoyang(2004\4\23) 加入采集矿石任务，可重复加声望

Include("\\script\\global\\repute_head.lua")

function main(sel)
	Uworld38 = GetByte(GetTask(38),2)
	Uworld131 = GetTask(131)
	if (Uworld131 == 10) and (GetItemCount(138) >= 5) and (GetItemCount(121) >= 5) and (GetItemCount(118) >=5) then
		Talk(1,"U131_prise","Чi s�! C竎 lo筰 kho竛g th筩h t筰 h�  甧m n, xin h穣 xem qua.","Kho竛g th筩h n祔.....c竚 琻 ngi!")
	elseif (GetFaction() == "shaolin") or (Uworld38 == 127) then
		if (GetLevel() >= 20) and (GetReputeLevel(GetRepute()) >=4) and ((Uworld131 < 10) or ((GetGameTime() > Uworld131) and (Uworld131 > 255))) then
			Say("B鎛 t� n籱 trong ph筸 vi c馻 Kim qu鑓, c竎 th� r蘮 xung quang c竎h 100 d苖 頲 l謓h c馻 Чi Kim kh玭g 頲 b竛 binh kh� kho竛g th筩h cho Thi誹 L﹎. Hi謓 v� kh� trong ch颽  r� s衪 c�, n誹 qu﹏ Kim t蕁 c玭g n, e r籲g kh玭g ch鑞g  頲. Ta c莕 T� Thi誸 Kho竛g, Lng Ng﹏ Kho竛g, X輈h уng Kho竛g.",3,"уng � 甶 thu th藀 kho竛g th筩h. /yes1","T筰 h� mu鑞 mua v礽 lo筰 binh kh�. /yes","T筰 h� c遪 chuy謓 kh竎 ph秈 l祄, l莕 sau s� i tho筰. /no")
		else
			Say("V� c玭g Thi誹 L﹎ vang danh thi猲 h�, nh璶g n誹 kh玭g c� v� kh� th� c玭g phu n祇 c騨g th祅h v� d鬾g.", 2, "Giao d辌h/yes", "Kh玭g giao d辌h/no")
		end
	else
		Talk(1,"","Chng m玭 c� l謓h, v� kh� b鎛 ph竔 ch� b竛 cho ng m玭")
	end
end;

function yes()
	Sale(69)
end;

function yes1()
	Talk(2,"","Thi誹 L﹎ n緈 gi� v薾 m謓h v� l﹎  m蕐 tr╩ n╩ nay, t筰 h� nguy謓 ph鬰 v� h誸 m譶h!","Ph藅 t� bi, Thi誹 L﹎ c莕 ngi gi髉 ! H穣 gi髉 ti觰 t╪g t譵 T� Thi誸 Kho竛g, Lng Ng﹏ Kho竛g, X輈h уng Kho竛g m鏸 lo筰 n╩ vi猲.")
	SetTask(131,10)
	Msg2Player("уng � gi髉 Thi誹 L﹎ ph竔 甶 t譵 T� Thi誸 Kho竛g, Lng Ng﹏ kho竛g, X輈h уng kho竛g m鏸 lo筰 5 vi猲. ")
end

function U131_prise()
	for i=1,5 do
		DelItem(138)
		DelItem(121)
		DelItem(118)
	end
	SetTask(131,GetGameTime()+14400)
	i = GetReputeLevel(GetRepute()) + 2
	AddRepute(i)
	Msg2Player("Giao kho竛g th筩h cho Tr鮪g M箃, ho祅 th祅h nhi謒 v�. Danh v鋘g c馻 b筺 t╪g th猰 "..i.."甶觤.")
end

function no()
end;
