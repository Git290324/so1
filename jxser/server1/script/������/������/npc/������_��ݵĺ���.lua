-- 结拜的和尚
-- By: Dan_Deng(2003-08-22)

function main(sel)
	if (GetTeamSize() > 1) and (IsCaptain() == 1) then			-- 只有队长才能启动结拜
		Talk(1,"Wswear_select", 11374)
	else
		Talk(1,"", 11375)
	end
end;

function Wswear_select()
	if (GetSex() == 0) then
		P_sex = "Thi誹 hi謕"
	else
		P_sex = "N� hi謕"
	end
	Say("T辬h цc Thi襫 S�: N鉯 hay l緈! Ch� c莕"..P_sex.."ng 3000 lng  s鯽 tng Ph藅, m鋓 chuy謓 u d� n鉯.",2,"Quy猲 3000 lng. /Wswear_yes","Kh玭g c莕!/Wswear_no")
end;

function Wswear_yes()
	if (GetCash() >= 3000) then
		if(SwearBrother(GetTeam()) == 1)then
			Pay(3000)
			Msg2Team("Ch骳 m鮪g hai v�  k誸 ngh躠 Kim Lan. ")
		else
			Msg2Team("Trong nh鉳 c� t錸 t筰 quan h� phu th�, vi謈 k誸 b竔 th蕋 b筰. ")
		end
	else
		Talk(1,"", 11376)
	end
end;

function Wswear_no()
end;
