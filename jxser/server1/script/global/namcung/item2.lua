Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\lib\\progressbar.lua")
IncludeLib("ITEM")

function main(nItemIndex)

	local G,D,P,nLevel = GetItemProp(nItemIndex);
	local nExPiredTime = ITEM_GetExpiredTime(nItemIndex);
	local nLeftTime = nExPiredTime - GetCurServerTime();
	if nExPiredTime ~= 0 and nLeftTime <= 60 then
		Msg2Player("V�t ph�m �� qu� h�n s� d�ng")
		return 0;
	end
	nLeftTime = floor((nLeftTime)/60);
	
	if (G ~= 6) then
		return 1;
	end
	
	if CalcFreeItemCellCount() < 10 then
		CreateTaskSay({"Xin h�y s�p x�p l�i h�nh trang! Nh� �� tr�ng 10 � tr� l�n nh�!",  "���c r�i./Cancel",});
		return 1;
	end
	
	-- day chuyen ab
	if P == 4383 then

	end	
	
	-- ngoc boi ab
	if P == 4384 then

	end	
	
	
	-- nhan ab
	if P == 4385 or P == 2336 or P == 2337 or P == 2338 or P == 2339 then

	end
	
	return 1
end

function daychuyenab()
local n = CalcEquiproomItemCount(6,1,4383,-1);
if n < 100 then
Say("<color=green>Ng��i kh�ng c� <color=red>1 <color=yellow> Ti�n ��ng<color> !") 
return
end 

end
function chonanbang()
	local bilTbOp = {}	
	tinsert(bilTbOp, "Mua Th�n H�nh Ph� (50 V�n)/MuaThanHanh")
	tinsert(bilTbOp, "Xu�t s� (10 v�n)/trangthai")
	tinsert(bilTbOp, "50 b� l�nh b�i phi t�c (100 v�n)/lenhbaiphitoc50")
	tinsert(bilTbOp, "L�p bang h�i/dmcreattongtest")
	tinsert(bilTbOp, "H�y trang b� kh�a/deltem")
	tinsert(bilTbOp, "K�t th�c ��i tho�i/thoat")
	Say("S� d�ng 100 m�nh an bang �� ��i trang b� an bang t��ng �ng h�n s� d�ng 30 ng�y", getn(bilTbOp), bilTbOp)

end