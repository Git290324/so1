
Include("\\script\\global\\namcung\\hotrogm.lua")
Include("\\script\\global\\namcung\\namcung_say.lua")
Include("\\script\\global\\namcung\\tanthu.lua")
Include("\\script\\global\\特殊用地\\梦境\\npc\\路人_叛僧.lua")



function main()	
	dofile("script/global/namcung/lenhbaitanthu.lua");	
	-- AddItem(6,1,22,1,0,0)
	-- AddItem(6,1,26,1,0,0)
	-- LoadScript("/script/global/namcung/hotrogm.lua");
			ttk = mod(GetTask(81),16)
			vlmt = mod(GetTask(80),16)
	Say("Х s� d鬾g\nV� l﹎ m藅 t辌h : "..vlmt.."\nT葃 t駓 kinh  : "..ttk.." ", 10, 
		"Nh薾 h� tr� skill/HoTroSkill",
		"Nh薾 V遪g s竛g h� tr� t韎 c蕄 80/vongsanghtb",
		"Nh薾 thng t c蕄 80/thuongcap80",
		"H駓 trang b� kh鉧/deltem",
		"Thoat/thoat"
		);
return 1
end
function test_trang2()	
	Say("Xin Chao", 10, 
		-- "Nhan full skill 120 /HoTroSkill_120",
		"Danh v鋘g,Ph骳 duy猲 /danhvongphucduyen",
		"T礽 l穘h o /lanhdao",
		"T葃 甶觤 /clear_attibute_point",
		"Thay i M祏 PK /trangthai",
		-- "Bug tiem nang /tiemnang",
		-- "Tang tiem nang /add_prop",
		"Thoat/thoat"
		);
return 1
end
function HoTroSkill_120()
	local szFaction = GetFaction()
	if tbAllSkill[szFaction] == nil then
	Talk(1, "", "Чi hi謕 ch璦 gia nh藀 m玭 ph竔");
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
	Talk(1, "", "Xin ch骳 m鮪g b筺  nh薾 頲 h� tr� k� n╪g t� BQT");
end
function cap80()
	local nCurLevel = GetLevel()
	if nCurLevel >= 81 then
			Talk(1, "", "Ngi  t c蕄 81 r錳.")
		return
	end
	local nAddLevel = 81 - nCurLevel
	ST_LevelUp(nAddLevel)	
end;

function tiemnang()
AddProp(1000000)
end