function GetDesc(nItem)
	return ""
end

--调试符纸对多少范围内的怪起作用
function testAround(nDist)
    local tbList,nCount = GetAroundNpcList(nDist, 8)
    	for i = 1,nCount do
    		local nNpcIndex = tbList[i]
    		local nNpcId = GetNpcSettingIdx(nNpcIndex)
    		if nNpcId == 849 then
    			local szNpcName = GetNpcName(nNpcIndex)
    			Msg2Player(format("%s trong ph筸 vi %d", szNpcName, nDist))
    		end
    end
end

function main(nItem)
	local nMapId, nX, nY = GetWorldPos()
	if nMapId ~= 395 then
		Msg2Player("V藅 ph萴 n祔 ch� 頲 s� d鬾g trong b秐  Thi猲 B秓 Kh�")
		return 1
	end
	
	local tbList,nCount = GetAroundNpcList(20, 8)--距离20大概为一屏范围
	for i = 1,nCount do
		local nNpcIndex = tbList[i]
		local nNpcId = GetNpcSettingIdx(nNpcIndex)
		if nNpcId == 849 then
			local szNpcName = GetNpcName(nNpcIndex)
			Msg2Player(szNpcName.."Kh竛g h醓 c馻  gi秏 xu鑞g")
			AddNpcSkillState(nNpcIndex, 1041, 1, 1, 18 * 60 * 60)
		end
	end
	
	Msg2Player("Ngi s� d鬾g 1 Tri謙 H醓 Ph�")
	WriteLog(format("Account:%s[Name:%s] s� d鬾g Tri謙 H醓 Ph�.",
				GetAccount(),
				GetName())
			);
	return
end
