DA_ZHONGQIU2023_START = 2308100000
DA_ZHONGQIU2023_END 	= 2310142400
NZHONGQIU2023_MAX = 4000000000
TSK_ZHONGQIU2023 = 5843
ZHONGQIU_LEVEL = 50		
SZYUEBING = ""				
TSK_TEMP = 51	

tb_content =
{
	sztalk1 = "Th� b�nh A N��ng: Th�t tho�i m�i, ta �ang ngh� ng�i v�i ng�y.",
	sztalk2 = "Th� b�nh A N��ng: L�i ��n Trung Thu n�a r�i, tay ngh� l�m b�nh c�a ta ai c�ng bi�t ��n, m�i n�m c� kh�ng �t nh�n s� ��n t�m ta gi�p l�m b�nh, kh�ch quan c�n g� �?",	
	szmakeItemUI = "��ng v�y, ta mu�n l�m b�nh Trung Thu/makeItemUI",
	szlevel = "Th�t ��ng ti�c, ��ng c�p kh�ng �� 50, kh�ng th� tham gia ho�t ��ng n�y.",
	szmoney = "Th�t ��ng ti�c, ng�n l��ng mang theo kh�ng ��.",
	szpay = "Th�t ��ng ti�c, ng��i ch�i ch�a n�p th�, kh�ng th� d�ng b�nh Trung Thu.",
	
}

TB_BOX_DROP_TUINGUYENLIEU = {
 
	{"B�t 2023", 4404, 20},
	{"T�i ���ng 2023", 4405, 20},
	{"Tr�ng 2023", 4406, 20},
	{"��u xanh 2023", 4407, 0.5},	

}


function check_item(szItemKey)	--�ж���Ʒ�Ƿ����
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
function check_level()		--�жϵȼ�
	if GetLevel() < ZHONGQIU_LEVEL then
		return 0
	end 
	return 1
end

function check_money()		--�ж�Ǯ
	SZYUEBING = getTaskItemName()
	if GetCash() < tb_Mareial[SZYUEBING][1]["nMoney"]then
		return 0
	end
	return 1
end

function check_pay()		--�жϳ�ֵ�û�
	if GetExtPoint(0) <= 0 then
		return 0
	end 
	return 1
end

function pack(...)
	return arg
end

function getTaskItemName()		--���tb�����
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