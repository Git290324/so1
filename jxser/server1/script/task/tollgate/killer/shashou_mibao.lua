-- ====================== 文件信息 ======================

-- 剑侠情缘网络版越南收费版 - 道具:杀手秘宝
-- 文件名　：shashou_mibao.lua
-- 创建者　：子非魚
-- 创建时间：2010-05-24 11:40:18

-- ======================================================

Include("\\script\\lib\\awardtemplet.lua");		-- 奖励模板
Include("\\script\\task\\tollgate\\killer\\mibao_head.lua")

local n_XuanTian_Chui = 6;

function main(nItemIdx)
	local n_curcnt = CalcItemCount(3, 6,1,2348,-1);
	if (n_curcnt < %n_XuanTian_Chui) then
		Msg2Player(format("C莕 %d %s, c竎 h� 甧m kh玭g  s� lng!", %n_XuanTian_Chui, "Huy襫 Thi猲 Ch飝"));
		return 1
	end
	if (CalcFreeItemCellCount() >= 3 and ConsumeItem(3, %n_XuanTian_Chui, 6,1,2348,-1)) then
		tbAwardTemplet:GiveAwardByList(tbItem_Mibao, format("USE %s", "S竧 Th� B� B秓"))
		AddStatData("baoxiangxiaohao_kaishashoumibao", 1)		-- 数据埋点第一期
	else
		Msg2Player("Kho秐g tr鑞g trong t骾 kh玭g ! ");
		return 1
	end
end
