--中原北区 朱仙镇 药店老板对话
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
function main(sel)
Say("Kh竎h quan mu鑞 mua g�?", 3, "Giao d辌h/yes","Ta n nh薾 nhi謒 v� S� nh藀/yboss", "Kh玭g giao d辌h/no");
end;


function yes()
Sale(88);  		--弹出交易框
end;


function no()
end;

