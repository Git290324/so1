Include("\\script\\activitysys\\config\\12\\extend.lua")
dofile("script/global/dockaka/vantieu.lua);

function main()
Describe("§¹i hiÖp cÇn g×",3,"Thuª xe vËn tiªu =150 v¹n/xevantieu","nhËn th­ëng vËn tiªu/TaskFinish","tho¸t/cancel");
end

function xevantieu()
  if GetCash() < 1500000 then
    Talk(1,"","b¹n kh«ng ®ñ tiÒn")
  else
    Pay(1500000)
	pActivity:GiveTask()
  end
end
