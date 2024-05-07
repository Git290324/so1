
-- 任务系统邪教发奖处理函数
-- Edited by peres
-- 2005/01/13 PM 22:12

Include("\\script\\task\\newtask\\master\\clearskillpoint.lua");

-- 传入参数为：任务等级

function nt_givePlayerAward(myTaskLevel)

local i
local myAwardText1,myAwardText2 = "",""
local myGolden = {168,169,170,171,172,173,174,175,176}

	if (myTaskLevel==1) then -- 如果是 20 级任务
		

		
	elseif (myTaskLevel==2) then -- 如果是 30 级任务
		
		AddOwnExp(80000)
		AddGoldItem(0,177)  --增加蓝帽子

		myAwardText1 = "80.000 甶觤 kinh nghi謒"
		myAwardText2 = "B筺 nh薾 頲 1 kh玦 m穙"
		
	elseif (myTaskLevel==3) then -- 如果是 40 级任务

		AddOwnExp(280000)	
		ClearMagicPoint()  --增加40级时洗点的功能
		
		myAwardText1 = "150.000 甶觤 kinh nghi謒"
		myAwardText2 = "1 l莕 t葃 甶觤 k� n╪g mi詎 ph� "
				
	elseif (myTaskLevel==4) then -- 如果是 50 级任务
		
		local nRandom=random(1,2);
		
		AddOwnExp(350000)
		
		if nRandom==1 then
			AddItem(6,1,72,1,1,1,0)  -- 天山
		else
			AddItem(6,1,73,1,1,1,0)  -- 白果
		end;

		myAwardText1 = "350.000 甶觤 kinh nghi謒"
		myAwardText2 = "1 ph莕 thng"
				
	elseif (myTaskLevel==5) then -- 如果是 60 级任务

		AddOwnExp(800000)		
		i = random(1,getn(myGolden))
		AddGoldItem(0,myGolden[i])
		
		myAwardText1 = "800.000 甶觤 kinh nghi謒"
		myAwardText2 = "1 b� B秓 kh� tuy謙 th� "
		
	end
	
	return myAwardText1,myAwardText2

end
