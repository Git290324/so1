function newmaptrain()
    local nMapId = 969
    ClearMapTrap(nMapId);
    ClearMapNpc(nMapId);
    local tbpoint =
    {
         local tbpoint = {1593,3169},
	     nleftstep = 1,
	     nrightstep = 1,
    ]
    local szScriptFile = "\\script\\global\\dockaka\\mapnew\\vebanlanghuyen.lua"
    local tballpoint = getRectanglePoint(tbpoint)
    for nx,tbp in tballpoint do
    AddMapTrap(nMapId, floor(tbp[1]*32),floor(tbp[2]*32), szScriptFile);
    end
	   
end