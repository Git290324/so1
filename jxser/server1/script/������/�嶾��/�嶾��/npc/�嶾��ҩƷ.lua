--五毒教 卖药的弟子对话
-- Update: Dan_Deng(2003-08-21) 加入卖道具只卖给本帮

function main(sel)
	Uworld37 = GetByte(GetTask(37),2)
	if (GetFaction() == "wudu") or (Uworld37 == 127) then
		Say("C玭g phu c馻 b鎛 ph竔 m芻 d� l� l蕐 c l祄 ch�. Nh璶g m� h秓 dc 'di謚 th� h錳 xu﹏' c騨g kh玭g thi誹. C� mu鑞 xem th� kh玭g", 2, "Giao d辌h/yes", "Kh玭g giao d辌h/no")
	else
		Talk(1,"","Gi竜 ch� c� l謓h: thu鑓 c馻 b秐 ph竔 kh玭g 頲 b竛 cho ngi ngo礽")
	end
end;

function yes()
Sale(80)
end;

function no()
end;
