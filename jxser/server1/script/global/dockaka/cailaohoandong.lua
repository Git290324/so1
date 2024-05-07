Include("\\script\\global\\fuyuan.lua")
Include("\\script\\global\\translife.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\missions\\leaguematch\\npc\\officer.lua")

function main()
local szTitle ="<npc>\n<color=yellow>Gi�i h�n C�i L�o hi�n t�i:<color><bclr=blue> 99 l�n<bclr><color=yellow>\nY�u C�u:<color><color=yellow>\n + Tr�ng Sinh 4 tr� l�n: <color=red>C�p 200<color> <color> \n + Ti�n ��ng : <color=red> 300 xu <color>\n + Ti�n v�n : <color=red> 10k v�n <color>"
local tbOpt =
{
{"Ta Mu�n C�i L�o Ho�n ��ng( kh�ng c�n c�i b� trang b�) ", checkdkien},
{"T�m bi�t!",jxlinux},
}
CreateNewSayEx(szTitle, tbOpt)
end

function myplayersex()
if GetSex() == 1 then
return "N� hi�p";
else
return "��i hi�p";
end
end

function checkdkien()
local n_solan = GetTask(900);
if n_solan >= 30 then
Talk(1,"","Server hi�n t�i �ang gi�i h�n c�i l�o l� 99 l�n..!\n<bclr=fire>"..myplayersex().."h�y ki�n nh�n ch� ��i ��t c�i l�o ti�p theo!")
return end
if ST_GetTransLifeCount() < 4 then --trung sinh 4 moi duoc cai lao
Talk(1, "", "<color=yellow>"..myplayersex().." ch�a Tr�ng Sinh 4 <color=red> kh�ng th� C�i L�o!")
return end
if GetLevel() < 200 then --cap 200 moi duoc cai lao
Talk(1, "", "<color=yellow>"..myplayersex().." ch�a �� 200 C�p <color=red> kh�ng th� C�i L�o!")
return end
if (GetCash() <= 100000000) then --gia tien 10k van 1 lan cai lao
Talk(1, "", "<color=yellow>"..myplayersex().." ch�a c� �� 10k v�n...!")
return end
local nSilverCount = CalcEquiproomItemCount(4, 417, 1, 1) ;
if(nSilverCount < 300) then -- gia xu 300 1 lan cai lao
Talk(1,"","Tr�n ng��i "..myplayersex().." kh�ng c� ��<color=red> 300 Ti�n ��ng.") -- go
return end
Cai_lao_tt()
end
function Cai_lao_tt()
Pay(100000000) --- moi lan Cai Lao ton 10k van
ConsumeEquiproomItem(300,4,417,1,1) --- ton 300 xu 1 lan cai lao
str = "<color=green>Ch�c m�ng ��i cao th� <color=yellow>"..GetName().." �� c�i l�o ho�n ��ng th�nh c�ng!"
AddGlobalCountNews(str, 2)
local nCurLevel = GetLevel() ---kiem tra cap do nhan vat
local nLevel = 90 ---cai lao ve lai lv 90, neu 0 thich thi chinh lv khac
local nAddLevel = nLevel - nCurLevel
ST_LevelUp(nAddLevel)
AddMagicPoint(50) -- diem ky nang them cho 1 lan Cai Lao
AddProp(1000) --diem tiem nang them cho 1 lan Cai Lao
PARTNER_CallOutCurPartner(0)
SetTask(900,GetTask(900)+1)
AddSkillState(966,10,1,3600*60*18) --- Hieu ung mat trang tren dau
AddSkillState(980,1,1,3600*60*18) --- Hieu ung mat trang tren dau
local n_solan = GetTask(900);
Msg2SubWorld("<color=green>Ch�c m�ng ��i cao th� <color=yellow>"..GetName().."<color=pink> �� c�i l�o l�n <color=yellow><bclr=blue>"..n_solan.."<bclr><color> th�nh c�ng!<color=white><bclr=blue>\nT� n�y V� L�m l�i m�t l�n n�a d�y s�ng!")
KickOutSelf()
Msg2Player("B�n �� C�i L�o Th�nh C�ng..!")
end 