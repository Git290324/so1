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
	"<color=green>Ch�o m�ng qu� nh�n s� <pic=1>",
	"<color=green>Nh�p Gift code  t�i ��y",
	"<color=orange>L�n Trang Ch� <color=red>TocChien.cc<color> �� nh�n gift code"
}
function npcchat_npcmacdinh()
	local nNpcIndex = GetLastDiagNpc();
	local nTaskChat = GetNpcParam(nNpcIndex,1);
	if nTaskChat == 0 then 
		SetNpcParam(nNpcIndex,1,1); --set index ��u ti�n c�a table npc chat.
		SetNpcTimer(nNpcIndex,500); --Tu� ch�nh th�i gian npc t� chat (20 s)
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
		Say("H�y c�t b�t v�t ph�m �� ��m b�o c� 20 � tr�ng r�i h�y m�.",0);
		return
	end
local szTitle = "<npc> Xin ch�o <color=red>"..GetName().."<color> ! V�o trang ch�: <color=yellow>tocchien.cc<color> �� nh�n gift code. \n\n<color=green>Ch� � b�o v� s�c kh�e v� t�i s�n khi ch�i Game.<pic=115><color>"
tbOpt=
{
	{"Nh�n Qu� tocchien", Code},
	{"Th�i"},
}
CreateNewSayEx(szTitle, tbOpt)
end


function Code() 
    CodeStrings() 
end 
