--龙泉村 职能 铁匠
--龙泉村新手任务：修刀
-- By: Dan_Deng(2003-09-03)
Include("\\script\\global\\global_tiejiang.lua")
Include("\\Script\\Global\\TimerHead.lua")

TIEJIANG_DIALOG = "<dec><npc>Mu鑞 mua lo筰 binh kh� n祇? T筰 y r蕋 n鎖 ti課g v� v� kh�, kh玭g tin ngi 甶 h醝 thanh danh c馻 Long Tuy襫 Ho祅g Gia th� xem!"

function main(sel)
	UTask_world19 = GetTask(19)
	if(UTask_world19 == 2) then
		if (HaveItem(229) == 1) then
			tiejiang_village("<dec><npc>C﹜ 產o n祔 h� h醤g n苙g n�, ph秈 b� kh玭g 輙 ti襫  s 鯽 n�. Ti襫 tu s鯽 120 ng﹏ lng.", "Лa ti襫 s鯽 產o/W19_repair")
		else
			Talk(2,"","Mu鑞 s鯽 c﹜ 產o? Xin h穣 a cho ta xem th� ","Th玦 r錳! C﹜ 產o c馻 ta  b� qu猲 � ch� B祅h Ph鉵g! Ta s� quay v�  l蕐 n� ")
		end
	elseif (UTask_world19 == 4) then
		tiejiang_village("<dec><npc>C﹜ 產o c馻 i hi謕 產ng s鯽, xin m阨 i m閠 l竧 n鱝"..GetRestSec(7).."<#> Gi﹜ r錳 l筰 l蕐.")
	elseif (UTask_world19 == 6) then
		Talk(2,"","o c馻 ngi  s鯽 xong r錳","T鑤 l緈! C秏 琻!")
		SetTask(19,8)
		AddEventItem(230)
		AddNote("L蕐 l筰 c﹜ b秓 產o tr� cho B祅h Ph鉵g.")
		Msg2Player("L蕐 l筰 c﹜ b秓 產o tr� cho B祅h Ph鉵g.")
	elseif (UTask_world19 == 8) and (HaveItem(230) == 0) then
		Talk(1,"","Ngi  b� qu猲 c﹜ 產o � ch� ta")
		AddEventItem(230)
		Msg2Player("Ta l蕐 l筰 c﹜ b秓 產o   qu猲 � ch� th� r蘮.")
	else
		tiejiang_village();
	end
end;

function W19_repair()
	if (GetTimerId() > 0) then		-- 另有计时器在运行中
		Talk(1,"","Ngi 產ng mang nhi謒 v� c蕄 b竎h nh� th�, m� c遪 ch箉 lung tung �?")
	else
		if (GetCash() < 120) then
			Talk(1,"","Ngi a ch璦  ti襫")
		else
			Talk(1,"","Л頲! Hai gi� sau ngi n  l蕐 產o")
			Pay(120)
			SetTask(19,4)
			DelItem(229)
			SetTimer(2 * CTime * FramePerSec, 7)
			AddNote("Giao b秓 產o cho th� r蘮 s鯽, hai gi� sau l筰 l蕐.")
			Msg2Player("Giao b秓 產o cho th� r蘮 s鯽, hai gi� sau l筰 l蕐.")
		end
	end
end;

function yes()
Sale(28);  				--弹出交易框
end;
