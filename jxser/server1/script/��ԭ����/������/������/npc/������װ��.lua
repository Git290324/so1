--少林派 卖装备的弟子对话
-- Update: Dan_Deng(2003-08-21) 加入卖道具只卖给本帮

function main(sel)
	Uworld38 = GetByte(GetTask(38),2)
	if (GetFaction() == "shaolin") or (Uworld38 == 127) then
		Say("Ngi xu蕋 gia kh玭g th� xa hoa, c竎 lo筰 竜 m� n祔 u do c竎 s� huynh  t� l祄 l蕐.", 2, "Giao d辌h/yes", "Kh玭g giao d辌h/no")
	else
		Talk(1,"","Chng m玭 c� l謓h, trang b� c馻 b鎛 ph竔 ch� b竛 cho ng m玭")
	end
end;

function yes()
Sale(70)
end;

function no()
end;
