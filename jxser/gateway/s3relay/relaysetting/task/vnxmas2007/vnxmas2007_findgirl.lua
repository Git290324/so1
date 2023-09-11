--圣诞活动，找寻圣诞少女
--2007-11-24
--by 小浪多多

Include("\\RelaySetting\\Task\\vnxmas2007\\vnxmas2007_head.lua")

function TaskShedule()
	TaskName("HOAT DONG TIM THIEU NU GIANG SINH");
	TaskInterval(20);
	local tb_xmas_time = tb_xmas2007_strattime
	local nhour = tonumber(date("%H"))
	local nstarth = 0
	if nhour >= 23 then
		nstarth = 8
	else
		for ni,nh in tb_xmas_time do
			if nh >= nhour then
				nstarth = nh
				break
			end
		end
	end
	local nmin = xmas2007_findgirl_returnmin()
	if nmin == 60 then
		nstarth = nstarth + 1
		nmin = 0
	end
	TaskTime(nstarth, nmin)
	OutputMsg(format("=====> HOAT DONG TIM THIEU NU GIANG SINH BAT DAU LUC %s:%s...",nstarth,nmin))
	TaskCountLimit(0);
end

function TaskContent()
	local ndate = tonumber(date("%y%m%d%H"))
	--if ndate < 07120800 or ndate > 19011324 then
		--return 
	--end
	local nhm = tonumber(date("%H%M"))
	
	if nhm >= 800 and nhm <= 900 then
		--通过pass
	elseif nhm >= 1000 and nhm <= 1100 then
		--通过pass
	elseif nhm >= 1200 and nhm <= 1300 then
		--通过pass
	elseif nhm >= 1400 and nhm <= 1500 then
		--通过pass
	elseif nhm >= 1600 and nhm <= 1700 then
		--通过pass
	elseif nhm >= 1800 and nhm <= 1900 then
		--通过pass
	elseif nhm >= 2100 and nhm <= 2200 then
		--通过pass
	elseif nhm >= 2200 and nhm <= 2300 then
		--通过pass
	elseif nhm >= 1500 and nhm <= 1600 then
		--通过pass
	else
		return
	end
	local ni = 0
	local tbmap = {}
	for nmapid,nitem in tb_xmas2007_city do
			ni = ni + 1
			tbmap[ni] = nmapid 
	end
	tbmap = YDBZ_get_randomlist(tbmap,ni)
	for ngirl=1,3 do 
		local selectmapid = tbmap[ngirl]
		GlobalExecute(format("dwf \\script\\event\\vnchristmas2007\\findgirl\\findgirl.lua xmars2007_findgirl([[%s]],[[%s]])",ngirl,selectmapid));
	end
	local szMsg = format("[T譵 ki誱 Thi誹 N� Th莕 B輂 Gi竛g sinh thi誹 n� B筩h Nhi, Йng Nhi, Tuy誸 Nhi  xu蕋 hi謓. Nhanh n B╪g Nhi  ghi danh.")
	GlobalExecute(format("dw AddLocalNews([[%s]])", szMsg))
	OutputMsg("=====> Hoat Dong Tim Thieu Nu Giang Sinh Bat Dau (vnxmas2007_findgirl.lua)")
end
function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
