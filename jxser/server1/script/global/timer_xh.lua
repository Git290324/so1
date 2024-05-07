IncludeLib("TIMER")
IncludeLib("SETTING")
IncludeLib("ITEM")
IncludeLib("RELAYLADDER")
IncludeLib("TONG")
Include ("\\script\\global\\jxprivate\\xephang\\top.lua")
Include("\\script\\lib\\remoteexc.lua")
Include("\\script\\global\\namcung\\tanthu.lua")

function OnTimer()
vongsanghtb();
RemoteExc("\\script\\jxprivate\\jx_xephang.lua", "BXH_LuuDSNhanVat", {GetName(), ST_GetTransLifeCount(), GetLevel(), GetExp(), GetExpPercent(), GetLastFactionNumber(), GetAccount()})
RemoteExc("\\script\\jxprivate\\jx_xephang.lua", "BXH_PhuHo", {GetBoxMoney(), GetCash(), GetName(), GetLastFactionNumber(), GetAccount()})
end
