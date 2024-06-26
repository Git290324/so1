IncludeLib("ITEM");
IncludeLib("FILESYS")

TB_PLATINARECOIN_INFO ={
--[白金ID] = {装备名, 补天中数量};
--[1] = {"梦龙之正黄僧帽", 2},
}
RECOIN_PLATINA_DATE_RANGE = {20070420, 20070426};

function LoadPlatinaCoinSettingTmp()
	
	local b1 = TabFile_Load("\\settings\\task\\equipex\\platina_def_tmp.txt", "PlatinaDataRecoinTmp")
	if b1~=1 then
		print("T秈 t藀 tin th╪g c蕄 trang b� B筩h Kim th蕋 b筰!")
		return
	end
	local nRowCount = TabFile_GetRowCount("PlatinaDataRecoinTmp", "EQUIPNAME")
	
	for y = 2, nRowCount do
		local platinaid = tonumber(TabFile_GetCell("PlatinaDataRecoinTmp", y, "PLATINAID"));
		local recoin = tonumber(TabFile_GetCell("PlatinaDataRecoinTmp", y, "RECOIN"));
		local name = TabFile_GetCell("PlatinaDataRecoinTmp", y, "EQUIPNAME");
		if (recoin ~= nil and recoin > 0) then
			TB_PLATINARECOIN_INFO[platinaid] = {name, recoin, platinaid};
		end;
	end	
end;

LoadPlatinaCoinSettingTmp()

--白金装备重铸入口
function recoin_platina_main()
	local nTodayString = tonumber(GetLocalDate("%Y%m%d"));
	local aryDescribe = {};
	reloadRecoinPlatinaDate();
	if (nTodayString < RECOIN_PLATINA_DATE_RANGE[1] or nTodayString > RECOIN_PLATINA_DATE_RANGE[2]) then
		aryDescribe = {"<dec><npc>Tr飊g luy謓 trang b� b筩h kim s� t錸 t筰 v韎 th阨 gian, nh� <color=yellow>"..floor(RECOIN_PLATINA_DATE_RANGE[1]/10000).."n╩"..mod(floor(RECOIN_PLATINA_DATE_RANGE[1]/100),100).."nguy謙 "..mod(RECOIN_PLATINA_DATE_RANGE[1], 100).." ng祔 -"..floor(RECOIN_PLATINA_DATE_RANGE[2]/10000).."n╩"..mod(floor(RECOIN_PLATINA_DATE_RANGE[2]/100),100).."nguy謙 "..mod(RECOIN_PLATINA_DATE_RANGE[2], 100).." ng祔 <color> th藅 l� p. H玬 nay kh玭g t鑤 ng祔 l緈 cho n猲 s� kh玭g l祄 頲.",
			"Th藅 ti誧 qu�,  tr� gi� r錳, l骳 kh竎 h穣 quay l筰./no",};
	else
		aryDescribe = {"<dec><npc>Tr飊g luy謓 trang b� b筩h kim c莕 {1 Kim T獇, {1 huy襫 tinh kho竛g th筩h c蕄 8} v� m閠 s� lng { m秐h b� thi猲 th筩h (trung)}. Tr飊g luy謓 kh玭g c飊g lo筰 trang b� ho祅g kim s� c莕  thi猲 th筩h s� kh玭g gi鑞g nhau. Tranh th� v蒼 c遪 s韒 h穣 g鰅 cho ta l祄 s韒, i  <color=yellow>"..floor(RECOIN_PLATINA_DATE_RANGE[2]/10000).."n╩"..mod(floor(RECOIN_PLATINA_DATE_RANGE[2]/100),100).."nguy謙 "..mod(RECOIN_PLATINA_DATE_RANGE[2], 100).."<color> kh玭g gi髉 頲 ngi th� ng c� tr竎h ta.", 
		"Tr飊g luy謓 trang b� b筩h kim n祔 c莕 bao nhi猽 m秐h B� Thi猲 Th筩h (Trung)/want_recoinplatina_preview",
		"Ta  mang  nguy猲 li謚  tr飊g luy謓 trang b� b筩h kim n祔./want_recoinplatina",
		"Ta ch� ti謓 阯g gh� ngang y/no"}
	end;
	CreateTaskSay(aryDescribe);
end;

--预览的起始
function want_recoinplatina_preview()
	GiveItemUI("Tr飊g luy謓 trang b� b筩h kim", "Xin m阨 b� trang b� b筩h kim c莕 tr飊g luy謓 v祇 � b猲 di. Ta s� gi髉 ngi xem th� c莕 bao nhi猽 m秐h B� Thi猲 Th筩h (Trung)", "do_recoinplatina_preview", "no", 1);
end;

function do_recoinplatina_preview(nCount)
	if (nCount <= 0) then	--没有给出东西，不做对话直接返回
		return 0;
	end;
	
	if (nCount > 1) then	--一次一件，给于提示
		CreateTaskSay({"<dec><npc>M閠 l莕 ch� a ta 1 v藅 ph萴 th� ta m韎 c� th� gi髉 ngi xem 頲.",
			"Th祅h th藅 xin l鏸, ta s� s緋 x誴 l筰/want_recoinplatina_preview",
			"ьi 1 l竧 n鱝 quay l筰 nh�/no"});
		return 0;
	end;
	
	local nItemIdx = GetGiveItemUnit(nCount);
	local nCurItemName = GetItemName(nItemIdx);
	local nCurItemQuality = GetItemQuality(nItemIdx);
	local tbCurItemProp = pack(GetItemProp(nItemIdx));
	if (nCurItemQuality == 4) then		--给于的是白金装备
		if (tbCurItemProp[1] == 0) then		--不是破损的装备
			local nCurPlatinaEqID = GetPlatinaEquipIndex(nItemIdx);
			if (TB_PLATINARECOIN_INFO[nCurPlatinaEqID]) then
				CreateTaskSay({format("<dec><npc>Trang b� b筩h kim %s  c莕 {%d m秐h} b� thi猲 th筩h (trung) v� 1 Kim T� v韎 1 huy襫 tinh c蕄 8.",TB_PLATINARECOIN_INFO[nCurPlatinaEqID][1],TB_PLATINARECOIN_INFO[nCurPlatinaEqID][2]),
					"Xin h穣 gi髉 ta tr飊g luy謓 trang b� b筩h kim n祔/want_recoinplatina",
					"ьi ta chu萵 b� xong s� quay l筰 t譵 ngi/no"});
			else
				CreateTaskSay({format("<dec><npc>V韎 n╪g l鵦 hi謓 t筰 c馻 ta kh玭g th� gi髉 ngi tr飊g luy謓 {%s} 頲.",nCurItemName),
				"Th� th� ta s� i/want_recoinplatina_preview",
				"ьi 1 l竧 n鱝 quay l筰 nh�/no"});
			end;
			return 0;
		end;
	end;
	CreateTaskSay({"<dec><npc>Kh玭g ph秈 ngi mu鑞 bi誸 tr飊g luy謓 b筩h kim c莕 bao nhi猽 m秐h b� thi猲 th筩h, ngi kh玭g a cho ta trang b� b筩h kim th� l祄 sao xem n祇?",
		"Th祅h th藅 xin l鏸, ta s� s緋 x誴 l筰/want_recoinplatina_preview",
		"ьi 1 l竧 n鱝 quay l筰 nh�/no"});
end;

--重铸的起始
function want_recoinplatina()
	GiveItemUI("Tr飊g luy謓 trang b� b筩h kim", "Xin m阨 b� nh鱪g nguy猲 li謚 c莕 thi誸  tr飊g luy謓 trang b� b筩h kim v祇 � b猲 di (1 Kim T�, 1 huy襫 tinh c蕄 8, v� m閠 s� lng B� Thi猲 Th筩h (Trung))", "do_recoinplatina", "no", 1);
end;

function do_recoinplatina(nCount)
	if (nCount <= 0) then	--没有给出东西，不做对话直接返回
		return 0;
	end;
	local nComposeEntryIdx = 0;
	local nComposeEntryLvl = 0;
	local szBeforeItemInfo = "";
	local szBehindItemInfo = ""
	local nMarkCount = 0;
	local nItemBindState = 0;	--原料黄金的绑定状态
	local nItemLockState = 0;
	local bHaveLockItem  = 0;	
	local szMARKITEM_KEY = "6,1,1309";
	local tb_material = {
		--key = {数量，名称，等级} 
		["4,979,1"] = {1, "Kim T�", -1},
		["6,1,147"] = {1, "Huy襫 Tinh Kho竛g Th筩h c蕄 8", 8},
		};
	local tb_curmaterial = {};
	for key, tb in tb_material do
		tb_curmaterial[key] = {};
		tb_curmaterial[key][1] = 0;
	end;
	
	for i = 1, nCount do
		local nCurItemIdx = GetGiveItemUnit(i);
		local nCurItemName = GetItemName(nCurItemIdx);
		local nCurItemQuality = GetItemQuality(nCurItemIdx);
		local tbCurItemProp = pack(GetItemProp(nCurItemIdx));
		local nExpiredTime = ITEM_GetExpiredTime(nCurItemIdx);
		if (nCurItemQuality == 4) then		--给于的是白金装备
			if (nExpiredTime > 0) then -- 有保质期的装备，不能拆！
				CreateTaskSay(	{	"<dec><npc>Trang b� c� <color=fire>th阨 h筺 s� d鬾g<color>, kh玭g th� tr飊g luy謓 頲.",
									"Th藅 l� th� l鏸, ta l筰 b� nh莔 n鱝 r錳. M閠 l骳 sau quay l筰 nh�/no"	}	);
				return
			end
			if (tbCurItemProp[1] == 0) then		--不是破损的装备
				local nCurPlatinaEqID = GetPlatinaEquipIndex(nCurItemIdx);
				if (TB_PLATINARECOIN_INFO[nCurPlatinaEqID]) then
					if (nComposeEntryIdx ~= 0) then
						CreateTaskSay({"<dec><npc>Ngi r鑤 cu閏 mu鑞 tr飊g luy謓 trang b� b筩h kim n祇 y?",
							"Ha ha, i hi謕 c騨g c� l骳 b蕋 c萵,  ta t v祇 l筰./want_recoinplatina",
							"Th藅 ng筰 qu�, ta s� quay l筰 sau./no"	});
									return 0;
					else
						nComposeEntryIdx = nCurPlatinaEqID;
						nComposeEntryLvl = GetPlatinaLevel(nCurItemIdx);
						szBeforeItemInfo = getItemInfo(nCurItemIdx);	--获得重铸前的详细信息
						nItemBindState = GetItemBindState(nCurItemIdx)	--获取绑定状态
					end;
				else
					CreateTaskSay({format("<dec><npc>V韎 n╪g l鵦 hi謓 t筰 c馻 ta kh玭g th� gi髉 ngi tr飊g luy謓 {%s} 頲.",nCurItemName),
						"Th� th� ta s� i/want_recoinplatina_preview",
						"ьi 1 l竧 n鱝 quay l筰 nh�/no"});
					return 0;
				end;
			end;
		else		--如果不是白金装备，就判断是不是所需材料
			local szItemKey = tbCurItemProp[1]..","..tbCurItemProp[2]..","..tbCurItemProp[3];
			if (szItemKey == szMARKITEM_KEY) then	--补天石碎片
				nMarkCount = nMarkCount + 1;
			else
				if (tb_material[szItemKey] == nil) then	--不是八玄 and 不是金犀
					CreateTaskSay({	"<dec><npc>Ngo礽 {trang b� b筩h kim} v� {kim t獇, { huy襫 tinh c蕄 8}, { m秐h b� thi猲 th筩h (trung)} l� nh鱪g nguy猲 li謚 ta c莕. Nh鱪g th� kh竎 xin h穣 thu l筰.",
						"Ha ha, i hi謕 c騨g c� l骳 b蕋 c萵,  ta t v祇 l筰./want_recoinplatina",
						"Th藅 ng筰 qu�, ta s� quay l筰 sau./no"	});
					return 0;
				else
					if (tb_material[szItemKey][3] ~= -1) then
						if (tb_material[szItemKey][3] ~= tbCurItemProp[4]) then
							CreateTaskSay({"<dec><npc>Ъng c蕄 c馻 trang b�"..nCurItemName.." n祔 dng nh� kh玭g ng.",
								"Ha ha, i hi謕 c騨g c� l骳 b蕋 c萵,  ta t v祇 l筰./want_recoinplatina",
								"Th藅 ng筰 qu�, ta s� quay l筰 sau./no"	}	);
							return 0;
						end;
					end;
					tb_curmaterial[szItemKey][1] = tb_curmaterial[szItemKey][1] + 1;
					tb_curmaterial[szItemKey][2] = nCurItemName;
				end;
			end;
		end;
	end;	--end for nCout
	
	local szlog = ""
	if (nComposeEntryIdx == 0) then		--竟然不给白金装备
		CreateTaskSay({"<dec><npc>Kh玭g ph秈 ngi mu鑞 tr飊g luy謓 trang b� b筩h kim sao, ngi kh玭g giao cho ta trang b� l祄 sao ta l祄 頲.",
			"Th祅h th藅 xin l鏸, ta s� s緋 x誴 l筰/want_recoinplatina",
			"ьi 1 l竧 n鱝 quay l筰 nh�/no"});
		return 0;
	end;
	if (nMarkCount ~= TB_PLATINARECOIN_INFO[nComposeEntryIdx][2]) then
		CreateTaskSay({format("<dec><npc>Trang b� b筩h kim {%s} c莕 (%d) m秐h b� thi猲 th筩h (trung).",TB_PLATINARECOIN_INFO[nComposeEntryIdx][1],TB_PLATINARECOIN_INFO[nComposeEntryIdx][2]),
					"Th祅h th藅 xin l鏸, ta s� s緋 x誴 l筰/want_recoinplatina",
					"ьi ta chu萵 b� xong s� quay l筰 t譵 ngi/no"});
		return 0;
	end;
	for key, tb in tb_material do
		if (tb[1] ~= tb_curmaterial[key][1]) then
			CreateTaskSay({format("<dec><npc>Tr飊g luy謓 trang b� b筩h kim ta c莕 {%d} %s.", tb[1],tb[2]),
					"Th祅h th藅 xin l鏸, ta s� s緋 x誴 l筰/want_recoinplatina",
					"ьi ta chu萵 b� xong s� quay l筰 t譵 ngi/no"});
			return 0;
		end;
	end;

--	for i = 1, nCount do
--		local nCurItemIdx = GetGiveItemUnit(i)
--		nItemLockState = GetLockItemState(nCurItemIdx)
--		if (nItemLockState == 1) then
--			local bOwner = IsLockItemOwner(nCurItemIdx)
--			if (bOwner == 0)   then
--				CreateTaskSay({"<dec><npc>重铸的白金装备是锁魂物品，锁魂物品处于锁魂状态，只允许物品归属人重铸。","知道了/cancel"});
--				return
--			else
--				bHaveLockItem =	1;
--			end							
--		elseif (nItemLockState == 2) then
--			CreateTaskSay({"<dec><npc>重铸的白金装备是锁魂物品，锁魂物品处于解魂状态，禁止重铸。","知道了/cancel"});
--			return
--		end
--	end;	
	
	-- 删原料
	for i = 1, nCount do
		if (RemoveItemByIndex(GetGiveItemUnit(i)) ~= 1) then
			WriteLog("[Tr飊g luy謓 trang b� b筩h kim]"..GetLocalDate("%Y-%m-%d %H:%M:%S").."\t"..GetAccount().."\t"..GetName().."\t X鉧 v藅 ph萴 th蕋 b筰\t"..GetItemName(GetGiveItemUnit(i)));
			return 0;
		end
	end
	
	--新给个白金装备
	local nNewItemIdx = AddPlatinaItem(0, nComposeEntryIdx);	--此时 是0级白金
	if (nNewItemIdx <= 0) then
		WriteLog("[Tr飊g luy謓 trang b� b筩h kim]"..GetLocalDate("%Y-%m-%d %H:%M:%S").."\t"..GetAccount().."\t"..GetName().."\tTh猰 trang b� b筩h kim ho祅g kim th蕋 b筰\t"..GetItemName(GetGiveItemUnit(i)));
		return 0;
	end;

	if nItemBindState ~= 0 then 
		--把碎片设置为源黄金装备的绑定状态值
		SetItemBindState(nNewItemIdx, nItemBindState)
	end

	for i = 1, nComposeEntryLvl do								--升级之原装备等级
		UpgradePlatinaItem(nNewItemIdx);
	end;
	
--	if (bHaveLockItem == 1) then
--		LockItem(nNewItemIdx);
--	end
		
	szlog = format("[Tr飊g luy謓 trang b� b筩h kim]\t%s\tAccount:%s\tName:%s\tTr飊g luy謓 %s x鉧 nguy猲 li謚: 1 Kim T�, 1 huy襫 tinh c蕄 8, %d m秐h b� thi猲 th筩h", 
				GetLocalDate("%Y-%m-%d %X"), GetAccount(), GetName(),
				TB_PLATINARECOIN_INFO[nComposeEntryIdx][1], nMarkCount);
	szBehindItemInfo = getItemInfo(nNewItemIdx);	--重铸后的信息
	WriteLog(szlog);
	writeRecoinLog("[Thu閏 t輓h trc khi tr飊g luy謓 trang b� b筩h kim]", szBeforeItemInfo);
	writeRecoinLog("[Thu閏 tinh sau khi tr飊g luy謓 trang b� b筩h kim]", szBehindItemInfo);
	Msg2Player("Tr飊g luy謓 th祅h c玭g棗<color=green>"..TB_PLATINARECOIN_INFO[nComposeEntryIdx][1]);
end;

function reloadRecoinPlatinaDate()
	local tb_NewAvailableDate = {gb_GetTask("RECOIN_PLATINAEQUIP",1), gb_GetTask("RECOIN_PLATINAEQUIP",2)};
	if (tb_NewAvailableDate[1] ~= 0 and tb_NewAvailableDate[2] ~= 0 and tb_NewAvailableDate[2] ~= RECOIN_PLATINA_DATE_RANGE[2]) then
		RECOIN_PLATINA_DATE_RANGE[1] = tb_NewAvailableDate[1];
		RECOIN_PLATINA_DATE_RANGE[2] = tb_NewAvailableDate[2];
	end;
end;