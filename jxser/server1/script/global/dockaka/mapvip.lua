Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\functionlib.lua")
Include("\\script\\lib\\log.lua")
IncludeLib("SETTING")
Include("\\script\\global\\rename_head.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\global\\fuyuan.lua")
Include("\\script\\global\\namcung\\hotrogm.lua")
Include("\\script\\global\\namcung\\xephang\\top10_all.lua")
Include("\\script\\task\\partner\\education\\swordking_people.lua")
Include("\\script\\global\\namcung\\hotrotanthu\\doiraclayvk.lua")
Include("\\script\\global\\namcung\\gmquanlyserver\\ds_gm.lua");
Include("\\script\\global\\namcung\\hotrogm.lua")
Include("\\script\\global\\namcung\\namcung_say.lua")



function main()
	dofile("script/global/dockaka/mapvip.lua");		
	-- LoadScript("/script/global/·��_���.lua")
-- for i = 16,20 do
-- AddGoldItem(0,194)
-- end
	local tbAward = 
	{
		{nExp_tl = 5000000},
	}
	-- tbAwardTemplet:GiveAwardByList(tbAward, "L� T�nh Nh�n n�m 2011, m� L� H�p T�nh Nh�n")
	
	local szTitle = "  "
				local tbOpt =
	{
		 --{"Nh�n l�nh b�i test", lbtest},
		-- {"Nh�n h� tr� t�n th�", hotrotanthune},
		 {"�i luy�n c�ng MAP VIP", gotobaitrain},
		--{"Nh�n h� tr� t�n th�", hotrotanthune2},
		--{"Nh�n nh�c v��ng ki�m", nhacvuongkiem},
		--{"Nh�n ph�c l�i h�ng ng�y", thuonghangngay},
		--{"Nh�n b� k�p 90",nhapbk90mienphi },
		--{"Nh�n h� tr� skill 6x", HoTroSkill},
		-- {"Nh�n h� tr� skill 6x", HoTroSkill},
		--{"Huy trang bi khoa", deltem},
		--{"Nh�n V�ng s�ng h� tr� t�i c�p 80", vongsanghtb},
		--{"Nh�n th��ng ��t c�p 80", thuongcap80},
		{"Tho�t"},
	}
		CreateNewSayEx(szTitle, tbOpt)	
end

function gotobaitrain()

	    NewWorld(1000, 1581, 3197)
        SetFightState(1)

end
