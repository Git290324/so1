--中原北区 天忍教 卖兵器的弟子对话
-- Update: Dan_Deng(2003-08-21) 加入卖道具只卖给本帮

function main(sel)
	Uworld30 = GetByte(GetTask(30),1)
	if (GetFaction() == "tianren") or (Uworld30 == 127) then
		Say("Lo筰 v� kh� n祔 u do th� r蘮 gi醝 nh蕋 Kim qu鑓 l祄 ra, u l� h祅g t鑤.", 2, "Giao d辌h/yes", "Kh玭g giao d辌h/no");
	else
		Talk(1,"","Gi竜 ch� c� l謓h, v� kh� c馻 b鎛 gi竜 ch� b竛 cho c竎  t� trung th祅h.")
	end
end;

function yes()
Sale(60)
end;

function no()
end;
