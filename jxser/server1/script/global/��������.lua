-- 送信任务.lua (送信任务主文件)
-- By: Dan_Deng(2003-12-08)

-- 各个级别的同伴剧情任务实体处理文件
Include ("\\script\\task\\partner\\master\\partner_master_main.lua");

Include("\\script\\task\\tollgate\\killbosshead.lua")
Include("\\script\\task\\tollgate\\messenger\\posthouse.lua")


Define_City = {"<#> L﹎ An","<#> Phng Tng","<#> Th祅h Й","<#> Чi L� ","<#> Bi謓 Kinh","<#> Tng Dng","<#> Dng Ch﹗"}



function default_talk(letter_station)
especiallymessenger()
	-- Uworld12 = GetTask(12)
	-- if (Uworld12 == 0) then				-- 随时可以开始任务（以前未做过）
		-- W12_get(letter_station)
	-- elseif (Uworld12 < 256) then		-- 任务中
		-- check_letter(letter_station)
	-- elseif (GetGameTime() >= Uworld12) then		-- 已超过重复时间限制，允许再次进行任务（暂时使用在线时间）
		-- W12_get(letter_station)
	-- else													-- 等待重复进行任务中
		-- Talk(1,"","Hi謓 th阨 ch璦 c� c玭g v╪ n祇 nh� ngi gi髉! H穣 quay l筰 sau nh�! ")
	-- end
end

function W12_get(start_city)
	dest_city = random(1,7)				-- 现在是7个城市
	if (dest_city == start_city) then		-- 不允许送信的源城市与目标城市重复
		Talk(1,"","Hi謓 th阨 ch璦 c� c玭g v╪ n祇 nh� ngi gi髉! H穣 quay l筰 sau nh�! ")
	else
		SetTaskTemp(3,start_city*10+dest_city)		-- 十位数为起始地，个位数为目标地
		Say("Ng祔 nay chi課 s� t莕g t莕g, c玭g v╪ nhi襲, ngi a th� trong kh玭g , ngi mu鑞 gi髉 a th� kh玭g? M鏸 l莕 u c� th� lao! ",2,"уng �!/W12_get_yes","Kh玭g b籲g l遪g/no")
	end
end

function check_letter(get_city)
	x = GetTask(12)
	dest_city = mod(x,10)
	start_city = (x - dest_city) / 10		-- 应该肯定能整除
	if (dest_city == get_city) then			-- 目标城市
		if (HaveItem(231+x) == 1) then			-- 有信函能对应上，任务完成
			Talk(1,"","<#> Nh薾 頲"..Define_City[start_city].."<#> l祄 t鑤 l緈! Зy l� 500 lng h藆 t�!")
			DelItem(231+x)
			SetTask(12,GetGameTime()+7200)				-- 两小时（7200秒）后可重复做任务
			i = random(1,10)		-- 随机给声望奖励
			AddRepute(i)
			Msg2Player("<#> Chuy觧 h祄 th� th祅h c玭g n D辌h tr筸 m鬰 ti猽, nhi謒 v� ho祅 th祅h. Danh v鋘g c馻 b筺 t╪g th猰 "..i.."<#> 甶觤.")
			AddNote("Chuy觧 h祄 th� th祅h c玭g n D辌h tr筸 m鬰 ti猽, nhi謒 v� ho祅 th祅h.")
			Earn(500)
		else												-- 信函丢失，取消任务
			Say("C玭g v╪ quan tr鋘g m� l筰 l祄 m蕋? L莕 n祔 phi襫 l緈 y!  Лa ta 2000 lng ta s� gi蕌 chuy謓 n祔 甶",2,"N閜 ti襫/W12_cancel","Ta 甶 ki誱 th猰 ti襫/no")
		end
	elseif (start_city == get_city) then	-- 起始城市
		if (HaveItem(231+x) == 0) then			-- 信函丢失，取消任务
			Say("C玭g v╪ quan tr鋘g m� l筰 l祄 m蕋? L莕 n祔 phi襫 l緈 y!  Лa ta 2000 lng ta s� gi蕌 chuy謓 n祔 甶",2,"N閜 ti襫/W12_cancel","Ta 甶 ki誱 th猰 ti襫/no")
		else
			Talk(1,"","Зy l� c玭g v╪ r蕋 g蕄!  Phi襫 ngi a nhanh m閠 t�! ")
		end
	else 																					-- 其它情况（任务未完成）
		Talk(1,"","<#> H祄 th� n祔 kh玭g ph秈 chuy觧 n y! Ngi ph秈 chuy觧 n "..Define_City[dest_city].."<#> ")
	end
end

function W12_cancel()
	if (GetCash() >= 2000) then
		Pay(2000)
		SetTask(12,0)
		Msg2Player("Nhi謒 v� chuy觧 th� c馻 b筺  b� h駓.")
		AddNote("Nhi謒 v� chuy觧 th� c馻 b筺  b� h駓.")
		Talk(1,"","L莕 n祔 ta b� qua!  Sau n祔 c莕 ph秈 c萵 th薾! ")
	else
		Talk(1,"","2000 lng c騨g kh玭g c�!  Ngi ngh蘯 v藋 sao? C� ti襫 r錳 h穣 n t譵 ta! ")
	end
end

function W12_get_yes()
	x = GetTaskTemp(3)
	dest_city = mod(x,10)
	start_city = (x - dest_city) / 10		-- 应该肯定能整除
	Talk(1,"","<#> H穣 gi髉 ta chuy觧 b鴆 h祄 th� n祔 n"..Define_City[dest_city].."<#>!")
	Msg2Player(Define_City[start_city].."<#> H穣 gi髉 ta chuy觧 b鴆 h祄 th� n祔 n"..Define_City[dest_city].."<#> ")
	AddNote("<#> Nhi謒 v� chuy觧 th� n"..Define_City[start_city].."<#> "..Define_City[dest_city]..".")
	SetTask(12,x)
	AddEventItem(231+x)		-- 信函从242开始，城市从1开始
end

function no()
end
