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
	-- LoadScript("/script/global/Â·ÈË_Àñ¹Ù.lua")
-- for i = 16,20 do
-- AddGoldItem(0,194)
-- end
	local tbAward = 
	{
		{nExp_tl = 5000000},
	}
	-- tbAwardTemplet:GiveAwardByList(tbAward, "LÔ T×nh Nh©n n¨m 2011, më LÔ Hép T×nh Nh©n")
	
	local szTitle = "  "
				local tbOpt =
	{
		 --{"NhËn lÖnh bµi test", lbtest},
		-- {"NhËn hç trî t©n thñ", hotrotanthune},
		 {"®i luyÖn c«ng MAP VIP", gotobaitrain},
		--{"NhËn hç trî t©n thñ", hotrotanthune2},
		--{"NhËn nh¹c v­¬ng kiÕm", nhacvuongkiem},
		--{"NhËn phóc lîi h»ng ngµy", thuonghangngay},
		--{"NhËn bÝ kÝp 90",nhapbk90mienphi },
		--{"NhËn hç trî skill 6x", HoTroSkill},
		-- {"NhËn hç trî skill 6x", HoTroSkill},
		--{"Huy trang bi khoa", deltem},
		--{"NhËn Vßng s¸ng hæ trî tíi cÊp 80", vongsanghtb},
		--{"NhËn th­ëng ®¹t cÊp 80", thuongcap80},
		{"Tho¸t"},
	}
		CreateNewSayEx(szTitle, tbOpt)	
end

function gotobaitrain()

	    NewWorld(1000, 1581, 3197)
        SetFightState(1)

end
