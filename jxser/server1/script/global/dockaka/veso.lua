function main() 
dofile("script/global/dockaka/veso.lua");
   local nNgay = tonumber(GetLocalDate("%d")); 
    local nGio = tonumber(GetLocalDate("%H")); 
    local nPhut = tonumber(GetLocalDate("%M")); 
    local nHour = tonumber(date("%H%M"))


if GetTask(2046) == 0 and GetTask(2047) == 0 then
Say("<color=fire>§¹i lÝ vÐ sè<color>: VÐ sè §¹i ViÖt cã 2 lo¹i:<enter>Lo¹i 1 v¹n: gi¶i ®Æc biÖt <color=yellow>300 v¹n<color><enter>Lo¹i 10 v¹n: gi¶i ®Æc biÖt <color=yellow>5000 v¹n<color>",4,
    "Mua vÐ lo¹i 1 v¹n/loai1",
    "Mua vÐ lo¹i 10 v¹n/loai10",
    "Dß vÐ sè/giaydo",
    "Ta kh«ng cÇn/no" )
else
Say("<color=fire>§¹i lÝ vÐ sè<color>: VÐ sè ngµy h«m nay ng*¬i ®· chän lµ: <enter>Lo¹i 1 v¹n: <color=green>"..GetTask(2046).."<color><enter>Lo¹i 10 v¹n: <color=pink>"..GetTask(2047).."<color><enter>NÕu ng*¬i ®æi sè kh¸c th× vÉn ph¶i bÞ trõ sè tiÒn víi mçi lo¹i vÐ. Ng*¬i cã muèn ®æi kh«ng?",4,
    "§æi vÐ lo¹i 1 v¹n/loai1",
    "§æi vÐ lo¹i 10 v¹n/loai10",
    "Dß vÐ sè/giaydo",
    "Ta kh«ng cÇn/no" )
end
end




function loai1()


local nHour = tonumber(date("%H%M"))
if (nHour >= 1600 and nHour <= 2359) then
Talk(15,"","<color=fire>§¹i lÝ vÐ sè<color>: Tõ <color=yellow>16 giê 00 phót<color> ®Õn <color=yellow>00 giê 00 phót<color> ng*ng b¸n vÐ sè!")
return
end
Talk(15,"chon","<color=fire>§¹i lÝ vÐ sè<color>: Gi¸ vÐ lµ <color=yellow>1 v¹n l*îng<color> c¬ cÊu gi¶i th*ëng nh* sau:<enter>Gi¶i ®Æc biÖt 4 ch÷ sè: <color=yellow>300 v¹n<color><enter>Gi¶i nh× 3 ch÷ sè: <color=yellow>70 v¹n<color><enter>Gi¶i ba: <color=yellow>30 v¹n<color>")


end


function chon()
AskClientForNumber("tienvan",1000,9999,"NhËp 4 sè") 
end


function tienvan(nNum)
 local nNgay = tonumber(GetLocalDate("%d")); 
SetTask(2046,nNum)
SetTask(2048,nNgay)
Talk(15,"","<color=fire>§¹i lÝ vÐ sè<color>: Ng*¬i ®· chän sè <color=pink>"..nNum.."<color> <enter>víi gi¸ vÐ lµ <color=yellow>1 v¹n<color><enter>L*u ý: Thêi gian quay sè lµ <color=red>16h00<color> mçi ngµy. §õng t¾t sever vµo giê ®ã!")
Msg2Player("B¹n ®· mua vÐ sè <color=pink>"..nNum.."<color> víi gi¸ <color=yellow>1 v¹n l*îng.") 
AddNote("B¹n ®· mua vÐ sè <color=pink>"..nNum.."<color> víi gi¸ <color=yellow>1 v¹n l*îng.") 
end


function loai10()


    local nHour = tonumber(date("%H%M"))
if (nHour >= 1545 and nHour <= 2359) then
Talk(15,"","<color=fire>§¹i lÝ vÐ sè<color>: Tõ <color=yellow>15 giê 45 phót<color> ®Õn <color=yellow>00 giê 00 phót<color> ng*ng b¸n vÐ sè!")
return
end
Talk(15,"chon10","<color=fire>§¹i lÝ vÐ sè<color>: Gi¸ vÐ lµ <color=yellow>10 v¹n l*îng<color> c¬ cÊu gi¶i th*ëng nh* sau:<enter>Gi¶i ®Æc biÖt 4 ch÷ sè: <color=yellow>5000 v¹n<color><enter>Gi¶i nh× 3 ch÷ sè: <color=yellow>700 v¹n<color><enter>Gi¶i ba: <color=yellow>300 v¹n<color>")
end


function chon10()
AskClientForNumber("tienvan10",1000,9999,"NhËp 4 sè") 
end


function tienvan10(nNum)
local nNgay = tonumber(GetLocalDate("%d")); 
SetTask(2047,nNum)
SetTask(2049,nNgay)
Talk(15,"","<color=fire>§¹i lÝ vÐ sè<color>: Ng*¬i ®· chän sè <color=pink>"..nNum.."<color> <enter>víi gi¸ vÐ lµ <color=yellow>10 v¹n<color><enter>L*u ý: Thêi gian quay sè lµ <color=red>16h00<color> mçi ngµy. §õng t¾t sever vµo giê ®ã!")
Msg2Player("B¹n ®· mua vÐ sè <color=pink>"..nNum.."<color> víi gi¸ <color=yellow>10 v¹n l*îng.") 
AddNote("B¹n ®· mua vÐ sè <color=pink>"..nNum.."<color> víi gi¸ <color=yellow>10 v¹n l*îng.") 
end










function giaydo()
local nHour = tonumber(date("%H%M"))
if (nHour >= 1545 and nHour <= 1610) then
Talk(15,"","<color=fire>§¹i lÝ vÐ sè<color>: Tõ  <color=yellow>15 giê 45 phót<color> ®Õn <color=yellow>16 giê 10 phót<color> t¹m dõng ho¹t ®éng ®Ó thùc hiÖn xæ sè!")
return end


Say("<color=fire>§¹i lÝ vÐ sè<color>: Lo¹i 1 v¹n: <color=cyan>"..GetTask(2046).."<color>. Lo¹i 10 v¹n: <color=green>"..GetTask(2047).."<color><enter>KÕt qu¶ sæ xè k× tr*íc lµ:<enter> Gi¶i ba: <color=yellow>"..GetGlbMissionV(4).."<color><enter> Gi¶i nh×: <color=yellow>"..GetGlbMissionV(3).."<color><enter> Gi¶i §Æc biÖt: <color=pink>"..GetGlbMissionV(2).."<color><enter>L*u ý: <color=red>Gi¶i 3 vµ 2 ch÷ sè bÞ Èn sè 0 ë phÝa tr*íc do lçi kÜ thuËt In Ên!",3,
    "Tróng sè 1 v¹n/trung",
    "Tróng sè 10 v¹n/trung10",
    "C¶m ¬n/no" )
    
end




function trung()
local nNgay = tonumber(GetLocalDate("%d")); 
local TRUNG1 = GetTask(2046)
local TRUNG2 = GetGlbMissionV(2)
local TRUNG3 = GetGlbMissionV(3)
local TRUNG4 = GetGlbMissionV(4)


if GetTask(2048) == nNgay then


if GetTask(2046)  == GetGlbMissionV(2) then
Talk(15,"dacbiet","<color=green>Chóc mõng b¹n ®· tróng gi¶i §Æc biÖt sè <color=fire>"..GetGlbMissionV(2).."<color> víi sè tiÒn <color=yellow>300 v¹n<color>!!!")
return


elseif (TRUNG1  - 9000 == TRUNG3) or (TRUNG1  - 8000 == TRUNG3) or (TRUNG1  - 7000 == TRUNG3) or (TRUNG1  - 6000 == TRUNG3) or (TRUNG1  - 5000 == TRUNG3) or (TRUNG1  - 4000 == TRUNG3) or (TRUNG1  - 3000 == TRUNG3) or (TRUNG1  - 2000 == TRUNG3) or (TRUNG1  - 1000 == TRUNG3) then
Talk(15,"nhi","<color=green>Chóc mõng b¹n ®· tróng gi¶i Nh× sè <color=pink>"..GetGlbMissionV(3).."<color> víi sè tiÒn <color=yellow>70 v¹n<color>!!!")
return


elseif (TRUNG1  - 9900 == TRUNG4) or (TRUNG1  - 9800 == TRUNG4) or (TRUNG1  - 9700 == TRUNG4) or (TRUNG1  - 9600 == TRUNG4) or (TRUNG1  - 9500 == TRUNG4) or (TRUNG1  - 9400 == TRUNG4) or (TRUNG1  - 9300 == TRUNG4) or (TRUNG1  - 9200 == TRUNG4) or (TRUNG1  - 9100 == TRUNG4) or (TRUNG1  - 9000 == TRUNG4) then
Talk(15,"ba","<color=green>Chóc mõng b¹n ®· tróng gi¶i Ba sè <color=pink>"..GetGlbMissionV(4).."<color> víi sè tiÒn <color=yellow>30 v¹n<color>!!!")
return


elseif (TRUNG1  - 8900 == TRUNG4) or (TRUNG1  - 8800 == TRUNG4) or (TRUNG1  - 8700 == TRUNG4) or (TRUNG1  - 8600 == TRUNG4) or (TRUNG1  - 8500 == TRUNG4) or (TRUNG1  - 8400 == TRUNG4) or (TRUNG1  - 8300 == TRUNG4) or (TRUNG1  - 8200 == TRUNG4) or (TRUNG1  - 8100 == TRUNG4) or (TRUNG1  - 8000 == TRUNG4) then
Talk(15,"ba","<color=green>Chóc mõng b¹n ®· tróng gi¶i Ba sè <color=pink>"..GetGlbMissionV(4).."<color> víi sè tiÒn <color=yellow>30 v¹n<color>!!!")
return


elseif (TRUNG1  - 7900 == TRUNG4) or (TRUNG1  - 7800 == TRUNG4) or (TRUNG1  - 7700 == TRUNG4) or (TRUNG1  - 7600 == TRUNG4) or (TRUNG1  - 7500 == TRUNG4) or (TRUNG1  - 7400 == TRUNG4) or (TRUNG1  - 7300 == TRUNG4) or (TRUNG1  - 7200 == TRUNG4) or (TRUNG1  - 7100 == TRUNG4) or (TRUNG1  - 7000 == TRUNG4) then
Talk(15,"ba","<color=green>Chóc mõng b¹n ®· tróng gi¶i Ba sè <color=pink>"..GetGlbMissionV(4).."<color> víi sè tiÒn <color=yellow>30 v¹n<color>!!!")
return


elseif (TRUNG1  - 6900 == TRUNG4) or (TRUNG1  - 6800 == TRUNG4) or (TRUNG1  - 6700 == TRUNG4) or (TRUNG1  - 6600 == TRUNG4) or (TRUNG1  - 6500 == TRUNG4) or (TRUNG1  - 6400 == TRUNG4) or (TRUNG1  - 6300 == TRUNG4) or (TRUNG1  - 6200 == TRUNG4) or (TRUNG1  - 6100 == TRUNG4) or (TRUNG1  - 6000 == TRUNG4)  then
Talk(15,"ba","<color=green>Chóc mõng b¹n ®· tróng gi¶i Ba sè <color=pink>"..GetGlbMissionV(4).."<color> víi sè tiÒn <color=yellow>30 v¹n<color>!!!")
return


elseif (TRUNG1  - 5900 == TRUNG4) or (TRUNG1  - 5800 == TRUNG4) or (TRUNG1  - 5700 == TRUNG4) or (TRUNG1  - 5600 == TRUNG4) or (TRUNG1  - 5500 == TRUNG4) or (TRUNG1  - 5400 == TRUNG4) or (TRUNG1  - 5300 == TRUNG4) or (TRUNG1  - 5200 == TRUNG4) or (TRUNG1  - 5100 == TRUNG4) or (TRUNG1  - 5000 == TRUNG4) then
Talk(15,"ba","<color=green>Chóc mõng b¹n ®· tróng gi¶i Ba sè <color=pink>"..GetGlbMissionV(4).."<color> víi sè tiÒn <color=yellow>30 v¹n<color>!!!")
return


elseif (TRUNG1  - 4900 == TRUNG4) or (TRUNG1  - 4800 == TRUNG4) or (TRUNG1  - 4700 == TRUNG4) or (TRUNG1  - 4600 == TRUNG4) or (TRUNG1  - 4500 == TRUNG4) or (TRUNG1  - 4400 == TRUNG4) or (TRUNG1  - 4300 == TRUNG4) or (TRUNG1  - 4200 == TRUNG4) or (TRUNG1  - 4100 == TRUNG4) or (TRUNG1  - 4000 == TRUNG4) then
Talk(15,"ba","<color=green>Chóc mõng b¹n ®· tróng gi¶i Ba sè <color=pink>"..GetGlbMissionV(4).."<color> víi sè tiÒn <color=yellow>30 v¹n<color>!!!")
return


elseif (TRUNG1  - 3900 == TRUNG4) or (TRUNG1  - 3800 == TRUNG4) or (TRUNG1  - 3700 == TRUNG4) or (TRUNG1  - 3600 == TRUNG4) or (TRUNG1  - 3500 == TRUNG4) or (TRUNG1  - 3400 == TRUNG4) or (TRUNG1  - 3300 == TRUNG4) or (TRUNG1  - 3200 == TRUNG4) or (TRUNG1  - 3100 == TRUNG4) or (TRUNG1  - 3000 == TRUNG4) then
Talk(15,"ba","<color=green>Chóc mõng b¹n ®· tróng gi¶i Ba sè <color=pink>"..GetGlbMissionV(4).."<color> víi sè tiÒn <color=yellow>30 v¹n<color>!!!")
return


elseif (TRUNG1  - 2900 == TRUNG4) or (TRUNG1  - 2800 == TRUNG4) or (TRUNG1  - 2700 == TRUNG4) or (TRUNG1  - 2600 == TRUNG4) or (TRUNG1  - 2500 == TRUNG4) or (TRUNG1  - 2400 == TRUNG4) or (TRUNG1  - 2300 == TRUNG4) or (TRUNG1  - 2200 == TRUNG4) or (TRUNG1  - 2100 == TRUNG4)or (TRUNG1  - 2000 == TRUNG4)  then
Talk(15,"ba","<color=green>Chóc mõng b¹n ®· tróng gi¶i Ba sè <color=pink>"..GetGlbMissionV(4).."<color> víi sè tiÒn <color=yellow>30 v¹n<color>!!!")
return


elseif (TRUNG1  - 1900 == TRUNG4) or (TRUNG1  - 1800 == TRUNG4) or (TRUNG1  - 1700 == TRUNG4) or (TRUNG1  - 1600 == TRUNG4) or (TRUNG1  - 1500 == TRUNG4) or (TRUNG1  - 1400 == TRUNG4) or (TRUNG1  - 1300 == TRUNG4) or (TRUNG1  - 1200 == TRUNG4) or (TRUNG1  - 1100 == TRUNG4) or (TRUNG1  - 1000 == TRUNG4) then
Talk(15,"ba","<color=green>Chóc mõng b¹n ®· tróng gi¶i Ba sè <color=pink>"..GetGlbMissionV(4).."<color> víi sè tiÒn <color=yellow>30 v¹n<color>!!!")
return
else
Talk(15,"","Xin chia buån!")
end
else
Talk(15,"","RÊt tiÕt vÐ sè cña ng*¬i ®· nhÇm ngµy, h·y mua vÐ sè míi!")
end
end


function dacbiet()
Earn(3000000)
SetTask(2046,0)
Msg2Player("<color=green>Chóc mõng b¹n nhËn ®*îc <color=yellow>300 v¹n l*îng")
end


function nhi()
Earn(700000)
SetTask(2046,0)
Msg2Player("<color=green>Chóc mõng b¹n nhËn ®*îc <color=yellow>70 v¹n l*îng")
end


function ba()
SetTask(2046,0)
Earn(300000)
Msg2Player("<color=green>Chóc mõng b¹n nhËn ®*îc <color=yellow>30 v¹n l*îng")
end


-----------------------------------------------------------------------------


function trung10()
local nNgay = tonumber(GetLocalDate("%d")); 
local TRUNG1 = GetTask(2047)
local TRUNG2 = GetGlbMissionV(2)
local TRUNG3 = GetGlbMissionV(3)
local TRUNG4 = GetGlbMissionV(4)


if GetTask(2049) == nNgay then


if GetTask(2047)  == GetGlbMissionV(2) then
Talk(15,"dacbiet10","<color=green>Chóc mõng b¹n ®· tróng gi¶i §Æc biÖt sè <color=fire>"..GetGlbMissionV(2).."<color> víi sè tiÒn <color=yellow>5000 v¹n<color>!!!")
return


elseif (TRUNG1  - 9000 == TRUNG3) or (TRUNG1  - 8000 == TRUNG3) or (TRUNG1  - 7000 == TRUNG3) or (TRUNG1  - 6000 == TRUNG3) or (TRUNG1  - 5000 == TRUNG3) or (TRUNG1  - 4000 == TRUNG3) or (TRUNG1  - 3000 == TRUNG3) or (TRUNG1  - 2000 == TRUNG3) or (TRUNG1  - 1000 == TRUNG3) then
Talk(15,"nhi10","<color=green>Chóc mõng b¹n ®· tróng gi¶i Nh× sè <color=pink>"..GetGlbMissionV(3).."<color> víi sè tiÒn <color=yellow>700 v¹n<color>!!!")
return


elseif (TRUNG1  - 9900 == TRUNG4) or (TRUNG1  - 9800 == TRUNG4) or (TRUNG1  - 9700 == TRUNG4) or (TRUNG1  - 9600 == TRUNG4) or (TRUNG1  - 9500 == TRUNG4) or (TRUNG1  - 9400 == TRUNG4) or (TRUNG1  - 9300 == TRUNG4) or (TRUNG1  - 9200 == TRUNG4) or (TRUNG1  - 9100 == TRUNG4) or (TRUNG1  - 9000 == TRUNG4) then
Talk(15,"ba10","<color=green>Chóc mõng b¹n ®· tróng gi¶i Ba sè <color=pink>"..GetGlbMissionV(4).."<color> víi sè tiÒn <color=yellow>300 v¹n<color>!!!")
return


elseif (TRUNG1  - 8900 == TRUNG4) or (TRUNG1  - 8800 == TRUNG4) or (TRUNG1  - 8700 == TRUNG4) or (TRUNG1  - 8600 == TRUNG4) or (TRUNG1  - 8500 == TRUNG4) or (TRUNG1  - 8400 == TRUNG4) or (TRUNG1  - 8300 == TRUNG4) or (TRUNG1  - 8200 == TRUNG4) or (TRUNG1  - 8100 == TRUNG4) or (TRUNG1  - 8000 == TRUNG4) then
Talk(15,"ba10","<color=green>Chóc mõng b¹n ®· tróng gi¶i Ba sè <color=pink>"..GetGlbMissionV(4).."<color> víi sè tiÒn <color=yellow>300 v¹n<color>!!!")
return


elseif (TRUNG1  - 7900 == TRUNG4) or (TRUNG1  - 7800 == TRUNG4) or (TRUNG1  - 7700 == TRUNG4) or (TRUNG1  - 7600 == TRUNG4) or (TRUNG1  - 7500 == TRUNG4) or (TRUNG1  - 7400 == TRUNG4) or (TRUNG1  - 7300 == TRUNG4) or (TRUNG1  - 7200 == TRUNG4) or (TRUNG1  - 7100 == TRUNG4) or (TRUNG1  - 7000 == TRUNG4) then
Talk(15,"ba10","<color=green>Chóc mõng b¹n ®· tróng gi¶i Ba sè <color=pink>"..GetGlbMissionV(4).."<color> víi sè tiÒn <color=yellow>300 v¹n<color>!!!")
return


elseif (TRUNG1  - 6900 == TRUNG4) or (TRUNG1  - 6800 == TRUNG4) or (TRUNG1  - 6700 == TRUNG4) or (TRUNG1  - 6600 == TRUNG4) or (TRUNG1  - 6500 == TRUNG4) or (TRUNG1  - 6400 == TRUNG4) or (TRUNG1  - 6300 == TRUNG4) or (TRUNG1  - 6200 == TRUNG4) or (TRUNG1  - 6100 == TRUNG4) or (TRUNG1  - 6000 == TRUNG4)then
Talk(15,"ba10","<color=green>Chóc mõng b¹n ®· tróng gi¶i Ba sè <color=pink>"..GetGlbMissionV(4).."<color> víi sè tiÒn <color=yellow>300 v¹n<color>!!!")
return


elseif (TRUNG1  - 5900 == TRUNG4) or (TRUNG1  - 5800 == TRUNG4) or (TRUNG1  - 5700 == TRUNG4) or (TRUNG1  - 5600 == TRUNG4) or (TRUNG1  - 5500 == TRUNG4) or (TRUNG1  - 5400 == TRUNG4) or (TRUNG1  - 5300 == TRUNG4) or (TRUNG1  - 5200 == TRUNG4) or (TRUNG1  - 5100 == TRUNG4) or (TRUNG1  - 5000 == TRUNG4) then
Talk(15,"ba10","<color=green>Chóc mõng b¹n ®· tróng gi¶i Ba sè <color=pink>"..GetGlbMissionV(4).."<color> víi sè tiÒn <color=yellow>300 v¹n<color>!!!")
return


elseif (TRUNG1  - 4900 == TRUNG4) or (TRUNG1  - 4800 == TRUNG4) or (TRUNG1  - 4700 == TRUNG4) or (TRUNG1  - 4600 == TRUNG4) or (TRUNG1  - 4500 == TRUNG4) or (TRUNG1  - 4400 == TRUNG4) or (TRUNG1  - 4300 == TRUNG4) or (TRUNG1  - 4200 == TRUNG4) or (TRUNG1  - 4100 == TRUNG4) or (TRUNG1  - 4000 == TRUNG4) then
Talk(15,"ba10","<color=green>Chóc mõng b¹n ®· tróng gi¶i Ba sè <color=pink>"..GetGlbMissionV(4).."<color> víi sè tiÒn <color=yellow>300 v¹n<color>!!!")
return


elseif (TRUNG1  - 3900 == TRUNG4) or (TRUNG1  - 3800 == TRUNG4) or (TRUNG1  - 3700 == TRUNG4) or (TRUNG1  - 3600 == TRUNG4) or (TRUNG1  - 3500 == TRUNG4) or (TRUNG1  - 3400 == TRUNG4) or (TRUNG1  - 3300 == TRUNG4) or (TRUNG1  - 3200 == TRUNG4) or (TRUNG1  - 3100 == TRUNG4) or (TRUNG1  - 3000 == TRUNG4) then
Talk(15,"ba10","<color=green>Chóc mõng b¹n ®· tróng gi¶i Ba sè <color=pink>"..GetGlbMissionV(4).."<color> víi sè tiÒn <color=yellow>300 v¹n<color>!!!")
return


elseif (TRUNG1  - 2900 == TRUNG4) or (TRUNG1  - 2800 == TRUNG4) or (TRUNG1  - 2700 == TRUNG4) or (TRUNG1  - 2600 == TRUNG4) or (TRUNG1  - 2500 == TRUNG4) or (TRUNG1  - 2400 == TRUNG4) or (TRUNG1  - 2300 == TRUNG4) or (TRUNG1  - 2200 == TRUNG4) or (TRUNG1  - 2100 == TRUNG4) or (TRUNG1  - 2000 == TRUNG4) then
Talk(15,"ba10","<color=green>Chóc mõng b¹n ®· tróng gi¶i Ba sè <color=pink>"..GetGlbMissionV(4).."<color> víi sè tiÒn <color=yellow>300 v¹n<color>!!!")
return


elseif (TRUNG1  - 1900 == TRUNG4) or (TRUNG1  - 1800 == TRUNG4) or (TRUNG1  - 1700 == TRUNG4) or (TRUNG1  - 1600 == TRUNG4) or (TRUNG1  - 1500 == TRUNG4) or (TRUNG1  - 1400 == TRUNG4) or (TRUNG1  - 1300 == TRUNG4) or (TRUNG1  - 1200 == TRUNG4) or (TRUNG1  - 1100 == TRUNG4) or (TRUNG1  - 1000 == TRUNG4) then
Talk(15,"ba10","<color=green>Chóc mõng b¹n ®· tróng gi¶i Ba sè <color=pink>"..GetGlbMissionV(4).."<color> víi sè tiÒn <color=yellow>300 v¹n<color>!!!")
return
else
Talk(15,"","Xin chia buån!")
end
else
Talk(15,"","RÊt tiÕt vÐ sè cña ng*¬i ®· nhÇm ngµy, h·y mua vÐ sè míi!")
end
end


function dacbiet10()
SetTask(2047,0)
Earn(50000000)
Msg2Player("<color=green>Chóc mõng b¹n nhËn ®*îc <color=yellow>300 v¹n l*îng")
end


function nhi10()
SetTask(2047,0)
Earn(7000000)
Msg2Player("<color=green>Chóc mõng b¹n nhËn ®*îc <color=yellow>70 v¹n l*îng")
end


function ba10()
SetTask(2047,0)
Earn(3000000)
Msg2Player("<color=green>Chóc mõng b¹n nhËn ®*îc <color=yellow>30 v¹n l*îng")
end