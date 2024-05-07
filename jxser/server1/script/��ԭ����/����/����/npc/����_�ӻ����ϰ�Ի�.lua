--description: 中原南区 襄阳府 杂货店老板对话	武当派20级任务
--author: yuanlan	
--date: 2003/5/14
-- Update: Dan_Deng(2003-08-08)
-- Update: Dan_Deng(2003-08-17)
Include("\\script\\global\\global_zahuodian.lua");

function main(sel)
	UTask_wd = GetTask(5);
	if (UTask_wd == 20*256+40) and (HaveItem(66) == 1) then
		Talk(2, "", "N祔 ch� gia, 玭g c� th� gi髉 ta s鯽 t蕀 o b祇 n祔?", "Con trai ta l猲 V� ng s琻 h竔 l� d﹗ t籱 b� s鉯 hoang trong <color=Red>H醓 Lang ng<color> ha 甶 m蕋. Ai c� th� c鴘 頲 con ta?!","C鴘 ngi l� kh萵 c蕄, ta g鰅 l筰 o b祇 ch� 玭g!")
		SetTask(5, 20*256+50)
		DelItem(66)
		AddNote("T筰 Tng Dng  t譵 th蕐 玭g ch� ti謒 t筽 h鉧, 頲 bi誸 con trai c馻 b� ta  b� s鉯 hoang <color=red>trong ng H醓 Lang<color> tha 甶 m蕋. ")
		Msg2Player("T筰 Tng Dng  t譵 th蕐 b� g ch� ti謒 t筽 h鉧, 頲 bi誸 con g竔 c馻 b� ta  b� s鉯 hoang<color=red> trong ng H醓 Lang<color> tha 甶 m蕋. ")
	elseif (UTask_wd == 20*256+50) then
		if (HaveItem(67) == 1) then
			Talk(3,"","Kh竎h quan l� ﹏ nh﹏ c鴘 m筺g c馻 con ta, c莕 ta gi髉 g� xin c� n鉯!","C� th� gi髉 ta s鯽 t蕀 o b祇 n祔?","Kh玭g th祅h v蕁 ! в n 琻 c鴘 m筺g con ta, ta kh玭g l蕐 ti襫 c玭g s鯽 竜!")
			DelItem(67)
			AddEventItem(68)
			Msg2Player("竜  頲 v� xong. ")
			SetTask(5, 20*256+80)
			AddNote("g ch� ti謒 t筽 h鉧 Tng Dng d飊g l鬭 t� t籱  s鯽 l筰 chi誧 竜. ")
		else
			Say("Con trai ta l猲 V� ng s琻 h竔 l� d﹗ t籱 b� s鉯 hoang trong <color=Red>H醓 Lang ng<color> ha 甶 m蕋. Ai c� th� c鴘 頲 con ta?!", 2, "Ta ch� l� mu鑞 mua ch髏 輙  th玦 /yes", "Ta  bi誸 r錳. /no")
		end
	elseif (UTask_wd == 20*256+80) and (HaveItem(68) == 0) then		-- 道具丢了
		AddEventItem(68)
		Talk(1,""," nh﹏, ngi qu猲 l蕐 o b祇 r錳!")
	else
		local Buttons = store_sel_extend();
		Say("Kh竎h quan mu鑞 mua th� g�? у ╪, m芻, hay  d飊g?", getn(Buttons), Buttons);
	end
end;

function yes()
	Sale(11)  			--弹出交易框
end;

function BuyChristmasCard()
	Sale(97);
end


function no()
end;
