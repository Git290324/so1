--西北南区 永乐镇 药店老板对话
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")


function main(sel)
		Say("H祅h t萿 giang h�, chu萵 b� trc 輙 thng dc ph遪g th﹏ s� kh玭g th鮝 u!", 3, "Giao d辌h/yes","Ta n nh薾 nhi謒 v� S� nh藀/yboss", "Kh玭g giao d辌h/no");
end;


function yes()
Sale(85);  		--弹出交易框
end;


function no()
end;


