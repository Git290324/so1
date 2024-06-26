Include("\\script\\missions\\leaguematch\\head.lua")
Include("\\script\\lib\\pay.lua")

local tbData = 
{
	["6,1,2213"] = {nTaskId = 1803, nExp = 50000000},
	["6,1,2214"] = {nTaskId = 1804, nExp = 120000000},
	["6,1,2215"] = {nTaskId = 1805, nExp = 200000000},
	["6,1,2216"]= {nTaskId = 1806, nExp = 280000000},
	["6,1,2217"] = {nTaskId = 1807, nExp = 400000000},

}

--TaskId 用法， 0~15位记录第几届联赛，16~32位记录使用次数
local _AddBitTask = function (nTaskId, nBitPos, nBitCount, nValue)
	local nOldValue = GetBitTask(nTaskId, nBitPos, nBitCount)
	SetBitTask(nTaskId, nBitPos, nBitCount, nOldValue + nValue)
end

function main(nItemIndex)
	local nG,nD,nP = GetItemProp(nItemIndex)
	local nMaxCount = 5
	local szKey = format("%d,%d,%d", nG,nD,nP)
	
	local Data = %tbData[szKey]
	local nWLLSId = GetGlbValue(GLB_WLLS_SID)
	if GetGlbValue(GLB_WLLS_PHASE) == 1 then
		nWLLSId = nWLLSId + 1
	end
	
	if GetBitTask(Data.nTaskId, 0, 15) ~= nWLLSId then
		SetBitTask(Data.nTaskId, 0, 15, nWLLSId)
		SetBitTask(Data.nTaskId, 16, 16, 0)
	end
	
	if GetBitTask(Data.nTaskId, 16, 16) >= nMaxCount then
		Talk(1, "", format("M鏸 m颽 li猲 u m鏸 nh﹏ v藅 ch� 頲 s� d鬾g %d o c� n祔.", nMaxCount))
		return 1
	end
	
	if GetLevel() < 120 or IsCharged() ~= 1 then
		Talk(1, "", "C蕄 120 tr� l猲 v�  n閜 th� m韎 c� th� s� d鬾g 頲.")
		return 1
	end
	
	
	AddOwnExp(Data.nExp)
	%_AddBitTask(Data.nTaskId, 16, 16, 1)
	
end