-- 路人_沈驹 南岳镇 卖特殊马(80级马)的NPC脚本
-- By Dan_Deng(2003-11-10)

Include("\\script\\tong\\tong_header.lua");
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\answer.lua")
Include("\\script\\activitysys\\npcfunlib.lua")

function main()
	UWorld97 = GetTask(97)
	str, result = GetTong()	
--	if (UWorld97 >= 10) then		-- 已经买过
--		Talk(1,"","沈驹：你一定要好好对待马儿，每天要给它洗澡，豆饼里面要掺上精面......")
	if (UWorld97 < 100) and (result == 1) and (GetTongFigure() == TONG_MASTER) then			-- 是帮主，没有享受过优惠买马
		SetTaskTemp(17,1000)
	else								-- 普通买马
		SetTaskTemp(17,1500)
--		Talk(1,"","沈驹：千里马常有，而伯乐不常有。徒呼！奈何！")
	end
	
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex);
	if NpcName2Replace then szNpcName = NpcName2Replace(szNpcName); end
	local tbDailog = DailogClass:new(szNpcName);
	tbDailog.szTitleMsg = "<#><npc>T筰 h� nu玦 ng鵤 r蕋 nhi襲 n╩, ch� c莕 xem qua l� bi誸 t鑤 hay kh玭g!"
	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex);
	tbDailog:AddOptEntry("L骳 n穣 ngi g鋓 ta?", horse_get);

	tbDailog:Show();
end

function horse_get()
	Talk(4,"sele_color","V� anh h飊g n祔 xin d鮪g bc . ","Huynh i, c� chuy謓 g� c莕 ch� gi竜? ","T筰 h� l� Th蒻 C﹗, hi謓 c� m閠 con ng鵤 qu�, c� th� phi 頲 ng祅 d苖. V� anh h飊g y phong th竔 b蕋 ph祄, nh蕋 nh l� 1 cao th�. Ng鵤 qu� c馻 t筰 h� kh玭g bao gi� ch辵 khu蕋 ph鬰 k� th蕋 phu. ","в ta xem th� ng鵤 qu� c馻 huynh,,, ")
end

function sele_color()
	Say("Anh h飊g h穣 xem! ",6,"Зy kh玭g ph秈 l� � V﹏ Чp Tuy誸 sao! /buy_black","Зy kh玭g ph秈 l� X輈h Th� B秓 M� sao! /buy_red","Зy kh玭g ph秈 l� Tuy謙 秐h sao! /buy_cyan","Зy kh玭g ph秈 l� лch L� sao! /buy_yellow","Зy ch糿g ph秈 l� Chi誹 D� Ng鋍 S� T� sao! /buy_white","Зy l� ng鵤 g� v藋? T筰 h� hi觰 bi誸 c遪 k衜 /buy_none")
end

function buy_black()
	the_buy(1)
end

function buy_red()
	the_buy(2)
end

function buy_cyan()
	the_buy(3)
end

function buy_yellow()
	the_buy(4)
end

function buy_white()
	the_buy(5)
end

function buy_none()
	Talk(1,"","Nh蕋 bang chi ch�, l� m閠 nh﹏ v藅 b薱 th莥 l祄 sao kh玭g bi誸 y r鑤 cu閏 l� ng鵤 g� ch�? Th� l鏸, xem ra t筰 h�  nh譶 l莔 ngi!")
end

function the_buy(i)
	SetTaskTemp(49,i)
	x = GetTaskTemp(17)
	if (x == 1000) then
		Say("Kh玭g sai! Ngi qu� th藅 l� anh h飊g. T筰 h� v鑞 ch糿g mu鑞 b竛 con ng鵤 n祔 u, nh璶g v� 產ng c莕 g蕄 1000 lng b筩, v� l筰 nh譶 th蕐 anh h飊g c騨g th藅 s� th輈h n� n猲 n衝 l遪g m� b竛 n� cho anh h飊g, mong r籲g anh h飊g h穣 thng y猽 nu玦 dng n� ",2,"kh玭g sao u, ta nh蕋 nh s� i x� t鑤 v韎 n� m� /buy_yes","Nh蕋 th阨 l祄 sao t譵 ra 頲 s� ti襫 n祔 /buy_no")
	else
		Say("Kh玭g sai! Ngi qu� th藅 l� anh h飊g. T筰 h� v鑞 ch糿g mu鑞 b竛 con ng鵤 n祔 u, nh璶g v� 產ng c莕 g蕄 1500 lng b筩, v� l筰 nh譶 th蕐 anh h飊g c騨g th藅 s� th輈h n� n猲 n衝 l遪g m� b竛 n� cho anh h飊g, mong r籲g anh h飊g h穣 thng y猽 nu玦 dng n� ",2,"kh玭g sao u, ta nh蕋 nh s� i x� t鑤 v韎 n� m� /buy_yes","Nh蕋 th阨 l祄 sao t譵 ra 頲 s� ti襫 n祔 /buy_no")
	end
end

function buy_yes()
	x = GetTaskTemp(17)
	if (GetCash() >= x * 10000) then
		i = GetTaskTemp(49)
		if (x == 1000) then			-- 是优惠价买的，为变量赋值，并且记住买的是什么颜色马
			SetTask(97,100+i)
		end
		Pay(x * 10000)
		AddItem(0,10,5,i,0,0,0)
		Talk(1,"","Ng鵤 琲 ng鵤! T� y v� sau ngi h穣 甶 theo v� anh h飊g n祔 nh�, nh蕋 nh ph秈 ngoan ngo穘 !")
	else
		Talk(1,"","Ta hi謓 gi� trong ngi kh玭g mang theo  ng﹏ lng, huynh t筸 th阨 c莔  s� ti襫 n祔 v藋!")
	end
end

function buy_no()
	Talk(1,"","Kh玭g l� s� ti襫 n祔 l筰 l祄 kh� anh h飊g sao")
end
