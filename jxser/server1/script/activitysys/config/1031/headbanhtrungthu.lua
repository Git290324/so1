DA_ZHONGQIU2023_START = 2308100000
DA_ZHONGQIU2023_END 	= 2310142400
NZHONGQIU2023_MAX = 4000000000
TSK_ZHONGQIU2023 = 5843
ZHONGQIU_LEVEL = 50		
SZYUEBING = ""				
TSK_TEMP = 51	

tb_content =
{
	sztalk1 = "Thî b¸nh A N­¬ng: ThËt tho¶i m¸i, ta ®ang nghØ ng¬i vµi ngµy.",
	sztalk2 = "Thî b¸nh A N­¬ng: L¹i ®Õn Trung Thu n÷a råi, tay nghÒ lµm b¸nh cña ta ai còng biÕt ®Õn, mçi n¨m cã kh«ng Ýt nh©n sü ®Õn t×m ta gióp lµm b¸nh, kh¸ch quan cÇn g× ¹?",	
	szmakeItemUI = "§óng vËy, ta muèn lµm b¸nh Trung Thu/makeItemUI",
	szlevel = "ThËt ®¸ng tiÕc, ®¼ng cÊp kh«ng ®ñ 50, kh«ng thÓ tham gia ho¹t ®éng nµy.",
	szmoney = "ThËt ®¸ng tiÕc, ng©n l­îng mang theo kh«ng ®ñ.",
	szpay = "ThËt ®¸ng tiÕc, ng­êi ch¬i ch­a n¹p thÎ, kh«ng thÓ dïng b¸nh Trung Thu.",
	
}

TB_BOX_DROP_TUINGUYENLIEU = {
 
	{"Bét 2023", 4404, 20},
	{"Tói ®­êng 2023", 4405, 20},
	{"Trøng 2023", 4406, 20},
	{"§Ëu xanh 2023", 4407, 0.5},	

}


function check_item(szItemKey)	--ÅÐ¶ÏÎïÆ·ÊÇ·ñ´æÔÚ
	SZYUEBING = getTaskItemName()
	for nkey, tb_item in tb_Mareial[SZYUEBING] do
			local szkey = tb_item["G"]..","..tb_item["D"]..","..tb_item["P"]
			if nkey ~= 1 then
					if szkey == szItemKey then
						return 1
					end
			end
	end
	return 0
end
function check_level()		--ÅÐ¶ÏµÈ¼¶
	if GetLevel() < ZHONGQIU_LEVEL then
		return 0
	end 
	return 1
end

function check_money()		--ÅÐ¶ÏÇ®
	SZYUEBING = getTaskItemName()
	if GetCash() < tb_Mareial[SZYUEBING][1]["nMoney"]then
		return 0
	end
	return 1
end

function check_pay()		--ÅÐ¶Ï³äÖµÓÃ»§
	if GetExtPoint(0) <= 0 then
		return 0
	end 
	return 1
end

function pack(...)
	return arg
end

function getTaskItemName()		--»ñµÃtbÀà±ðÃû
	if GetTaskTemp(TSK_TEMP) == 1 then
		return "szlvdou"
	end
	if GetTaskTemp(TSK_TEMP) == 2 then
		return "szlianzi"
	end
	if GetTaskTemp(TSK_TEMP) == 3 then
		return "szkaoji"
	end
	if GetTaskTemp(TSK_TEMP) == 4 then
		return "szkaozhu"
	end
	if GetTaskTemp(TSK_TEMP) == 5 then
		return "szlihe"
	end
	return "szlvdou"
end