--丐帮 卖兵器的弟子对话
-- Update: Dan_Deng(2003-08-21) 加入卖道具只卖给本帮

function main(sel)
	Uworld30 = GetByte(GetTask(30),2)
	if (GetFaction() == "gaibang") or (Uworld30 == 127) then
		Say("Ф c萿 B鎛g c馻 b鎛 bang  vang danh thi猲 h�. T蕋 c� c竎 lo筰 binh kh� c玭, roi, d﹜� � d﹜ u c� y  c� ", 2, "Giao d辌h/yes", "Kh玭g giao d辌h/no")
	else
		Talk(1,"","Bang ch� c� l謓h: Binh kh� c馻 b鎛 m玭 kh玭g 頲 b竛 cho ngi ngo礽")
	end
end;

function yes()
	Sale(72)
end;

function no()
end;
