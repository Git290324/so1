Include("\\script\\activitysys\\config\\1031\\headbanhtrungthu.lua")


function main(sel)
	local ndate = tonumber(GetLocalDate("%y%m%d%H%M"))
	if ndate > 2312022400 then
		Say("B∏nh Trung Thu hπt sen nµy Æ∑ qu∏ hπn sˆ dÙng.",0)
		return 0
	end
	if check_level() == 0 then
		Say(tb_content["szlevel"],0)
		return 1
	end

	local ncurexp = GetTask(TSK_ZHONGQIU2023)
	if ncurexp >= NZHONGQIU2023_MAX then
		Say("ßi”m kinh nghi÷m nhÀn Æ≠Óc tı b∏nh Trung Thu Æ∑ v≠Ót m¯c giÌi hπn.",0)
		return 1
	end
	local nexp = 1000000
	if (ncurexp + nexp) >= NZHONGQIU2023_MAX then
		nexp = NZHONGQIU2023_MAX - ncurexp
	end
	SetTask(TSK_ZHONGQIU2023,(ncurexp+nexp))
	AddOwnExp(nexp)
	Msg2Player(format("NhÀn Æ≠Óc <color=yellow>%s<color> Æi”m kinh nghi÷m",nexp))
end