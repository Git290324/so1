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
Say("Muèn §æi TiÒn ®ång + B¶o Th¹ch + Ng©n l­îng kh«ng",2,"§æi/co","kh«ng/ko");
end;
function ko()
end;
function co()
Say("§æi TiÒn ®ång cÇn 2 Tinh Hång B¶o Th¹ch + §æi Tö Thñy Tinh cÇn 2 Tinh Hång B¶o Th¹ch + §æi 50000 l­îng cÇn 2 Tö Thñy Tinh + §æi 100000 l­îng cÇn 2 Lam Thñy Tinh + §æi 200000 l­îng cÇn 3 Lôc Thñy Tinh",5,"§æi TiÒn ®ång/TD","§æi Tö Thñy Tinh/TTT","§æi 50000 l­îng/TUNL","§æi 100000 l­îng/LANL","§æi 200000 l­îng/LUNL");
end;

function TD()
if (GetItemCount(353) >= 2) then
DelItem(353)
DelItem(353)
AddItem(4,417,1,1,0,0) --<color=pink>TiÒn ®ång
Msg2Player("nhËn ®­îc TiÒn ®ång.")
else
Msg2Player("VËt phÈm ng­¬i cã kh«ng ®óng.")
end
end;

function TTT()
if (GetItemCount(353) >= 2) then
DelItem(353)
DelItem(353)
AddItem(4,239,1,1,0,0) --<color=pink>Tö Thñy Tinh
Msg2Player("nhËn ®­îc Tö Thñy Tinh.")
else
Msg2Player("VËt phÈm ng­¬i cã kh«ng ®óng.")
end
end;



function TUNL()
if (GetItemCount(239) >= 2) then
DelItem(239)
DelItem(239)
Earn(50000) --<color=pink>50000 l­îng
Msg2Player("nhËn ®­îc 50000 l­îng.")
else
Msg2Player("VËt phÈm ng­¬i cã kh«ng ®óng.")
end
end;

function LANL()
if (GetItemCount(238) >= 2) then
DelItem(238)
DelItem(238)
Earn(100000) --<color=pink>100000 l­îng
Msg2Player("nhËn ®­îc 100000 l­îng.")
else
Msg2Player("VËt phÈm ng­¬i cã kh«ng ®óng.")
end
end;

function LUNL()
if (GetItemCount(240) >= 3) then
DelItem(240)
DelItem(240)
DelItem(240)
Earn(200000) --<color=pink>200000 l­îng
Msg2Player("nhËn ®­îc 200000 l­îng.")
else
Msg2Player("VËt phÈm ng­¬i cã kh«ng ®óng.")
end
end;