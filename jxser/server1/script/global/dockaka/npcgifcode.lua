IncludeLib("SETTING")
Include("\\script\\global\\titlefuncs.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\global\\fuyuan.lua")
Include("\\script\\missions\\leaguematch\\npc\\officer.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\global\\gift\\gift.lua")
------------------------------------------------------------------------------------------------------------
function main()
dofile("script/global/dockaka/npcgifcode.lua")
dialog_main()
end
tbChat = 
{
	"<color=green>Chµo mõng quý nh©n sü <pic=1>",
	"<color=green>NhËp Gift code  t¹i ®©y",
	"<color=orange>Lªn Trang Chñ <color=red>TocChien.cc<color> ®Ó nhËn gift code"
}
function npcchat_npcmacdinh()
	local nNpcIndex = GetLastDiagNpc();
	local nTaskChat = GetNpcParam(nNpcIndex,1);
	if nTaskChat == 0 then 
		SetNpcParam(nNpcIndex,1,1); --set index ®Çu tiªn cña table npc chat.
		SetNpcTimer(nNpcIndex,500); --Tuú chØnh thêi gian npc tù chat (20 s)
	end
end
function OnTimer(nNpcIndex,nTimeOut)
	local nTaskChat = GetNpcParam(nNpcIndex,1);
	if not nTaskChat or nTaskChat <= 0 then 
		nTaskChat = 1;
	else
		nTaskChat = nTaskChat + 1;
	end
	if nTaskChat > getn(tbChat) then 	
		nTaskChat = 1;
	end
	NpcChat(nNpcIndex,tbChat[nTaskChat],1);
	SetNpcParam(nNpcIndex,1,nTaskChat)
	SetNpcTimer(nNpcIndex,500);
end

function dialog_main()
npcchat_npcmacdinh()
    if CalcFreeItemCellCount() < 20 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 20 « trèng råi h·y më.",0);
		return
	end
local szTitle = "<npc> Xin chµo <color=red>"..GetName().."<color> ! Vµo trang chñ: <color=yellow>tocchien.cc<color> ®Ó nhËn gift code. \n\n<color=green>Chó ý b¶o vÖ søc kháe vµ tµi s¶n khi ch¬i Game.<pic=115><color>"
tbOpt=
{
	{"NhËn Quµ tocchien", Code},
	{"Th«i"},
}
CreateNewSayEx(szTitle, tbOpt)
end


function Code() 
    CodeStrings() 
end 
