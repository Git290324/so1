--中原北区 汴京府 码头船夫2对话
--suyu
--200306015

CurWharf = 3;
Include("\\script\\global\\station.lua")
Include("\\script\\missions\\autohang\\function.lua")
---------------------------------------------------------------
function main(sel)
	if (GetLevel() >= 50) then
		Say("H玬 nay xu玦 thuy襫 ngc d遪g, l筰 g苝 ph秈 gi� l韓, xem ra kh玭g th� c� ch蘯 m穒 nh� th� n祔. E r籲g ph秈 l猲 b� th玦, ngi c� ch辵 l猲 kh玭g? ", 3, "Ng錳 thuy襫/WharfFun", "Kh玭g ng錳/OnCancel", " Уo hoa o (4) /go_thd");
	else
		Say("H玬 nay xu玦 thuy襫 ngc d遪g, l筰 g苝 ph秈 gi� l韓, xem ra kh玭g th� c� ch蘯 m穒 nh� th� n祔. E r籲g ph秈 l猲 b� th玦, ngi c� ch辵 l猲 kh玭g? ", 2, "Ng錳 thuy襫/WharfFun", "Kh玭g ng錳/OnCancel");		
	end

end;

---------------------------------------------------------------
function  OnCancel()

   Say("Kh玭g ti襫 kh玭g th� l猲 thuy襫! ",0)

end;

---------------------------------------------------------------
function go_thd()
	nRet = aexp_gotothd(238);
	-- if (nRet == 1) then
	--	Msg2Player("船夫：最近去桃花岛的人可真多。好吧，你坐好喽！")
	if (nRet == -1) then
		Talk(1,"","Ph� 甶 thuy襫 n Уo Hoa Фo "..AEXP_TICKET.."Lng, ngi c�  kh玭g? ")
	end
end
---------------------------------------------------------------
