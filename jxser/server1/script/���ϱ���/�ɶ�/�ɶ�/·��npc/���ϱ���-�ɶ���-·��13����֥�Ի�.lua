--西南北区 成都府 路人13贺兰芝对话
Include("\\script\\task\\newtask\\branch\\zhengpai\\branch_zhengpaitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
function main(sel)
	Uworld1051 = nt_getTask(1051)
	if ( Uworld1051 ~= 0 ) then
		branch_helanzhi()
	else
		Say("Ch錸g ta � Th祅h Й l祄 sai u, r蕋 c鵦 kh�! Ta ph秈 m閠 v礽 m鉵 ngon cho huynh 蕐  b錳 b� s鴆 kho�.",0)
	end
end;