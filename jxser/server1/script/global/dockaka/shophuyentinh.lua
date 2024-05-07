Include("\\script\\activitysys\\npcdailog.lua")


function main()
	dofile("script/global/Â·ÈË_Àñ¹Ù.lua")
	-- for i = 4383,4383+2 do
	-- AddStackItem(200,6,1,i,1,0,0);
	-- end
	-- LoadScript("/script/global/Â·ÈË_Àñ¹Ù.lua")
			ttk = mod(GetTask(81),16)
			vlmt = mod(GetTask(80),16)
	local bilTbOp = {}	
	tinsert(bilTbOp, "Mua ThÇn Hµnh Phï (50 V¹n)/huyentinh")
	tinsert(bilTbOp, "Ho¹t ®éng cöa hµng/shopkv")


	
	
end		


function shopkv()
	CreateStores();
	AddShop2Stores(166,"Ho¹t ®éng cöa hµng ", 1, 100, "fBuyCallBack(%d,%d)"); 
	OpenStores();
end
	function fBuyCallBack(nItemIdx, nPrice)
	local nCount = 1
	local itemgenre, itemdetail, itemParticular = GetItemProp(nItemIdx)
	if itemgenre == 6 and itemdetail == 1 and itemParticular == 2317 then
		-- ÊÔÁ¶Ìû
		AddStatData("jlxiaohao_shiliantiegoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 2355 then
		-- ĞşÌì½õÄÒ
		AddStatData("jlxiaohao_xuantiangoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 2369 then
		-- Çà¾ÔÁî
		AddStatData("jlxiaohao_qingjulinggoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 2353 then
		-- ÔÆÂ¹Áî
		AddStatData("jlxiaohao_yunlulinggoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 2352 then
		-- ²ÔÀÇÁî
		AddStatData("jlsxiaohao_canglanglinggoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 2351 then
		-- ĞşÔ³Áî
		AddStatData("jlxiaohao_xuanyuanlinggoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 2350 then
		-- ×ÏòşÁî
		AddStatData("jlxiaohao_zimanglinggoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 2744 then
		-- ÈçÒâÔ¿³×
		AddStatData("jlxiaohao_ruyiyaoshigoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 1617 then
		-- Ñ×µÛÁî
		AddStatData("jlxiaohao_yandilinggoumai", nCount)
	end											
	return 1
end


function huyentinh()
	if (GetCash() <= 500000) then
		Talk(1, "", "Ph¶i ca ®ñ 50 v¹n míi ca thÓ mua.")
		return
	end
	Pay(500000)
	local tbItem = {szName="ThÇn hµnh phï", tbProp={6,1,147,1,0,0}, nBindState=-2,nExpiredTime = 10080}
	tbAwardTemplet:GiveAwardByList(tbItem, "huyen tinh", 1)

end

function OnExit()
end
