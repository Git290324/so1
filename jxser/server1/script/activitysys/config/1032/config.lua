Include("\\script\\activitysys\\config\\1032\\variables.lua")
tbConfig = {}
tbConfig[1] =
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "Khi khëi ®éng server sÏ t¶i Tæng Qu¶n Sù KiÖn",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:AddInitNpcTQSK", {nil} },
	},
}
-----§èi tho¹i víi Npc
tbConfig[2] =
{
	nId = 2,
	szMessageType = "ClickNpc",
	szName = "BÊm vµo Tæng Qu¶n Sù KiÖn",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tæng Qu¶n Sù KiÖn"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"SetDialogTitle", {"<npc><color=green>TÕt Trung Thu<color> lµ mét trong nh÷ng ngµy tÕt cæ truyÒn cña ng­êi ViÖt Nam tõ bao ®êi nay. Nh¾c ®Õn Trung Thu lµ nh¾c ®Õn mét c¸i TÕt §oµn Viªn chøa chan trong ®ã t×nh c¶m cña nh÷ng ng­êi con ®i lµm xa quª mong mái ®Ó trë vÒ víi gia ®×nh. Mäi ng­êi trµn ngËp trong h¹nh phóc viªn m·n, trÎ nhá phÊn khİch víi nh÷ng mãn ¨n, ®å ch¬i ®Æc tr­ng cho Trung Thu nh­ b¸nh n­íng , b¸nh dÎo, ®Ìn «ng sao v.v Trung Thu n¨m nay cã lÏ lµ Trung Thu ®Çu tiªn mµ rÊt nhiÒu ng­êi con ph¶i xa gia ®×nh v× dŞch covid. Ng­êi th× ®ang v× dŞch bÖnh mµ ph¶i ®i c¸ch ly, ®iÒu trŞ. Ng­êi th× v× nghÜa vô thiªng liªng víi tæ quèc, v× 2 tiÕng ®ång bµo mµ ph¶i rêi xa gia ®×nh trong nh÷ng thêi kh¾c ®oµn viªn. Nh»m mang tíi mét c¸i TÕt §oµn Viªn, mét c¸i TÕt Trung Thu ı nghÜa tíi tÊt c¶ ng­êi ch¬i còng nh­ toµn thÓ ng­êi d©n ViÖt Nam, BQT xin göi tíi toµn thÓ quı ®ång ®¹o chuçi sù kiÖn: <color=green>'TRUNG THU §OµN VI£N 2023'<color>."}},
		{"AddDialogOpt",	{"Giíi thiÖu ho¹t ®éng",	3} },		
		{"AddDialogOpt",	{"Liªn quan M·nh tranh Tiªn Vò",	9} },			
	},
}

tbConfig[3] = 
{
	nId = 3,
	szMessageType = "CreateDialog",
	szName = "",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc> Ho¹t ®éng lÇn nµy cã Th­ëng NguyÖt §oµn Viªn vµ Thá Tiªn KÕt Duyªn, hiÖp sÜ muèn tham gia ho¹t ®éng nµo?"},
	tbCondition = 
	{
	},
	tbActition = {
		{"AddDialogOpt",	{"Hoa ®¨ng Khoe s¾c",	4} },
		{"AddDialogOpt",	{"Trung Thu th­ëng NguyÖt ",	6} },
		{"AddDialogOpt",	{"Hé Thñy §a",	7} },
		{"AddDialogOpt",	{"§¨ng Thu",	8} },


	},
}

tbConfig[4] = 
{
	nId = 4,
	szMessageType = "CreateDialog",
	szName = "",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>B¾t ®Çu tõ ngµy <color=green>10/08/2023 ®Õn 0h00 ngµy 03/12/2023<color><enter>H»ng ngµy - <color=red>2 ®ît<color> - <color=green>11h00-13h - 19h-21h<color><enter>B¾t ®Çu mçi ®ît <color=green>Hoa §¨ng<color> sÏ xuÊt hiÖn ngÉu nhiªn ë <color=green>7 Thµnh thŞ lín vµ 8 b¶n ®å T©n thñ th«n <color>.Cø c¸ch 15 phót hoa ®¨ng sÏ xuÊt hiÖn 1 lÇn. Nh©n sÜ ®èi tho¹i víi 1 Hoa §¨ng sÏ xuÊt hiÖn 1 c©u hái vµ c¸c c©u tr¶ lêi t­¬ng øng d­íi d¹ng tr¾c nghiÖm.Nh©n sÜ sÏ chän 1 c©u tr¶ lêi trong sè c¸c c©u ®ã. Khi nh©n sÜ tr¶ lêi ®óng sÏ tiÕp tôc xuÊt hiÖn thªm 1 c©u hái vµ c¸c c©u tr¶ lêi. NÕu tr¶ lêi ®óng n÷a sÏ tiÕp tôc xuÊt hiÖn thªm 1 c©u hái vµ c¸c c©u tr¶ lêi.NÕu nh©n sÜ tr¶ lêi ®óng 3 c©u hái liªn tiÕp sÏ nhËn ®­îc phÇn th­ëng cã gi¸ trŞ."},
	tbCondition = 
	{
	},
	tbActition = {
		{"AddDialogOpt",	{"Trang kÕ",	5} },

	},
}
tbConfig[5] = 
{
	nId = 5,
	szMessageType = "CreateDialog",
	szName = "",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc> Nh©n sÜ chØ cÇn tr¶ lêi sai 1 c©u hái bÊt kú th× Hoa §¨ng sÏ biÕn mÊt.Mçi ngµy mçi nh©n vËt chØ cã thÓ nhËn tèi ®a <color=green>40 lÇn<color> phÇn th­ëng tõ viÖc ®o¸n Hoa §¨ng.NÕu nh©n sÜ ®· ®¹t giíi h¹n th× khi ®èi tho¹i víi Hoa §¨ng sÏ xuÊt hiÖn th«ng b¸o “KiÕn thøc cña ®¹i hiÖp ®· réng r·i råi, kh«ng cÇn ph¶i kiÓm tra n÷a”.ChØ cã nh©n vËt <color=red>cÊp 50 trë lªn<color> míi cã thÓ tham gia ®o¸n Hoa §¨ng."},
	tbCondition = 
	{
	},
	tbActition = {
		

	},
}

tbConfig[6] = 
{
	nId = 6,
	szMessageType = "CreateDialog",
	szName = "",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc> Trung thu lµ mét dŞp quan träng ®Ó cïng nhau ®oµn viªn sum vÇy, nh©n dŞp trung thu n¨m nay Vâ L©m TruyÒn Kú xin göi ®Õn quı nh©n sÜ mét sù kiÖn ®Æc biÖt kh«ng chØ mang ®Õn mu«n vµn niÒm vui mµ cßn lµ thêi ®iÓm thİch hîp ®Ó nhËn ®­îc rÊt nhiÒu phÇn th­ëng cã gi¸ trŞ liªn thµnh.<enter>Thêi gian: ngµy <color=green>14/09 ®Õn 24h00 ngµy 07/10/2023<color><enter>§èi t­îng: §¼ng cÊp <color=red>trªn 50<color>.<enter>Khi b«n tÈu giang hå, nh©n sÜ vâ l©m cã c¬ héi nhËn ®­îc c¸c vËt phÈm sù kiÖn ®Ó lµm c¸c lo¹i <color=green>B¸nh Trung thu<color> th¬m ngon. Sö dông <color=green>B¸nh Trung thu<color> sÏ nhËn ®­îc kinh nghiÖm vµ c¸c phÇn th­ëng hÊp dÉn."},
	tbCondition = 
	{
	},
	tbActition = {	
		
	},
}
--Mua lan
tbConfig[7] = 
{
	nId = 7,
	szMessageType = "CreateDialog",
	szName = "",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc> Mçi ngµy <color=green>3 lÇn<color>, t¹i <color=green>Chu Tiªn TrÊn, VÜnh L¹c TrÊn vµ Long TuyÒn Th«n<color>, h·y ®i t×m <color=green>Chó Cuéi<color> ®Ó nhËn nhiÖm vô <color=orange>Hé Thñy §a<color>, khi hoµn thµnh sÏ nhËn ®­îc kinh nghiÖm vµ phÇn th­ëng cã gi¸ trŞ."},
	tbCondition = 
	{
	},
	tbActition = {	
			
	},
}

tbConfig[8] = 
{
	nId = 8,
	szMessageType = "CreateDialog",
	szName = "",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc> Thêi gian: 10/08 ®Õn 24h 07/10/2023<enter>Nh©n vËt trªn cÊp 10 trë lªn<enter>Quı nh©n sÜ sÏ nhËn ®­îc <color=orange>Hép vËt liÖu Trung thu<color> ®i ®¸nh qu¸i, chuét ph¶i sö dông sÏ nhËn ®­îc c¸c vËt liÖu cÇn thiÕt ®Ó ghĞp c¸c lo¹i <color=green>Lång ®Ìn<color> ®Çy mµu s¾c. Sö dông lßng ®Ìn sÏ nhËn ®­îc nh÷ng phÇn th­ëng hÊp dÉn."},
	tbCondition = 
	{
	},
	tbActition = {	
	
	},
}

tbConfig[9] = 
{
	nId = 9,
	szMessageType = "CreateDialog",
	szName = "",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc><color=green>LiÔu Êt th­¬ng nh©n ë T­¬ng D­¬ng (197/199)<color> ®ang muèn t×m hai bøc danh häa <color=green>H»ng Nga Tiªn Tö<color>. 2 bøc tranh nµy ®· bŞ ph©n thµnh nhiÒu m¶nh t¶n l¹c kh¾p n¬i. Nghe nãi Giang Hå ®ang cã ®ñ c¸c m¶nh tranh ®ã. NÕu ng­¬i cã ®­îc nh÷ng m¶nh nµy, h·y ®i gÆp LiÓu Êt sÏ gióp ng­¬i ghĞp l¹i, sau khi nhËn ®­îc <color=green>H»ng Nga LÖnh Bµi<color>, h·y ®Õn giao l¹i cho ta, c¸c h¹ sÏ nhËn ®­îc c¸c phÇn th­ëng cã gi¸ trŞ."},
	tbCondition = 
	{
	},
	tbActition = {
		{"AddDialogOpt",	{"Ta ®Õn giao H»ng Nga LÖnh Bµi 2023",	10} },
	},
}

tbConfig[10] = 
{
	nId = 10,
	szMessageType = "CreateCompose",
	szName = "Giao H»ng Nga LÖnh Bµi 2023",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Giao <color=green>H»ng Nga LÖnh Bµi 2023<color> cho Tæng qu¶n sù kiÖn",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{60,"§¼ng cÊp cña ng­¬i kh«ng ®ñ, lÇn sau h·y ®Õn nhĞ!",">="} },
		{"ThisActivity:ComposeLimitHangNgaLenhBai", {nil}},
		{"AddOneMaterial",	{ITEM_HANGNGA_LENHBAI.szName,ITEM_HANGNGA_LENHBAI,3} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveHangNgaLenhBai", {nil} },
	},
}
