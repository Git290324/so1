-- 丐帮 帮主何人我　10级任务、50级任务、重返师门任务
-- by：Dan_Deng(2003-07-28)
-- Update：Dan_Deng(2003-10-27)重写重返师门任务，并重新整理脚本

Include("\\script\\global\\skills_table.lua")
Include([[\script\event\teachersday06_v\prize_qingyika.lua]]);
Include("\\script\\task\\lv120skill\\head.lua")
Include("\\script\\misc\\daiyitoushi\\toushi_function.lua")	-- 带艺投师

Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

function main()
	if (vt06_isactive() ~= 0) then
		Say("T譵 ta c� vi謈 g�?", 2, "Mu鑞 th豱h gi竜 i s�!/oldentence", "M鮪g l�  S�, t筰 h�  t譵  揟h�  S瓟 v� 揟h� Cao у�./vt06_prizeenter");
		return
	end;
	
	local nNpcIndex = GetLastDiagNpc();
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<npc>G莕 y ta c� r蕋 nhi襲 vi謈 gi秈 quy誸, ngi n y c� vi謈 g�."
	G_TASK:OnMessage("C竔 Bang", tbDailog, "DialogWithNpc")
	if (GetLevel() >= 120 and GetTask(LV120_SKILL_STATE) ~= 19 and GetLastFactionNumber() == 6) then
		tbDailog:AddOptEntry("H鋍 k� n╪g c蕄 120.", lvl120skill_learn)
	end
	tbDailog:AddOptEntry("Mu鑞 th豱h gi竜 vi謈 kh竎", oldentence)
	tbDailog:Show() 
end
	

function oldentence()
--	check_skill()
	local UTask_gb = GetTask(8)
	local nFactID = GetLastFactionNumber();

	if (UTask_gb == 70*256) and (GetFaction() == "gaibang") then			-- 回师错误修正
		SetFaction("")
		Say("H� th鑞g ph竧 hi謓 sai s鉻,  k辮 th阨 h錳 phuc!",0)
		return
	elseif (UTask_gb == 70*256) and (GetTask(4) >= 5*256) and (GetTask(4) < 10*256) then		-- 以前接过入门任务的
		SetTask(4,0)
		Say("H� th鑞g ph竧 hi謓 sai s鉻,  k辮 th阨 h錳 phuc!",0)
		return
	elseif (UTask_gb == 80*256) and (GetCamp() == 4) then			-- 回师错误修正
		SetTask(8,70*256)
		Say("H� th鑞g ph竧 hi謓 sai s鉻,  k辮 th阨 h錳 phuc!",0)
		return
	elseif (GetTask(4) == 70*256) and (GetTask(8) == 70*256) then			-- 转门派错误修正
		SetTask(4,75*256)
		Say("H� th鑞g ph竧 hi謓 sai s鉻,  k辮 th阨 h錳 phuc!",0)
		return
	elseif (UTask_gb == 80*256 and nFactID == 6 and GetCamp() == 1 and GetFaction() == "M韎 nh藀 giang h� ") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("gaibang");
			Say("H� th鑞g ph竧 hi謓 sai s鉻,  k辮 th阨 h錳 phuc!",0)
			return
		end
	elseif (UTask_gb == 70*256 and nFactID == 6 and GetCamp() ~= 4 and GetFaction() == "M韎 nh藀 giang h� ") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("");
			SetCurCamp(GetCamp());
			Say("H� th鑞g ph竧 hi謓 sai s鉻,  k辮 th阨 h錳 phuc!",0)
			return
		end
	end

	local tbDes = {"Цi ngh� u s�/#daiyitoushi_main(6)", "Mu鑞 th豱h gi竜 vi謈 kh竎/common_talk"};
	
	Say("G莕 y ta c� r蕋 nhi襲 vi謈 gi秈 quy誸, ngi n y c� vi謈 g�.", getn(tbDes), tbDes);
end

function common_talk()
	local UTask_gb = GetTask(8)
	if (GetTask(39) == 10) and (GetBit(GetTask(40),8) == 0) then				-- 世界任务：武林向背
		Talk(1,"","C竔 bang v� Kim Qu鑓 kh玭g i tr阨 chung, h琻 n鱝 Minh ch� c� l謓h, t筰 h� kh玭g d竚 kh玭g nghe! M阨 ngi v� chuy觧 l阨: C竔 Bang tr猲 di s� nghe theo l謓h c馻 ng礽.")
		Uworld40 = SetBit(GetTask(40),8,1)
		SetTask(40,Uworld40)
	elseif (GetSeries() == 3) and (GetFaction() == "gaibang") then
		if (UTask_gb == 50*256+60) then		-- 50级任务完成
			Talk(1,"L50_prise","Chuy謓 n祔 l� nh� v藋 ,  t�  甧m t蕀 Trung Nguy猲 a  giao cho Trng Чi Nh﹏, nh� 玭g ta tr譶h l猲 Ho祅g Thng.")
		elseif ((UTask_gb == 50*256+10) or (UTask_gb == 50*256+20)) and (HaveItem(199) == 0) then		--任务中，道具丢了
			Talk(2,"","Sao ngi c萿 th� th� n祔! Ta d苙 甶 d苙 l筰 m蕐 l莕 r錳 ph秈 c萵 th薾 gi� b鴆 a  ch�, sao c� th� nh r琲 頲!","� y c遪 m閠 b秐, l莕 n祔 ph秈 c萵 th薾 h琻 , ng  x秠 ra chuy謓 n鱝!")
			AddEventItem(199)
		elseif ((UTask_gb == 50*256) and (GetLevel() >= 50)) then		--50级任务启动
			Say("Trong c萴 h閜 n祔 l� m閠 b鴆 tranh mi猽 t� Trung Nguy猲 a , c莕 ngi 甧m n L﹎ An d﹏g cho tri襲 nh. Ngi c� ng � 甶 kh玭g?",2,"уng �!/L50_get_yes","е t� c遪 y誹 k衜 qu�! E kh玭g 琻g n鏸 vi謈 n祔!/no")
		elseif (UTask_gb == 10*256+40) and (HaveItem(76) == 1) and (HaveItem(77) == 1) and (HaveItem(78) == 1) and (HaveItem(79) == 1) and (HaveItem(80) == 1) then
			L10_prise()
		elseif (UTask_gb == 10*256) and (GetLevel() >= 10) then		--10级任务启动
			Talk(3,"L10_get","Ngi s鑞g tr猲 i, ng n猲 th� o竛 l蒼 nhau, ╪ u鑞g no say qua ng祔 th� t鑤 bi誸 m蕐!","Bang ch�! C� ph秈 ng礽  u鑞g say r錳 ph秈 kh玭g?","Hahaha, c祅g say ta c祅g t豱h y! Ta l� ai! Ai l� ta! Hahaha!")
		elseif (UTask_gb == 80*256) then						-- 重返后的自由出入
			Say("Khi誹 h鉧 t� ta y ch� t筰 b鑞 phng ngi ng su鑤 ng祔 ng錳 kh玭g ra y!",2,"D�! е t� mu鑞 ra giang h� r蘮 luy謓 th猰!/goff_yes","е t� t� th蕐 m譶h v� ngh� c遪 k衜, ch璦 th� xu蕋 s�!/no")
		elseif (UTask_gb > 10*256) and (UTask_gb < 20*256) then		--10级任务进行时的普通对话
			Talk(1,"","Sao ru c遪 ch璦 mang n? L� 甶 n祇, l� 甶!")
		else
			Talk(1,"","Trc gi� Th竛h nh﹏ u phi襫 mu閚 ch� c� nh� ta y m韎 vui v� th玦.")
		end
--	elseif (UTask_gb == 5*256+20) then			-- 转门派完成
--		Talk(1,"defection_complete","何人我：很好，弃暗投明更是大智大勇。到抗金前线上去证明你的赤胆忠心吧！")
	elseif (GetSeries() == 3) and (GetCamp() == 4) and (GetLevel() >= 60) and (UTask_gb == 70*256) and ((GetTask(4) < 5*256) or (GetTask(4) == 75*256)) then		-- 重返师门任务
		Talk(3,"return_sele","Khi誹 h鉧 t� b猲 ngo礽 ch辵 nhi襲 l阨 m ti誹 qu�!","Л琻g nhi猲, cho c琺 ngi ╪ ph秈 c� ch髏 g�  ch�, chuy謓 琻g nhi猲 th玦, haha!","Thng kh玭g cho c琺 ╪ c遪 b総 ch髇g t玦 ra  tr髏 gi薾 n鱝 y!")
	elseif (GetCamp() == 4) and ((UTask_gb == 70*256+10) or (UTask_gb == 70*256+20)) then		-- 重返师门任务中
		Say("5 v筺 lng  chu萵 b� xong ch璦 v藋?",2,"Х chu萵 b� xong/return_complete","V蒼 ch璦 chu萵 b� xong/return_uncompleted")
--	elseif (GetTask(4) == 70*256+10) and (HaveMagic(128) >= 0) then		-- 天忍重返门派，收回亢龙有悔
--		Say("何人我：本帮与金国誓不两立，你竟想背弃本教投靠金国？",2,"属下心意已决/defection_yes","对不起，属下知错了/no")
	else
		Talk(1,"","B� T鰑 Л琻g Ca, Nh﹏ Sinh K� H�.")
	end
end;
---------------------- 技能调整相关 ------------------------
function check_skill()		-- 目前没有玩家变动修改需求，没有60级技能
	x = 0
	skillID = 121					-- 
	i = HaveMagic(skillID)
	if (i >= 0) then
		x = x + 1
		DelMagic(skillID)
		AddMagicPoint(i)
	end
	if (x > 0) then		-- 若有技能发生变化，则踢下线，否则返回继续流程
		Say("Vi s� nay ph秈 b� quan  suy ngh�, nay 甧m v� ngh� tuy謙 h鋍 b鎛 gi竜 truy襫 cho ngi, h鋍 xong n猲 ngh� ng琲 m閠 l竧, tr竛h vi謈 t鎛 thng kinh m筩h.",1," t� s� ph� /KickOutSelf")
	else
		return
	end
end

--------------------- 转门派相关 ------------------------
function defection_complete()
	SetRevPos(115,53)		  			--等待提供重生点
	SetTask(8, 10*256)				-- 直接入门
	SetFaction("gaibang")       			--玩家加入门派
	SetCamp(1)
	SetCurCamp(1)
	SetRank(37)
	AddMagic(117)
	Msg2Player("Hoan ngh猲h b筺 gia nh藀 C竔 bang,tr� th祅h  t� kh玭g t骾!")
	Msg2Player("H鋍 頲 Ki課 Nh﹏ Th莕 Th�, Di猲 M玭 Th竎 B竧")
	AddNote("Gia  nh藀 C竔 bang, tr� th祅h е t� kh玭g t骾! H鋍 頲 Ki課 Nh﹏ Th莕 Th�, Di猲 M玭 Th竎 B竧")
	Msg2Faction("gaibang",GetName().."C� th猰 ngi c馻 Thi猲 Nh蒼 gia nh藀, l鵦 lng C竔 bang  m筺h th猰",GetName())
end

--------------- 重返师门相关 ------------------------
function goff_yes()
	Talk(1,"","T鑤! nh� y g苝 chuy謓 b蕋 b譶h, ph秈 ra tay ngh躠 hi謕 !")
	SetTask(8,70*256)
	AddNote("R阨 kh醝 C竔 bang, ti誴 t鬰 h祅h t萿 giang h� ")
	Msg2Player("B筺 r阨 kh醝 C竔 bang, ti誴 t鬰 h祅h t萿 giang h� ")
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
end

function return_sele()
	Say("Haha, mau tr� v� b鎛 bang 甶, m鋓 ngi c� th� c飊g nhau ╪ c琺, kh玭g ai tr髏 gi薾 ai u m� lo.",2," t� Bang ch�!/return_yes","Th玦 kh玭g c莕 u!/return_no")
end;

function return_yes()
	Talk(2,"","Ch� t筰 b鎛 bang chi c竎 kho秐 l韓, thng kh玭g  xoay s�, n誹 ngi mu鑞 tr飊g ph秈 b鎛 ph竔 th� ph秈 quy猲 g鉷 50000 lng.","Л頲! е t� chu萵 b� ti襫 ngay y.")
	SetTask(8,70*256+20)
	AddNote("Giao n閜 50000 lng, tr飊g ph秐 C竔 bang.")
	Msg2Player("Giao n閜 50000 lng, tr飊g ph秐 C竔 bang.")
end;

function return_no()
	Talk(1,"","S� ph�, con c秏 th蕐 s鑞g tr猲 i ph秈 g莥 d鵱g s� nghi謕, kh玭g th� ╪ b竚 ngi kh竎 qua ng祔 頲. V� v藋 c遪 t輓h kh玭g quay l筰 u.")
end;

function return_complete()
	if(GetCash() >= 50000) then
		Talk(1,"","Haha, kh玭g ng� ngi chu萵 b�  s� ng﹏ lng m� ta n鉯, t鑤 l緈! Ta l蕐 th﹏ ph薾 bang ch� cho ngi tr飊g ph秐 b鎛 ph竔 ng th阨 m nhi謒 ch鴆 C鰑 Чi Trng L穙 c馻 b鎛 gi竜.")
		Pay(50000)
		SetTask(8,80*256)
		SetFaction("gaibang")
		SetCamp(1)
		SetCurCamp(1)
		SetRank(78)
--		if (HaveMagic(130) == -1) then
--			AddMagic(360)
--			AddMagic(130)
		add_gb(70)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
		Msg2Player("B筺 h鋍 頲 tuy謙 h鋍 tr蕁 ph竔 T髖 謕 Cu錸g V�, v� c玭g Ti猽 Di猽 C玭g")
--		end
		AddNote("Х 頲 ph衟 tr� l筰 C竔 bang")
		Msg2Player(GetName().."Tr飊g ph秐 C竔 bang, 頲 phong l� C鰑 Чi Trng L穙")
	else
		Talk(2,"","ng ngh� ta  say, ng﹏ lng th� ta nh譶 r� l緈, y kh玭g  5 v筺 lng m�!","Xin l鏸! L� t玦 m nh莔,  t玦 ki觤 tra l筰.")
	end
end;

function return_uncompleted()
	Talk(1,"","5 v筺 lng kh玭g ph秈 s� nh�, ngi t� t� 甶 kh玭g sao u!")
end;

---------------- 门派任务相关 -----------------------
function L10_get()
	Say(" nhanh mua gi髉 ta 5 lo筰 danh t鰑 Giang Nam n y g錷: Hu� Tuy襫 T鰑, Kim L╪g Xu﹏, B竎h Hoa Nhng, Kinh Hoa L�, Song C﹗ Чi Kh骳.",2," mua ru/L10_get_yes","Gi� v� nh� kh玭g nghe/no")
end;

function L10_get_yes()
	SetTask(8,10*256+10)
	AddNote("Ti誴 nh薾 nh蕺m v� c蕄 10, 甶 mua 5 lo筰 ru Hu� Tuy襫 T鰑, Kim L╪g Xu﹏, B竎h Hoa Nhng, Kinh Hoa L�, Song C﹗ Чi Kh骳 v� cho Bang ch�.")
	Msg2Player("Ti誴 nh薾 nh蕺m v� c蕄 10, 甶 mua 5 lo筰 ru Hu� Tuy襫 T鰑, Kim L╪g Xu﹏, B竎h Hoa Nhng, Kinh Hoa L�, Song C﹗ Чi Kh骳 v� cho Bang ch�.")
end;

function L10_prise()
	Talk(2,"","Bang ch�, ru t玦  mua v� r錳!","T鑤! Huynh  l筰 u鑞g chung 甶 n祇?")
	DelItem(76)
	DelItem(77)
	DelItem(78)
	DelItem(79)
	DelItem(80)
	SetTask(8,20*256)
	SetRank(38)
--	AddMagic(116)
--	AddMagic(115)
	add_gb(20)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	AddNote("Mua  5 l筰 ru, ho祅 th祅h nhi謒 v� c蕄 10, tr� th祅h Ch蕄 Чi  t� ")
	Msg2Player("Ch骳 m鮪g b筺! Л頲 phong l� Ch蕄 Чi  t�! H鋍 頲 C竔 bang Chng ph竝, C竔 bang B鎛g ph竝.")
end;

function L50_get_yes()
	Talk(1,"","T蕀 Trung Nguy猲 a  n祔 quan h� tr鋘g i, c萵 th薾 ng  l鋞 v祇 tay ngi Kim y!")
	SetTask(8,50*256+10)
	AddEventItem(199)
	AddNote("Ti誴 nh薾 nhi謒 v� c蕄 50, hi課 t苙g b鴆 мa  Trung nguy猲 cho tri襲 nh.")
	Msg2Player("Ti誴 nh薾 nhi謒 v� c蕄 50, hi課 t苙g b鴆 мa  Trung nguy猲 cho tri襲 nh.")
end;

function L50_prise()
	Talk(1,"","Bang ch�: Ngi l祄 t鑤 l緈, mong r籲g vi謈 l祄 l莕 n祔 gi髉 cho s� nghi謕 kh竛g Kim,  kh醝 b� c玭g kh玭g v� 輈h!")
	SetTask(8,60*256)
	SetRank(42)
--	AddMagic(128)
--	AddMagic(125)
	add_gb(60)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	Msg2Player("Ch骳 m鮪g b筺! Л頲 phong l� Чi Long u! H鋍 頲 v� c玭g Kh竛g Long H鱱 H鑙, B鎛g Ф 竎 C萿.")
	AddNote("Giao th祅h c玭g b鴆 мa  Trung nguy猲 cho Trng Tu蕁, ho祅 th祅h nhi謒 v� c蕄 50. Tr� th祅h Чi Long u.")
end;

function no()
end;
