local _GetNexStartTime = function(nStartHour, nStartMinute, nInterval)
	
	
	local nNextHour = nStartHour
	local nNextMinute = nInterval * ceil(nStartMinute / nInterval)
	
	if nNextMinute >= 60 then
		
		nNextHour = nNextHour + floor(nNextMinute / 60)
		nNextMinute = mod(nNextMinute, 60) 
	end
	
	if (nNextHour >= 24) then
		nNextHour = mod(nNextHour, 24);
	end;
	return nNextHour, nNextMinute
end

local _IsOpenModule = function ()
	
	return gb_GetModule("chunjie2009_dangboss")
end

Include("\\script\\gb_modulefuncs.lua")

function TaskShedule()
	--设置方案名称
	TaskName("Hoat Dong Dau Bo")
	
	local  nInterval = 60
	
	local nStartHour = tonumber(date("%H")) ;
	local nStartMinute = tonumber(date("%M"));
	
	local nNextHour, nNextMinute = %_GetNexStartTime(nStartHour, nStartMinute, nInterval)
	
	TaskTime(nNextHour, nNextMinute);

	--设置间隔时间，单位为分钟
	TaskInterval(nInterval) --nInterval分钟一次
	--设置触发次数，0表示无限次数
	
	
	TaskCountLimit(0)

	
	local szMsg = format("=====> %s Bat dau %d:%d va %d", "HOAT DONG DAU NGU",nNextHour, nNextMinute, nInterval)
	OutputMsg(szMsg);
end

function TaskContent()
	local nTime = tonumber(date("%H%M"))
	local nWeek	= tonumber(date("%w"))
	local nDate	= tonumber(date("%y%m%d"))
	local nTaskState = tonumber(date("%y%m%d%H"))
	
	
	--if %_IsOpenModule() ~= 1 then
		--return 
	--end

	
	--if nDate < 100610 or nDate > 190627 then
		--return
	--end
	local flag = 0
	
	
		
	if (nTime >= 900 and nTime < 1100) then
		flag = 1
	end
	if (nTime >= 1100 and nTime < 1300) then
		flag = 1
	end

	if (nTime >= 1300 and nTime < 1500) then
		flag = 1
	end

	if (nTime >= 1500 and nTime < 1700) then
		flag = 1
	end

	if (nTime >= 1700 and nTime < 1900) then
		flag = 1
	end

	if (nTime >= 1900 and nTime < 2100) then
		flag = 1
	end

	if (nTime >= 2100 and nTime < 2300) then
		flag = 1
	end

	if flag == 1 then
		local szMsg = "Ho箃 ng u ng�  b総 u m鋓 ngi nhanh ch蕁 n Chng Жng Cung N�  ghi danh."
		local szExec = format("dwf \\script\\missions\\dangboss\\dangbaossclass.lua tbDangBoss:StartGame()")
		--OutputMsg(szMsg)
		GlobalExecute(szExec)
		OutputMsg("=====> HOAT DONG DAU NGUU BAT DAU (dangboss.lua)");
	end
	
end



function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
