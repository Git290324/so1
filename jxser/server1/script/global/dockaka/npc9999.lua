IncludeLib("SETTING")
Include("\\script\\lib\\alonelib.lua");
Include("\\script\\activitysys\\g_activity.lua")
--Include("\\script\\activitysys\\playerfunlib.lua")
--Include("\\script\\activitysys\\npcfunlib.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

function main()

suadohong()
end;
function suadohong()
Say("Mu�n ��i Ti�n ��ng + B�o Th�ch + Ng�n l��ng kh�ng",2,"��i/co","kh�ng/ko");
end;
function ko()
end;
function co()
Say("��i Ti�n ��ng c�n 2 Tinh H�ng B�o Th�ch + ��i T� Th�y Tinh c�n 2 Tinh H�ng B�o Th�ch + ��i 50000 l��ng c�n 2 T� Th�y Tinh + ��i 100000 l��ng c�n 2 Lam Th�y Tinh + ��i 200000 l��ng c�n 3 L�c Th�y Tinh",5,"��i Ti�n ��ng/TD","��i T� Th�y Tinh/TTT","��i 50000 l��ng/TUNL","��i 100000 l��ng/LANL","��i 200000 l��ng/LUNL");
end;

function TD()
if (GetItemCount(353) >= 2) then
DelItem(353)
DelItem(353)
AddItem(4,417,1,1,0,0) --<color=pink>Ti�n ��ng
Msg2Player("nh�n ���c Ti�n ��ng.")
else
Msg2Player("V�t ph�m ng��i c� kh�ng ��ng.")
end
end;

function TTT()
if (GetItemCount(353) >= 2) then
DelItem(353)
DelItem(353)
AddItem(4,239,1,1,0,0) --<color=pink>T� Th�y Tinh
Msg2Player("nh�n ���c T� Th�y Tinh.")
else
Msg2Player("V�t ph�m ng��i c� kh�ng ��ng.")
end
end;



function TUNL()
if (GetItemCount(239) >= 2) then
DelItem(239)
DelItem(239)
Earn(50000) --<color=pink>50000 l��ng
Msg2Player("nh�n ���c 50000 l��ng.")
else
Msg2Player("V�t ph�m ng��i c� kh�ng ��ng.")
end
end;

function LANL()
if (GetItemCount(238) >= 2) then
DelItem(238)
DelItem(238)
Earn(100000) --<color=pink>100000 l��ng
Msg2Player("nh�n ���c 100000 l��ng.")
else
Msg2Player("V�t ph�m ng��i c� kh�ng ��ng.")
end
end;

function LUNL()
if (GetItemCount(240) >= 3) then
DelItem(240)
DelItem(240)
DelItem(240)
Earn(200000) --<color=pink>200000 l��ng
Msg2Player("nh�n ���c 200000 l��ng.")
else
Msg2Player("V�t ph�m ng��i c� kh�ng ��ng.")
end
end;