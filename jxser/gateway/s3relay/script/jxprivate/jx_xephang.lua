function BXH_LuuDSNhanVat(nName, nTransLife, nLevel, n_Exp, n_ExpPer, nFaction, nAccount)
	GlobalExecute(format("dwf \\script\\global\\jxprivate\\xephang\\top.lua XepHang:LuuDSNhanVat([[%s]], %d, %d, %d, %d, %d, [[%s]] )",nName, nTransLife, nLevel, n_Exp, n_ExpPer, nFaction, nAccount ));
end

function BXH_PhuHo(MoneyBox, Money, nName, nFaction, nAccount)
	GlobalExecute(format("dwf \\script\\global\\jxprivate\\xephang\\top.lua Top10PhuHo(%d, %d, [[%s]], %d, [[%s]])",MoneyBox, Money, nName, nFaction, nAccount ));
end

function BXH_ReloadBXH()
	GlobalExecute("dwf \\script\\global\\jxprivate\\xephang\\bangxephang.lua XepHangVaLuu()")
	OutputMsg("[=====> Cap Nhat Bang Xep Hang<=====]")
end

function BXH_SaveDataGamer()
	GlobalExecute("dwf \\script\\global\\jxprivate\\xephang\\bangxephang.lua SaveDataGamer()")
	OutputMsg("[=====> Thuc Hien Luu Du Lieu Gamer <=====]")
end

function TOP_MONPHAI(nName, nTransLife, nLevel, n_Exp, n_ExpPer, nFaction, nAccount)
	GlobalExecute(format("dwf \\script\\global\\jxprivate\\xephang\\top.lua XepHang:Top10MonPhai([[%s]], %d, %d, %d, %d, %d, [[%s]] )",nName, nTransLife, nLevel, n_Exp, n_ExpPer, nFaction, nAccount ));
end

function set_tinhluc(nName)
	GlobalExecute(format("dwf \\script\\global\\jxprivate\\xephang\\top.lua XepHang:TinhLucXH(%s)",nName));
end