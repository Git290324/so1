--西南南区 大理府 长江码头船夫对话
--suyu
--20031029

CurWharf = 9;
Include("\\script\\global\\station.lua")
Include("\\script\\missions\\autohang\\function.lua")
---------------------------------------------------------------
function main(sel)
	if (GetLevel() >= 50) then
		Say("S玭g Ho祅g H� u鑞 ln ch輓 kh骳 cong, em � v飊g bi觧 anh tr猲 n骾, c竎h nhau Thng S琻 Nh� H秈, mu鑞 g苝 c騨g kh玭g 頲.", 3, "Ng錳 thuy襫/WharfFun", "Kh玭g ng錳/OnCancel", " Уo Hoa o (5) /go_thd")
	else
		Say("S玭g Ho祅g H� u鑞 ln ch輓 kh骳 cong, em � v飊g bi觧 anh tr猲 n骾, c竎h nhau Thng S琻 Nh� H秈, mu鑞 g苝 c騨g kh玭g 頲.", 2, "Ng錳 thuy襫/WharfFun", "Kh玭g ng錳/OnCancel")
	end
end;

function  OnCancel()
   Talk(1,"","Kh玭g ti襫 kh玭g th� ng錳 thuy襫! ")
end;

---------------------------------------------------------------
function go_thd()
	nRet = aexp_gotothd(239);
	-- if (nRet == 1) then
	--	Msg2Player("船夫：最近去桃花岛的人可真多。好吧，你坐好喽！")
	if (nRet == -1) then
		Talk(1,"","Ph� 甶 thuy襫 n Уo Hoa Фo "..AEXP_TICKET.."Lng, ngi c�  kh玭g? ")
	end
end
---------------------------------------------------------------
