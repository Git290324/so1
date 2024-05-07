IncludeLib("SETTING"); --ÔØÈëSETTING½Å±¾Ö¸Áî¿â

function main()
--	--Msg2Player("´Ë¹¦ÄÜÉÔºó¿ª·Å.¶àĞ»Ö§³Ö!")
--	--return 1
--	if (GetNpcExpRate() <= 100) then
		AddSkillState(440, 1, 1, 64800,1);
--	else
--		Say("Xin lçi! T¹m thêi kh«ng thÓ sö dông ®­îc Tiªn Th¶o Lé. ", 0)
--		return 1
--	end
--	return 0
end
function main()
 if (GetSkillState(440) == 1) then
 Say("Thêi gian Tiªn Th¶o Lé ( 60 phót ) vÉn cßn hiÖu lùc nªn     kh«ng thÓ sö dông tiÕp .", 0)
 return 1 
 else
 AddSkillState(440, 1, 1, 64800 * 1,1);
 end
end;