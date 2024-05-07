TB_SNOWMAN_ID = {
	[1319] = "snowman_green_special",
	[1320] = "snowman_red_special",
	[1321] = "snowman_special",
	[1322] = "snowman_green",
	[1323] = "snowman_red",
	[1324] = "snowman_normal",
}

function main(nItemIdx)	
	local nG, nD, nP = GetItemProp(nItemIdx);
	if (not TB_SNOWMAN_ID[nP]) then
		return 1;
	end;
	dostring(TB_SNOWMAN_ID[nP].."()");
end;

function snowman_green_special()
	AddOwnExp(20*10000)
	SetTask(10, GetTask(10) + 1)	
	AddStackItem(1, 6, 1, 71, 0, 0, 0)
	Msg2Player("Nh�n ���c 1 ti�n th�o l� ")
	k = random(0,10)
	if k==0 then
		AddStackItem(1, 6, 1, 1327, 0, 0, 0)
		Msg2Player("May m�n nh�n ���c 1 g� l�i")
	elseif k==1 then
		AddItem(6,1,22,1,1,1)
		Msg2Player("May m�n nh�n ���c 1 T�y t�y kinh")
	end
end;

function snowman_red_special()
	AddOwnExp(40*10000)
	SetTask(10, GetTask(10) + 1)	
	AddStackItem(1, 6, 1, 71, 0, 0, 0)
	Msg2Player("Nh�n ���c 1 ti�n th�o l�")
	k = random(0,8)
	if k==0 then
		AddStackItem(1, 6, 1, 1327, 0, 0, 0)
		Msg2Player("May m�n nh�n ���c 1 g� l�i")
	elseif k==1 then
		AddItem(6,1,22,1,1,1)
		Msg2Player("May m�n nh�n ���c 1 T�y t�y kinh")
	end
end;

function snowman_special()
	AddOwnExp(60*10000)
	SetTask(10, GetTask(10) + 10)	
	AddStackItem(1, 6, 1, 71, 0, 0, 0)
	Msg2Player("Nh�n ���c 1 ti�n th�o l�")
	k = random(0,6)
	if k==0 then
		AddStackItem(1, 6, 1, 1327, 0, 0, 0)
		Msg2Player("May m�n nh�n ���c 1 g� l�i")
	elseif k==1 then
		AddItem(6,1,22,1,1,1)
		Msg2Player("May m�n nh�n ���c 1 T�y t�y kinh")
	end
end;

function snowman_green()
	AddOwnExp(10*10000)
	SetTask(10, GetTask(10) + 1)	
	AddStackItem(1, 6, 1, 1327, 0, 0, 0)
	Msg2Player("Nh�n ���c  1 g� l�")
	k = random(0,10)
	if k==0 then
		AddItem(6,1,26,1,1,1)
		Msg2Player("May m�n nh�n ���c 1 V� l�m m�t t�ch")
	elseif k==1 then
		AddItem(6,1,22,1,1,1)
		Msg2Player("May m�n nh�n ���c 1 T�y t�y kinh")
	end
end;

function snowman_red()
	AddOwnExp(30*10000)
	SetTask(10, GetTask(10) + 1)	
	AddStackItem(1, 6, 1, 1327, 0, 0, 0)
	Msg2Player("Nh�n ���c  1 g� l�")
	k = random(0,8)
	if k==0 then
		AddItem(6,1,26,1,1,1)
		Msg2Player("May m�n nh�n ���c 1 V� l�m m�t t�ch")
	elseif k==1 then
		AddItem(6,1,22,1,1,1)
		Msg2Player("May m�n nh�n ���c 1 T�y t�y kinh")
	end
end;

function snowman_normal()
	AddOwnExp(50*10000)
	SetTask(10, GetTask(10) + 10)	
	AddStackItem(1, 6, 1, 1327, 0, 0, 0)
	Msg2Player("Nh�n ���c 10 Ch�n Nguy�n v� 1 H� M�ch ��n")
	k = random(0,6)
	if k==0 then
		AddStackItem(1, 6, 1, 1327, 0, 0, 0)
		Msg2Player("May m�n nh�n ���c 1 g� l�i")
	elseif k==1 then
		AddItem(6,1,22,1,1,1)
		Msg2Player("May m�n nh�n ���c 1 T�y t�y kinh")
	end
end;