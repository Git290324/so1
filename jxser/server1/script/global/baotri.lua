IncludeLib("SETTING")
Include("\\script\\global\\volamht\\config.lua")
CONST_LEFT_TIME = 10
leftTime = 10
offTime = 5
function OnTimer()    
if(GetTask(TASK_BAOTRI) ~= 1) then        
StopTimer()   
end    
local strThongBao = "Server sÏ ®ãng ®Ó b¶o tr× trong vßng %d phót n÷a. Dù kiÕn thêi gian b¶o tr× lµ %d phót. §¹i hiÖp h·y bè trÝ thêi gian nghØ ng¬i hîp lý. Tr©n träng!"    
local strBaoTri = "Server ®ãng ®Ó b¶o tr×. Dù kiÕn thêi gian b¶o tr× lµ %d phót. §¹i hiÖp h·y bè trÝ thêi gian nghØ ng¬i hîp lý. Tr©n träng!"     
if leftTime > 0 then 
Msg2SubWorld(format(strThongBao,leftTime,offTime)) 
leftTime = leftTime - 1 
else 
Msg2SubWorld(format(strBaoTri,offTime)) 
leftTime = CONST_LEFT_TIME 
SetTask(TASK_BAOTRI,0) 
StopTimer()
SaveNow()
OrgPlayerIdx = PlayerIndex
for i=1, 1200 do
PlayerIndex = i
KickOutSelf()
end
PlayerIndex = OrgPlayerIdx
end
end