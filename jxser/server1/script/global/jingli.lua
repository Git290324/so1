-- 精力系统 wangbin 2010-4-7
Include("\\script\\lib\\common.lua")
Include("\\script\\lib\\player.lua")
Include("\\script\\global\\playerlist.lua")

MAXCOUNT_EVERYDAY				= 8						-- 每天修炼灵露的次数限制
MIN_LEVEL						= 90
TIMEOUT_REFINING				= 30					-- 炼制一个混元灵露需要的时间（分钟）
TOTALENERGY_LIMIT_PERMONTH		= 80000					-- 每个月最多只能增加80000的精力
POTION_ENERGY					= 100					-- 使用混元灵露可获得的精力值
ITEM_YUGUAN						= {6, 1, 2311, 1, 0, 0}	-- 玉罐
ITEM_HUNYUANLINGLU 				= {6, 1, 2312, 1, 0, 0}	-- 混元灵露
TASK_HUNYUANLINGLU_STARTDATE	= 2673					-- 当日已修炼次数 * 1000000 + 混元灵露开始修炼日期（YYMMDD）
TASK_HUNYUANLINGLU_REFINING		= 2674					-- 混元灵露修炼完成数量 * 100000 + 是否正在修炼 * 10000 + 混元灵露累计修炼时间（分钟）
TASK_HUNYUANLINGLU_USEDATE		= 2675					-- 上一次使用混元灵露的日期（YYYYMMDD）
TASK_HUNYUANLINGLU_TOTALENERGY	= 2676					-- 当前使用混元灵露增加了多少精力
TASK_REFININGCOUNT				= 2793					-- 待修炼的混元灵露数目

HunyuanPotion = {}

function HunyuanPotion:New(player)
	local tb = clone(HunyuanPotion)
	tb.m_Player = player
	return tb
end

function HunyuanPotion:EncodeDateTask(count, date)
	local task = count * 1000000 + date
	self.m_Player:SetTask(TASK_HUNYUANLINGLU_STARTDATE, task)
end

function HunyuanPotion:DecodeDateTask()
	local task = self.m_Player:GetTask(TASK_HUNYUANLINGLU_STARTDATE)
	local count = floor(task / 1000000)
	local time = mod(task, 1000000)
	return count, time
end

function HunyuanPotion:EncodeRefiningTask(count, flag, time)
	local task = count * 100000 + flag * 10000 + time
	self.m_Player:SetTask(TASK_HUNYUANLINGLU_REFINING, task)
end

function HunyuanPotion:DecodeRefiningTask()
	local task = self.m_Player:GetTask(TASK_HUNYUANLINGLU_REFINING)
	local count = floor(task / 100000)
	local left = mod(task, 100000)
	local flag = floor(left / 10000)
	local time = mod(left, 10000)
	return count, flag, time
end

-- 查询是否正在修炼
function HunyuanPotion:GetRefiningFlag()
	local _, flag, _ = self:DecodeRefiningTask()
	return flag
end

-- 设置是否正在修炼
function HunyuanPotion:SetRefiningFlag(flag)
	local count, _, time = self:DecodeRefiningTask()
	self:EncodeRefiningTask(count, flag, time)
end

-- 查询今日已修炼次数
function HunyuanPotion:GetCurrentDateRefineCount(curr_date)
	if (not curr_date) then
		curr_date = tonumber(GetLocalDate("%y%m%d"))
	end
	local count, date = self:DecodeDateTask()
	if (curr_date ~= date) then
		return 0
	else
		return count
	end
end

-- 清除今日已修炼次数
function HunyuanPotion:ClearCurrentDateRefineCount()
	local _, date = self:DecodeDateTask()
	self:EncodeDateTask(0, date)
end

-- 增加今日已修炼次数
function HunyuanPotion:AddCurrentDateRefineCount(curr_date)
	if (not curr_date) then
		curr_date = tonumber(GetLocalDate("%y%m%d"))
	end
	local count, date = self:DecodeDateTask()
	if (curr_date ~= date) then
		date = curr_date
		count = 1
	else
		count = count + 1
	end
	self:EncodeDateTask(count, date)
end

-- 获取开始修炼日期
function HunyuanPotion:GetRefineDate()
	local count, date = self:DecodeDateTask()
	return date
end

-- 设置开始修炼日期
function HunyuanPotion:SetRefineDate(date)
	local count, _ = self:DecodeDateTask()
	self:EncodeDateTask(count, date)
end

-- 获取已经修炼完成的灵露数量
function HunyuanPotion:GetFinishedCount()
	local count, flag, time = self:DecodeRefiningTask()
	return count
end

-- 增加已经修炼完成的灵露数量
function HunyuanPotion:AddFinishedCount()
	local count, flag, time = self:DecodeRefiningTask()
	self:EncodeRefiningTask(count + 1, flag, time)
end

-- 清除已经修炼完成的灵露数量
function HunyuanPotion:ClearFinishedCount()
	local count, flag, time = self:DecodeRefiningTask()
	self:EncodeRefiningTask(0, flag, time)
end

-- 减少已经修炼完成的灵露数量
function HunyuanPotion:ReduceFinishedCount(count)
	local count_now, flag, time = self:DecodeRefiningTask()
	if (count_now <= count) then
		count_now = 0
	else
		count_now = count_now - count
	end
	self:EncodeRefiningTask(count_now, flag, time)
end

-- 查询修炼时间（分钟）
function HunyuanPotion:GetRefiningTime()
	local _, _, time = self:DecodeRefiningTask()
	return time
end

-- 增加修炼时间（分钟）
function HunyuanPotion:AddRefiningTime(minutes)
	local count, flag, time = self:DecodeRefiningTask()
	time = time + minutes
	self:EncodeRefiningTask(count, flag, time)
	local msg = format("H鏽 nguy猲 linh l� c馻 i hi謕  luy謓 頲 %d ph髏.", time)
	self.m_Player:Msg2Player(msg)
end

-- 清除修炼时间（分钟）
function HunyuanPotion:ClearRefiningTime()
	local count, flag, time = self:DecodeRefiningTask()
	if (time > 0) then
		self:EncodeRefiningTask(count, flag, 0)
	end
end

-- 消耗玉罐
function HunyuanPotion:ConsumeYuguan(count)
	if (count <= 0 or
		self.m_Player:CalcEquiproomItemCount(
			ITEM_YUGUAN[1],
			ITEM_YUGUAN[2],
			ITEM_YUGUAN[3],
			ITEM_YUGUAN[4]) < count) then
		return 0
	end
	local result = self.m_Player:ConsumeEquiproomItem(
		count,
		ITEM_YUGUAN[1],
		ITEM_YUGUAN[2],
		ITEM_YUGUAN[3],
		ITEM_YUGUAN[4])
	if (result == 1) then
		return 1
	else
		return 0
	end
end

-- 使用混元灵露
-- 增加精力的参数	by wangjingjun
function HunyuanPotion:Use(nEnergy)
	-- 若nEnergy为空，则用默认的混元灵露的值，否则为新增加的值
	nEnergy = nEnergy or POTION_ENERGY	 
	local player = self.m_Player
	local old_energy = player:GetEnergy()
	local nToday = GetLocalDate("%Y%m%d")
	local nLastDate = player:GetTask(TASK_HUNYUANLINGLU_USEDATE)
	local nCurAddEnergy = player:GetTask(TASK_HUNYUANLINGLU_TOTALENERGY)
	local nCurMonth = floor(nToday/100)
	local nLastMonth = floor(nLastDate/100)
	
	if (nCurMonth ~= nLastMonth) then
		nLastDate = nToday;
		nCurAddEnergy = 0;
	end
	
	if (old_energy + nEnergy > 2000000000) then
		player:Say("觤 tinh l鵦 t n m鴆 cao nh蕋, kh玭g th� ti誴 t鬰 s� d鬾g h鏽 nguy猲 linh l�.")
		return 0
	elseif (nCurAddEnergy + nEnergy > TOTALENERGY_LIMIT_PERMONTH) then
		player:Say(format("M鏸 nh﹏ v藅 m鏸 th竛g nhi襲 nh蕋 ch� 頲 %d tinh l鵦", TOTALENERGY_LIMIT_PERMONTH))
		return 0
	elseif (self.m_Player:AddEnergy(nEnergy) ~= 1) then
		player:Say("T╪g 甶觤 tinh l鵦 th蕋 b筰.")
		return 0
	else
		nCurAddEnergy = nCurAddEnergy + nEnergy
		player:SetTask(TASK_HUNYUANLINGLU_USEDATE, nLastDate)
		player:SetTask(TASK_HUNYUANLINGLU_TOTALENERGY, nCurAddEnergy)
		
		local account = player:GetAccount()
		local name = player:GetName()
		local new_energy = player:GetEnergy()
		WriteLog(format("%s(%s) use hunyuanlinglu to add enery(%d=>%d) cur month energy (%d)",
			player:GetAccount(),
			player:GetName(),
			old_energy,
			self.m_Player:GetEnergy(),
			nCurAddEnergy))
		player:Msg2Player(format("T╪g %d 甶觤 tinh l鵦. Th竛g n祔  nh薾 頲 %d tinh l鵦.", nEnergy, nCurAddEnergy))
		return 1
	end
end

JingliList = {m_List = {}}

function JingliList:Add(index, item)
	self.m_List[index] = item
end

function JingliList:Del(index)
	self.m_List[index] = nil
end

function JingliList:GetCount()
	local count = 0
	for key, value in self.m_List do
		if (value) then
			count = count + 1
		end
	end
	return count
end

function JingliList:Find(index)
	return self.m_List[index]
end

function JingliList:OnTime(player, id)
	local jingli = self:Find(player)
	if (not jingli) then
		return 0
	else
		local result = jingli:OnTime()
		if (result == 0) then
			jingli:Destroy()
			return 0
		else
			return result, player
		end
	end
end

Jingli = {}

function Jingli:New(player, potion)
	local tb = clone(Jingli)
	tb.m_Timeout = 18 * 60
	tb.m_Player = player
	if (not potion) then
		tb.m_Potion = HunyuanPotion:New(player)
		tb.m_Potion:AddCurrentDateRefineCount(nil)
	else
		tb.m_Potion = potion
	end
	tb.m_TimerId = AddTimer(18 * 60, "JingliList:OnTime", player.m_PlayerIndex)
	JingliList:Add(player.m_PlayerIndex, tb)
	tb.m_Potion:SetRefiningFlag(1)
	tb.m_OwnerName = player:GetName()
	
	player:Msg2Player("B総 u tu luy謓 h鏽 nguy猲 linh l�")
	WriteLog(format("%s(%s) begin hunyunlnglu refining",
		player:GetAccount(),
		player:GetName()))
	return tb
end

function Jingli:Destroy()
	if (self.m_TimerId > 0) then
		DelTimer(self.m_TimerId)
		self.m_TimerId = 0
		JingliList:Del(self.m_Player.m_PlayerIndex)
		self.m_Player = nil
		self.m_OwnerName = ""
	end
end

function Jingli:GetTime()
	return self.m_Potion:GetRefiningTime()
end

function Jingli:ClearRefining()
	self.m_Potion:ClearRefiningTime()
	self.m_Potion:SetRefiningFlag(0)
end

function Jingli:OnTime()
	local player = self.m_Player
	local potion = self.m_Potion
	local name = player:GetName()
	if (self.m_OwnerName ~= name) then
		WriteLog(format("[ERROR JINGLI]owner chanage: %s => %s", self.m_OwnerName, name))
		return 0
	end
	potion:AddRefiningTime(1)
	if (potion:GetRefiningTime() < TIMEOUT_REFINING) then
		return self.m_Timeout
	end
	self:Success()
	potion:ClearRefiningTime()
	local count = player:GetTask(TASK_REFININGCOUNT)
	if (count > 0) then
		-- 继续炼制下一个混元灵露
		player:SetTask(TASK_REFININGCOUNT, count - 1)
		potion:AddCurrentDateRefineCount(nil)
		return self.m_Timeout
	else
		-- 结束炼制
		potion:SetRefiningFlag(0)
		player:SetTask(TASK_REFININGCOUNT, 0)
		return 0
	end
end

function Jingli:Success()
	local account = self.m_Player:GetAccount()
	local name = self.m_Player:GetName()
	local item = self.m_Player:AddItemIntoEquipmentBox(
		ITEM_HUNYUANLINGLU[1],
		ITEM_HUNYUANLINGLU[2],
		ITEM_HUNYUANLINGLU[3],
		ITEM_HUNYUANLINGLU[4],
		ITEM_HUNYUANLINGLU[5],
		ITEM_HUNYUANLINGLU[6])
	if (item > 0) then
		WriteLog(format("%s(%s) refine hunyuanlinglu ok", account, name))
		self.m_Player:Msg2Player("Чi hi謕  ch� th祅h c玭g 1 h鏽 nguy猲 linh l�")

		Jiluhunyuan(1)
	else
		self.m_Potion:AddFinishedCount()
		WriteLog(format("%s(%s) add stored hunyuanlinglu(%d)",
			account,
			name,
			self.m_Potion:GetFinishedCount()))
		self.m_Player:Msg2Player("Чi hi謕  ch� t筼 th祅h c玭g 1 h鏽 nguy猲 linh l�, xin h穣 n <color=red>o hoa 萵 s�<color> ho芻 <color=red>th蕋 i th祅h th� dc 甶誱 <color>  nh薾.")
	end
end

-- NPC对话入口
function dlg_entrance(playerindex)
	local player = PlayerList:GetPlayer(playerindex)
	-- player:Say("此功能暂未开放。")
	JingliDlg:Main(player)
end

-- 炼制混元灵露
function dlg_refine()
	local player = PlayerList:GetPlayer(PlayerIndex)
	return JingliDlg:Refine(player)
end

-- 领取混元灵露
function dlg_get()
	local player = PlayerList:GetPlayer(PlayerIndex)
	JingliDlg:Draw(player)
end

-- 设置修炼数量
function dlg_inputcount()
	local player = PlayerList:GetPlayer(PlayerIndex)
	local potion = HunyuanPotion:New(player)
	local count = JingliDlg:Check(player, potion, 0)
	if (count > 0) then
		player:AskClientForNumber(
			"callback_inputcount",
			1,
			count,
			"Ngi mu鑞 ch� luy謓 bao nhi猽 c竔?")
	end
end

function callback_inputcount(count)
	if (count > 0) then
		local player = PlayerList:GetPlayer(PlayerIndex)
		local potion = HunyuanPotion:New(player)
		JingliDlg:Refine(player, potion, count)
	end
end

JingliDlg = {}

function JingliDlg:Check(player, potion, count_input)
	if (player:GetLevel() < MIN_LEVEL) then
		local fmt = "Ch� luy謓 h鏽 nguy猲 linh l� c莕 t n m閠 tr譶h  v� c玭g nh蕋 nh, i hi謕 %s h穣 luy謓 n c蕄 <color=red>%d<color> r錳 m韎 n y nh�"
		local msg = nil
		if (player:GetSex() == 1) then
			msg = format(fmt, "N� hi謕", MIN_LEVEL)
		else
			msg = format(fmt, "Thi誹 hi謕", MIN_LEVEL)
		end
		player:Say(msg)
		return 0
	elseif (player:IsCharged() == 0) then
		player:Say("Ch� c� nh﹏ v藅  n閜 th� m韎 c� th� ch� luy謓 'h鏽 nguy猲 linh l�'")
		return 0
	elseif (potion:GetFinishedCount() > 0) then
		player:Say("Xin h穣 nh薾 l蕐 h鏽 nguy猲 linh l�  ch� luy謓 ho祅 t蕋.")
		return 0
	end
	local count_day = potion:GetCurrentDateRefineCount(nil)	-- 当天已修炼的次数
	local count_cur = player:GetTask(TASK_REFININGCOUNT)	-- 连续修炼的次数
	if (count_day >= MAXCOUNT_EVERYDAY) then
		player:Say(
			format("H玬 nay c竎 h�  ch� luy謓 qua <color=red>%d<color> l莕 r錳, xin h穣 i ng祔 mai quay l筰.",
			MAXCOUNT_EVERYDAY))
		return 0
	end
	local count_ok = MAXCOUNT_EVERYDAY - count_day - count_cur
	if (count_ok <= 0) then
		player:Say("S� l莕 tu luy謓  , xin h穣 i ng祔 mai  ch� luy謓 h鏽 nguy猲 linh l�")
		return 0
	elseif (count_ok < count_input) then
		player:Say(format("H玬 nay nhi襲 nh蕋 ch� 頲 luy謓 th猰 %d h鏽 nguy猲 linh l�, xin h穣 nh藀 s� lng c莕 ch� luy謓.", count_ok))
		return 0
	else
		return count_ok
	end
end

function JingliDlg:Main(player)
	player:Say(
		"V筺 v藅 tr猲 th� gian u ch鴄 linh kh� thi猲 a, n誹 nh� ngi c� 'ng鋍 qu竛' th� c� th� ti課 h祅h thu th藀 linh kh� 頲, sau khi thu th蕄 30 ph髏 linh kh� c� th� ch� luy謓 th祅h 'h鏽 nguy猲 linh l�'! Sau khi s� d鬾g linh l� n祔 c� th� gia t╪g tinh kh� n閕 l鵦!? ",
		3,
		"B総 u luy謓 h鏽 nguy猲 linh l�/dlg_inputcount",
		"Nh薾 h鏽 nguy猲 linh l�  g鰅./dlg_get",
		"K誸 th骳 i tho筰/Cancel")
end

function JingliDlg:Refine(player, potion, count)
	if (count <= 0 or self:Check(player, potion, count) == 0) then
		return 0
	elseif (potion:ConsumeYuguan(count) ~= 1) then
		player:Say(format(
			"Kh玭g b閠  g閠 n猲 h�, ngi v蒼 ch璦 c� <color=red>%d<color> ng鋍 qu竛 th� l穙 phu c騨g nh b� tay<enter><color=yellow><Ng鋍 qu竛 c騨g 頲 b竛 � K� Tr﹏ C竎 , xin h穣 b蕀 v祇 � tr遪 tr遪 � b猲 g鉩 di ph秈 m祅 h譶h><color>",
			count))
		return 0
	end
	if (potion:GetRefiningFlag() == 0) then	
		Jingli:New(player)
		player:AddTask(TASK_REFININGCOUNT, count - 1)
	else
		player:AddTask(TASK_REFININGCOUNT, count)
	end
	WriteLog(format("%s(%s) start hunyuanlinglu refining, count(%d)",
		player:GetAccount(),
		player:GetName(),
		count))
	player:Say(format("Ng鋍 qu竛 � t筰 y c� d竛 b颽 ch�, ngi h穣 mau 甶 thu th藀, sau <color=red>%d ph髏<color> c� th� ho祅 th祅h!", TIMEOUT_REFINING))
	return 1
end

function JingliDlg:Draw(player)
	local potion = HunyuanPotion:New(player)
	local count = potion:GetFinishedCount()
	if (count <= 0) then
		player:Say("Ngi v蒼 ch璦 g鰅 cho ta h鏽 nguy猲 linh l�.")
		return
	end
	local item_count = 0
	for i = 1, count do
		local idx = player:AddItemIntoEquipmentBox(
						ITEM_HUNYUANLINGLU[1],
						ITEM_HUNYUANLINGLU[2],
						ITEM_HUNYUANLINGLU[3],
						ITEM_HUNYUANLINGLU[4],
						ITEM_HUNYUANLINGLU[5],
						ITEM_HUNYUANLINGLU[6])
		if (idx <= 0) then
			break
		else
			item_count = item_count + 1
		end
	end
	if (item_count == 0) then
		player:Say("Xin h穣 s緋 x誴 l筰 h祅h trang.")
		return
	end
	potion:ReduceFinishedCount(item_count)
	WriteLog(format("%s(%s) receive stored hunyuanlinglu, count(%d)",
		player:GetAccount(),
		player:GetName(),
		item_count))
	Jiluhunyuan(item_count)
	if (item_count < count) then
		player:Say(format("Зy l� h鏽 nguy猲 linh l� <color=red>%d<color> m� nh� ngi  g鰅 ta, h穣 chu萵 b� h祅h trang  nh薾 <color=red>%d<color> h鏽 nguy猲 linh l�",
			item_count,
			count - item_count))
	else
		player:Say(format("Зy l� <color=red>%d<color> h鏽 nguy猲 linh l� m� ngi  g鰅, xin h穣 nh薾 l蕐.", item_count))
	end
end

-- 进入或者离开游戏世界
function WorldEntranceLogin(nPlayerIndex, bExchangeIn)
	WorldEntrance(nPlayerIndex, 1)
end

function WorldEntranceLogout(nPlayerIndex)
	WorldEntrance(nPlayerIndex, 0)
end

function WorldEntrance(playerindex, in)
	if (in == 1) then
		local player = PlayerList:GetPlayer(playerindex)
		local potion = HunyuanPotion:New(player)
		Enter(player, potion)
	else
		local obj = JingliList:Find(playerindex)
		if (obj) then
			obj:Destroy()
		end
	end
end

function Enter(player, potion)
	if (potion:GetRefiningFlag() == 1) then
		Jingli:New(player, potion)
	end
end


function Jiluhunyuan(nCount)
	if nCount <= 0 then
		return
	end
	AddStatData("linluchanchu_lianzhilinlu", nCount)	--数据埋点第一期
end