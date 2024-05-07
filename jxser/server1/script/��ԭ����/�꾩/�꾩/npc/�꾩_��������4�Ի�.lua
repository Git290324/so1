--中原北区 汴京府 城门卫兵4对话（少林入门任务）
-- by：Dan_Deng(2003-08-01)

Include("\\script\\global\\map_helper.lua")
npc_name = "<#> V� binh Th祅h m玭"

function default_talk()
	Uworld38 = GetByte(GetTask(38),2)
	if ((Uworld38 == 10) and (HaveItem(121) == 0)) then		--入门任务进行中
		Say("Ngi ╪ gan h飉 m藅 g蕌 r錳 h�? T閕 l祄 n竜 ng nha m玭 ngi kh玭g g竛h n鎖 u.",4,"Ngi ph秈 ph鬰 t飊g m謓h l謓h � y v� 甶襲 ki謓 /enroll_S1_wrong","Nh鱪g ngi h祅h nghi謕 v� nc v� d﹏ /enroll_S1_correct","Ph� thi猲 chi h�, m筩 phi vng th�, so竔 th� chi binh, m筩 phi vng th莕 /enroll_S1_wrong","T薾 t﹎ b竜 qu鑓 ch誸 c騨g kh玭g h鑙 h薾  /enroll_S1_wrong")
	else
		Talk(1,"","B鋘 ngi Kim kh玭g gi鑞g ngi H竛 ch髇g ta! Ch髇g ch糿 bi誸 g� n chuy謓 li猰 s�!")
	end
end;

function enroll_S1_correct()
	Talk(1,"","X輈h уng kho竛g m芻 d� kh玭g ng gi� g� nh璶g c騨g xin t苙g ngi l祄 qu� v藋!")
	AddEventItem(121)
	Msg2Player("Nh薾 頲 X輈h уng kho竛g")
	AddNote("Tr� l阨 c﹗ h醝 c馻 v� binh, nh薾 頲 X輈h уng kho竛g")
end;

function enroll_S1_wrong()
	Talk(1,"","B鋘 ngi Kim kh玭g gi鑞g ngi H竛 ch髇g ta! Ch髇g ch糿 bi誸 g� n chuy謓 li猰 s�!")
end;
