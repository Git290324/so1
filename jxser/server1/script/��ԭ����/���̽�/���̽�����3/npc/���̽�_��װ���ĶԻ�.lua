--中原北区 天忍教 卖装备的弟子对话
-- Update: Dan_Deng(2003-08-21) 加入卖道具只卖给本帮

function main(sel)
	Uworld30 = GetByte(GetTask(30),1)
	if (GetFaction() == "tianren") or (Uworld30 == 127) then
		Say("Зy u l� do Cung n� trong cung l祄 ra, ngi xem, th� c玭g r蕋 tinh x秓...", 2, "Giao d辌h/yes", "Kh玭g giao d辌h/no")
	else
		Talk(1,"","Gi竜 ch� c� l謓h, trang b� c馻 b鎛 gi竜 ch� b竛 cho c竎  t�.")
	end
end;

function yes()
Sale(61)
end;

function no()
end;
