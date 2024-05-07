-- ====================== 文件信息 ======================

-- 剑侠情缘网络版一追寻秘谱道具养生秘谱脚本

-- Edited by 子非魚
-- 2008/07/24 13:43

-- ======================================================

Include("\\script\\event\\guoqing_jieri\\200808\\head.lua");	-- 活动相关信息文件
Include("\\script\\lib\\pay.lua");

function main()
	zxmp_reset_vertsk();
	
	if (zxmp_200808_itemdate() ~= 1) then
		Msg2Player("V藅 ph萴 qu� h筺 s� d鬾g, t� ng m蕋 甶.")
		return 0;
	end
	
	if (GetLevel() < 50 or IsCharged() == 0) then
			Say("Ch� c� ngi ch琲 c蕄 tr猲 50  n筽 th� m韎 c� th� s� d鬾g.", 0)
		return 1;
	end
	
	local n_ran = random(100*10000);
	local n_sum = 0;
	local n_idx = 0;
	local sz_msg = "";
	
	for i, tb in TB_ZHUIXUNMIPU_ITEMLIST do
		n_sum = n_sum + tb.n_rate * 10000;
		if (n_sum >= n_ran) then
			n_idx = i;
			
			if (tb.n_type == 2) then
				local ng, nd, sz_name = tb.tb_itemid[1], tb.tb_itemid[2], tb.sz_name;
				AddGoldItem(ng, nd);
				sz_msg = format("Nh薾 頲 trang b� Ho祅g Kim %s", sz_name);
			elseif (tb.n_type == 1) then
				local ng, nd, np, nl, ns, nlk, sz_name = tb.tb_itemid[1], tb.tb_itemid[2], tb.tb_itemid[3], 
										tb.tb_itemid[4], tb.tb_itemid[5], tb.tb_itemid[6], tb.sz_name;
				AddItem(ng, nd, np, nl, ns, nlk);
				sz_msg = format("Nh薾 頲 %s", sz_name);
			elseif (tb.n_type == 3) then
				
				AddRepute(tb.n_repute);
				sz_msg = format("Nh薾 頲 %d 甶觤 danh v鋘g", tb.n_repute);
			end
			if (sz_msg ~= "") then
				Msg2Player(sz_msg);
				WriteLog(format("[%s]\t%s\tName:%s\tAccount:%s\t %s。","Dng sinh b� ph�",
							GetLocalDate("%Y-%m-%d,%X"),
							GetName(),
							GetAccount(),
							sz_msg	));
			end
			break
		end
	end
	
	if (n_idx == 0) then
		return 1;
	end
	
	local n_addexp = zxmp_200808_checkexp();
	
	if (n_addexp <= 0) then
		Msg2Player("Х t gi韎 h筺 800 tri謚 甶觤 kinh nghi謒, kh玭g th� ti誴 t鬰 nh薾 n鱝.");
	else
		AddOwnExp(n_addexp);
		SetTask(TSK_ZXMP_MAXEXP, GetTask(TSK_ZXMP_MAXEXP) + n_addexp);
		Msg2Player(format("B筺 nh薾 頲 %d 甶觤 kinh nghi謒.",n_addexp));
		WriteLog(format("[S� d鬾g %s]\t%s\tName:%s\tAccount:%s\t t╪g %s 甶觤 kinh nghi謒.", "Dng sinh b� ph�",
						GetLocalDate("%Y-%m-%d,%X"),
						GetName(),
						GetAccount(),
						n_addexp	));
	end
end

