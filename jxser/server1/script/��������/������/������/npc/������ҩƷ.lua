--昆仑派 卖药的弟子对话
-- Update: Dan_Deng(2003-08-21) 加入卖道具只卖给本帮

function main(sel)
	Uworld31 = GetByte(GetTask(31),2)
	if (GetFaction() == "kunlun") or (Uworld31 == 127) then
		Say("Ti猲 Кn Th竛h dc, Чo Gia ch輓h th鑞g ti猲 n u  � y c�. ", 2, "Giao d辌h/yes", "Kh玭g giao d辌h/no")
	else
		Talk(1,"","Chng m玭 c� l謓h: Dc ph萴 ch� 頲 b竛 cho ng m玭.")
	end
end;

function yes()
Sale(77)
end;

function no()
end;
