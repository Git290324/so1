Include("\\script\\maps\\newworldscript_default.lua")



function OnNewWorld(szParam)
--local checkexp = GetExpPercent()
if GetLevel() < 80 then
Talk(1,"phune", "C�p �� th�p h�n 80 kh�ng th� di chuy�n l�n map 9x")

-- Say("C�p �� th�p h�n 60 kh�ng th� di chuy�n l�n map 7x")
-- UseTownPortal();
--return 1
end
local checkexp = GetExpPercent()
if checkexp < -50 then
Say("Hi�n t�i �i�m kinh nghi�m v��t -50% kh�ng th� di chuy�n l�n map")
--UseTownPortal();
NewWorld (53,1600,3200)

end
--if checkexp < -50 then
--Say("Hi�n t�i �i�m kinh nghi�m v��t -50% kh�ng th� di chuy�n l�n map")
--NewWorld (53,1600,3200)
--return 1
-- RemoveSkillState(1525);
	-- ForbidChangePK(0);	-- khong duoc doi pk
	-- SetFightState(1)
	-- OnNewWorldDefault(szParam)
end

function phune()
UseTownPortal();
end

