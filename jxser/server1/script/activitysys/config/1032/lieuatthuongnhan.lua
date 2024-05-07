Include("\\script\\lib\\droptemplet.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
function main()	
	local tab_Content = {
		"Ta ®· thu thËp ®ñ c¸c m¶nh tranh./handup_picture",
		"ChØ ®Õn th¨m «ng chót th«i!/oncancel"
	};
	Describe("LiÔu Êt th­¬ng nh©n ®ang muèn t×m <color=green>hai bøc danh häa H»ng Nga Tiªn Tö<color>. 2 bøc tranh nµy ®· bÞ ph©n thµnh nhiÒu m¶nh t¶n l¹c kh¾p n¬i. Nghe nãi Giang hå ®ang cã ®ñ c¸c m¶nh tranh ®ã. NÕu ng­¬i cã ®­îc nh÷ng m¶nh nµy, ta sÏ gióp ng­¬i ghÐp l¹i. Ng­¬i sÏ nhËn ®­îc <color=yellow>1 H»ng Nga LÖnh Bµi<color>. Thu thËp ®ñ 3 c¸i ®Õn giao cho Tæng Qu¶n Sù kiÖn ®Ó nhËn th­ëng.", getn(tab_Content), tab_Content);
end;


function handup_picture()
	GiveItemUI("Giao tranh", "C¸ch ghÐp: xÕp theo ®óng vÞ trÝ, dïng « ®Çu tiªn bªn tr¸i lµm chuÈn ®Ó ghÐp tranh.", "pic_award", "oncancel");
end;

tab_boxcheck = 
{{1207, 1208, 1209, 1210, 1211, 1212},
 {1213, 1214, 1215, 1216, 1217, 1218}
}
function pic_award(nCount)
	local bCorrectItem = 0
	local idxItem = 0

	if (nCount ~= 6) then
		Describe("Mét bøc tranh cã s¸u m¶nh, ng­¬i ®em ®Õn ch­a ®ñ.", 1, "VËy ta xin c¸o tõ./oncancel");
		return
	end
	
	bFull = 1;
	idxItem = GetGiveItemUnit(1);
	local g, d, p = GetItemProp(idxItem);
	local nIndex = 0;
	if (p <= 1212 and p >= 1207 and d == 1 and g == 6) then
		nIndex = 1;
	elseif(p <= 1218 and p >= 1213 and d == 1 and g == 6) then
		nIndex = 2;
	end;
	if (0 == nIndex) then
		Describe("Nh÷ng m¶nh tranh cña ng­¬i kh«ng ®ñ ®Ó ghÐp, h·y t×m ®ñ råi quay vÒ gÆp ta.", 1, "VËy ta xin c¸o tõ./oncancel");
		return
	end

	tab_items = {};
	for i = 1, nCount do
		idxItem = GetGiveItemUnit(i)
		g, d, p = GetItemProp(idxItem)
		if (d ~= 1 or g ~= 6) then
			bFull = 0;
			break
		end
		tab_items[i] = p;
	end
	
	tab_items = au06_sort(tab_items); -- ÉýÐòÅÅÐò
	
	for i = 1, getn(tab_items) do
		if (tab_items[i] ~= tab_boxcheck[nIndex][i]) then
			bFull = 0;
			break;
		end;
	end;
	
	if (0 == bFull) then
		Describe("Nh÷ng m¶nh tranh cña ng­¬i kh«ng ®ñ ®Ó ghÐp, h·y t×m ®ñ råi quay vÒ gÆp ta.", 1, "VËy ta xin c¸o tõ./oncancel");
		return
	end
	
	--É¾³ý»­
	for i = 1, nCount do
		idxItem = GetGiveItemUnit(i);
		RemoveItemByIndex(idxItem);
	end
	
	--¸ø½±Àø
	local str = "1 <color=yellow>Hµng Nga LÖnh Bµi<color>";	
	AddItem(6, 1, 5069, 1, 0, 0, 0);
	
	--¸øÌáÊ¾
	Describe("ThËt kh«ng ngê ng­¬i cã thÓ t×m ®ñ bé. §©y lµ <color=yellow>Th­¬ng Cæ LÖnh Bµi<color>, mang ®ñ 10 tÊm lÖnh bµi nµy ®Õn gÆp LiÔu Êt th­¬ng nh©n ë T­¬ng D­¬ng ®Ó ®æi lÊy b¸nh trung thu thÇn kú", 1, "NhËn phÇn th­ëng/oncancel")
	Msg2Player("B¹n ®¹t ®­îc "..str);
end;

function au06_sort(table)
	if (not table or type(table) ~= "table") then
		return {};
	end;
	
	local nCount = getn(table);
	for i = 2, nCount do	--²ÉÓÃÒ»¸öÃ°ÅÝÅÅÐò
		for j = nCount, i, -1 do
			if (table[j] < table[j - 1]) then	--²ÉÓÃ½µÉýÐòÅÅÐò
				temptab = table[j];
				table[j] = table[j - 1];
				table[j - 1] = temptab;
			end;
		end;
	end;
	
	return table;
end

