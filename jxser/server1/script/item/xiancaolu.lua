IncludeLib("SETTING"); --载入SETTING脚本指令库

function main()
--	--Msg2Player("此功能稍后开放.多谢支持!")
--	--return 1
--	if (GetNpcExpRate() <= 100) then
		AddSkillState(440, 1, 1, 64800,1);
--	else
--		Say("Xin l鏸! T筸 th阨 kh玭g th� s� d鬾g 頲 Ti猲 Th秓 L�. ", 0)
--		return 1
--	end
--	return 0
end
function main()
 if (GetSkillState(440) == 1) then
 Say("Th阨 gian Ti猲 Th秓 L� ( 60 ph髏 ) v蒼 c遪 hi謚 l鵦 n猲     kh玭g th� s� d鬾g ti誴 .", 0)
 return 1 
 else
 AddSkillState(440, 1, 1, 64800 * 1,1);
 end
end;