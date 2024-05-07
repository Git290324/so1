Include("\\script\\activitysys\\config\\1031\\headbanhtrungthu.lua")


function main(sel)
	local PItem = 0;
	local PGetItem = random();
	local PGetItem = PGetItem * 100;
	for ngift,mgift in TB_BOX_DROP_TUINGUYENLIEU do
		PItem = PItem + TB_BOX_DROP_TUINGUYENLIEU[ngift][3];
		if(PGetItem < PItem) then
			AddItem(6,1,TB_BOX_DROP_TUINGUYENLIEU[ngift][2],1,0,0,0);
			Msg2Player("B¹n nhÆt ®­îc nguyªn liÖu lµm b¸nh Trung thu: <color=green>"..TB_BOX_DROP_TUINGUYENLIEU[ngift][1].."<color>");
			return
		end
	end
	return 1;

end