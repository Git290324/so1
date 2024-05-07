Include("\\script\\global\\fuyuan.lua")
Include("\\script\\global\\translife.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\missions\\leaguematch\\npc\\officer.lua")

function main()
local szTitle ="<npc>\n<color=yellow>Giíi h¹n C¶i L·o hiÖn t¹i:<color><bclr=blue> 99 lÇn<bclr><color=yellow>\nYªu CÇu:<color><color=yellow>\n + Trïng Sinh 4 trë lªn: <color=red>CÊp 200<color> <color> \n + TiÒn ®ång : <color=red> 300 xu <color>\n + TiÒn v¹n : <color=red> 10k v¹n <color>"
local tbOpt =
{
{"Ta Muèn C¶i L·o Hoµn §ång( kh«ng cÇn cëi bá trang bÞ) ", checkdkien},
{"T¹m biÖt!",jxlinux},
}
CreateNewSayEx(szTitle, tbOpt)
end

function myplayersex()
if GetSex() == 1 then
return "N÷ hiÖp";
else
return "§¹i hiÖp";
end
end

function checkdkien()
local n_solan = GetTask(900);
if n_solan >= 30 then
Talk(1,"","Server hiÖn t¹i ®ang giíi h¹n c¶i l·o lµ 99 lÇn..!\n<bclr=fire>"..myplayersex().."h·y kiªn nhÉn chê ®îi ®ît c¶i l·o tiÕp theo!")
return end
if ST_GetTransLifeCount() < 4 then --trung sinh 4 moi duoc cai lao
Talk(1, "", "<color=yellow>"..myplayersex().." ch­a Trïng Sinh 4 <color=red> kh«ng thÓ C¶i L·o!")
return end
if GetLevel() < 200 then --cap 200 moi duoc cai lao
Talk(1, "", "<color=yellow>"..myplayersex().." ch­a ®ñ 200 CÊp <color=red> kh«ng thÓ C¶i L·o!")
return end
if (GetCash() <= 100000000) then --gia tien 10k van 1 lan cai lao
Talk(1, "", "<color=yellow>"..myplayersex().." ch­a cã ®ñ 10k v¹n...!")
return end
local nSilverCount = CalcEquiproomItemCount(4, 417, 1, 1) ;
if(nSilverCount < 300) then -- gia xu 300 1 lan cai lao
Talk(1,"","Trªn ng­êi "..myplayersex().." kh«ng cã ®ñ<color=red> 300 TiÒn ®ång.") -- go
return end
Cai_lao_tt()
end
function Cai_lao_tt()
Pay(100000000) --- moi lan Cai Lao ton 10k van
ConsumeEquiproomItem(300,4,417,1,1) --- ton 300 xu 1 lan cai lao
str = "<color=green>Chóc mõng ®¹i cao thñ <color=yellow>"..GetName().." ®· c·i l·o hoµn ®ång thµnh c«ng!"
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
Msg2SubWorld("<color=green>Chóc mõng ®¹i cao thñ <color=yellow>"..GetName().."<color=pink> ®· c·i l·o lÇn <color=yellow><bclr=blue>"..n_solan.."<bclr><color> thµnh c«ng!<color=white><bclr=blue>\nTõ n·y Vâ L©m l¹i mét lÇn n÷a dËy sãng!")
KickOutSelf()
Msg2Player("B¹n §· C¶i L·o Thµnh C«ng..!")
end 