Include("\\script\\activitysys\\npcdailog.lua")


function main()
	dofile("script/global/·��_���.lua")
	-- for i = 4383,4383+2 do
	-- AddStackItem(200,6,1,i,1,0,0);
	-- end
	-- LoadScript("/script/global/·��_���.lua")
			ttk = mod(GetTask(81),16)
			vlmt = mod(GetTask(80),16)
	local bilTbOp = {}	
	tinsert(bilTbOp, "Mua Th�n H�nh Ph� (50 V�n)/huyentinh")
	tinsert(bilTbOp, "Ho�t ��ng c�a h�ng/shopkv")


	
	
end		


function shopkv()
	CreateStores();
	AddShop2Stores(166,"Ho�t ��ng c�a h�ng ", 1, 100, "fBuyCallBack(%d,%d)"); 
	OpenStores();
end
	function fBuyCallBack(nItemIdx, nPrice)
	local nCount = 1
	local itemgenre, itemdetail, itemParticular = GetItemProp(nItemIdx)
	if itemgenre == 6 and itemdetail == 1 and itemParticular == 2317 then
		-- ������
		AddStatData("jlxiaohao_shiliantiegoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 2355 then
		-- �������
		AddStatData("jlxiaohao_xuantiangoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 2369 then
		-- �����
		AddStatData("jlxiaohao_qingjulinggoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 2353 then
		-- ��¹��
		AddStatData("jlxiaohao_yunlulinggoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 2352 then
		-- ������
		AddStatData("jlsxiaohao_canglanglinggoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 2351 then
		-- ��Գ��
		AddStatData("jlxiaohao_xuanyuanlinggoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 2350 then
		-- ������
		AddStatData("jlxiaohao_zimanglinggoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 2744 then
		-- ����Կ��
		AddStatData("jlxiaohao_ruyiyaoshigoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 1617 then
		-- �׵���
		AddStatData("jlxiaohao_yandilinggoumai", nCount)
	end											
	return 1
end


function huyentinh()
	if (GetCash() <= 500000) then
		Talk(1, "", "Ph�i ca �� 50 v�n m�i ca th� mua.")
		return
	end
	Pay(500000)
	local tbItem = {szName="Th�n h�nh ph�", tbProp={6,1,147,1,0,0}, nBindState=-2,nExpiredTime = 10080}
	tbAwardTemplet:GiveAwardByList(tbItem, "huyen tinh", 1)

end

function OnExit()
end
