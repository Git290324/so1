-- 西山屿船夫

function main()
	Say("Ngi mu鑞 ng錳 thuy襫 n Dng Ch﹗ 礹? 500 lng!", 2, "Л頲 th玦!  n祇!/toyangzhou", "Kh玭g ng錳 thuy襫 u/no");
end

function toyangzhou()
	if( GetCash() >= 500 ) then
		NewWorld( 80,1369,3369 );
		DisabledUseTownP(0)	-- 不限制其离开西山屿返回扬州后使用回城符
		SetFightState(1);
		Pay( 500 );
	else
		Talk( 1,"","Kh玭g ti襫 kh玭g th� l猲 thuy襫!");
	end
end

function no()
end