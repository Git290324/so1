-- 钱庄功能 (越南版本) Banks function (Vietnamese version) 
-- by：Dan_Deng(2003-09-16)
-- Update: Dan_Deng(2004-01-06) 从统一功能移动处理银票到此独有
-- Update: Fanghao_Wu(2004-9-04) 增加元宝兑换铜钱功能

-- Update: paul zhang(2005-09-06) 为越南版作修改，只使用银元宝，没有金元宝，银元宝可充成包周(7天)或者25小时，
--			铜钱暂时不开放，同时增加一个头文件用于控制功能的开放与关闭
-- Update: paul zhang(2005-12-28) 为越南版作修改，由于越南方的原因，修改成只使用金元宝，没有银元宝，但是金元宝的作用修改为可充成包周(7天)或者25小时，

-- Edited by peres
-- 2005/12/29 开放一个元宝换 15 个铜钱的功能
-- Last edited by Giangleloi WwW.ClbGamesVN.COM
-- end;

Include("\\script\\global\\systemconfig.lua") -- 系统配置
--Include("\\script\\global\\yuanbao_head.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua") 
Include("\\script\\misc\\maskfree\\event.lua")		--免费面具领取
Include("\\script\\event\\vnchristmas2006\\event.lua")	--圣诞充卡送面具
Include("\\script\\global\\vn\\extpointfunc_proc.lua") --by Giangleloi

--Msg2Player("gamebank_proc-- vn")

function gamebank_proc()
	local msg = {
		"Ta mu鑞 r髏 Ti襫 ng/get_ingot", 
		--"Ta mu鑞 i Ti襫 ng l蕐 ng祔 ch琲/pay_ingot",
		"Ki觤 tra ta c遪 g鰅 bao nhi猽 Ti襫 ng/show_ingot", 
		--"Ta mu鑞 i kim nguy猲 b秓 th祅h ti襫 ng/change_ingot_to_coin", 
		"Nh﹏ ti謓 gh� qua th玦/no" 
	};
	local talk = "";  
	if (GetSex() == 0) then
		talk = "ng r錳, thi誹 hi謕 c莕 g�?";
	else
		talk = "ng r錳, n� hi謕 c莕 g�?"; -- 
	end
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate >= 20061223 and nDate <= 20270114) then
		--tinsert(msg, 1, "Nh薾 m苩 n� mi詎 ph� khi n筽 th�/takeMaskFree"); 
	end;
	Say(talk, getn(msg), msg)
end
------------- 查询元宝 --------------------
function show_ingot()
	local nMoney = GetExtPoint(1)
	local nMoney2 = GetExtPoint(1)
	if (nMoney >= 32768) then
		nMoney = 0
		Msg2Player("T筸 th阨 kh玭g th� r髏 Ti襫 ng! Xin li猲 h� v韎 nh� s秐 xu蕋  gi秈 quy誸!") 
		return
	end
	if nMoney ~= nMoney2 then
			Talk(1,"","Xin l鏸! Kh竎h quan kh玭g c� g鰅 Ti襫 ng t筰 b鎛 trang!") 
		return
	end
	if (nMoney <= 0) then
		Say("Ch� ti襫 trang: Kh竎h quan ch璦 h� g鰅 k� tr﹏ b秓 v藅 g� � y",1,"Bi誸 r錳/no") 
		return
	else
		local nCurVar = nMoney *10
		Say("<#> Kh竎h quan 產ng g鰅 � y <color=green>"..nCurVar.."<color> Ti襫 ng.",1,"Bi誸 r錳/no") 
	end
end

------------- 取元宝 -----------------------
function get_ingot()
	if (SYSCFG_GAMEBANK_GOLDSILVER_OPEN ~= 1) then
		Talk(1,"","Th藅 xin l鏸! Ti襫 trang 產ng s鯽 ch鱝, 2 ng祔 sau h穣 n.")  
		return
	end
	local nMoney = GetExtPoint(1)	
	local nMoney2 = GetExtPoint(2)	
	if (nMoney >= 32768) then
		nMoney = 0
		Msg2Player("Ch鴆 n╪g b� l鏸!")
		return
	end
	if CalcFreeItemCellCount() < 5 then
			Talk(1, "", "C莕 輙 nh蕋 5 � tr鑞g trong h祅h trang."); 
			return 1
	end
	if nMoney ~= nMoney2 then
			Talk(1,"","Xin l鏸! Kh竎h quan kh玭g c� g鰅 Ti襫 ng t筰 b鎛 trang!") 
		return
	end
	if (nMoney <= 0) then					-- 没有扩展点数
		Talk(1,"","Xin l鏸! Kh竎h quan kh玭g c� g鰅 Ti襫 ng t筰 b鎛 trang!") 
		return
	else
		local nCurVar = nMoney *10
		Say("<#> Kh竎h quan 產ng g鰅 � y t鎛g c閚g <color=green>"..nCurVar.."<color> Ti襫 ng, mu鑞 r髏 ch�?", 4, "Ta mu鑞 r髏 10 Ti襫 ng/get_ingot10","Ta mu鑞 r髏 50 Ti襫 ng/get_ingot50","Ta mu鑞 r髏 100 Ti襫 ng/get_ingot100", "Kh玭g r髏/no") 
	end
end
--------------- rut 10 xu
function get_ingot10()
	if (SYSCFG_GAMEBANK_SILVER_GET == nil) then -- 出错了~~
		print("get_silver have close, but something is wrong...");
		Msg2Player("Ch鴆 n╪g b� l鏸!"); 
		return
	end
	
	if (GetExtPoint(1) < 1) then
		Talk(1,"","T筸 th阨 kh玭g th� r髏 Ti襫 ng! Xin li猲 h� v韎 nh� s秐 xu蕋  gi秈 quy誸!") 
		return
	end
	Say("Kh竎h quan c� ch綾 mu鑞 r髏 Ti襫 ng ch�? (N誹 ng �, xin ng tho竧 kh醝 tr� ch琲!) ", 2, "Ta ng �/get_ingot10ok", "Kh玭g r髏/no"); 
end

function get_ingot10ok()
	PayExtPoint(1,1)
	PayExtPoint(2,1)
	Msg2Player("ng r髏 Ti襫 ng! Xin c萵 tr鋘g v� ng tho竧 kh醝 tr� ch琲!") 
end;
----------- rut 50 xu
function get_ingot50()
	if (SYSCFG_GAMEBANK_SILVER_GET == nil) then -- 出错了~~
		print("get_silver have close, but something is wrong...");
		Msg2Player("Ch鴆 n╪g b� l鏸!"); 
		return
	end
	
	if (GetExtPoint(1) < 5) then
		Talk(1,"","Kh玭g  50 ti襫 ng") 
		return
	end
	Say("Kh竎h quan c� ch綾 mu鑞 r髏 Ti襫 ng ch�? (N誹 ng �, xin ng tho竧 kh醝 tr� ch琲!) ", 2, "Ta ng �/get_ingot50ok", "Kh玭g r髏/no"); 
end

function get_ingot50ok()
	PayExtPoint(1,5)
	PayExtPoint(2,5)
	Msg2Player("ng r髏 Ti襫 ng! Xin c萵 tr鋘g v� ng tho竧 kh醝 tr� ch琲!") 
end;
--------------- rut 100 xu
function get_ingot100()
	if (SYSCFG_GAMEBANK_SILVER_GET == nil) then -- 出错了~~
		print("get_silver have close, but something is wrong...");
		Msg2Player("Ch鴆 n╪g b� l鏸!"); 
		return
	end
	
	if (GetExtPoint(1) < 10) then
		Talk(1,"","Kh玭g  100 ti襫 ng") 
		return
	end
	Say("Kh竎h quan c� ch綾 mu鑞 r髏 Ti襫 ng ch�? (N誹 ng �, xin ng tho竧 kh醝 tr� ch琲!) ", 2, "Ta ng �/get_ingot100ok", "Kh玭g r髏/no"); 
end

function get_ingot100ok()
	PayExtPoint(1,10)
	PayExtPoint(2,10)
	Msg2Player("ng r髏 Ti襫 ng! Xin c萵 tr鋘g v� ng tho竧 kh醝 tr� ch琲!") 
end;

------------- 兑现元宝 ---------------------
function pay_ingot()
	if (SYSCFG_GAMEBANK_SILVER_PAY ~= 1) then
		Talk(1,"","Th藅 xin l鏸! Ti襫 trang 產ng s鯽 ch鱝, 2 ng祔 sau h穣 n.") 
		return
	end
	-- 越南的银元宝物品ID与大陆版本的金元宝物品ID一致
	local nCurTD = CalcEquiproomItemCount(4,417,1,1)
	if (nCurTD >= 20) then
		Say("Ch� ti襫 trang: Kh竎h quan mu鑞 i <color=green>Ti襫 ng<color> th祅h d筺g g�?", 3,"Ta mu鑞 d飊g 20 ti襫 ng i l蕐 7 ng祔 ch琲/pay_ingot_10a","Ta mu鑞 d飊g 20 ti襫 ng i l蕐 25 gi� ch琲/pay_ticket_10b","Kh玭g i/no")
	else
		Say("Kh竎h quan kh玭g 甧m theo Ti襫 ng",1,"ng r錳, ta qu猲 mang theo/no")
	end
end

function pay_ingot_10a()
	if (SYSCFG_GAMEBANK_SILVER_PAY == nil) then -- 出错了~~
		print("pay_silver10 have close, but something is wrong...");
		Msg2Player("Ch鴆 n╪g b� l鏸!"); 
		return
	end
	local nCurTD = CalcEquiproomItemCount(4,417,1,1)
	if (nCurTD >= 20) then
		if (ConsumeEquiproomItem(20,4,417,1,1)~= 1) then
			Msg2Player("Quy i th蕋 b筰!") 
			WriteLog(date("%Y%m%d %H%M%S").."\t".." T礽 kho秐 "..GetAccount().."\t"..GetName().."\t".." quy i 20 Ti襫 ng th祅h 7 ng祔 ch琲 th蕋 b筰!")
			return
		end
		UseSilver(1,1,1)
		SaveNow(); -- 立即存盘 - immediately save 
		WriteLog(date("%Y%m%d %H%M%S").."\t".." T礽 kho秐 "..GetAccount().."\t"..GetName().."\t".." quy i 20 Ti襫 ng th祅h 7 ng祔 ch琲 th祅h c玭g!")
		WriteGoldLog( GetAccount().."("..GetName()..") USE a 343 SILVER for 7 DAY CHARGE", 0, -1, 0 );
		Say("Ch� ti襫 trang: Kh竎h quan  s� d鬾g <color=green>20 Ti襫 ng<color> i l蕐 <color=red>7 ng祔 ch琲<color> th祅h c玭g! Xin ki觤 tra l筰!", 0)
	end
end

function pay_ticket_10b()
	if (SYSCFG_GAMEBANK_SILVER_PAY == nil) then -- 出错了~~
		print("pay_silver10 have close, but something is wrong...");
		Msg2Player("Ch鴆 n╪g b� l鏸!"); 
		return
	end
	local nCurTD = CalcEquiproomItemCount(4,417,1,1)
		if (nCurTD >= 20) then
			if (ConsumeEquiproomItem(20,4,417,1,1)~= 1) then
				Msg2Player("Quy i th蕋 b筰!")
				WriteLog(date("%Y%m%d %H%M%S").."\t".." T礽 kho秐 "..GetAccount().."\t"..GetName().."\t".." quy i 20 Ti襫 ng th祅h 25 gi� ch琲 th蕋 b筰!")
				return
			end
			UseSilver(1,0,1)
			SaveNow(); -- 立即存盘
			WriteLog(date("%Y%m%d %H%M%S").."\t".." T礽 kho秐 "..GetAccount().."\t"..GetName().."\t".." quy i 20 Ti襫 ng th祅h 25 gi� ch琲 th祅h c玭g!")
			WriteGoldLog( GetAccount().."("..GetName()..") USE a 343 SILVER for 25 HOURS CHARGE", 0, -1, 0 );
			Say("Ch� ti襫 trang: Kh竎h quan  s� d鬾g <color=green>20 Ti襫 ng<color> i l蕐 <color=green>25 gi� ch琲<color> th祅h c玭g! Xin ki觤 tra l筰!", 0)
		end
end

------------- 兑换铜钱---------------------
function change_ingot_to_coin()	
--do return end
	local nSilverCount = GetItemCountEx(343);		-- 元宝个数
	if (SYSCFG_GAMEBANK_SILVER_COIN ~= 1) then
		Talk(1,"","Th藅 xin l鏸! Ti襫 trang 產ng s鯽 ch鱝, 2 ng祔 sau h穣 n.")
		return
	end
	if (nSilverCount <= 0) then					-- 没有元宝
		Say("Kh竎h quan kh玭g mang theo kim nguy猲 b秓?", 1, "ng r錳, ta qu猲 mang theo/no");
		return
	end
	if CalcFreeItemCellCount() < 5 then
			Talk(1, "", "Kh玭g  5 � tr鑞g trong h祅h trang.");
			return 1
	end
	Say("Ch� Ti襫 Trang: Kh竎h quan ng � i Kim Nguy猲 b秓 l蕐 ng ti襫 sao?", 2, "фi Kim nguy猲 b秓 th祅h "..COIN_CHANGE_COUNT_OF_SILVER.."<#> ti襫 ng/change_silver_to_coin", "Kh玭g i/no");
end

function change_silver_to_coin()
	if (SYSCFG_GAMEBANK_SILVER_COIN == nil) then -- 出错了~~
		print("coin_silver have close, but something is wrong...");
		Msg2Player("Ch鴆 n╪g b� l鏸!"); 
		return
	end
	if (GetItemCountEx(343) > 0) then		
		DelItemEx(343);		
		AddStackItem(COIN_CHANGE_COUNT_OF_SILVER, 4, 417, 1, 1, 0, 0, 0 );
		UseSilver(1, 2, 1); -- 银票兑换为铜钱的消耗统计
		SaveNow(); -- 立即存盘
		WriteGoldLog( GetAccount().."("..GetName()..") CHANGE a SILVER into "..COIN_CHANGE_COUNT_OF_SILVER.." COINS", 0, -1, COIN_CHANGE_COUNT_OF_SILVER );
		--local nSilverCount = GetItemCountEx( 343 );		-- 元宝个数
		--if( nSilverCount > 0 ) then
		--	Say( "钱庄老板：您的元宝已成功兑换成"..COIN_CHANGE_COUNT_OF_SILVER.."<#>个铜钱，请客倌核查。", 2, "知道了/no", "再兑换一些铜钱/change_coin" );
		-- Say ("banks Boss: Your ingot has been successfully converted into" .. COIN_CHANGE_COUNT_OF_SILVER .. "<#> months coins, treat groom verification.", 2, "know / no", "and then exchange some coins / change_coin "); 
		--else
		Say("Kh竎h quan  i th祅h c玭g Kim Nguy猲 B秓 l蕐 "..COIN_CHANGE_COUNT_OF_SILVER.."<#> ti襫 ng! Xin ki觤 tra l筰!",0);
		-- Say ("banks Boss: Keguan change ingot out" .. COIN_CHANGE_COUNT_OF_SILVER .., 0 "<#> coins Keguan please check again!"); 
		--end
	end
end

------------ 关于铜钱 ------------------
function onAboutCoin()
	Talk( 2,"","钱庄老板：可以带元宝到本店换成铜钱, 1 <color=yellow>元宝<color>换得<color=yellow>"..COIN_CHANGE_COUNT_OF_SILVER.."<color> 铜钱。元宝换成铜钱后，就不能换回来了","铜钱可以到各城市的商贩处买奇珍异宝.","点击鼠标左键到一个铜钱上，拉出另一个铜钱叠在上面，最多为<color=yellow>100个<color>. 按键盘<color=yellow>Shift<color> 以及按鼠标左键到一个铜钱上，输入想换的钱数，按确定来完成。!");
-- Talk (2, "", "banks boss: can be replaced with gold coins to shop, 1 <color=yellow> ingot <color> exchange <color=yellow>" .. COIN_CHANGE_COUNT_OF_SILVER .. "<color> gold coins After the switch to coins, you can not change back, "and" coins to traders can buy at various cities treasures. "," click on the left mouse button to a coins, pull coins stacked on top of another, up to . <color=yellow> 100 ? <color> <color=yellow> Shift <color> the keyboard and press the left mouse button to count the money on one coins, enter want to change, and press OK to finish. ")!; 
end
----------------------------------------
function no()
end