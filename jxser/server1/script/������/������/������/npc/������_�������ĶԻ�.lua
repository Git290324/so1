--两湖区 天王帮 卖兵器的帮众对话
-- Update: Dan_Deng(2003-08-21) 加入卖道具只卖给本帮

function main(sel)
	Uworld38 = GetByte(GetTask(38),1)
	if (GetFaction() == "tianwang") or (Uworld38 == 127) then
		Say("Xem binh kh� Thi猲 Vng bang do ch髇g ta t� ch� t筼 y!", 2, "Giao d辌h/yes", "Kh玭g giao d辌h/no")
	else
		Talk(1,"","Bang ch� c� l謓h: binh kh� c馻 b鎛 bang ch� b竛 cho huynh  ng m玭")
	end
end;

function yes()
Sale(57);  			
end;

function no()
end;






