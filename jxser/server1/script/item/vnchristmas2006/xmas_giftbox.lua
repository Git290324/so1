-- Created by Danielsun 2006-12-07
-- 圣诞礼盒
-- 按几率获得圣诞礼物材料

TB_Giftbox = {
 --1.物品名	    2.物品ID	3.掉落几率
	{"Hoa tuy誸", 			1312,		20	},
	{"C� r鑤",		1313,		20	},
	{"C祅h th玭g",	1314,		20	},
	{"N鉵 gi竛g sinh",		1315,		18	},
	{"Kh╪ cho祅g (xanh)",	1316,		11	},
	{"Kh╪ cho祅g ()",	1317,		5		},
	{"C﹜ th玭g ",		1318,		1		},
}

function main()
	
	local PItem = 0;
	local PGetItem = random();
	local PGetItem = PGetItem * 100;
	for ngift,mgift in TB_Giftbox do
		PItem = PItem + TB_Giftbox[ngift][3];
		if(PGetItem < PItem) then
			AddItem(6,1,TB_Giftbox[ngift][2],1,0,0,0);
			Msg2Player("B筺 nh苩 頲 nguy猲 li謚 gi竛g sinh:"..TB_Giftbox[ngift][1]);
			return
		end
	end
	return 1;
end
