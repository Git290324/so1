Include("\\script\\activitysys\\config\\12\\extend.lua")
dofile("script/global/dockaka/vantieu.lua);

function main()
Describe("��i hi�p c�n g�",3,"Thu� xe v�n ti�u =150 v�n/xevantieu","nh�n th��ng v�n ti�u/TaskFinish","tho�t/cancel");
end

function xevantieu()
  if GetCash() < 1500000 then
    Talk(1,"","b�n kh�ng �� ti�n")
  else
    Pay(1500000)
	pActivity:GiveTask()
  end
end
