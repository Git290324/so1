--特效仙草露
--8小时经验双倍
IncludeLib("SETTING"); --载入SETTING脚本指令库

function main()
--	if (GetNpcExpRate() <= 100) then
		AddSkillState(440, 1, 1, 64800 * 8,1);
--	else
--		Say("Th藅 ng ti誧, t筸 th阨 kh玭g s� d鬾g 頲 Ti猲 Th秓 L� c bi謙.", 0)
--		return 1;
--	end;
--	return 0;
end;
function main()
 if (GetSkillState(440) == 1) then
 Say("Th阨 gian Ti猲 Th秓 L� ( 8 h ) v蒼 c遪 hi謚 l鵦 n猲      kh玭g th� s� d鬾g ti誴 .", 0)
 return 1 
 else
 AddSkillState(440, 1, 1, 64800 * 8,1);
 end
end;