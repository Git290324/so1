Include("\\script\\maps\\newworldscript_default.lua")



function OnNewWorld(szParam)
local checkexp = GetExpPercent()
if GetLevel() < 90 then
Talk(1,"phune", "CÊp ®é thÊp h¬n 90 kh«ng thÓ di chuyÓn lªn map 9x")

 Say("CÊp ®é thÊp h¬n 90 kh«ng thÓ di chuyÓn lªn map 9x")
 UseTownPortal();
 NewWorld (53,1600,3200)
return 1
end
local checkexp = GetExpPercent()
if checkexp < -50 then
Say("HiÖn t¹i ®iÓm kinh nghiÖm v­ît -50% kh«ng thÓ di chuyÓn lªn map")
UseTownPortal();
NewWorld (53,1600,3200)

end
if checkexp < -50 then
Say("HiÖn t¹i ®iÓm kinh nghiÖm v­ît -50% kh«ng thÓ di chuyÓn lªn map")
NewWorld (53,1600,3200)
return 1
 RemoveSkillState(1525);
	 ForbidChangePK(0);	-- khong duoc doi pk
	 SetFightState(1)
	 OnNewWorldDefault(szParam)
end

function phune()
UseTownPortal();
end

