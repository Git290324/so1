Include("\\script\\activitysys\\config\\1031\\head.lua")
Include("\\script\\activitysys\\config\\1031\\variables.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\log.lua")
IncludeLib("SETTING");
Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\activitysys\\config\\1031\\headbanhtrungthu.lua")

function pActivity:AddInitNpcTrungThu()
	local tbPos = {
		{37, 213*8*32, 195*16*32},
		{78, 198*8*32, 201*16*32},
		{11, 392*8*32, 316*16*32},		
		{1, 199*8*32, 200*16*32},
		{162, 202*8*32, 200*16*32},
		{80, 220*8*32, 189*16*32},
		{176, 196*8*32, 184*16*32},
	}
	for _, pos in tbPos do
		local nMapIndex = SubWorldID2Idx(pos[1])
		if nMapIndex >= 0 then
			--384 : tho banh
			local nNpcIndex = AddNpcEx(384, 1, 0, nMapIndex, pos[2], pos[3], 1, "Thî b¸nh A N­¬ng")
			if nNpcIndex and nNpcIndex > 0 then
				SetNpcScript(nNpcIndex, "\\script\\activitysys\\npcdailog.lua")
			end
		end
	end

end

