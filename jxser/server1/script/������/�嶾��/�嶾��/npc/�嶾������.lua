--五毒教 卖兵器的弟子对话
-- Update: Dan_Deng(2003-08-21) 加入卖道具只卖给本帮


function main(sel)
	Uworld37 = GetByte(GetTask(37),2)
	if (GetFaction() == "wudu") or (Uworld37 == 127) then
		Say("B鎛 ph竔 v鑞 kh玭g d飊g s鴆 m筺h  chi課 th緉g, b雐 v� nh鱪g v� kh� n祔 khi bi誸 v薾 d鬾g th� tuy謙 x秓 v� song ", 2, "Giao d辌h/yes", "Kh玭g giao d辌h/no")
	else
		Talk(1,"","Gi竜 ch� c� l謓h: binh kh� c馻 m玭 ph竔 kh玭g 頲 b竛 cho ngi ngo礽")
	end
end;

function yes()
	Sale(78)
end;

function no()
end;
