tbAccountGM = 
{ 
	[""] =
	{ 
		"" 
	}, 
	[""] = 
	{ 
		"" 
	}, 
}

tbAccountMod = 
{ 
	[""] = 
	{ 
		"" 
	}, 
	[""] = 
	{ 
		"" 
	}, 
}

function CheckAccountGM()
	dofile("script/global/namcung/gmquanlyserver/ds_gm.lua");	
	local szAccount = GetAccount() 
	local szName = GetName() 
	local tbRoleList = tbAccountGM[szAccount] 
	if tbRoleList then 
		for i=1, getn(tbRoleList) do 
			if tbRoleList[i] == szName then 
				return 1
			end 
		end 
	end 
end

function CheckAccountMod()
	dofile("script/global/namcung/gmquanlyserver/ds_gm.lua");	
	local szAccount = GetAccount() 
	local szName = GetName() 
	local tbRoleList = tbAccountMod[szAccount] 
	if tbRoleList then 
		for i=1, getn(tbRoleList) do 
			if tbRoleList[i] == szName then 
				return 1
			end 
		end 
	end 
end