-- 龙门镇 职能 药店老板
-- By: Dan_Deng(2003-09-16)
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
function main()
		Say("Х n Long M玭 tr蕁 n祔 th� n猲 mua 輙 thng dc  ph遪g tr竔 gi� tr� tr阨!", 3, "Giao d辌h/yes","Ta n nh薾 nhi謒 v� S� nh藀/yboss", "Kh玭g giao d辌h/no")
end;

function yes()
	Sale(27);  			--弹出交易框
end;

function no()
end;
