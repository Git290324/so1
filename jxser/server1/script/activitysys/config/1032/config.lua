Include("\\script\\activitysys\\config\\1032\\variables.lua")
tbConfig = {}
tbConfig[1] =
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "Khi kh�i ��ng server s� t�i T�ng Qu�n S� Ki�n",
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
-----��i tho�i v�i Npc
tbConfig[2] =
{
	nId = 2,
	szMessageType = "ClickNpc",
	szName = "B�m v�o T�ng Qu�n S� Ki�n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"T�ng Qu�n S� Ki�n"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"SetDialogTitle", {"<npc><color=green>T�t Trung Thu<color> l� m�t trong nh�ng ng�y t�t c� truy�n c�a ng��i Vi�t Nam t� bao ��i nay. Nh�c ��n Trung Thu l� nh�c ��n m�t c�i T�t �o�n Vi�n ch�a chan trong �� t�nh c�m c�a nh�ng ng��i con �i l�m xa qu� mong m�i �� tr� v� v�i gia ��nh. M�i ng��i tr�n ng�p trong h�nh ph�c vi�n m�n, tr� nh� ph�n kh�ch v�i nh�ng m�n �n, �� ch�i ��c tr�ng cho Trung Thu nh� b�nh n��ng , b�nh d�o, ��n �ng sao v.v Trung Thu n�m nay c� l� l� Trung Thu ��u ti�n m� r�t nhi�u ng��i con ph�i xa gia ��nh v� d�ch covid. Ng��i th� �ang v� d�ch b�nh m� ph�i �i c�ch ly, �i�u tr�. Ng��i th� v� ngh�a v� thi�ng li�ng v�i t� qu�c, v� 2 ti�ng ��ng b�o m� ph�i r�i xa gia ��nh trong nh�ng th�i kh�c �o�n vi�n. Nh�m mang t�i m�t c�i T�t �o�n Vi�n, m�t c�i T�t Trung Thu � ngh�a t�i t�t c� ng��i ch�i c�ng nh� to�n th� ng��i d�n Vi�t Nam, BQT xin g�i t�i to�n th� qu� ��ng ��o chu�i s� ki�n: <color=green>'TRUNG THU �O�N VI�N 2023'<color>."}},
		{"AddDialogOpt",	{"Gi�i thi�u ho�t ��ng",	3} },		
		{"AddDialogOpt",	{"Li�n quan M�nh tranh Ti�n V�",	9} },			
	},
}

tbConfig[3] = 
{
	nId = 3,
	szMessageType = "CreateDialog",
	szName = "",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc> Ho�t ��ng l�n n�y c� Th��ng Nguy�t �o�n Vi�n v� Th� Ti�n K�t Duy�n, hi�p s� mu�n tham gia ho�t ��ng n�o?"},
	tbCondition = 
	{
	},
	tbActition = {
		{"AddDialogOpt",	{"Hoa ��ng Khoe s�c",	4} },
		{"AddDialogOpt",	{"Trung Thu th��ng Nguy�t ",	6} },
		{"AddDialogOpt",	{"H� Th�y �a",	7} },
		{"AddDialogOpt",	{"��ng Thu",	8} },


	},
}

tbConfig[4] = 
{
	nId = 4,
	szMessageType = "CreateDialog",
	szName = "",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>B�t ��u t� ng�y <color=green>10/08/2023 ��n 0h00 ng�y 03/12/2023<color><enter>H�ng ng�y - <color=red>2 ��t<color> - <color=green>11h00-13h - 19h-21h<color><enter>B�t ��u m�i ��t <color=green>Hoa ��ng<color> s� xu�t hi�n ng�u nhi�n � <color=green>7 Th�nh th� l�n v� 8 b�n �� T�n th� th�n <color>.C� c�ch 15 ph�t hoa ��ng s� xu�t hi�n 1 l�n. Nh�n s� ��i tho�i v�i 1 Hoa ��ng s� xu�t hi�n 1 c�u h�i v� c�c c�u tr� l�i t��ng �ng d��i d�ng tr�c nghi�m.Nh�n s� s� ch�n 1 c�u tr� l�i trong s� c�c c�u ��. Khi nh�n s� tr� l�i ��ng s� ti�p t�c xu�t hi�n th�m 1 c�u h�i v� c�c c�u tr� l�i. N�u tr� l�i ��ng n�a s� ti�p t�c xu�t hi�n th�m 1 c�u h�i v� c�c c�u tr� l�i.N�u nh�n s� tr� l�i ��ng 3 c�u h�i li�n ti�p s� nh�n ���c ph�n th��ng c� gi� tr�."},
	tbCondition = 
	{
	},
	tbActition = {
		{"AddDialogOpt",	{"Trang k�",	5} },

	},
}
tbConfig[5] = 
{
	nId = 5,
	szMessageType = "CreateDialog",
	szName = "",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc> Nh�n s� ch� c�n tr� l�i sai 1 c�u h�i b�t k� th� Hoa ��ng s� bi�n m�t.M�i ng�y m�i nh�n v�t ch� c� th� nh�n t�i �a <color=green>40 l�n<color> ph�n th��ng t� vi�c �o�n Hoa ��ng.N�u nh�n s� �� ��t gi�i h�n th� khi ��i tho�i v�i Hoa ��ng s� xu�t hi�n th�ng b�o �Ki�n th�c c�a ��i hi�p �� r�ng r�i r�i, kh�ng c�n ph�i ki�m tra n�a�.Ch� c� nh�n v�t <color=red>c�p 50 tr� l�n<color> m�i c� th� tham gia �o�n Hoa ��ng."},
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
	tbMessageParam = {"<npc> Trung thu l� m�t d�p quan tr�ng �� c�ng nhau �o�n vi�n sum v�y, nh�n d�p trung thu n�m nay V� L�m Truy�n K� xin g�i ��n qu� nh�n s� m�t s� ki�n ��c bi�t kh�ng ch� mang ��n mu�n v�n ni�m vui m� c�n l� th�i �i�m th�ch h�p �� nh�n ���c r�t nhi�u ph�n th��ng c� gi� tr� li�n th�nh.<enter>Th�i gian: ng�y <color=green>14/09 ��n 24h00 ng�y 07/10/2023<color><enter>��i t��ng: ��ng c�p <color=red>tr�n 50<color>.<enter>Khi b�n t�u giang h�, nh�n s� v� l�m c� c� h�i nh�n ���c c�c v�t ph�m s� ki�n �� l�m c�c lo�i <color=green>B�nh Trung thu<color> th�m ngon. S� d�ng <color=green>B�nh Trung thu<color> s� nh�n ���c kinh nghi�m v� c�c ph�n th��ng h�p d�n."},
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
	tbMessageParam = {"<npc> M�i ng�y <color=green>3 l�n<color>, t�i <color=green>Chu Ti�n Tr�n, V�nh L�c Tr�n v� Long Tuy�n Th�n<color>, h�y �i t�m <color=green>Ch� Cu�i<color> �� nh�n nhi�m v� <color=orange>H� Th�y �a<color>, khi ho�n th�nh s� nh�n ���c kinh nghi�m v� ph�n th��ng c� gi� tr�."},
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
	tbMessageParam = {"<npc> Th�i gian: 10/08 ��n 24h 07/10/2023<enter>Nh�n v�t tr�n c�p 10 tr� l�n<enter>Qu� nh�n s� s� nh�n ���c <color=orange>H�p v�t li�u Trung thu<color> �i ��nh qu�i, chu�t ph�i s� d�ng s� nh�n ���c c�c v�t li�u c�n thi�t �� gh�p c�c lo�i <color=green>L�ng ��n<color> ��y m�u s�c. S� d�ng l�ng ��n s� nh�n ���c nh�ng ph�n th��ng h�p d�n."},
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
	tbMessageParam = {"<npc><color=green>Li�u �t th��ng nh�n � T��ng D��ng (197/199)<color> �ang mu�n t�m hai b�c danh h�a <color=green>H�ng Nga Ti�n T�<color>. 2 b�c tranh n�y �� b� ph�n th�nh nhi�u m�nh t�n l�c kh�p n�i. Nghe n�i Giang H� �ang c� �� c�c m�nh tranh ��. N�u ng��i c� ���c nh�ng m�nh n�y, h�y �i g�p Li�u �t s� gi�p ng��i gh�p l�i, sau khi nh�n ���c <color=green>H�ng Nga L�nh B�i<color>, h�y ��n giao l�i cho ta, c�c h� s� nh�n ���c c�c ph�n th��ng c� gi� tr�."},
	tbCondition = 
	{
	},
	tbActition = {
		{"AddDialogOpt",	{"Ta ��n giao H�ng Nga L�nh B�i 2023",	10} },
	},
}

tbConfig[10] = 
{
	nId = 10,
	szMessageType = "CreateCompose",
	szName = "Giao H�ng Nga L�nh B�i 2023",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Giao <color=green>H�ng Nga L�nh B�i 2023<color> cho T�ng qu�n s� ki�n",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{60,"��ng c�p c�a ng��i kh�ng ��, l�n sau h�y ��n nh�!",">="} },
		{"ThisActivity:ComposeLimitHangNgaLenhBai", {nil}},
		{"AddOneMaterial",	{ITEM_HANGNGA_LENHBAI.szName,ITEM_HANGNGA_LENHBAI,3} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveHangNgaLenhBai", {nil} },
	},
}
