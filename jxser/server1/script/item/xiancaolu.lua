IncludeLib("SETTING"); --����SETTING�ű�ָ���

function main()
--	--Msg2Player("�˹����Ժ󿪷�.��л֧��!")
--	--return 1
--	if (GetNpcExpRate() <= 100) then
		AddSkillState(440, 1, 1, 64800,1);
--	else
--		Say("Xin l�i! T�m th�i kh�ng th� s� d�ng ���c Ti�n Th�o L�. ", 0)
--		return 1
--	end
--	return 0
end
function main()
 if (GetSkillState(440) == 1) then
 Say("Th�i gian Ti�n Th�o L� ( 60 ph�t ) v�n c�n hi�u l�c n�n     kh�ng th� s� d�ng ti�p .", 0)
 return 1 
 else
 AddSkillState(440, 1, 1, 64800 * 1,1);
 end
end;