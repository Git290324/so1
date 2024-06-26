
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\activitysys\\activity.lua")
Include("\\script\\activitysys\\detailtype\\itemscript.lua")
Include("\\script\\lib\\pfunction.lua")


pItemScript = ActivityDetailClass:Create("ItemScript", pActivity)

pItemScript.tbItem = {tbProp={999,99,9999,1,0,0},}

function TestCondition()
	return nil
end

function TestAction()
	pItemScript.bIsTestOk = 1
end

pItemScript.tbCondition = 
{
	FunctionClass:new("TestCondition", {});
}

pItemScript.tbAction = 
{
	FunctionClass:new("TestAction", {});
}

pItemScript:RegisteMessage(G_ACTIVITY)



local _MakeItem = function (...)
	return {tbProp= arg}
end

function TestItem(tbItem, bValue)
	
	local pScript = G_ACTIVITY:GetItemScript(tbItem)
	if pScript then
		pScript:UseItem(nItemIndex)
		if pScript.bIsTestOk == bValue then
			return 1
		end
	else
		return bValue == -1
		
	end	
end


function GetAccount()
	return "ScriptAutoTest"
end

function GetName()
	return "testname"
end

function GetItemName(nItemIndex)
	return "testItem"
end

pItemScript.bIsTestOk = nil
local bTestCaseRet1 = TestItem(pItemScript.tbItem, nil)

function TestCondition2()
	return 1
end

pItemScript.tbCondition = 
{
	FunctionClass:new("TestCondition2", {});
}

pItemScript.bIsTestOk = nil
local bTestCaseRet2 = TestItem(pItemScript.tbItem, 1)



G_ACTIVITY:UnRegisteItemScript(pItemScript.tbItem)


local bTestCaseRet3 = TestItem(pItemScript.tbItem, -1)

if bTestCaseRet1 == 1 and bTestCaseRet1 == 1 and bTestCaseRet3 == 1 then
-- print("\n \n----------------Chao mung ban den voi VolamTruyenKy----------------\n----------- Ver CTC By TranMinhDo - Nam Cung Nhat Thien------------\n----------------Mua Server Va Cac Dich Vu Lien He :----------------\n-----------------01649525074 Hoac FB:01649525074-------------------\n------ Server da khoi dong hoan tat - Chuc cac ban choi vui ve-----\n \n ") 
else 
-- print("\n \n----------------Chao mung ban den voi VolamTruyenKy----------------\n----------- Ver CTC By TranMinhDo - Nam Cung Nhat Thien------------\n----------------Mua Server Va Cac Dich Vu Lien He :----------------\n-----------------01649525074 Hoac FB:01649525074-------------------\n------ Khoi dong that bai vui long kiem tra lai he thong ---------------------\n \n ") 
end
