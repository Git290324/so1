--中原北区 汴京府 杂货店老板对话
Include("\\script\\global\\global_zahuodian.lua");

function main(sel)
	local Buttons = store_sel_extend();
	Say("Kh竎h quan c莕 g�? Hi謓 gi� th� o h鏽 lo筺 s鑞g 頲 qua ng祔 th藅 kh玭g d�, ti謒 ta th� g� c騨g r�, mu鑞 mua th� g�?", getn(Buttons), Buttons);
end;


function yes()
Sale(8);  			--弹出交易框
end;

function BuyChristmasCard()
	Sale(97);
end


function no()
end;


