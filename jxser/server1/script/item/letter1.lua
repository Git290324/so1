--包袱内的信件（新任务系统龙五的包袱）中立
--by xiaoyang(2004\12\25)

Include("\\script\\task\\newtask\\newtask_head.lua")

function main(sel)
local curCamp = nt_getCamp()
	Uworld1001 = nt_getTask(1001)  --正派
	Uworld1002 = nt_getTask(1002)
	Uworld1003 = nt_getTask(1003)
	Uworld183 = nt_getTask(183)
	Uworld186 = nt_getTask(186)
	Uworld189 = nt_getTask(189)
	local name = GetName()
	if ( Uworld186 == 20 )  then
		Describe("<link=image:\\spr\\item\\questkey\\taskobj090.spr>Th� Long Ng�<link><enter>Long Ng�: "..name..", ngi tuy m韎 ra giang h� nh譶  th� hi謓 b秐 l躰h h琻 ngi! Hi謓 gi� c� m閠 t� ch鴆 s竧 th� l韓 m筺h t猲 l� L﹎ Uy猲 Nhai 產ng 秐h hng r蕋 nguy h筰 n V� l﹎! Ngi mang th� n祔 n Bi謓 Kinh a cho Ph� Nam B╪g, h緉 s� t� bi誸 s緋 x誴! Long Ng�.",1,"Nh薾 h祄 th� /no")
		nt_setTask(186,30)
		if ( Uworld1002 < 10 ) then
			nt_setTask(1002,10) --中立任务开始
		end
	end
	return 0
end
	
