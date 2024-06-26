--万事通样例脚本(BlackBay.03.12.30)

Include([[\script\event\mid_autumn06\fairy_of_midautumn06.lua]]);

function main(sel)
	local tab_Content = {
		"T鑞 20000 lng b筩  bi誸 tin t鴆 v� m閠 ngi /Query2", 
		"T鑞 3000 lng b筩  bi誸 tin t鴆 v� m閠 ngi /Query3", 
		"Kh玭g h醝 trc /Nothing"
	};
	
	if (au06_is_inperiod() == 1) then
		tinsert(tab_Content, "Ho箃 ng Trung Thu/au06_entrance_fairy");
	end;
	Say("Ta ch th藅 l� V筺 S� Th玭g, kh玭g c� chuy謓 g� m� kh玭g bi誸. Ngi mu鑞 h醝 vi謈 g�?", getn(tab_Content), tab_Content);
end;

--下面三个函数都调用了 QueryWiseMan 的函数，此函数通知客户端输入一个名字并提交一次查询
--查询成功，系统回调第一个参数指定的回调函数名；查询失败，系统回调第一个参数指定的回调函数名
--回调函数原型请参考下面定义的两个样例函数WisemanCallBack和AbsentCallBack
function Query1()
	if (GetCash() >= 100000) then
		QueryWiseMan("WisemanCallBack", "AbsentCallBack", 100000)
	else
		Nothing()
	end
end;

function Query2()
	if (GetCash() >= 20000) then
		QueryWiseMan("WisemanCallBack", "AbsentCallBack", 20000)
	else
		Nothing()
	end
end;

function Query3()
	if (GetCash() >= 3000) then
		QueryWiseMan("WisemanCallBack", "AbsentCallBack", 3000)
	else
		Nothing()
	end
end;

function Nothing()
	Talk(1, "", "Ngi ch糿g ph秈 產ng ch鋍 gh裲 ta y ch�?")
end;

--此函数为成功查询信息的回调函数，参数个数和参数顺序不允许改变
function WisemanCallBack(TargetName, MoneyToPay, LifeMax, ManaMax, PKValue, PlayerLevel, MapName, nPosX, nPosY, nSex, nWorldRank)
	if MapName == "" then
			Say("Xin l鏸, "..TargetName.."Hi謓 t筰 � khu v鵦 c th� nh� <color=red>Khu v鵦 bang h閕 c l藀<color>, nh璶g kh玭g th� bi誸 頲 v� tr� c� th� c馻 y, v� th� ta ch� t輓h m閠 n鱝 gi� d� h醝 m� th玦, ha ha.",0)
			Pay(MoneyToPay / 2)
			return
	elseif (MoneyToPay == 3000) then
		Say("C竔 kia "..TargetName.."B﹜ gi� � t筰<color=red> "..MapName.."<color>ngi 甶 nhanh 甶, n誹 h緉 甶 n n琲 kh竎 ta kh玭g qu秐 頲 u. ",1," t� /no")
	elseif (MoneyToPay == 20000) then
		Say("C竔 kia "..TargetName.."B﹜ gi� � t筰<color=red> "..MapName.."<color>, V� tr� c� th� c� l� l�<color=red> ( "..nPosX..", "..nPosY..")<color>, n誹 ngi mu鑞 t譵 h緉 th� 甶 nhanh l猲. ",1," t� /no")
	elseif (MoneyToPay == 100000) then
		SexString = "Nam"
		if (nSex ~= 0) then
			SexString = "N� "
		end
		Say("C竔 kia "..TargetName.."Tu﹏ l謓h!"..PlayerLevel.."hi謕 kh竎h "..SexString..", v� tr� hi謓 t筰 l�<color=red>"..MapName.."("..nPosX..", "..nPosY..")<color> h譶h d筺g c馻., th�. th� gi韎 "..nWorldRank.."Danh., 甶觤 PK "..PKValue..". N誹 ngi mu鑞 t譵 h緉 th� 甶 nhanh l猲. ",1," t� /no")
	end
	Pay(MoneyToPay)
end;

--此函数为失败查询(也就是不在线)信息的回调函数，参数个数和参数顺序不允许改变
function AbsentCallBack(TargetName, MoneyToPay)
	Say("Xin l鏸, "..TargetName.."Hi謓 gi� kh玭g c� � y, kh玭g th� bi誸 頲 n琲 � c馻 h緉, ph� t� v蕁 ta ch� l蕐 n鯽 gi� th玦, hehe. ",0)
	Pay(MoneyToPay / 2)
end;

function no()
end
