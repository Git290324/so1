-- 大理　职能 杂货店老板
-- By: Dan_Deng(2003-09-16)
Include("\\script\\global\\global_zahuodian.lua");

function main(sel)
	local Buttons = store_sel_extend();
	Say("у � ch� ta v鮝 r� l筰 d� b竛, h玬 qua v鮝 mua h祅g m韎 v�, vui qu�! ", getn(Buttons), Buttons)
end;

function yes()
	Sale(17)
end;

function BuyChristmasCard()
	Sale(97);
end

function no()
end;
