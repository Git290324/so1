----------------------------------------------------------------
--FileName:	transer.lua
--Creater:	firefox
--Date:		2005-
--Comment:	周末活动：卫国战争之烽火连城
--			功能：战场内车夫，负责将玩家传送到报名点
-----------------------------------------------------------------
Include("\\script\\missions\\newcitydefence\\head.lua")
--TASKID_FIRE_ADDR
function main()
	Say("Xa phu: Chi課 tranh 產ng k辌h li謙! S韒 bi誸 ta  b竜 danh 甶 ti襫 phng r錳! ng r錳! Ngi c� chuy謓 g� v藋?", 2, "Ta c� chuy謓 quan tr鋘g b竜 v韎 Tng qu﹏! Xin m阨 玭g ta v� h藆 doanh!/sure2leave", "Kh玭g c� chi! Ta ch� n y ch琲./OnCancel" )
end

function sure2leave()
	--bt_getsignpos(camp)
	local mapid = SubWorldIdx2ID( SubWorld )
	if ( mapid == tbDEFENCE_MAPID[1] ) then
		camp = 1;
	else
		camp = 2;
	end
	SetLogoutRV(0);
	SetRevPos(tbDEFENCE_SIGNMAP[camp], random(3))
	NewWorld(bt_getsignpos(camp))
end

function OnCancel()
end