--西南北区 成都府 杂货店老板对话 
--author: yuanlan	
--date: 2003/5/23
-- Update: Dan_Deng(2003-08-12)
Include("\\script\\global\\global_zahuodian.lua");

function main(sel)
	UTask_em = GetTask(1);
	UTask_tm = GetTask(2);
	if (UTask_em == 30*256+50) then 		--峨嵋派穆云慈30级任务
		Say("эi g� nng c遪 n鉵g h醝 v鮝 m韎 l蕐 trong b誴. 50 lng b筩 m閠 c竔, c� mu鑞 l蕐 kh玭g?", 3, "Ta mu鑞 mua m閠 c竔 i g�. /chicken", "Ta mu鑞 mua h祅g h鉧 kh竎 /yes", "Kh玭g giao d辌h/no")
	elseif ((UTask_em == 40*256+50) and (GetByte(GetTask(29),1) == 1)) then		--峨嵋派40级任务
		Say("C� lo筰 tr﹎ b筩 ki觰 m韎 nh蕋, t h祅g l緈, ch� c� 200 lng b筩, r� l祄 sao, mua m閠 c﹜ nh�!", 3, "Mua Ng﹏ Tr﹎ /hairpin", "Mua h祅g ho� kh竎 /yes", "Kh玭g giao d辌h/no")
	elseif (UTask_tm == 10*256+40) then		--唐门唐鹤10级任务
		Say("Chi誧 nh蒼 m� n穙 n祔 r蕋 p, 500 lng b筩 m閠 chi誧. Kh玭g mua s� h鑙 h薾!", 3, "Mua nh蒼 M� n穙. /ring", "Giao d辌h/yes", "Kh玭g giao d辌h/no")
	else
		local Buttons = store_sel_extend();
		Say("� y ta b竛  ch駈g lo筰 h祅g h鉧,xin h穣 ch鋘 l鵤, xem c� g� d飊g 頲 kh玭g?", getn(Buttons), Buttons);
	end
end;

function chicken()
	if (GetCash() >= 50) then
		Pay(50)
		AddEventItem(119)
		Msg2Player("Mua 頲 i g�. ")
		AddNote("Mua 頲 i g� � ti謒 t筽 ho� Th祅h Й ")
	else
		Say("C�  ti襫 r錳 h穣 n mua 甶, h穣 xem nh鱪g m鉵 h祅g kh竎 trc 甶.", 2, "Giao d辌h/yes", "Kh玭g giao d辌h/no")		
	end
end;

function hairpin()
	if (GetCash() >= 200) then
		Pay(200)
		AddEventItem(63)
		Msg2Player("Mua 頲 Ng﹏ Tr﹎ ")
--		SetTask(29, 4)
		AddNote("Mua 頲 Ng﹏ Tr﹎ � ti謒 t筽 h鉧 Th祅h Й ")
	else
		Say("C�  ti襫 r錳 h穣 n mua 甶, h穣 xem nh鱪g m鉵 h祅g kh竎 trc 甶.", 2, "Giao d辌h/yes", "Kh玭g giao d辌h/no")		
	end
end;


function ring()
	if (GetCash() >= 500) then
		Pay(500)
		AddEventItem(165)
		Msg2Player("Mua 頲 chi誧 nh蒼 M� n穙 ")
		AddNote("Mua 頲 chi誧 nh蒼 M� n穙 � ti謒 t筽 ho� Th祅h Й ")
	else
		Say("C�  ti襫 r錳 h穣 n mua 甶, h穣 xem nh鱪g m鉵 h祅g kh竎 trc 甶.", 2, "Giao d辌h/yes", "Kh玭g giao d辌h/no")		
	end
end;

function yes()
Sale(14);  		--弹出交易框
end;

function BuyChristmasCard()
	Sale(97);
end

function no()
end;
