--中原南区 襄阳府 钱庄老板对话
-- Update: Dan_Deng(2003-12-31) 加红包、元宝功能

Include("\\script\\global\\钱庄功能.lua")

function main(sel)
	i = random(0,1)
	if (i == 0) then
		Talk(1,"main_proc","Ngi l祄 ╪ 琻g nhi猲 mu鑞 l阨 c祅g nhi襲 c祅g T鑤! thi猲 h� c� m蕐 ai ch� ti襫?")
	else
		Talk(1,"main_proc","M鋓 th� u l� gi�, ch� c� v祅g th藅, b筩 tr緉g m韎 l� th藅!")
	end
end;
