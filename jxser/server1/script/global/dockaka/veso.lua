function main() 
dofile("script/global/dockaka/veso.lua");
   local nNgay = tonumber(GetLocalDate("%d")); 
    local nGio = tonumber(GetLocalDate("%H")); 
    local nPhut = tonumber(GetLocalDate("%M")); 
    local nHour = tonumber(date("%H%M"))


if GetTask(2046) == 0 and GetTask(2047) == 0 then
Say("<color=fire>��i l� v� s�<color>: V� s� ��i Vi�t c� 2 lo�i:<enter>Lo�i 1 v�n: gi�i ��c bi�t <color=yellow>300 v�n<color><enter>Lo�i 10 v�n: gi�i ��c bi�t <color=yellow>5000 v�n<color>",4,
    "Mua v� lo�i 1 v�n/loai1",
    "Mua v� lo�i 10 v�n/loai10",
    "D� v� s�/giaydo",
    "Ta kh�ng c�n/no" )
else
Say("<color=fire>��i l� v� s�<color>: V� s� ng�y h�m nay ng*�i �� ch�n l�: <enter>Lo�i 1 v�n: <color=green>"..GetTask(2046).."<color><enter>Lo�i 10 v�n: <color=pink>"..GetTask(2047).."<color><enter>N�u ng*�i ��i s� kh�c th� v�n ph�i b� tr� s� ti�n v�i m�i lo�i v�. Ng*�i c� mu�n ��i kh�ng?",4,
    "��i v� lo�i 1 v�n/loai1",
    "��i v� lo�i 10 v�n/loai10",
    "D� v� s�/giaydo",
    "Ta kh�ng c�n/no" )
end
end




function loai1()


local nHour = tonumber(date("%H%M"))
if (nHour >= 1600 and nHour <= 2359) then
Talk(15,"","<color=fire>��i l� v� s�<color>: T� <color=yellow>16 gi� 00 ph�t<color> ��n <color=yellow>00 gi� 00 ph�t<color> ng*ng b�n v� s�!")
return
end
Talk(15,"chon","<color=fire>��i l� v� s�<color>: Gi� v� l� <color=yellow>1 v�n l*�ng<color> c� c�u gi�i th*�ng nh* sau:<enter>Gi�i ��c bi�t 4 ch� s�: <color=yellow>300 v�n<color><enter>Gi�i nh� 3 ch� s�: <color=yellow>70 v�n<color><enter>Gi�i ba: <color=yellow>30 v�n<color>")


end


function chon()
AskClientForNumber("tienvan",1000,9999,"Nh�p 4 s�") 
end


function tienvan(nNum)
 local nNgay = tonumber(GetLocalDate("%d")); 
SetTask(2046,nNum)
SetTask(2048,nNgay)
Talk(15,"","<color=fire>��i l� v� s�<color>: Ng*�i �� ch�n s� <color=pink>"..nNum.."<color> <enter>v�i gi� v� l� <color=yellow>1 v�n<color><enter>L*u �: Th�i gian quay s� l� <color=red>16h00<color> m�i ng�y. ��ng t�t sever v�o gi� ��!")
Msg2Player("B�n �� mua v� s� <color=pink>"..nNum.."<color> v�i gi� <color=yellow>1 v�n l*�ng.") 
AddNote("B�n �� mua v� s� <color=pink>"..nNum.."<color> v�i gi� <color=yellow>1 v�n l*�ng.") 
end


function loai10()


    local nHour = tonumber(date("%H%M"))
if (nHour >= 1545 and nHour <= 2359) then
Talk(15,"","<color=fire>��i l� v� s�<color>: T� <color=yellow>15 gi� 45 ph�t<color> ��n <color=yellow>00 gi� 00 ph�t<color> ng*ng b�n v� s�!")
return
end
Talk(15,"chon10","<color=fire>��i l� v� s�<color>: Gi� v� l� <color=yellow>10 v�n l*�ng<color> c� c�u gi�i th*�ng nh* sau:<enter>Gi�i ��c bi�t 4 ch� s�: <color=yellow>5000 v�n<color><enter>Gi�i nh� 3 ch� s�: <color=yellow>700 v�n<color><enter>Gi�i ba: <color=yellow>300 v�n<color>")
end


function chon10()
AskClientForNumber("tienvan10",1000,9999,"Nh�p 4 s�") 
end


function tienvan10(nNum)
local nNgay = tonumber(GetLocalDate("%d")); 
SetTask(2047,nNum)
SetTask(2049,nNgay)
Talk(15,"","<color=fire>��i l� v� s�<color>: Ng*�i �� ch�n s� <color=pink>"..nNum.."<color> <enter>v�i gi� v� l� <color=yellow>10 v�n<color><enter>L*u �: Th�i gian quay s� l� <color=red>16h00<color> m�i ng�y. ��ng t�t sever v�o gi� ��!")
Msg2Player("B�n �� mua v� s� <color=pink>"..nNum.."<color> v�i gi� <color=yellow>10 v�n l*�ng.") 
AddNote("B�n �� mua v� s� <color=pink>"..nNum.."<color> v�i gi� <color=yellow>10 v�n l*�ng.") 
end










function giaydo()
local nHour = tonumber(date("%H%M"))
if (nHour >= 1545 and nHour <= 1610) then
Talk(15,"","<color=fire>��i l� v� s�<color>: T�  <color=yellow>15 gi� 45 ph�t<color> ��n <color=yellow>16 gi� 10 ph�t<color> t�m d�ng ho�t ��ng �� th�c hi�n x� s�!")
return end


Say("<color=fire>��i l� v� s�<color>: Lo�i 1 v�n: <color=cyan>"..GetTask(2046).."<color>. Lo�i 10 v�n: <color=green>"..GetTask(2047).."<color><enter>K�t qu� s� x� k� tr*�c l�:<enter> Gi�i ba: <color=yellow>"..GetGlbMissionV(4).."<color><enter> Gi�i nh�: <color=yellow>"..GetGlbMissionV(3).."<color><enter> Gi�i ��c bi�t: <color=pink>"..GetGlbMissionV(2).."<color><enter>L*u �: <color=red>Gi�i 3 v� 2 ch� s� b� �n s� 0 � ph�a tr*�c do l�i k� thu�t In �n!",3,
    "Tr�ng s� 1 v�n/trung",
    "Tr�ng s� 10 v�n/trung10",
    "C�m �n/no" )
    
end




function trung()
local nNgay = tonumber(GetLocalDate("%d")); 
local TRUNG1 = GetTask(2046)
local TRUNG2 = GetGlbMissionV(2)
local TRUNG3 = GetGlbMissionV(3)
local TRUNG4 = GetGlbMissionV(4)


if GetTask(2048) == nNgay then


if GetTask(2046)  == GetGlbMissionV(2) then
Talk(15,"dacbiet","<color=green>Ch�c m�ng b�n �� tr�ng gi�i ��c bi�t s� <color=fire>"..GetGlbMissionV(2).."<color> v�i s� ti�n <color=yellow>300 v�n<color>!!!")
return


elseif (TRUNG1  - 9000 == TRUNG3) or (TRUNG1  - 8000 == TRUNG3) or (TRUNG1  - 7000 == TRUNG3) or (TRUNG1  - 6000 == TRUNG3) or (TRUNG1  - 5000 == TRUNG3) or (TRUNG1  - 4000 == TRUNG3) or (TRUNG1  - 3000 == TRUNG3) or (TRUNG1  - 2000 == TRUNG3) or (TRUNG1  - 1000 == TRUNG3) then
Talk(15,"nhi","<color=green>Ch�c m�ng b�n �� tr�ng gi�i Nh� s� <color=pink>"..GetGlbMissionV(3).."<color> v�i s� ti�n <color=yellow>70 v�n<color>!!!")
return


elseif (TRUNG1  - 9900 == TRUNG4) or (TRUNG1  - 9800 == TRUNG4) or (TRUNG1  - 9700 == TRUNG4) or (TRUNG1  - 9600 == TRUNG4) or (TRUNG1  - 9500 == TRUNG4) or (TRUNG1  - 9400 == TRUNG4) or (TRUNG1  - 9300 == TRUNG4) or (TRUNG1  - 9200 == TRUNG4) or (TRUNG1  - 9100 == TRUNG4) or (TRUNG1  - 9000 == TRUNG4) then
Talk(15,"ba","<color=green>Ch�c m�ng b�n �� tr�ng gi�i Ba s� <color=pink>"..GetGlbMissionV(4).."<color> v�i s� ti�n <color=yellow>30 v�n<color>!!!")
return


elseif (TRUNG1  - 8900 == TRUNG4) or (TRUNG1  - 8800 == TRUNG4) or (TRUNG1  - 8700 == TRUNG4) or (TRUNG1  - 8600 == TRUNG4) or (TRUNG1  - 8500 == TRUNG4) or (TRUNG1  - 8400 == TRUNG4) or (TRUNG1  - 8300 == TRUNG4) or (TRUNG1  - 8200 == TRUNG4) or (TRUNG1  - 8100 == TRUNG4) or (TRUNG1  - 8000 == TRUNG4) then
Talk(15,"ba","<color=green>Ch�c m�ng b�n �� tr�ng gi�i Ba s� <color=pink>"..GetGlbMissionV(4).."<color> v�i s� ti�n <color=yellow>30 v�n<color>!!!")
return


elseif (TRUNG1  - 7900 == TRUNG4) or (TRUNG1  - 7800 == TRUNG4) or (TRUNG1  - 7700 == TRUNG4) or (TRUNG1  - 7600 == TRUNG4) or (TRUNG1  - 7500 == TRUNG4) or (TRUNG1  - 7400 == TRUNG4) or (TRUNG1  - 7300 == TRUNG4) or (TRUNG1  - 7200 == TRUNG4) or (TRUNG1  - 7100 == TRUNG4) or (TRUNG1  - 7000 == TRUNG4) then
Talk(15,"ba","<color=green>Ch�c m�ng b�n �� tr�ng gi�i Ba s� <color=pink>"..GetGlbMissionV(4).."<color> v�i s� ti�n <color=yellow>30 v�n<color>!!!")
return


elseif (TRUNG1  - 6900 == TRUNG4) or (TRUNG1  - 6800 == TRUNG4) or (TRUNG1  - 6700 == TRUNG4) or (TRUNG1  - 6600 == TRUNG4) or (TRUNG1  - 6500 == TRUNG4) or (TRUNG1  - 6400 == TRUNG4) or (TRUNG1  - 6300 == TRUNG4) or (TRUNG1  - 6200 == TRUNG4) or (TRUNG1  - 6100 == TRUNG4) or (TRUNG1  - 6000 == TRUNG4)  then
Talk(15,"ba","<color=green>Ch�c m�ng b�n �� tr�ng gi�i Ba s� <color=pink>"..GetGlbMissionV(4).."<color> v�i s� ti�n <color=yellow>30 v�n<color>!!!")
return


elseif (TRUNG1  - 5900 == TRUNG4) or (TRUNG1  - 5800 == TRUNG4) or (TRUNG1  - 5700 == TRUNG4) or (TRUNG1  - 5600 == TRUNG4) or (TRUNG1  - 5500 == TRUNG4) or (TRUNG1  - 5400 == TRUNG4) or (TRUNG1  - 5300 == TRUNG4) or (TRUNG1  - 5200 == TRUNG4) or (TRUNG1  - 5100 == TRUNG4) or (TRUNG1  - 5000 == TRUNG4) then
Talk(15,"ba","<color=green>Ch�c m�ng b�n �� tr�ng gi�i Ba s� <color=pink>"..GetGlbMissionV(4).."<color> v�i s� ti�n <color=yellow>30 v�n<color>!!!")
return


elseif (TRUNG1  - 4900 == TRUNG4) or (TRUNG1  - 4800 == TRUNG4) or (TRUNG1  - 4700 == TRUNG4) or (TRUNG1  - 4600 == TRUNG4) or (TRUNG1  - 4500 == TRUNG4) or (TRUNG1  - 4400 == TRUNG4) or (TRUNG1  - 4300 == TRUNG4) or (TRUNG1  - 4200 == TRUNG4) or (TRUNG1  - 4100 == TRUNG4) or (TRUNG1  - 4000 == TRUNG4) then
Talk(15,"ba","<color=green>Ch�c m�ng b�n �� tr�ng gi�i Ba s� <color=pink>"..GetGlbMissionV(4).."<color> v�i s� ti�n <color=yellow>30 v�n<color>!!!")
return


elseif (TRUNG1  - 3900 == TRUNG4) or (TRUNG1  - 3800 == TRUNG4) or (TRUNG1  - 3700 == TRUNG4) or (TRUNG1  - 3600 == TRUNG4) or (TRUNG1  - 3500 == TRUNG4) or (TRUNG1  - 3400 == TRUNG4) or (TRUNG1  - 3300 == TRUNG4) or (TRUNG1  - 3200 == TRUNG4) or (TRUNG1  - 3100 == TRUNG4) or (TRUNG1  - 3000 == TRUNG4) then
Talk(15,"ba","<color=green>Ch�c m�ng b�n �� tr�ng gi�i Ba s� <color=pink>"..GetGlbMissionV(4).."<color> v�i s� ti�n <color=yellow>30 v�n<color>!!!")
return


elseif (TRUNG1  - 2900 == TRUNG4) or (TRUNG1  - 2800 == TRUNG4) or (TRUNG1  - 2700 == TRUNG4) or (TRUNG1  - 2600 == TRUNG4) or (TRUNG1  - 2500 == TRUNG4) or (TRUNG1  - 2400 == TRUNG4) or (TRUNG1  - 2300 == TRUNG4) or (TRUNG1  - 2200 == TRUNG4) or (TRUNG1  - 2100 == TRUNG4)or (TRUNG1  - 2000 == TRUNG4)  then
Talk(15,"ba","<color=green>Ch�c m�ng b�n �� tr�ng gi�i Ba s� <color=pink>"..GetGlbMissionV(4).."<color> v�i s� ti�n <color=yellow>30 v�n<color>!!!")
return


elseif (TRUNG1  - 1900 == TRUNG4) or (TRUNG1  - 1800 == TRUNG4) or (TRUNG1  - 1700 == TRUNG4) or (TRUNG1  - 1600 == TRUNG4) or (TRUNG1  - 1500 == TRUNG4) or (TRUNG1  - 1400 == TRUNG4) or (TRUNG1  - 1300 == TRUNG4) or (TRUNG1  - 1200 == TRUNG4) or (TRUNG1  - 1100 == TRUNG4) or (TRUNG1  - 1000 == TRUNG4) then
Talk(15,"ba","<color=green>Ch�c m�ng b�n �� tr�ng gi�i Ba s� <color=pink>"..GetGlbMissionV(4).."<color> v�i s� ti�n <color=yellow>30 v�n<color>!!!")
return
else
Talk(15,"","Xin chia bu�n!")
end
else
Talk(15,"","R�t ti�t v� s� c�a ng*�i �� nh�m ng�y, h�y mua v� s� m�i!")
end
end


function dacbiet()
Earn(3000000)
SetTask(2046,0)
Msg2Player("<color=green>Ch�c m�ng b�n nh�n �*�c <color=yellow>300 v�n l*�ng")
end


function nhi()
Earn(700000)
SetTask(2046,0)
Msg2Player("<color=green>Ch�c m�ng b�n nh�n �*�c <color=yellow>70 v�n l*�ng")
end


function ba()
SetTask(2046,0)
Earn(300000)
Msg2Player("<color=green>Ch�c m�ng b�n nh�n �*�c <color=yellow>30 v�n l*�ng")
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
Talk(15,"dacbiet10","<color=green>Ch�c m�ng b�n �� tr�ng gi�i ��c bi�t s� <color=fire>"..GetGlbMissionV(2).."<color> v�i s� ti�n <color=yellow>5000 v�n<color>!!!")
return


elseif (TRUNG1  - 9000 == TRUNG3) or (TRUNG1  - 8000 == TRUNG3) or (TRUNG1  - 7000 == TRUNG3) or (TRUNG1  - 6000 == TRUNG3) or (TRUNG1  - 5000 == TRUNG3) or (TRUNG1  - 4000 == TRUNG3) or (TRUNG1  - 3000 == TRUNG3) or (TRUNG1  - 2000 == TRUNG3) or (TRUNG1  - 1000 == TRUNG3) then
Talk(15,"nhi10","<color=green>Ch�c m�ng b�n �� tr�ng gi�i Nh� s� <color=pink>"..GetGlbMissionV(3).."<color> v�i s� ti�n <color=yellow>700 v�n<color>!!!")
return


elseif (TRUNG1  - 9900 == TRUNG4) or (TRUNG1  - 9800 == TRUNG4) or (TRUNG1  - 9700 == TRUNG4) or (TRUNG1  - 9600 == TRUNG4) or (TRUNG1  - 9500 == TRUNG4) or (TRUNG1  - 9400 == TRUNG4) or (TRUNG1  - 9300 == TRUNG4) or (TRUNG1  - 9200 == TRUNG4) or (TRUNG1  - 9100 == TRUNG4) or (TRUNG1  - 9000 == TRUNG4) then
Talk(15,"ba10","<color=green>Ch�c m�ng b�n �� tr�ng gi�i Ba s� <color=pink>"..GetGlbMissionV(4).."<color> v�i s� ti�n <color=yellow>300 v�n<color>!!!")
return


elseif (TRUNG1  - 8900 == TRUNG4) or (TRUNG1  - 8800 == TRUNG4) or (TRUNG1  - 8700 == TRUNG4) or (TRUNG1  - 8600 == TRUNG4) or (TRUNG1  - 8500 == TRUNG4) or (TRUNG1  - 8400 == TRUNG4) or (TRUNG1  - 8300 == TRUNG4) or (TRUNG1  - 8200 == TRUNG4) or (TRUNG1  - 8100 == TRUNG4) or (TRUNG1  - 8000 == TRUNG4) then
Talk(15,"ba10","<color=green>Ch�c m�ng b�n �� tr�ng gi�i Ba s� <color=pink>"..GetGlbMissionV(4).."<color> v�i s� ti�n <color=yellow>300 v�n<color>!!!")
return


elseif (TRUNG1  - 7900 == TRUNG4) or (TRUNG1  - 7800 == TRUNG4) or (TRUNG1  - 7700 == TRUNG4) or (TRUNG1  - 7600 == TRUNG4) or (TRUNG1  - 7500 == TRUNG4) or (TRUNG1  - 7400 == TRUNG4) or (TRUNG1  - 7300 == TRUNG4) or (TRUNG1  - 7200 == TRUNG4) or (TRUNG1  - 7100 == TRUNG4) or (TRUNG1  - 7000 == TRUNG4) then
Talk(15,"ba10","<color=green>Ch�c m�ng b�n �� tr�ng gi�i Ba s� <color=pink>"..GetGlbMissionV(4).."<color> v�i s� ti�n <color=yellow>300 v�n<color>!!!")
return


elseif (TRUNG1  - 6900 == TRUNG4) or (TRUNG1  - 6800 == TRUNG4) or (TRUNG1  - 6700 == TRUNG4) or (TRUNG1  - 6600 == TRUNG4) or (TRUNG1  - 6500 == TRUNG4) or (TRUNG1  - 6400 == TRUNG4) or (TRUNG1  - 6300 == TRUNG4) or (TRUNG1  - 6200 == TRUNG4) or (TRUNG1  - 6100 == TRUNG4) or (TRUNG1  - 6000 == TRUNG4)then
Talk(15,"ba10","<color=green>Ch�c m�ng b�n �� tr�ng gi�i Ba s� <color=pink>"..GetGlbMissionV(4).."<color> v�i s� ti�n <color=yellow>300 v�n<color>!!!")
return


elseif (TRUNG1  - 5900 == TRUNG4) or (TRUNG1  - 5800 == TRUNG4) or (TRUNG1  - 5700 == TRUNG4) or (TRUNG1  - 5600 == TRUNG4) or (TRUNG1  - 5500 == TRUNG4) or (TRUNG1  - 5400 == TRUNG4) or (TRUNG1  - 5300 == TRUNG4) or (TRUNG1  - 5200 == TRUNG4) or (TRUNG1  - 5100 == TRUNG4) or (TRUNG1  - 5000 == TRUNG4) then
Talk(15,"ba10","<color=green>Ch�c m�ng b�n �� tr�ng gi�i Ba s� <color=pink>"..GetGlbMissionV(4).."<color> v�i s� ti�n <color=yellow>300 v�n<color>!!!")
return


elseif (TRUNG1  - 4900 == TRUNG4) or (TRUNG1  - 4800 == TRUNG4) or (TRUNG1  - 4700 == TRUNG4) or (TRUNG1  - 4600 == TRUNG4) or (TRUNG1  - 4500 == TRUNG4) or (TRUNG1  - 4400 == TRUNG4) or (TRUNG1  - 4300 == TRUNG4) or (TRUNG1  - 4200 == TRUNG4) or (TRUNG1  - 4100 == TRUNG4) or (TRUNG1  - 4000 == TRUNG4) then
Talk(15,"ba10","<color=green>Ch�c m�ng b�n �� tr�ng gi�i Ba s� <color=pink>"..GetGlbMissionV(4).."<color> v�i s� ti�n <color=yellow>300 v�n<color>!!!")
return


elseif (TRUNG1  - 3900 == TRUNG4) or (TRUNG1  - 3800 == TRUNG4) or (TRUNG1  - 3700 == TRUNG4) or (TRUNG1  - 3600 == TRUNG4) or (TRUNG1  - 3500 == TRUNG4) or (TRUNG1  - 3400 == TRUNG4) or (TRUNG1  - 3300 == TRUNG4) or (TRUNG1  - 3200 == TRUNG4) or (TRUNG1  - 3100 == TRUNG4) or (TRUNG1  - 3000 == TRUNG4) then
Talk(15,"ba10","<color=green>Ch�c m�ng b�n �� tr�ng gi�i Ba s� <color=pink>"..GetGlbMissionV(4).."<color> v�i s� ti�n <color=yellow>300 v�n<color>!!!")
return


elseif (TRUNG1  - 2900 == TRUNG4) or (TRUNG1  - 2800 == TRUNG4) or (TRUNG1  - 2700 == TRUNG4) or (TRUNG1  - 2600 == TRUNG4) or (TRUNG1  - 2500 == TRUNG4) or (TRUNG1  - 2400 == TRUNG4) or (TRUNG1  - 2300 == TRUNG4) or (TRUNG1  - 2200 == TRUNG4) or (TRUNG1  - 2100 == TRUNG4) or (TRUNG1  - 2000 == TRUNG4) then
Talk(15,"ba10","<color=green>Ch�c m�ng b�n �� tr�ng gi�i Ba s� <color=pink>"..GetGlbMissionV(4).."<color> v�i s� ti�n <color=yellow>300 v�n<color>!!!")
return


elseif (TRUNG1  - 1900 == TRUNG4) or (TRUNG1  - 1800 == TRUNG4) or (TRUNG1  - 1700 == TRUNG4) or (TRUNG1  - 1600 == TRUNG4) or (TRUNG1  - 1500 == TRUNG4) or (TRUNG1  - 1400 == TRUNG4) or (TRUNG1  - 1300 == TRUNG4) or (TRUNG1  - 1200 == TRUNG4) or (TRUNG1  - 1100 == TRUNG4) or (TRUNG1  - 1000 == TRUNG4) then
Talk(15,"ba10","<color=green>Ch�c m�ng b�n �� tr�ng gi�i Ba s� <color=pink>"..GetGlbMissionV(4).."<color> v�i s� ti�n <color=yellow>300 v�n<color>!!!")
return
else
Talk(15,"","Xin chia bu�n!")
end
else
Talk(15,"","R�t ti�t v� s� c�a ng*�i �� nh�m ng�y, h�y mua v� s� m�i!")
end
end


function dacbiet10()
SetTask(2047,0)
Earn(50000000)
Msg2Player("<color=green>Ch�c m�ng b�n nh�n �*�c <color=yellow>300 v�n l*�ng")
end


function nhi10()
SetTask(2047,0)
Earn(7000000)
Msg2Player("<color=green>Ch�c m�ng b�n nh�n �*�c <color=yellow>70 v�n l*�ng")
end


function ba10()
SetTask(2047,0)
Earn(3000000)
Msg2Player("<color=green>Ch�c m�ng b�n nh�n �*�c <color=yellow>30 v�n l*�ng")
end