-- 临安　职能　神秘商人
-- By Li_Xin (2004-07-20)

Include("\\script\\global\\shenmi_chapman.lua") 
Include("\\script\\lib\\gb_taskfuncs.lua");
Include("\\script\\task\\system\\task_string.lua")
Include("\\script\\event\\act2years_yn\\baibaoxiang.lua") 
Include("\\script\\event\\leize_upplatina\\platina_upgrade.lua")--白金装备
Include("\\script\\event\\leize_upplatina\\recoin_platinaequip.lua")--重铸白金装备
function main()
	if (CheckGlobalTradeFlag() == 0) then		-- 全局经济系统交易开关
		return
	end
	
	local tbDecOpp =
	{
		"<dec><npc>Ta c� � t� T﹜ V鵦 xa x玦 n Trung Nguy猲 mu鑞 mua m閠 s� c s秐 nh� th駓 tinh, kim nguy猲 b秓 v� ng﹏ phi誹. N誹 nh� ngi c� nh鱪g v藅 ph萴 tr猲 th� ta c騨g c� 1 s� v藅 ph萴 qu� mu鑞 c飊g ngi i.",
		
		--Change request 04/06/2011, ng ch� t筼 trang b� b筩h kim - Modified by DinhHQ - 20110605
		--"Ta mu鑞 th╪g c蕄 cho trang b� B筩h Kim n祔/upgrade_paltinaequip",
		--"Ta mu鑞 ch� t筼 trang b� Ho祅g Kim th祅h trang b� B筩h Kim/upgrade_goldformplatina",
		
		--"我想请你重铸白金装备/recoin_platina_main",
		--"<#> Trao i у ph� v� kh� /get1",
		"<#> Mua K� tr﹏ d� b秓/get2",
		--"<#> X� l� <trang b� t鎛 h筰>/deal_brokenequip",
		--"我想了解白金装备拆解/unweave_paltinaequip",
		--"<#>Ta mu鑞 i b秓 rng/BaiBaoXiang_Give_UI",
		"<#> Ta xem th� trc !/no",
		
	};
	local ndate = tonumber(GetLocalDate("%y%m%d%H"))
	
	--Say(str[1],5,str[6],str[2],str[3],str[4], str[5])
	CreateTaskSay(tbDecOpp);
end;

function no()
end;