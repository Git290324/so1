
Include("\\script\\global\\namcung\\hotrogm.lua")
Include("\\script\\global\\namcung\\namcung_say.lua")
Include("\\script\\global\\namcung\\tanthu.lua")
Include("\\script\\global\\ÌØÊâÓÃµØ\\ÃÎ¾³\\npc\\Â·ÈË_ÅÑÉ®.lua")



function main()	
	dofile("script/global/namcung/lenhbaitanthu.lua");	
	-- AddItem(6,1,22,1,0,0)
	-- AddItem(6,1,26,1,0,0)
	-- LoadScript("/script/global/namcung/hotrogm.lua");
			ttk = mod(GetTask(81),16)
			vlmt = mod(GetTask(80),16)
	Say("§· sö dông\nVâ l©m mËt tÞch : "..vlmt.."\nTÈy tñy kinh  : "..ttk.." ", 10, 
		"NhËn hç trî skill/HoTroSkill",
		"NhËn Vßng s¸ng hæ trî tíi cÊp 80/vongsanghtb",
		"NhËn th­ëng ®¹t cÊp 80/thuongcap80",
		"Hñy trang bÞ khãa/deltem",
		"Thoat/thoat"
		);
return 1
end
function test_trang2()	
	Say("Xin Chao", 10, 
		-- "Nhan full skill 120 /HoTroSkill_120",
		"Danh väng,Phóc duyªn /danhvongphucduyen",
		"Tµi l·nh ®¹o /lanhdao",
		"TÈy ®iÓm /clear_attibute_point",
		"Thay ®æi Mµu PK /trangthai",
		-- "Bug tiem nang /tiemnang",
		-- "Tang tiem nang /add_prop",
		"Thoat/thoat"
		);
return 1
end
function HoTroSkill_120()
	local szFaction = GetFaction()
	if tbAllSkill[szFaction] == nil then
	Talk(1, "", "§¹i hiÖp ch­a gia nhËp m«n ph¸i");
		return
	end
	for i=1, 9 do --ho tro den 9x
	--for i=1, 11 do --ho tro den 15x
		if tbAllSkill[szFaction][i] ~= nil then
			for j=1, getn(tbAllSkill[szFaction][i]) do
				--if HaveMagic(tbAllSkill[szFaction][i][j]) ~= -1 then
					--DelMagic(tbAllSkill[szFaction][i][j])
				--end
				--UpdateSkill()
				if HaveMagic(tbAllSkill[szFaction][i][j]) == -1 then
						if (i == 10 or i == 9 or i == 8) then
						AddMagic(tbAllSkill[szFaction][i][j],1)--ho tro den 20 dang cap skill
						else
						AddMagic(tbAllSkill[szFaction][i][j])
						end
				end
			end
		end
	end
	Talk(1, "", "Xin chóc mõng b¹n ®· nhËn ®­îc hæ trî kü n¨ng tõ BQT");
end
function cap80()
	local nCurLevel = GetLevel()
	if nCurLevel >= 81 then
			Talk(1, "", "Ng­¬i ®· ®¹t cÊp 81 råi.")
		return
	end
	local nAddLevel = 81 - nCurLevel
	ST_LevelUp(nAddLevel)	
end;

function tiemnang()
AddProp(1000000)
end