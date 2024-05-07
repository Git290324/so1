--description: 中原北区 汴京府 铁匠1对话 天忍教出师任务
--author: yuanlan	
--date: 2003/5/19
-- Update: Dan_Deng(2003-08-14)
Include("\\script\\global\\global_tiejiang.lua")

TIEJIANG_DIALOG = "<dec><npc>Trc kia ti謒 th� r蘮 n祔 r蕋 ╪ n猲 l祄 ra, r蕋 nhi襲 v� l﹎ cao th� n y t l祄 binh kh�, b﹜ gi� th� �. Th玦 kh玭g n鉯 cho xong! Mu鑞 xem lo筰 binh kh� g�?"

function main(sel)
	UTask_tr = GetTask(4)
	if (UTask_tr == 60*256+20) then
		UTask_trsub60 = GetByte(GetTask(28),1)
		if (UTask_trsub60 == 0) then
			tiejiang_city("<dec><npc>Ta n╩ nay  tr遪 ba ch鬰 r錳 m� v蒼 h璦 l蕐 頲 v�, t筰 sao v蒼 ch璦 c� ngi th輈h ta nh�? Kh玭g d竚 gi蕌 i hi謕 ta r蕋 th輈h Trng g鉧 ph� � ph輆 ng th祅h, nh璶g ta l筰 kh玭g d竚 m� mi謓g th� l� s� c� 蕐 gh衪 ta.", "V藋  ta th� n鉯 gi髉 玭g nh�!/L60_sub_yes")
		elseif (UTask_trsub60 == 1) then
			if (HaveItem(63) == 1) then
				tiejiang_city("<dec><npc>Phi襫 ngi gi髉 ta t苙g c� 蕐 c﹜ tr﹎ b筩 n祔 頲 kh玭g?")
			else
				AddEventItem(63)
				Talk(1,"","Ngi ch璦 l蕐 ng﹏ tr﹎  v閕 b� 甶, r鑤 cu閏 c� mu鑞 gi髉 ta kh玭g?")
			end
		elseif (UTask_trsub60 == 2) and (HaveItem(64) == 1) then
			Talk(2, "", "Th藅 ra Trng qu� ph� c騨g c� c秏 t譶h v韎 玭g, y l� Hng Nang c馻 c� ta a 玭g!", "C秏 琻 ngi! N誹 kh玭g c� ngi, ch髇g t玦 kh玭g bi誸 m蕋 bao l﹗ m韎 hi觰 t﹎ � c馻 nhau n鱝. Ta c� 1 thanh 畂秐 ki誱, m芻 d� kh玭g ng gi� l� bao, nh璶g l� v藅 t� truy襫 c馻 ta, b﹜ gi� t苙g ngi coi nh� t� l�.")
			DelItem(64)
			AddEventItem(127)
			SetTask(28, SetByte(GetTask(28),1,10))
			AddNote("Giao Hng nang cho Kh骳 Thi誸 Tng, nh薾 頲 筺 Ki誱 'Y觤 Nh藅'.")
			Msg2Player("Nh薾 頲 筺 Ki誱 'Y觤 Nh藅'.")
		else
			if (HaveItem(127) == 1) then
				tiejiang_city("<dec><npc> t� i hi謕  l祄 m鑙 gi髉 ta v韎 Trng g鉧 ph�, c莕 xem lo筰 binh kh� g� � y?")
			else
				AddEventItem(127)
				Talk(1,"","M芻 d� ngi thi ﹏ b蕋 c莡 b竜, nh璶g ngi  gi髉 ta vi謈 l韓 nh� th�, thanh ki誱 n祔 b蕋 lu薾 th� n祇 ngi c騨g ph秈 nh薾 l蕐.")
			end
		end
	elseif (UTask_tr > 60*256+20) then
		tiejiang_city("<dec><npc> t� i hi謕  l祄 m鑙 gi髉 ta v韎 Trng g鉧 ph�, c莕 xem lo筰 binh kh� g� � y?")
	else
		tiejiang_city()
	end
end;

function L60_sub_yes()
	Talk(1,"","V藋 l祄 phi襫 ngi r錳! C﹜ ng﹏ tr﹎ n祔 ch輓h tay ta l祄, ngi gi髉 ta a cho c� ta, n誹 c� ta nh薾 ch鴑g t� trong l遪g c� 蕐 c� ta.")
	AddEventItem(63)
	SetTask(28, SetByte(GetTask(28),1,1))
	AddNote("цi tho筰 v韎 Kh骳 Thi誸 Tng, nh薾 mang Ng﹏ tr﹎ t苙g cho Trng qu� ph� ")
	Msg2Player("Nh薾 頲 1 c﹜ Ng﹏ tr﹎.")
end;

function yes()
Sale(7);  			--弹出交易框
end;

