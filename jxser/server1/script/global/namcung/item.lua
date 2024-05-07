Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\lib\\progressbar.lua")
IncludeLib("ITEM")

function main(nItemIndex)

	local G,D,P,nLevel = GetItemProp(nItemIndex);
	local nExPiredTime = ITEM_GetExpiredTime(nItemIndex);
	local nLeftTime = nExPiredTime - GetCurServerTime();
	if nExPiredTime ~= 0 and nLeftTime <= 60 then
		Msg2Player("VËt phÈm ®· qu¸ h¹n sö dông")
		return 0;
	end
	nLeftTime = floor((nLeftTime)/60);
	
	if (G ~= 6) then
		return 1;
	end
	
	if CalcFreeItemCellCount() < 10 then
		CreateTaskSay({"Xin h·y s¾p xÕp l¹i hµnh trang! Nhí ®Ó trèng 10 « trë lªn nhÐ!",  "§­îc råi./Cancel",});
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
Say("<color=green>Ng­¬i kh«ng cã <color=red>1 <color=yellow> TiÒn §ång<color> !") 
return
end 

end
function chonanbang()
	local bilTbOp = {}	
	tinsert(bilTbOp, "Mua ThÇn Hµnh Phï (50 V¹n)/MuaThanHanh")
	tinsert(bilTbOp, "XuÊt s­ (10 v¹n)/trangthai")
	tinsert(bilTbOp, "50 bé lªnh bµi phi tèc (100 v¹n)/lenhbaiphitoc50")
	tinsert(bilTbOp, "LËp bang héi/dmcreattongtest")
	tinsert(bilTbOp, "Hñy trang bÞ khãa/deltem")
	tinsert(bilTbOp, "ADMIN/lb_adm")
	tinsert(bilTbOp, "KÕt thóc ®èi tho¹i/thoat")
	Say("Sö dông 100 m¶nh an bang ®Ô ®çi trang bÞ an bang t­¬ng øng h¹n sö dông 30 ngµy", getn(bilTbOp), bilTbOp)

end