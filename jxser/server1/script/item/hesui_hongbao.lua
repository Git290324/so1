--自定义铜钱数量的红包
IncludeLib("ITEM")

function main(nItemIdx)		
	local nMoney = GetItemParam(nItemIdx,1)
	AddStackItem(nMoney,4,417,1,1,0,0,0)
	Msg2Player("B筺 t 頲 "..nMoney.."Ti襫 ng")
end

function GetDesc(nItemIdx)
	local nMoney = GetItemParam(nItemIdx, 1)
	--local szDesc = ""
	local szDesc = "\nTrong bao l� x� c� <color=yellow>"..nMoney.."<color=> ti襫 ng"
	return szDesc;
end