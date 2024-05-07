function main()
    dofile("script/global/namcung/autoexec_namcung.lua");
		
end
new_npc = { 
--{1135,80,4,53,1619,3189,0,"Ch©n Nhi",0,"\\script\\global\\namcung\\namcung_say.lua"}, 
-- {1623,80,4,53,1620,3176,0,"CËp NhËt XÕp H¹ng",0,"\\script\\global\\namcung\\xephang\\capnhat.lua"}, 
{715,80,4,53,1617,3202,0,"B¾c ®Èu l·o nh©n",0,"\\script\\event\\springfestival08\\allbrother\\beidoulaoren.lua"}, 
{644,80,4,53,1622,3184,0,"Hæ trî T©n Thñ",0,"\\script\\global\\namcung\\tanthu.lua"},
--{644,80,4,53,1624,3199,0,"Hæ trî VIP",0,"\\script\\global\\dockaka\\muaban.lua"},
--{228,80,4,53,1613,3213,0,"chu tien trang",0,"\\script\\global\\global_tiejiang.lua"},
--{736,80,4,53,1624,3199,0,"tan thu VIPP",0,"\\script\\global\\namcung\\hotrotanthu\\npctanthu.lua"}, 
--{736,78,4,78,1557,3210,0,"huyen tinh",0,"\\script\\global\\dockaka\\dotim.lua"}, 
{644,78,4,78,1578,3224,0,"¤ng Giµ NOEL",0,"\\script\\global\\dockaka\\ong_gia_noel.lua"}, 
-- {1877,80,4,78,1575,3207,0,"Sø gi¶ chuyÓn ph¸i",0,"\\script\\global\\namcung\\chuyenphai.lua"},
{315,80,4,53,1631,3175,0,"ThÈm V¹n Tam",0,"\\script\\global\\shopvip.lua"},
{1236,80,4,53,1620,3190,0,"NhËp CODE",0,"\\script\\global\\dockaka\\npcgifcode.lua"},
--{1877,80,4,53,1623,3201,0,"ThÈm V¹n Tam22",0,"\\script\\global\\dockaka\\npc9999.lua"},
--{1877,80,4,53,1654,3228,0,"vËn tiªu",0,"\\script\\global\\dockaka\\vantieu.lua"},
{54,80,4,53,1610,3213,0,"NPC + ®iÓm Kü N¨ng nhanh",0,"\\script\\global\\dockaka\\npccongnhanhdiem.lua"},
--{54,80,4,53,1633,3195,0,"NPC 150",0,"\\script\\global\\dockaka\\npc150.lua"},
{1159,80,4,54,1638,3041,0,"",0,"\\script\\global\\dockaka\\veso.lua"},
{81,80,4,53,1614,3206,0,"c·i l·o hoµn ®ång",0,"\\script\\global\\dockaka\\cailaohoandong.lua"},
{1877,80,4,53,1622,3167,0,"Sø gi¶ chuyÓn ph¸i",0,"\\script\\global\\namcung\\chuyenphai.lua"},
}




function add_npc_tinhnang()
	add_namcung(new_npc)
end

------------------------------------------------------------------------------------------------------------------------------
function add_namcung(tbnpc)
	for i = 1 , getn(tbnpc) do
		Mid = SubWorldID2Idx(tbnpc[i][4]);
		if (Mid >= 0 ) then
			TabValue5 = tbnpc[i][5] * 32;
			TabValue6 = tbnpc[i][6] * 32;
			local nNpcIdx = AddNpc(tbnpc[i][1],tbnpc[i][2],Mid,TabValue5,TabValue6,tbnpc[i][7],tbnpc[i][8]);
			SetNpcScript(nNpcIdx, tbnpc[i][10]);
		end;
	end;
end