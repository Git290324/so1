--西北南区 永乐镇 铁匠对话
Include("\\script\\global\\global_tiejiang.lua")

TIEJIANG_DIALOG = "<dec><npc>Mu鑞 lo筰 v� kh� n祇? C莕 lo筰 n祇 s� c� lo筰 !"

function main(sel)
	tiejiang_village()
end;


function yes()
Sale(83);  			--弹出交易框
end;
