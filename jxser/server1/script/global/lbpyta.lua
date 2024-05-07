IncludeLib("ITEM");
IncludeLib("SETTING")
IncludeLib("FILESYS")
IncludeLib("LEAGUE");
IncludeLib("TONG")
IncludeLib("RELAYLADDER");
Include("\\script\\global\\weapon_ring.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\global\\fuyuan.lua")
Include("\\script\\global\\equip_system.lua")
Include("\\script\\global\\callboss.lua")
Include("\\script\\task\\partner\\education\\swordking_people.lua")
Include("\\script\\global\\repute_head.lua")
Include("\\script\\misc\\league_cityinfo.lua")

LENHBAI_PYTA = "<#><link=image[0]:\\spr\\item\\sprADMIN.spr>LÖnh bµi PYTA: <link>"

function main()
	dofile("script/global/lbpyta.lua")
	local sex = GetSex();
	if sex == 0 then sex = "Nam" else sex = "N÷" end 
		local Faction = GetLastFactionNumber();
		local zFaction = "Ch­a gia nhËp m«n ph¸i"
	if Faction == 0 then zFaction = "ThiÕu L©m" 
	elseif Faction == 1 then zFaction = "Thiªn V­¬ng Bang"
	elseif Faction == 2 then zFaction = "§­êng M«n" 
	elseif Faction == 3 then zFaction = "Ngò §éc" 
	elseif Faction == 4 then zFaction = "Nga My" 
	elseif Faction == 5 then zFaction = "Thóy Yªn" 
	elseif Faction == 6 then zFaction = "C¸i Bang" 
	elseif Faction == 7 then zFaction = "Thiªn NhÉn" 
	elseif Faction == 8 then zFaction = "Vâ §ang" 
	elseif Faction == 9 then zFaction = "C«n L«n" 
	elseif Faction == 10 then zFaction = "Hoa S¬n"
	end
	local nMoney = GetBoxMoney()+ GetCash()
	local sMoney = nMoney/10000
	local szTitle =LENHBAI_PYTA.. "Xin chµo Gamemaster <color=red>"..GetName().."<color>, Mêi chän thao t¸c !<color>\n\n<pic=135> Giíi tÝnh: <color=red>"..sex.."<color>\n<pic=135> M«n ph¸i : <color=yellow>"..zFaction.."<color>\n<pic=135> CÊp ®é   : <color=red>"..GetLevel().."<color>\n<pic=135> TiÒn v¹n : <color=yellow>"..sMoney.."<color> v¹n\n<pic=135> Trang chñ: <color=red>Youtube.com/c/PYTAGAMING<color>"
	local tbOpt =
	{
		{"Gäi Boss Hoµng Kim",GoiBossHK},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
	return 1;
end
--Goi Boss--
function GoiBossHK() 
Auto_TestBoss()
end