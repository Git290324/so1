--Create by mengfan 2004-9-14
--奉月果蓉
--作用：中秋高级月饼之一，作用同武林秘籍，80级以上玩家使用，增加一点武功技能点。
--获得条件：集齐获得此物品所需要的所有单字。
--限制说明：该物品要求人物等级80级时使用有效，每人最多使用2次。
--任务变量700低4位表示使用该物品的次数

function main(sel) 
	times = GetTask(700)
	str={
		"<#> B筺 th� c緉 m閠 mi課g Ph鬾g Nguy謙 Qu� Dung, k誸 qu� kh玭g c� chuy謓 g� x秠 ra.: (",
		"<#> B筺 c緉 m閠 mi課g Ph鬾g Nguy謙 Qu� Dung, k誸 qu� ph竧 hi謓 v� c玭g kh玭g c� g� thay i.",
		"<#> B筺 th� c緉 m閠 mi課g Ph鬾g Nguy謙 Qu� Dung, k誸 qu� ph竧 hi謓 c� lu錸g ch﹏ kh� trong ngi 產ng v薾 chuy觧",
		"<#> B筺  ╪ 2 c竔 Ph鬾g Nguy謙 Qu� Dung, kh玭g th� d飊g ti誴."
		}
	if(times > 1) then                -- 使用次数已达到上限
		Msg2Player(str[4])
		return 1
	elseif (GetLevel() < 80) then     -- 等级小于80
		Msg2Player(str[2])
		return 1
	else                            	
		AddMagicPoint(1)          -- 奖励1点技能点
		time=date("%m%d%H%M%S")
	        name=GetName()
	    	WriteLog("Ngi ch琲"..name.."T筰"..time.." h誸 m閠 c竔 B竛h Trung thu Ph鬾g Nguy謙 Qu� Dung")
		SetTask(700,times+1)
		Msg2Player(str[3])
		return 0
	end
end