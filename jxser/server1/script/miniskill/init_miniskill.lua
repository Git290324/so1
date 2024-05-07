Include("\\script\\lib\\objbuffer_head.lua") -- to open protocol in client
Include("\\script\\script_protocol\\protocol_def_gs.lua") -- to call ScriptProtocol:SendData

function add_timer_mns()
	local timer_id = AddTimer(9, "auto_mns", PlayerIndex)
	SetTask(1412, timer_id) -- l≠u timer id
end



function del_timer_mns()
	local timer_id = GetTask(1412)
	DelTimer(timer_id)
	SetTask(1412,0)
end

function check_skill()
	local skill_unique= {	[1] = {273}, -- TL
			[2] = {33, 42}, --TV
			[6] = {100, 109, 713, 269, 713}, -- TY
			[7] = {277, 130}, -- CB
			[8] = {150}, -- TN
			[9] = {157}, -- VD
			[10] = {722}, -- CL
			[11] = {1358, 1364, 1369},
			[12] = {1932, 1987, 1991}, -- VH
			[13] = {1895, 1902, 1908}, -- TD
			}
	local skill_team = {	[1] = {202, 15},
			[5] = {206, 207, 208, 281, 333}, --NM
			[9] = {211, 738}, 
			[10] = {171},
			[12] = {1920},
	}

	local medicine = {440, 258, 261, 450, 441} -- ThuËc
	local debuff_skill = {	73, 64, 70, 67, 356, 72, 390, 719, 203, -- 5D -- skill c„ hπi
			349, 351, -- DM
			136, 137, 140, 364, 143, 391, 723, -- TN
			392, 393, 174, 175, 181, 90, 394, -- CL
			} -- skill c„ hπi
	
	local have_buff = {}
	local time_buff = {}
	for i = 1, getn(medicine) do
		local have_skill, _, rest_time = GetSkillState(medicine[i])
		if have_skill > 0 then
			have_buff[getn(have_buff)+1] = medicine[i]
			time_buff[getn(time_buff)+1] = rest_time
			--Msg2Player(GetSkillName(medicine[i]).." cﬂn "..rest_time)
		end
	end
	
	local faction_id = GetLastFactionNumber() -- TL la 0, TV la 1
	if skill_unique[faction_id+1] then
		for i = 1, getn(skill_unique[faction_id+1]) do
			local have_skill, _, rest_time = GetSkillState(skill_unique[faction_id+1][i])
			if have_skill > 0 then
				have_buff[getn(have_buff)+1] = skill_unique[faction_id+1][i]
				time_buff[getn(time_buff)+1] = rest_time
				--Msg2Player(GetSkillName(skill_unique[faction_id+1][i]).." cﬂn "..rest_time)
			end
		end	
	end

	if skill_team[faction_id+1] then
		for i = 1, getn(skill_team[faction_id+1]) do
			local have_skill, _, rest_time = GetSkillState(skill_team[faction_id+1][i])
			if have_skill > 0 then
				have_buff[getn(have_buff)+1] = skill_team[faction_id+1][i]
				time_buff[getn(time_buff)+1] = rest_time
				--Msg2Player(GetSkillName(skill_team[faction_id+1][i]).." cﬂn "..rest_time)
			end
		end	
	end
	
	local max_faction_num = 13 -- chÿnh v“ 10 n’u chÿ ch¨i 10 ph∏i
	local max_buff_allow = 5 -- 
	local max_buff_and_debuff_allow = 10 -- 
	for j =1, max_faction_num do
		if skill_team[j] and j~=faction_id+1 then
			for i = 1, getn(skill_team[j]) do
				if getn(have_buff) >= max_buff_allow then
					break
				end
				local have_skill, _, rest_time = GetSkillState(skill_team[j][i])
				if have_skill > 0 then
					have_buff[getn(have_buff)+1] = skill_team[j][i]
					time_buff[getn(time_buff)+1] = rest_time
					--Msg2Player(GetSkillName(skill_team[j][i]).." cﬂn "..rest_time)
				end
			end
				
		end
		if getn(have_buff) >= max_buff_allow then
			break
		end
	end

	for i = 1, getn(debuff_skill) do
		if getn(have_buff) >= max_buff_and_debuff_allow then
			break
		end
		local have_skill, _, rest_time = GetSkillState(debuff_skill[i])
		if have_skill > 0 then
			have_buff[getn(have_buff)+1] = debuff_skill[i]
			time_buff[getn(time_buff)+1] = rest_time
			--Msg2Player(GetSkillName(debuff_skill[i]).." cﬂn "..rest_time)
		end
	end
	return {have_buff, time_buff}
end


function auto_mns(player_id)
	PlayerIndex = player_id
	local player_name = GetName()
	if player_name~= nil then
		local tab = check_skill()
		local nHandle = OB_Create()
		ObjBuffer:PushByType(nHandle, OBJTYPE_TABLE, tab)
		ScriptProtocol:SendData("emSCRIPT_PROTOCOL_OPEN_MNS", nHandle)
		OB_Release(nHandle)
		return 9, player_id
	else
		return 0, player_id
	end
end