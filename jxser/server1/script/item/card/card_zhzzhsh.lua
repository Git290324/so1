--执子之手卡

--by yfeng
Include ("\\script\\event\\chinesenewyear\\eventhead.lua")

NUMPERMIN = 0  --分钟内拾取的卡数量
LASTTIME = 0 --上一次拾取时的时间

TID_VALIDATION = 501
TID_CARDNUMBER = 502
GETBYTE = 2

function ComputeTime()
	 return tonumber((((date("%m")-1)*30+date("%d")-1)*24+date("%H"))*60+date("%M"))
end

function main(idx)
	return 1
end

function IsPickable( nItemIndex, nPlayerIndex )
	return 1
end

function PickUp( nItemIndex, nPlayerIndex )
	if(not CHINESENEWYEAR) then
		return 0
	end
	local oldPlyIdx = PlayerIndex
	PlayerIndex = nPlayerIndex
	local size = GetTeamSize()
	local myName = GetName()
	local mySex = GetSex()
	local myCode = GetTask(TID_VALIDATION)
	local myNum = GetByte(GetTask(TID_CARDNUMBER),GETBYTE)
	local myLevel = GetLevel()
	if(size < 2) then --
		Msg2Player("B筺 頲 1 Uy猲 Μng M藅, nh璶g k� c� n nh� b筺 kh玭g th� m� c玭g n╪g c馻 th� n祔!")
		PlayerIndex = oldPlyIdx
		return 0
	end
	if(size > 2) then
		Msg2Player("B筺 頲 1 Uy猲 Μng M藅, nh璶g nhi襲 ngi th�, b筺 kh玭g bi誸 c飊g ai  m� c玭g n╪g c馻 th� n祔!")
		PlayerIndex = oldPlyIdx
		return 0
	end
	local otherIndex = GetTeamMember(1)
	if( otherIndex == nPlayerIndex) then
		otherIndex = GetTeamMember(2)
	end
	PlayerIndex = otherIndex
	otherName = GetName()
	otherSex = GetSex()
	otherCode = GetTask(TID_VALIDATION)
	otherNum = GetByte(GetTask(TID_CARDNUMBER),GETBYTE)
	otherLevel = GetLevel()
	PlayerIndex = nPlayerIndex
	if(otherSex == mySex) then
		Msg2Player("B筺 頲 Uy猲 Μng M藅, nh璶g kh玭g th� m� c玭g n╪g c馻 th� cho hai b筺 c飊g gi韎!")
		PlayerIndex = oldPlyIdx
		return 0
	end
	if(myCode == otherCode and myCode ~=0) then  --验证码相同
		if(myNum == otherNum) then --有情人，卡的数量一样。
			myNum = myNum + 1  --卡片数量累加
			otherNum = myNum
			Msg2Player("B筺 頲 Uy猲 Μng M藅, gi髉 cho duy猲 ph薾 c馻 b筺 v�     "..otherName.."th猰 g莕 nhau h琻. Hi謓 nay, b筺  t輈h l騳"..myNum.."Uy猲 Μng M藅.")
			AddOwnExp(myLevel * (20+0.1*myLevel)-10)
			SetTask(TID_CARDNUMBER,SetByte(GetTask(TID_CARDNUMBER),GETBYTE,myNum)) --回写信息
			PlayerIndex = otherIndex
			Msg2Player(myName.."頲 1 Uy猲 Μng M藅, gi髉 cho duy猲 ph薾 c馻 c竎 b筺 th猰 g莕 nhau h琻. Hi謓 nay, b筺  t輈h l騳"..otherNum.."Uy猲 Μng M藅.")
			AddOwnExp(otherLevel * (10+0.07*otherLevel))
			SetTask(TID_CARDNUMBER,SetByte(GetTask(TID_CARDNUMBER),GETBYTE,myNum)) --回写信息
			if(myNum > 98) then --达到99个，与子偕老啦
				myNum = 0
				PlayerIndex = nPlayerIndex
				AddSkillState(530,15,1,2*60*60*18)
				AddSkillState(533,1,1,2*60*60*18)
				Msg2Player("B筺  t輈h l騳 頲 99 Uy猲 Μng M藅! B筺 v� "..otherName.."c飊g m� c玭g n╪g c馻 thi謕 n祔. B筺 nh薾 頲 t╪g th猰 30 甶觤 may m緉 trong 2 gi�.")
				SetTask(TID_CARDNUMBER,SetByte(GetTask(TID_CARDNUMBER),GETBYTE,myNum)) --回写信息
				PlayerIndex = otherIndex
				AddSkillState(530,15,1,2*60*60*18)
				AddSkillState(533,1,1,2*60*60*18)
				Msg2Player("B筺  t輈h l騳 頲 99 Uy猲 Μng M藅! B筺 v� "..myName.."c飊g m� c玭g n╪g c馻 thi謕 n祔. B筺 nh薾 頲 t╪g th猰 30 甶觤 may m緉 trong 2 gi�.")
				SetTask(TID_CARDNUMBER,SetByte(GetTask(TID_CARDNUMBER),GETBYTE,myNum)) --回写信息
			end
			PlayerIndex = oldPlyIdx
			return 0
		end
		--移情别恋的一对
		if(myNum > otherNum) then --我比她卡多
			myNum = myNum - 1
			if(myNum ~= otherNum) then --损失了，还不等，没缘份啊
				otherNum = otherNum + 1  --你们的缘分再近一点。 :)
			end
		else  --她比我卡多
			myNum = myNum + 1  --加一个
			if(myNum ~=otherNum) then
				otherNum = otherNum - 1
			end
		end
		PlayerIndex = nPlayerIndex
		Msg2Player("B筺 頲 1 Uy猲 Μng M藅, c飊g"..otherName.."duy猲 ph薾 th猰 g莕 nhau h琻. B筺 hi謓  t輈h l騳 頲"..myNum.."Uy猲 Μng M藅.")
		SetTask(TID_CARDNUMBER,SetByte(GetTask(TID_CARDNUMBER),GETBYTE,myNum)) --回写信息
		PlayerIndex = otherIndex
		Msg2Player(myName.."頲 1 Uy猲 Μng M藅, duy猲 ph薾 c馻 b筺 th猰 g莕 nhau h琻. Hi謓 nay, b筺 t輈h l騳 頲"..otherNum.."Uy猲 Μng M藅.")
		SetTask(TID_CARDNUMBER,SetByte(GetTask(TID_CARDNUMBER),GETBYTE,otherNum)) --回写信息
		PlayerIndex = oldPlyIdx
		return 0
	end
	--验证码不同，或者都是0
	local code = GetValidateCode(nPlayerIndex)
	Msg2Player("B筺 頲 1 Uy猲 Μng M藅, ng th阨 c飊g"..otherName.."b総 u b総 u cu閏 t譶h duy猲. ")
	SetTask(TID_VALIDATION,code)
	PlayerIndex = otherIndex
	Msg2Player(myName.."c 1 Uy猲 Μng M藅, ng th阨 c飊g b筺 b総 u cu閏 t譶h duy猲.")
	SetTask(TID_VALIDATION,code)
	PlayerIndex = oldPlyIdx
	return 0
end

function GetValidateCode(plyIdx)
	local oPID = PlayerIndex
	PlayerIndex = plyIdx
	local mid = GetWorldPos()
	PlayerIndex = oPID
	local time = ComputeTime() --(((date("%m")-1)*30+date("%d")-1)*24+date("%H"))*60+date("%M")
	
	if(time == LASTTIME) then
		NUMPERMIN = NUMPERMIN + 1
	---+----------------+---------+-------+
	---|   LASTTIME     |  MAPID  |NUM/MIN|
	---+----------------+---------+-------+
	---|    16 BIT      |  9 BIT  |  7BIT |
	---+----------------+---------+-------+
	---|     65535      |   511   |  127  |
	---+----------------+---------+-------+
		return LASTTIME * 65536 + mid*128 + NUMPERMIN
	end
	LASTTIME = time
	NUMPERMIN = 0
	return LASTTIME * 65536 + mid*128 + NUMPERMIN
end
