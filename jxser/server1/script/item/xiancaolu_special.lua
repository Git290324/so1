--ÌØÐ§ÏÉ²ÝÂ¶
--8Ð¡Ê±¾­ÑéË«±¶
IncludeLib("SETTING"); --ÔØÈëSETTING½Å±¾Ö¸Áî¿â

function main()
--	if (GetNpcExpRate() <= 100) then
		AddSkillState(440, 1, 1, 64800 * 8,1);
--	else
--		Say("ThËt ®¸ng tiÕc, t¹m thêi kh«ng sö dông ®­îc Tiªn Th¶o Lé ®Æc biÖt.", 0)
--		return 1;
--	end;
--	return 0;
end;
function main()
 if (GetSkillState(440) == 1) then
 Say("Thêi gian Tiªn Th¶o Lé ( 8 h ) vÉn cßn hiÖu lùc nªn      kh«ng thÓ sö dông tiÕp .", 0)
 return 1 
 else
 AddSkillState(440, 1, 1, 64800 * 8,1);
 end
end;