-- 文件名　：callbosslingpai.lua
-- 创建者　：wangjingjun
-- 内容　　：只可以在各大主城，新手村的野外和帮会地图call
-- 创建时间：2011-11-11 14:56:18
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\activitysys\\functionlib.lua")
IncludeLib("TASKSYS");

function checkfightstate()
	if ( GetFightState() == 0 ) then	--非战斗区禁用
		Msg2Player("Kh玭g � trong tr筺g th竔 chi課 u th� kh玭g th� s� d鬾g");
		return 0
	end
	return 1
end

local tbUseOnlyInMap = 
{
	586,587,588,589,590,591,592,593,594,595,596,597,598,599,600,601,602,603,604,53
}
local checkOnlyUseInMap = function()
	local nMapId = SubWorldIdx2MapCopy(SubWorld)
	for i = 1, getn( %tbUseOnlyInMap ) do		--特殊地图禁用
		if( %tbUseOnlyInMap[i] == nMapId ) then
			return 1
		end
	end
	return 0
end


function getbossinfo(nItemIdx)
	local tbBossInfomation = {
		-- bossid, bosslvl, bossname
		[4346] = {1335,95,"Bia Luy謓 Skill",},		
	}
	local G,D,P = GetItemProp(nItemIdx)
	local szBossname = tbBossInfomation[P][3]
	local nBossLevel = tbBossInfomation[P][2]
	local nBossId = tbBossInfomation[P][1]
	return szBossname, nBossLevel, nBossId
end

function callboss(szBossname, nBossLevel, nBossId)
	local nMapId,nPosX,nPosY = GetWorldPos()
	local tbGoldBoss = 
	{
		szName = szBossname, 
		nLevel = nBossLevel,
		nNpcId = nBossId,
		nIsboss = 1,
		tbNpcParam = {nBossId,},
	}
	
	--if basemission_CallNpc(tbGoldBoss, nMapId, nPosX * 32, nPosY * 32) then
	--	WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."] D飊g l謓h b礽 g鋓 Boss  g鋓 Boss Ho祅g Kim: "..szBossname);
	--	return 1
	--end
	--return 0
end

function main()
	dofile("script/global/namcung/nguoituyet.lua");
	if checkfightstate() ~= 1 then
			Msg2Player("Kh玭g th� s� d鬾g v藅 ph萴 n祔 t筰 y.")
		return 1
	end
	if %checkOnlyUseInMap() ~= 1 then
		Msg2Player("Kh玭g th� s� d鬾g v藅 ph萴 n祔 t筰 y.")
		return 1
	end
	local nMapId,nPosX,nPosY = GetWorldPos()
	local mapidx = SubWorldID2Idx(nMapId)
	local npcindex = AddNpcEx(1335, 95, random(0,4), mapidx, nPosX*32, nPosY *32, 1, "Bia Luy謓 Skill", 1)
		SetNpcScript(npcindex, "\\script\\global\\namcung\\nguoituyet.lua");
		SetNpcParam(npcindex, 1, 1335)
		SetNpcTimer(npcindex, 24*60*60*18);-- 24 gio
--		WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."] goi bia: "..szBossname.." tai "..mapidx.." toa do "..nPosX.."/"..nPosY.." roi  ");
	--return 0
end

function OnTimer(nNpcIndex, nTimeOut) 
	DelNpc(nNpcIndex);
end

function logplayer(zFile,szMsg)
  local handle = openfile(zFile,"a")
  write(handle,format("%s\n",szMsg));
  closefile(handle);
 end
function main1(nItemIdx)
	if checkfightstate() ~= 1 then
		return 1
	end
	
	--if %checkOnlyUseInMap() ~= 1 then
	--	Msg2Player("Kh玭g th� s� d鬾g v藅 ph萴 n祔 t筰 y.")
	--	return 1
	--end
	local szBossname, nBossLevel, nBossId = getbossinfo(nItemIdx)

	if callboss(szBossname, nBossLevel, nBossId) ~= 1 then
		Msg2Player("Tri謚 h錳 Boss th蕋 b筰, xin th� l筰")
		return 1
	end
	
	return 0
end