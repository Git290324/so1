IncludeLib("SETTING")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\global\\fuyuan.lua")
Include("\\script\\traogiaithdnb\\thdnb7.lua")
Include("\\script\\global\\writeaddressdialog.lua")
Include("\\script\\missions\\leaguematch\\npc\\officer.lua")
Include("\\script\\vng_event\\2012_vlnb\\main.lua")
Include("\\script\\global\\lottery_gold.lua")
Include("\\script\\global\\namcung\\hotroitem.lua")
Include("\\script\\global\\namcung\\hotrotanthu\\itemblue.lua")
Include("\\script\\global\\gm_tool\\")
Include("\\script\\global\\repute_head.lua")
Include("\\script\\misc\\league_cityinfo.lua")

function hotro()
	local tbOpt =
	{
		
		{"B¸nh trung thu ", banhtrungthu},
		{"Trë l¹i", namcung2},
		{"Tho¸t"},
	}
	CreateNewSayEx("<npc>Anh cÇn g×?", tbOpt)
end

function banhtrungthu()

--long den
AddItem(6,1,1245,0,0,0)
AddItem(6,1,1246,0,0,0)
AddItem(6,1,1243,0,0,0)
AddItem(6,1,1244,0,0,0)
AddItem(6,1,1242,0,0,0)
AddItem(6,1,1241,0,0,0)
--gianhsinh
AddItem(6,1,4209,0,0,0)
AddItem(6,1,4210,0,0,0)
AddItem(6,1,4211,0,0,0)
AddItem(6,1,4212,0,0,0)

--banh sinh nhat
AddItem(6,1,2256,0,0,0)
AddItem(6,1,2255,0,0,0)
AddItem(6,1,2662,0,0,0)
AddItem(6,1,2663,0,0,0)
AddItem(6,1,2664,0,0,0)
AddItem(6,1,2665,0,0,0)
AddItem(6,1,4114,0,0,0)


end
