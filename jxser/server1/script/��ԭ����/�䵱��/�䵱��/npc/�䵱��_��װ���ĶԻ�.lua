--中原南区 武当派 卖装备的弟子对话
-- Update: Dan_Deng(2003-08-21) 加入卖道具只卖给本帮

function main(sel)
	Uworld31 = GetByte(GetTask(31),1)
	if (GetFaction() == "wudang") or (Uworld31 == 127) then
		Say("Чo b祇 p ai m� kh玭g th輈h? L鵤 m閠 c竔 甶?", 2, "Giao d辌h/yes", "Kh玭g giao d辌h/no")
	else
		Talk(1,"","Chng m玭 c� l謓h, c竎 trang b� c馻 b鎛 gi竜 ch� c� th� b竛 cho  t� V� ng.")
	end
end;

function yes()
Sale(64)
end;

function no()
end;
