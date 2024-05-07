Include("\\script\\activitysys\\config\\1031\\headbanhtrungthu.lua")

function main(sel)
	local ndate = tonumber(GetLocalDate("%y%m%d%H%M"))
	if ndate > 2312312400 then
		Say("B�nh Trung Thu g� n��ng n�y �� qu� h�n s� d�ng.",0)
		return 0
	end
	if check_level() == 0 then
		Say(tb_content["szlevel"],0)
		return 1
	end

	local ncurexp = GetTask(TSK_ZHONGQIU2023)
	if ncurexp >= NZHONGQIU2023_MAX then
		Say("�i�m kinh nghi�m nh�n ���c t� b�nh Trung Thu �� v��t m�c gi�i h�n.",0)
		return 1
	end
	local nexp = 2000000
	if (ncurexp + nexp) >= NZHONGQIU2023_MAX then
		nexp = NZHONGQIU2023_MAX - ncurexp
	end
	SetTask(TSK_ZHONGQIU2023,(ncurexp+nexp))
	AddOwnExp(nexp)
	Msg2Player(format("Nh�n ���c <color=yellow>%s<color> �i�m kinh nghi�m",nexp))
end