--中原南区 襄阳府 码头船夫1对话
--suyu
--200306015

CurWharf = 4;
Include("\\script\\global\\station.lua")
Include("\\script\\missions\\autohang\\function.lua")

---------------------------------------------------------------
function main(sel)
	if (GetLevel() >= 50) then
		Say("Nh� ta m蕐 i l猲h nh tr猲 Trng Giang, ng th蕐 thuy襫 ta nh� m� xem thng, ch� 4,5 ngi c騨g kh玭g h� h蕁 g�!", 3, "Ng錳 thuy襫/WharfFun", "Kh玭g ng錳/OnCancel", " Уo Hoa o (3) /go_thd");
	else
		Say("Nh� ta m蕐 i l猲h nh tr猲 Trng Giang, ng th蕐 thuy襫 ta nh� m� xem thng, ch� 4,5 ngi c騨g kh玭g h� h蕁 g�!", 2, "Ng錳 thuy襫/WharfFun", "Kh玭g ng錳/OnCancel");
	end
end;

---------------------------------------------------------------
function  OnCancel()

   Say("Kh玭g c� ti襫 ng錳 thuy襫 th� ngi 甶 b� v藋! ",0)

end;

---------------------------------------------------------------
function go_thd()
	nRet = aexp_gotothd(237);
	-- if (nRet == 1) then
	--	Msg2Player("船夫：最近去桃花岛的人可真多。好吧，你坐好喽！")
	if (nRet == -1) then
		Talk(1,"","Ph� 甶 thuy襫 n Уo Hoa Фo "..AEXP_TICKET.."Lng, ngi c�  kh玭g? ")
	end
end
---------------------------------------------------------------
