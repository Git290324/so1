IncludeLib("SETTING")
Include("\\script\\global\\jxprivate\\xephang\\top.lua")
Include("\\script\\global\\jxprivate\\xephang\\lib.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\progressbar.lua")
Include("\\script\\lib\\remoteexc.lua")

Task_BXH_Show = 5003

function main ()
	dofile("script/global/jxprivate/xephang/bangxephang.lua");
	if n_Bang_Xep_Hang ~= 1 then
		Talk(1, "", "<color=yellow>B¶ng XÕp H¹ng: <color>Server ®ang trong qu¸ tr×nh ®ua TOP, lÇn sau c¸c h¹ h·y ®Õn nhÐ !");
		return
	end
	OnClick()
end
local _OnBreak = function()
	Msg2Player("Qu¸ tr×nh thùc thi bÞ gi¸n ®o¹n...")
end

function OnClick()
tbProgressBar:OpenByConfig(23, dialog_main,{}, %_OnBreak)
end

BangXepHang = "<link=image[0]:\\spr\\item\\bxh.spr><link>"

function dialog_main()
	if(GetLevel() < 50) then
		Say("<color=yellow>B¶ng XÕp H¹ng: <color>CÊp ®é ph¶i tõ <color=red>50<color> trë lªn míi cã thÓ ®¨ng ký vµo danh s¸ch nµy, H·y tiÕp tôc cè g¾ng nhÐ !")
		return
	end
	local tbOpt ={}
	local szTitle=""..BangXepHang..""
	if not XepHang.TopAllServer then
		Say("<color=yellow>B¶ng XÕp H¹ng: <color>HiÖn t¹i ch­a cã B¶ng XÕp H¹ng, hÑn ®¹i hiÖp lÇn sau nhÐ !")
		return
	end
	local nCount = getn(%XepHang.TopAllServer)
	if(nCount == 0 or nCount < 1) then
		Say("<color=yellow>B¶ng XÕp H¹ng: <color>HiÖn t¹i ch­a cã B¶ng XÕp H¹ng, hÑn ®¹i hiÖp lÇn sau nhÐ !")
		return
	end
	if nCount > 20 then
		nCount=20
	end
	for i= 1,nCount do
		szTitle = format("%s <pic=135> H¹ng: <color=red>%d<color>	Cao Thñ: <color=yellow>%s<color>\n",szTitle,i,XepHang.TopAllServer[i][1],20)
	end
	szTitle = " Danh s¸ch cao thñ giang hå: \n"..szTitle.." <color=red><pic=137>Chó ý<color>: <color=green>b¶o vÖ søc kháe vµ tµi s¶n khi ch¬i Game.<pic=115><color>"
	if (GetGameTime() >= GetTask(Task_BXH_Show)) then
		tinsert(tbOpt,{"§¨ng Ký Vµo Danh S¸ch B¶ng XÕp H¹ng",ProgressLuuDanhSach})
	end
	tinsert(tbOpt,{"Xem XÕp H¹ng B¶n Th©n",strzMe})
	tinsert(tbOpt,{"Xem XÕp H¹ng Theo Tªn Nh©n VËt",strzName})
	tinsert(tbOpt,{"Xem XÕp H¹ng Theo Thø H¹ng Trong Server",strzNumber})
	tinsert(tbOpt,{"Tho¸t"})
	CreateNewSayEx(szTitle, tbOpt)
end

function ProgressLuuDanhSach()
	tbProgressBar:OpenByConfig(24, LuuVaoDanhSach,{}, %_OnBreak)
end
function LuuVaoDanhSach()
	RemoteExc("\\script\\jxprivate\\jx_xephang.lua", "BXH_LuuDSNhanVat", {GetName(), ST_GetTransLifeCount(), GetLevel(), GetExp(), GetExpPercent(), GetLastFactionNumber(), GetAccount()})
	SetTask(Task_BXH_Show,GetGameTime()+600)
	Say("§¨ng ký vµo danh s¸ch xÕp h¹ng thµnh c«ng !\n\nL­u ý: Mçi lÇn ®¨ng ký c¸ch nhau Ýt nhÊt lµ <color=yellow>10 phót<color>")
end

function strzMe()
	local szTitle=""
	if not XepHang.TopAllServer then
		Say("<color=yellow>B¶ng XÕp H¹ng: <color>HiÖn t¹i ch­a cã B¶ng XÕp H¹ng, hÑn ®¹i hiÖp lÇn sau nhÐ !")
		return
	end
	local nCount = getn(XepHang.TopAllServer)
	if(nCount == 0 or nCount < 1) then
		Say("<color=yellow>B¶ng XÕp H¹ng: <color>HiÖn t¹i ch­a cã B¶ng XÕp H¹ng, hÑn ®¹i hiÖp lÇn sau nhÐ !")
		return
	else
		tbProgressBar:OpenByConfig(22, XemXepHang,{GetName()}, %_OnBreak)
	end
end

IDXepHang=""
function strzName()
	local szTitle=""
	if not XepHang.TopAllServer then
		Say("<color=yellow>B¶ng XÕp H¹ng: <color>HiÖn t¹i ch­a cã B¶ng XÕp H¹ng, hÑn ®¹i hiÖp lÇn sau nhÐ !")
		return
	end
	local nCount = getn(XepHang.TopAllServer)
	if(nCount == 0 or nCount < 1) then
		Say("<color=yellow>B¶ng XÕp H¹ng: <color>HiÖn t¹i ch­a cã B¶ng XÕp H¹ng, hÑn ®¹i hiÖp lÇn sau nhÐ !")
		return
	else
		AskClientForString("ProgressXemXepHang",GetName(),1,100,"NhËp Tªn Nh©n VËt:")
	end
end
function strzNumber()
	local szTitle=""
	if not XepHang.TopAllServer then
		Say("<color=yellow>B¶ng XÕp H¹ng: <color>HiÖn t¹i ch­a cã B¶ng XÕp H¹ng, hÑn ®¹i hiÖp lÇn sau nhÐ !")
		return
	end
	local nCount = getn(XepHang.TopAllServer)
	if(nCount == 0 or nCount < 1) then
		Say("<color=yellow>B¶ng XÕp H¹ng: <color>HiÖn t¹i ch­a cã B¶ng XÕp H¹ng, hÑn ®¹i hiÖp lÇn sau nhÐ !")
		return
	else
		g_AskClientNumberEx(0, nCount, "NhËp H¹ng CÇn Xem:", {Progressn_XemXepHang, {nIndex}})
	end
end
function ProgressXemXepHang(zName)
	tbProgressBar:OpenByConfig(22, XemXepHang,{zName}, %_OnBreak)
end
function XemXepHang(zName)
	if zName == "" or zName == nil then
		Say("Giën h¶ d©n ch¬i ?")
	end
	if TrongTopServer(zName)==1 then
		local n_faction = XepHang.TopAllServer[IDXepHang][7]
		if n_faction == 1 then--ThiÕu L©m
			n_faction="ThiÕu L©m"
		elseif n_faction == 2 then--Thiªn V­¬ng
			n_faction="Thiªn V­¬ng Bang"
		elseif n_faction == 3 then--§­êng M«n
			n_faction="§­êng M«n"
		elseif n_faction == 4 then--Ngò §éc
			n_faction="Ngò §éc Gi¸o"
		elseif n_faction == 5 then--Nga Mi
			n_faction="Nga Mi"
		elseif n_faction == 6 then--Thóy Yªn
			n_faction="Thóy Yªn M«n"
		elseif n_faction == 7 then--C¸i Bang
			n_faction="C¸i Bang"
		elseif n_faction == 8 then--Thiªn NhÉn
			n_faction="Thiªn NhÉn"
		elseif n_faction == 9 then--Vâ §ang
			n_faction="Vâ §ang"
		elseif n_faction == 10 then--C«n L«n
			n_faction="C«n L«n"
		else
			n_faction="V« Danh"
		end
		local szTitle = BangXepHang.."Th«ng Tin Nh©n VËt:\n\n<pic=136> Tªn Nh©n VËt:     <color=red>"..XepHang.TopAllServer[IDXepHang][1].."<color>\n<pic=136> XÕp H¹ng:         <color=yellow>"..XepHang.TopAllServer[IDXepHang][6].."<color>\n<pic=136> CÊp §é:           <color=red>"..XepHang.TopAllServer[IDXepHang][3].."<color>\n<pic=136> Trïng Sinh:       <color=yellow>"..XepHang.TopAllServer[IDXepHang][2].."<color>\n<pic=136> M«n Ph¸i:         <color=red>"..n_faction.."<color>\n\n<color=red><pic=137> Chó ý<color>: <color=green>b¶o vÖ søc kháe vµ tµi s¶n khi ch¬i Game.<pic=115><color>"
		local tbOpt =
		{
			{"Tho¸t"},
		}
		CreateNewSayEx(szTitle, tbOpt)
		return
	else
		Say("<color=yellow>"..zName.."<color> kh«ng n»m trong danh s¸ch cao thñ, cÇn ph¶i cè g¾ng nhiÒu h¬n n÷a !")
	end
end

function TrongTopServer(zName)
	if not XepHang.TopAllServer then
		return
	end
	local nCount = getn(XepHang.TopAllServer)
	for i= 1,nCount do
		if(XepHang.TopAllServer[i][1] == zName) then
			IDXepHang=i
			return 1
		end
	end
	return 0
end

function Progressn_XemXepHang(nIndex)
	tbProgressBar:OpenByConfig(22, n_XemXepHang,{nIndex}, %_OnBreak)
end

function n_XemXepHang(nIndex)
	if nIndex == 0 then
		Say("Giën h¶ d©n ch¬i ?")
		return
	end
	local nCount = getn(XepHang.TopAllServer)
	for i= 1,nCount do
		if(XepHang.TopAllServer[i][6] == nIndex) then
		local n_faction = XepHang.TopAllServer[i][7]
		if n_faction == 1 then--ThiÕu L©m
			n_faction="ThiÕu L©m"
		elseif n_faction == 2 then--Thiªn V­¬ng
			n_faction="Thiªn V­¬ng Bang"
		elseif n_faction == 3 then--§­êng M«n
			n_faction="§­êng M«n"
		elseif n_faction == 4 then--Ngò §éc
			n_faction="Ngò §éc Gi¸o"
		elseif n_faction == 5 then--Nga Mi
			n_faction="Nga Mi"
		elseif n_faction == 6 then--Thóy Yªn
			n_faction="Thóy Yªn M«n"
		elseif n_faction == 7 then--C¸i Bang
			n_faction="C¸i Bang"
		elseif n_faction == 8 then--Thiªn NhÉn
			n_faction="Thiªn NhÉn"
		elseif n_faction == 9 then--Vâ §ang
			n_faction="Vâ §ang"
		elseif n_faction == 10 then--C«n L«n
			n_faction="C«n L«n"
		else
			n_faction="V« Danh"
		end
		local szTitle = BangXepHang.."Th«ng Tin Nh©n VËt:\n\n<pic=136> Tªn Nh©n VËt:     <color=red>"..XepHang.TopAllServer[i][1].."<color>\n<pic=136> XÕp H¹ng:         <color=yellow>"..XepHang.TopAllServer[i][6].."<color>\n<pic=136> CÊp §é:           <color=red>"..XepHang.TopAllServer[i][3].."<color>\n<pic=136> Trïng Sinh:       <color=yellow>"..XepHang.TopAllServer[i][2].."<color>\n<pic=136> M«n Ph¸i:         <color=red>"..n_faction.."<color>\n\n<color=red><pic=137> Chó ý<color>: <color=green>b¶o vÖ søc kháe vµ tµi s¶n khi ch¬i Game.<pic=115><color>"
		local tbOpt =
		{
			{"Tho¸t"},
		}
		CreateNewSayEx(szTitle, tbOpt)
		return
		end
	end
end

-------Hµm l­u d÷ liÖu nh©n vËt, ®¨ng ký nÕu nh©n vËt ch­a ®c ®¨ng ký vµ s¾p xÕp topall,top10server,top10 m«n ph¸i (cã thÓ dïng task ®Ó tù ®éng ch¹y )
function SaveDataGamer()
	local gmrole = PlayerIndex;
	local count = GetPlayerCount();
	if count > 0 then 
		for i=1,count do 
			PlayerIndex = i;
			if PlayerIndex > 0 then 
				SaveNow();
			end
		end
	end
	print("[=====> Luu Du Lieu Gamer Dang Online Toan Server Hoan Tat<=====]")
end
function XepHangVaLuu()
	if  SVR_Race_Top == 1 then
		print("[=====> Server Dang Trong Qua Trinh Dua Top - Chuc Nang Tam Dong <=====]")
		return
	end
	local gmrole = PlayerIndex;
	local count = GetPlayerCount();
	if count > 0 then 
		for i=1,count do 
			PlayerIndex = i;
			if PlayerIndex > 0 then 
				RemoteExc("\\script\\jxprivate\\jx_xephang.lua", "BXH_LuuDSNhanVat", {GetName(), ST_GetTransLifeCount(), GetLevel(), GetExp(), GetExpPercent(), GetLastFactionNumber(), GetAccount()})
				SaveNow();
			end
		end
	end
	XepHang:SapXepTopToanServer()
	XepHang:Top10Server()
	XepHang:Top10MonPhai()
	print("[=====> Cap Nhat Bang Xep Hang Toan Server Hoan Tat<=====]")
end