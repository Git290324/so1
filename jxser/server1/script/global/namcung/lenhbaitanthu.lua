
Include("\\script\\global\\namcung\\hotrogm.lua")
Include("\\script\\global\\namcung\\namcung_say.lua")
Include("\\script\\global\\namcung\\tanthu.lua")
Include("\\script\\global\\�����õ�\\�ξ�\\npc\\·��_��ɮ.lua")



function main()	
	dofile("script/global/namcung/lenhbaitanthu.lua");	
	-- AddItem(6,1,22,1,0,0)
	-- AddItem(6,1,26,1,0,0)
	-- LoadScript("/script/global/namcung/hotrogm.lua");
			ttk = mod(GetTask(81),16)
			vlmt = mod(GetTask(80),16)
	Say("�� s� d�ng\nV� l�m m�t t�ch : "..vlmt.."\nT�y t�y kinh  : "..ttk.." ", 10, 
		"Nh�n h� tr� skill/HoTroSkill",
		"Nh�n V�ng s�ng h� tr� t�i c�p 80/vongsanghtb",
		"Nh�n th��ng ��t c�p 80/thuongcap80",
		"H�y trang b� kh�a/deltem",
		"Thoat/thoat"
		);
return 1
end
function test_trang2()	
	Say("Xin Chao", 10, 
		-- "Nhan full skill 120 /HoTroSkill_120",
		"Danh v�ng,Ph�c duy�n /danhvongphucduyen",
		"T�i l�nh ��o /lanhdao",
		"T�y �i�m /clear_attibute_point",
		"Thay ��i M�u PK /trangthai",
		-- "Bug tiem nang /tiemnang",
		-- "Tang tiem nang /add_prop",
		"Thoat/thoat"
		);
return 1
end
function HoTroSkill_120()
	local szFaction = GetFaction()
	if tbAllSkill[szFaction] == nil then
	Talk(1, "", "��i hi�p ch�a gia nh�p m�n ph�i");
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
	Talk(1, "", "Xin ch�c m�ng b�n �� nh�n ���c h� tr� k� n�ng t� BQT");
end
function cap80()
	local nCurLevel = GetLevel()
	if nCurLevel >= 81 then
			Talk(1, "", "Ng��i �� ��t c�p 81 r�i.")
		return
	end
	local nAddLevel = 81 - nCurLevel
	ST_LevelUp(nAddLevel)	
end;

function tiemnang()
AddProp(1000000)
end