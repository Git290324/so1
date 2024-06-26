Include( "\\script\\missions\\leaguematch\\head.lua" )
Include( "\\script\\missions\\leaguematch\\npc\\head.lua" )

function wlls_get_winrate()
	local n_total	= GetTask(WLLS_TASKID_TOTAL)
	if (n_total > 0) then
		return floor(GetTask(WLLS_TASKID_WIN) / n_total * 100)
	else
		return 0
	end
end

function wlls_get_total()
	local n_total	= GetTask(WLLS_TASKID_TOTAL)
	if (n_total > 255) then
		return 255
	else
		return n_total
	end
end

WLLS_REG_TABLE	= {
	-- 名称，	获取函数，				显示，																			单位)
	{"gi韎 t輓h",	GetSex,					{"Nam", "N� "},																	""},
	{"m玭 ph竔",	GetLastFactionNumber,	{"Thi誹 L﹎", "Thi猲 Vng", "Л阯g M玭", "Ng� чc", "Nga Mi", "Th髖 Y猲", "C竔 Bang", "Thi猲 Nh蒼", "V� ng", "C玭 L玭"},""},
	{"ng c蕄",	GetLevel,				{{80,99}, {100,119}, {120,129}, {130,139}, {140,149}, {150,nil}},	"c蕄"},
	{"tham gia thi u",	wlls_get_total,			{{nil,9}, {10,48}, {49,99}, {100,200}, {200,nil}},								"tr薾"},
	{"t� l� th緉g",	wlls_get_winrate,		{{nil,29}, {30,49}, {50,70}, {70,90}, {90,nil}},								"%"},
}

function main()
	local n_ntype	= GetGlbValue(GLB_WLLS_NEXT)
	if (WLLS_TAB[n_ntype].max_member <= 1) then
		Say("Hi謓 v� l﹎ t� v� theo h譶h th鴆 n u. Ta kh玭g th� gi髉 ngi r錳!", 0)
		return
	end
	local n_lid = LG_GetLeagueObj(WLLS_REG_LGTYPE, GetName())
	local tb_option	= {}
	tb_option[getn(tb_option)+1]	= "Ta mu鑞 ki觤 tra/wlls_reg_query_menu"
	if FALSE(n_lid) then
		tb_option[getn(tb_option)+1]	= "Ta mu鑞 ng k� /wlls_reg_me"
	else
		tb_option[getn(tb_option)+1]	= "Tin t鴆 c馻 ta/wlls_view_me"
		tb_option[getn(tb_option)+1]	= "Ta mu鑞 x鉧 c竎 th玭g tin  nh藀/wlls_want2out"
	end
	tb_option[getn(tb_option)+1]	= "K誸 th骳 i tho筰/OnCancel"
	Say("S� gi� li猲 u: V� l﹎ li猲 u ch輓h th鴆 b総 u" .. WLLS_TAB[n_ntype].name .. ", C� th� g苝 ta  t� hi觰 v� c竎 th玭g tin c馻 nh鱪g tuy觧 th� kh竎 ho芻 產ng k� c竎 th玭g tin c馻 m譶h v� t� i", getn(tb_option), tb_option)
end

-- 登记成员
function wlls_reg_me()
	-- 建战队
	local n_lid = LG_CreateLeagueObj()
	LG_SetLeagueInfo(n_lid, WLLS_REG_LGTYPE, GetName())
	LG_ApplyAddLeague(n_lid, "", "") 
	LG_FreeLeagueObj(n_lid)

	-- 存入自身基本数据
	wlls_save_myinfo()

	Talk(1, "wlls_view_me", "   Жng k� th祅h c玭g! C� th� thay i c竎 th玭g tin")
end

-- 查看自己
function wlls_view_me()
	-- 如果 刚登记/刚更新 立即运行此函数 有可能显示异常
	Describe(wlls_get_infostr(GetName()), 3,
		"Thay i tin t鴆 c� b秐 c馻 ta/wlls_reg_refresh", "S鯽 tin t鴆 i h鱱 k� v鋘g/#wlls_edit_need('')", "Tr� l筰")
end

-- 更新自己的基本信息
function wlls_reg_refresh()
	wlls_save_myinfo()
	Talk(1, "wlls_view_me", strfill_right("Thay i th祅h c玭g!", 30))
end

-- 将自身基本信息存入
function wlls_save_myinfo()
	local tb_info = {}
	for n_idx, tb_fmt in WLLS_REG_TABLE do
		tb_info[n_idx]	= tb_fmt[2]()
		if (type(tb_fmt[3][1]) == "string") then	-- 枚举+1
			tb_info[n_idx]	= tb_info[n_idx] + 1
		end
	end
	local n_data	= wlls_reg_savedata(tb_info)
	LG_ApplySetLeagueTask(WLLS_REG_LGTYPE, GetName(), 1, n_data)
end

-- 查看并编辑期望队友信息
function wlls_edit_need(str, b_query)
	if (str == "") then	-- 刚打开
		SetTaskTemp(WLLS_TEMPTASK, LG_GetLeagueTask(WLLS_REG_LGTYPE, GetName(), 2))
		if b_query then
			str	= "Xin thay i c竎 th玭g tin m芻 nh c馻 i h鱱 "
		else
			str	= "B筺 hi謓 gi�  c� th� thay i c竎 th玭g tin i h鱱"
		end
	end
	
	str	= "S� gi� li猲 u:\n#" .. str
	str	= str .. "\nHi謓 產ng thi誸 l藀:\n" .. wlls_get_needinfo(GetTaskTemp(WLLS_TEMPTASK))
	if b_query then
		str	= str .. "\n\nc� mu鑞 thay i kh玭g? Thay i xong l� c� th� ki觤 tra."
	else
		str	= str .. "\n\nc� mu鑞 thay i kh玭g? Thay i xong nh� 'L璾 thay i'."
	end
	
	local tb_option = {}
	for n_idx, tb_fmt in WLLS_REG_TABLE do
		tb_option[n_idx]	= "Thay i" .. tb_fmt[1] .. "/#wlls_want2modify_need(" .. n_idx .. "," .. tostring(b_query) .. ")"
	end
	
	if b_query then
		tb_option[getn(tb_option)+1] = "Ki觤 tra ngay/wlls_reg_query_begin"
		tb_option[getn(tb_option)+1] = "Tr� l筰/wlls_reg_query_menu"
	else
		tb_option[getn(tb_option)+1] = "L璾 thay i/#wlls_save_need()"
		tb_option[getn(tb_option)+1] = "L璾 v� ki觤 tra/#wlls_save_need(1)"
		tb_option[getn(tb_option)+1] = "H駓 b� thay i/wlls_view_me"
	end
	Say(str, getn(tb_option), tb_option)
end

-- 准备修改某项期望值
function wlls_want2modify_need(n_idx, b_query)
	local tb_fmt	= WLLS_REG_TABLE[n_idx]
	local tb_info	= wlls_reg_loaddata(GetTaskTemp(WLLS_TEMPTASK))
	local n_value	= tb_info[n_idx]
	local tb_option	= {}
	for i = 0, getn(tb_fmt[3]) do
		if (n_value ~= i) then
			tb_option[getn(tb_option)+1]	= wlls_get_oneneed(n_idx, i).."/#wlls_modify_need("..n_idx..","..i.."," .. tostring(b_query) .. ")"
		end
	end
	tb_option[getn(tb_option)+1]	= "Kh玭g thay i/#wlls_edit_need ('C� mu鑞 thay i thi誸 l藀 kh竎 kh玭g?'," .. tostring(b_query) .. ")"
	Say("S� gi� li猲 u: K� v鋘g l骳 trc <color=yellow>" .. tb_fmt[1] .. "<color>thi誸 l藀 l�:<color=yellow>" ..
		wlls_get_oneneed(n_idx, n_value) .. "<color>\nxin ch鋘 ph筸 vi m韎:", getn(tb_option), tb_option)
end

-- 要注销成员
function wlls_want2out()
	Say("S� gi� li猲 u: Sau khi x鉧, t蕋 c� c竎 tuy觧 th� kh竎 u s� kh玭g th� xem 頲 c竎 tin t鴆! Quy誸 nh k� ch璦?", 2, "Ta quy誸 nh x鉧!/wlls_doout", "Th玦 sau h絥g t輓h!/OnCancel")
end

-- 注销成员
function wlls_doout()
	LG_ApplyRemoveLeague(WLLS_REG_LGTYPE, GetName())
	Talk(1, "main", strfill_right("X鉧 th祅h c玭g", 30))
end

-- 查询菜单
function wlls_reg_query_menu()
	local tb_option = {}
	tb_option[getn(tb_option)+1]	= "T譵 hi觰 theo [t猲]/wlls_reg_query_name"
	for n_idx, tb_fmt in WLLS_REG_TABLE do
		tb_option[getn(tb_option)+1]	= "Theo [" .. tb_fmt[1] .. "] /#wlls_reg_query_single(" .. n_idx .. ")"
	end
	tb_option[getn(tb_option)+1] = "T譵 hi觰 cao c蕄/#wlls_edit_need('',1)"
	tb_option[getn(tb_option)+1] = "Tr� l筰"
	Say("S� gi� li猲 u: B筺 c� th� c╪ c� v祇 c竎 lo筰 h譶h kh竎 nhau  t譵 hi觰 tuy觧 th�, bao g錷 gi韎 t輓h, m玭 ph竔, ng c蕄.", getn(tb_option), tb_option)
end

-- 查看队友（输入）
function wlls_reg_query_name()
	AskClientForString("wlls_reg_query_name_do", "", 1, 16, "Nh藀 t猲 th祅h vi猲 mu鑞 t譵 hi觰")
end

-- 查看队友（查询）
function wlls_reg_query_name_do(str_name)
	Describe(wlls_get_infostr(str_name), 1, "Tr� l筰/wlls_reg_query_menu", "Tr� l筰")
end

-- 准备单项查询
function wlls_reg_query_single(n_idx)
	local tb_fmt	= WLLS_REG_TABLE[n_idx]
	local tb_option	= {}
	for i = 1, getn(tb_fmt[3]) do
		tb_option[getn(tb_option)+1]	= wlls_get_oneneed(n_idx, i).."/#wlls_reg_query_single_do("..n_idx..","..i..")"
	end
	tb_option[getn(tb_option)+1]	= "Tr� l筰/wlls_reg_query_menu"
	Say("S� gi� li猲 u: Hi謓 t筰 theo th� t�<color=yellow>"..tb_fmt[1].."<color> t譵 hi觰, xin ch鋘 ph筸 vi c莕 t譵 hi觰:", getn(tb_option), tb_option)
end

-- 单项查询
function wlls_reg_query_single_do(n_idx, n_need)
	local tb_info	= {}
	for n, tb_fmt in WLLS_REG_TABLE do
		if (n == n_idx) then
			tb_info[n]	= n_need
		else
			tb_info[n]	= 0
		end
	end
	SetTaskTemp(WLLS_TEMPTASK, wlls_reg_savedata(tb_info))
	wlls_reg_query_begin()
end

-- 多项查询
function wlls_reg_query_begin()
	SetStringTask(WLLS_STRINGTASK, "")
	wlls_reg_query_do()
end

-- 根据临时变量查询
function wlls_reg_query_do(str_name, b_next)
	-- 确定本页的第一个战队ID
	local n_lid
	local str_start
	if b_next then	-- 翻页，str_name是起始成员
		SetStringTask(WLLS_STRINGTASK, str_name)
		str_start	= str_name
	else
		str_start	= GetStringTask(WLLS_STRINGTASK)
	end
	if (str_start ~= "") then	-- 当前页
		n_lid	= LG_GetLeagueObj(WLLS_REG_LGTYPE, str_start)
	else	-- 第一页
		n_lid	= LG_GetFirstLeague(WLLS_REG_LGTYPE)
	end
	
	-- 继续查找战队
	local str_myname	= GetName()
	local str
	local tb_option	= {}
	local tb_need	= wlls_reg_loaddata(GetTaskTemp(WLLS_TEMPTASK))
	while (not FALSE(n_lid)) do
		local tb_info	= wlls_reg_loaddata(LG_GetLeagueTask(n_lid, 1))
		if (wlls_check_need(tb_need, LG_GetLeagueTask(n_lid, 1))) then	-- 找到一个匹配
			local str_lgname	= LG_GetLeagueInfo(n_lid)
			if (str_myname ~= str_lgname) then	-- 不能搜索自己
				local n_got	= getn(tb_option)
				if (n_got == 0) then	-- 第一个
					-- 显示要查询的战队
					if (not str_name) then 	-- 默认显示本页第一个
						str_name	= str_lgname
					end
					str	= wlls_get_infostr(str_name)
				elseif (getn(tb_option) >= 10) then	-- 已满
					str_name	= str_lgname
					break
				end
				if (str_lgname == str_name) then	-- 正是当前查询的战队
					tb_option[getn(tb_option)+1]	= "< " .. safeshow(str_name) .. " >/#wlls_reg_query_do('" .. safestr(str_name) .. "')"
				else
					tb_option[getn(tb_option)+1]	= safeshow(str_lgname) .. "/#wlls_reg_query_do('" .. safestr(str_lgname) .. "')"
				end
			end
		end
		n_lid = LG_GetNextLeague(WLLS_REG_LGTYPE, n_lid)
	end

	if (not str) then	-- 没能找到
		Say("S� gi� li猲 u: Xin l鏸! Kh玭g th� t譵 th祅h vi猲 ng k� ph� h頿 v韎 y猽 c莡.", 1, "Tr� l筰/wlls_reg_query_menu")
		return
	end

	if (not FALSE(n_lid)) then	-- 后面还有
		tb_option[getn(tb_option)+1]	= "Trang k� /#wlls_reg_query_do('" .. safestr(str_name) .. "', 1)"
	end
	tb_option[getn(tb_option)+1]	= "Tr� l筰/wlls_reg_query_menu"
	Describe(str, getn(tb_option), tb_option)
end

-- 修改某项期望值
function wlls_modify_need(n_idx, n_value, b_query)
	local tb_info	= wlls_reg_loaddata(GetTaskTemp(WLLS_TEMPTASK))
	tb_info[n_idx]	= n_value
	-- 符合一定逻辑
	if (n_idx == 2) then	-- 门派
		if (n_value == 1 or n_value == 2) then
			if (tb_info[1] == 2) then
				tb_info[1] = 1
			end
		elseif (n_value == 5 or n_value == 6) then
			if (tb_info[1] == 1) then
				tb_info[1] = 2
			end
		end
	elseif (n_idx == 1) then	-- 性别
		if (n_value == 1) then
			if (tb_info[2] == 5 or tb_info[2] == 6) then
				tb_info[2] = 0
			end
		elseif (n_value == 2) then
			if (tb_info[2] == 1 or tb_info[2] == 2) then
				tb_info[2] = 0
			end
		end
	end
	SetTaskTemp(WLLS_TEMPTASK, wlls_reg_savedata(tb_info))
	wlls_edit_need(WLLS_REG_TABLE[n_idx][1] .. " s鯽", b_query)
end

-- 保存期望队友信息
function wlls_save_need(b_query)
	local n_data	= GetTaskTemp(WLLS_TEMPTASK)
	if (n_data ~= LG_GetLeagueTask(WLLS_REG_LGTYPE, GetName(), 2)) then
		LG_ApplySetLeagueTask(WLLS_REG_LGTYPE, GetName(), 2, n_data)
	end
	Talk(1, iif(b_query, "wlls_reg_query_begin", "wlls_view_me"), strfill_right("B秓 l璾 th祅h c玭g!", 30))
end

-- 得到相应的成员信息字符串
function wlls_get_infostr(str_name)
	local n_lid	= LG_GetLeagueObj(WLLS_REG_LGTYPE, str_name)
	if FALSE(n_lid) then
		return "<link=image[0,8]:#npcspr:?NPCSID=87?ACTION=0>S� gi� li猲 u<link>: Xin l鏸! th祅h vi猲 '"..safeshow(str_name).."' kh玭g t錸 t筰, ho芻    x鉧 b�."
	end
	local n_data1	= LG_GetLeagueTask(n_lid, 1)
	local n_data2	= LG_GetLeagueTask(n_lid, 2)
	local tb_info	= wlls_reg_loaddata(n_data1)
	local str_ret
	if (tb_info[1] == 1) then
		str_ret = "<link=image[0,0]:\\spr\\Ui3\\玩家肖像\\肖像\\001.spr>" .. str_name .. "<link>\n"
	else
		str_ret = "<link=image[0,0]:\\spr\\Ui3\\玩家肖像\\肖像\\003.spr>" .. str_name .. "<link>\n"
	end
	for n_idx, tb_fmt in WLLS_REG_TABLE do
		local str	= wlls_get_oneinfo(n_idx, tb_info[n_idx])
		if (mod(n_idx, 2) == 1) then	-- 单数
			str_ret	= str_ret .. " " .. tb_fmt[1] .. ":" .. strfill_left(str, 10)
		else	-- 双数
			str_ret	= str_ret .. tb_fmt[1] .. ":" .. str .. "\n"
		end
	end
	n_lid	= LG_GetLeagueObjByRole(WLLS_LGTYPE, str_name)
	if FALSE(n_lid) then
		str_ret	= str_ret .. "chi課 i: kh玭g\n"
	else
		local str_lgname, _, n_count = LG_GetLeagueInfo(n_lid)
		local n_stype	= LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
		if (n_stype ~= GetGlbValue(GLB_WLLS_NEXT)) then
			str_ret	= str_ret .. "Chi課 i:"..str_lgname.." (Х qu� h筺) \n"
		else
			local str_lgname, _, n_count = LG_GetLeagueInfo(n_lid)
			local n_ntype	= GetGlbValue(GLB_WLLS_NEXT)
			local n_maxmem	= WLLS_TAB[n_ntype].max_member
			str_ret	= str_ret .. "Chi課 i:" .. str_lgname .. " (" .. n_count .. "/" .. n_maxmem .. ")\n"
		end
	end
	return str_ret .. "\nчi c� hy v鋘g:\n" .. wlls_get_needinfo(n_data2)
end

-- 得到相应的期望信息字符串
function wlls_get_needinfo(n_data)
	local tb_info	= wlls_reg_loaddata(n_data)
	local str_ret	= ""
	for n_idx, tb_fmt in WLLS_REG_TABLE do
		local str	= wlls_get_oneneed(n_idx, tb_info[n_idx])
		if (mod(n_idx, 2) == 1) then	-- 单数
			str_ret	= str_ret .. " " .. tb_fmt[1] .. ":" .. strfill_left(str, 10)
		else	-- 双数
			str_ret	= str_ret .. tb_fmt[1] .. ":" .. str .. "\n"
		end
	end
	return str_ret
end

-- 返回一条需求信息的字符串
function wlls_get_oneneed(n_idx, n_value)
	local tb		= WLLS_REG_TABLE[n_idx][3]
	local str_units	= WLLS_REG_TABLE[n_idx][4]
	if (type(tb[1]) == "table") then	-- 数值范围
		local tb_range	= tb[n_value]
		if (not tb_range) then
			return "Kh玭g v蕁 "
		elseif (not tb_range[1]) then
			return "#" .. tb_range[2] .. str_units
		elseif (not tb_range[2]) then
			return "#" .. tb_range[1] .. str_units
		else
			return tb_range[1] .. "~" .. tb_range[2] .. str_units
		end
	elseif (type(tb[1]) == "string") then	-- 枚举
		local str = tb[n_value]
		if (not str) then
			return "Kh玭g v蕁 "
		else
			return str
		end
	else
		error("type(tb[1]) == " .. type(tb[1]))
	end
end

-- 返回一条成员基本信息的字符串
function wlls_get_oneinfo(n_idx, n_value)
	local tb	= WLLS_REG_TABLE[n_idx][3]
	local str_units	= WLLS_REG_TABLE[n_idx][4]
	if (type(tb[1]) == "table") then	-- 数值
		if (n_value >= 255) then
			return "#" .. n_value .. str_units
		else
			return n_value .. str_units
		end
	elseif (type(tb[1]) == "string") then	-- 枚举
		local str = tb[n_value]
		if (not str) then
			return "Ch璦 bi誸"
		else
			return str
		end
	else
		error("type(tb[1]) == " .. type(tb[1]))
	end
end

-- 检查期望值是否符合
function wlls_check_need(tb_need, n_data)
	local tb_value	= wlls_reg_loaddata(n_data)
	for n_idx, tb_fmt in WLLS_REG_TABLE do
		local n_need	= tb_need[n_idx]
		if (n_need ~= 0) then
			local tb		= WLLS_REG_TABLE[n_idx][3]
			local n_value	= tb_value[n_idx]
			if (type(tb[1]) == "table") then	-- 数值范围
				local tb_range	= tb[n_need]
				if (not tb_range[1]) then
					if (n_value > tb_range[2]) then
						return
					end
				elseif (not tb_range[2]) then
					if (n_value < tb_range[1]) then
						return
					end
				else
					if (n_value < tb_range[1] or n_value > tb_range[2]) then
						return
					end
				end
			elseif (type(tb[1]) == "string") then	-- 枚举
				if (n_need ~= n_value) then
					return
				end
			else
				error("type(tb[1]) == " .. type(tb[1]))
			end
		end
	end
	return 1
end

-- 根据 信息 返回 保存的数据
function wlls_reg_savedata(tb_info)
	local n_data	= 0;
	n_data	= SetByte(n_data, 1, tb_info[1] * 16 + tb_info[2])
	n_data	= SetByte(n_data, 2, tb_info[3])
	n_data	= SetByte(n_data, 3, tb_info[4])
	n_data	= SetByte(n_data, 4, tb_info[5])
	return n_data
end

-- 根据 保存的数据 返回 信息
function wlls_reg_loaddata(n_data)
	local n_data1	= GetByte(n_data, 1)
	tb_info	= {
		floor(n_data1 / 16),
		mod(n_data1, 16),
		GetByte(n_data, 2),
		GetByte(n_data, 3),
		GetByte(n_data, 4),
	}
	return tb_info
end


