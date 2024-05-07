Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\update_feature\\duanguaxephang\\dn_variables.lua")
Include("\\script\\lib\\basic.lua")
Include("\\script\\update_feature\\duanguaxephang\\dn_nhanthuongoffline.lua")
Include("\\script\\update_feature\\duanguaxephang\\dn_xemketqua.lua")
Include("\\script\\update_feature\\duanguaxephang\\dn_lib_files.lua")
-------------------------------------------------------------------------
F_TIEN_VAN           = "<color=yellow>v¹n<color>";
F_TIEN_DONG          = "<color=fire>tiÒn ®ång<color>";
STR_TIME_DUANGUA     = "";
N_MAX_TIEN_VAN_CUOC  = 100000;
N_MAX_TIEN_DONG_CUOC = 10000;
T_TIME_PLAY_DUA_NGUA = 116;
T_DN_KIM_TVAN  = 117;
T_DN_KIM_TDONG = 118;
T_DN_MOC_TVAN  = 119;
T_DN_MOC_TDONG = 120;
T_DN_THUY_TVAN  = 121;
T_DN_THUY_TDONG = 122;
T_DN_HOA_TVAN  = 123;
T_DN_HOA_TDONG = 124;
T_DN_THO_TVAN  = 125;
T_DN_THO_TDONG = 126;
----------------------------------------------------------------------------------------
function main()
dofile("script/update_feature/duanguaxephang/npc_quanlyduangua.lua");
dofile("script/update_feature/duanguaxephang/dn_nhanthuongoffline.lua");
dofile("script/update_feature/duanguaxephang/dn_variables.lua");
dofile("script/update_feature/duanguaxephang/dn_xemketqua.lua");
dofile("script/update_feature/duanguaxephang/duanguainit.lua");
local nNpcIndex = GetLastDiagNpc(); 
local curTime = GetCurServerTime();
local isStart = GetNpcParam(nNpcIndex, %DN_IsStart);
local isEnd  = GetNpcParam(nNpcIndex, %DN_IsEnd);
local isProcess  = GetNpcParam(nNpcIndex, %DN_IsProcess);
local isRunning  = GetNpcParam(nNpcIndex, %DN_IsRunning);
local isAnalyze  = GetNpcParam(nNpcIndex, %DN_IsAnalyze);
STR_TIME_DUANGUA = GetNpcParam(nNpcIndex, %DN_StartTimeBet);
   
	if STR_TIME_DUANGUA ~= 0 then         
		STR_TIME_DUANGUA =   format("1%s", FormatTime2String("%m%d%H%M", STR_TIME_DUANGUA));       
	end

	--local playTime = HN_GetTaskID(T_TIME_PLAY_DUA_NGUA);
	--if playTime == 0 or tostring(playTime) ~= STR_TIME_DUANGUA then
	--	defaultTaskBauCua();
	--end
    
	local sSexTitle = getSexTitle();
    
	local strTitle = "<npc><color=red>¤ Gia B¶o<color> võa huÊn luyÖn ®­îc <color=fire>5 con sñng vËt<color>. §ang më cuéc ®ua, ®©y lµ c¬ héi cho c¸c nh©n sü kiÕm thªm <color=yellow>tiÒn<color>.";   

	local tbOpt = {}
	if isEnd == 1 then
		strTitle = format("%s\n <color=red>Ho¹t ®éng ®· kÕt thóc<color>. %s vui lßng quay l¹i sau ho¹t ®éng diÔn ra vµo lóc <color=green>07h00 §Õn 12h00 - 13h §Õn 18h - 19h §Õn 23h<color>.", strTitle, sSexTitle);
		strTitle = format("%s\n %s kh«ng nªn di chuyÓn map trong khi ®Æt c­íc ", strTitle, sSexTitle);
	elseif isRunning == 1 then
		if tostring(playTime) == STR_TIME_DUANGUA then
			strTitle = format("%s\n <pic=135><pic=136><pic=137> <color=yellow>Cuéc ®ua ®· b¾t ®Çu<color>.", strTitle);
			strTitle = format("%s\nC¸c tay ®ua %s võa ®Æt:", strTitle, sSexTitle);
			strTitle = getStrThongTinCuoc(strTitle);
		else
			strTitle = format("%s, \n%s", strTitle, format("<pic=135><pic=136><pic=137><color=yellow>Cuéc ®ua ®ang diÔn ra<color>. \n%s vui lßng <color=yellow>quay l¹i vµo ®ît kÕ<color>. B©y giê h·y <color=green>cç vò cho c¸c tay ®ua nµo<color>!", getSexTitle()));
		end
	elseif isStart == 0 then
		strTitle = format("%s\n <pic=135><pic=136><pic=137> <color=yellow>Ch­a b¾t ®Çu ®Æt c­îc<color>:", strTitle);
		strTitle = format("%s\n + <color=red>Thèng kª <pic=88>...<color>", strTitle);
		strTitle = format("%s\n + <color=fire>Trao th­ëng...<color> <pic=116> <pic=131> <pic=116>", strTitle);
		strTitle = format("%s\n %s vui lßng <color=green>quay l¹i trong vµi gi©y n÷a...<pic=46><pic=46><pic=46><color>", strTitle, sSexTitle);  
	elseif isAnalyze == 1 then  
		strTitle = format("%s\n <pic=135><pic=136><pic=137> <color=yellow>HÖ thèng ®ang tiÕn hµnh<color>:", strTitle);
		strTitle = format("%s\n + <color=red>Thèng kª <pic=88>...<color>", strTitle);
		strTitle = format("%s\n + <color=fire>Trao th­ëng...<color> <pic=116> <pic=131> <pic=116>", strTitle);
		strTitle = format("%s\n %s vui lßng <color=green>quay l¹i trong vµi gi©y n÷a...<pic=46><pic=46><pic=46><color>", strTitle, sSexTitle);
	elseif isAnalyze ~= 1 and isRunning ~= 1 then      
		if playTime == 0 or tostring(playTime) ~= STR_TIME_DUANGUA then
			strTitle = format("%s\nHo¹t ®éng <color=green>§ua Thó<color> ®ang diÔn ra %s h·y nhanh tay tham gia ®Ó nhËn ®­îc <color=fire>nhiÒu phÇn th­ëng<color>.", strTitle, sSexTitle);
		end
	elseif tostring(playTime) == STR_TIME_DUANGUA and isStart == 1 then
		strTitle = format("%sC¸c tay ®ua %s võa ®Æt:", strTitle, sSexTitle);
		strTitle = getStrThongTinCuoc(strTitle);
	end 

	if isEnd ~= 1 and isStart == 1 and isAnalyze ~= 1 and isRunning ~= 1 then
		tinsert(tbOpt, {"Ta muèn ®Æt thªm", showMenuLuaChonLoaiTienDat});  
	end


	if isAnalyze ~= 1 then
		--tinsert(tbOpt, {"NhËn th­ëng", processNhanThuong});     
	end

	tinsert(tbOpt, {"Xem kÕt qu¶ lÇn tr­íc", showKetQuaTruocDo});   
	tinsert(tbOpt, {"Tho¸t"});  
    
	CreateNewSayEx(strTitle, tbOpt);
end

function defaultTaskBauCua()
HN_SetTaskID(T_DN_KIM_TVAN, 0); 
HN_SetTaskID(T_DN_KIM_TDONG, 0);
HN_SetTaskID(T_DN_MOC_TVAN, 0); 
HN_SetTaskID(T_DN_MOC_TDONG, 0);
HN_SetTaskID(T_DN_THUY_TVAN, 0);  
HN_SetTaskID(T_DN_THUY_TDONG, 0); 
HN_SetTaskID(T_DN_HOA_TVAN, 0);  
HN_SetTaskID(T_DN_HOA_TDONG, 0);
HN_SetTaskID(T_DN_THO_TVAN, 0);  
HN_SetTaskID(T_DN_THO_TDONG, 0); 
end

function getTongTienVanCuoc()
return
	HN_GetTaskID(T_DN_KIM_TVAN, 0) + 
	HN_GetTaskID(T_DN_MOC_TVAN, 0) +
	HN_GetTaskID(T_DN_THUY_TVAN, 0) +   
	HN_GetTaskID(T_DN_HOA_TVAN, 0) +  
	HN_GetTaskID(T_DN_THO_TVAN, 0);
end

function getTongTienDongCuoc()
return
	HN_GetTaskID(T_DN_KIM_TDONG, 0) + 
	HN_GetTaskID(T_DN_MOC_TDONG, 0) +
	HN_GetTaskID(T_DN_THUY_TDONG, 0) +   
	HN_GetTaskID(T_DN_HOA_TDONG, 0) +  
	HN_GetTaskID(T_DN_THO_TDONG, 0);
end    
        
function getStrThongTinCuoc(strTitle)
	for i=1, DN_nTotalItem  do
		local nVanTaskID = 0;
		local nTDongTaskID = 0;
		local sItemTile = "";
		if i == DN_nKim then
			nVanTaskID = T_DN_KIM_TVAN;
			nTDongTaskID  = T_DN_KIM_TDONG;
			sItemTile = DN_sKim;
		elseif i == DN_nMoc then
			nVanTaskID = T_DN_MOC_TVAN;
			nTDongTaskID  = T_DN_MOC_TDONG;
			sItemTile = DN_sMoc;
		elseif i == DN_nThuy then
			nVanTaskID = T_DN_THUY_TVAN;
			nTDongTaskID  = T_DN_THUY_TDONG;
			sItemTile = DN_sThuy;
		elseif i == DN_nHoa then
			nVanTaskID = T_DN_HOA_TVAN;
			nTDongTaskID  = T_DN_HOA_TDONG;
			sItemTile = DN_sHoa;
		elseif i == DN_nTho then
			nVanTaskID = T_DN_THO_TVAN;
			nTDongTaskID  = T_DN_THO_TDONG;
			sItemTile = DN_sTho;
		end
		local nTVanNum = 0;
		local nTDongNum = 0;
		if nVanTaskID > 0 then
			nTVanNum = HN_GetTaskID(nVanTaskID);
		end
		if nTDongTaskID >0 then
			nTDongNum = HN_GetTaskID(nTDongTaskID);
		end
		if nTVanNum > 0 or  nTDongNum > 0 then  
			sItemTile = fColor(sItemTile, "green");
		end
		if nTVanNum > 0 and nTDongNum > 0 then
			strTitle = format("%s \n + %s: %s %s \t - \t %s %s", strTitle,  sItemTile, fColor(nTVanNum,  "yellow"), F_TIEN_VAN,  fColor(nTDongNum, "yellow"), F_TIEN_DONG);
		elseif nTVanNum > 0 then
			strTitle = format("%s \n + %s: %s %s", strTitle,  sItemTile, fColor(nTVanNum,  "yellow"), F_TIEN_VAN);
		elseif nTDongNum > 0 then
			strTitle = format("%s \n + %s: %s %s", strTitle, sItemTile, fColor(nTDongNum, "yellow"), F_TIEN_DONG);
		end
	end
	return strTitle;
end

function fColor(sText, sColor)
	return format("<color=%s>%s<color>", sColor, sText);
end

function showMenuLuaChonLoaiTienDat()
	if isCanCuoc() == 1 then
		local tbOpt = {
			{"TiÒn v¹n", showMenuDatCuoc, {DN_nTienVan}},
			{"TiÒn ®ång", showMenuDatCuoc, {DN_nTienDong}},
			{"Trë l¹i", showMainDialog},
			{"Tho¸t"}
		}
		CreateNewSayEx("<npc>Ng­¬i muèn ®Æt theo lo¹i nµo?", tbOpt);
	end
end

function showMenuDatCuoc(nType)
	if isCanCuoc() == 1 then
		local tbOpt = {
			{DN_sKim, askSLCuoc, {nType, DN_nKim}},
			{DN_sMoc, askSLCuoc, {nType, DN_nMoc}},
			{DN_sThuy, askSLCuoc, {nType, DN_nThuy}},
			{DN_sHoa, askSLCuoc, {nType, DN_nHoa}},
			{DN_sTho, askSLCuoc, {nType, DN_nTho}},
			{"Trë l¹i", showMenuLuaChonLoaiTienDat},
			{"Tho¸t"}
		}
		CreateNewSayEx("<npc>LÇn nµy ng­¬i quyÕt ®Þnh chän tay ®ua nµo?", tbOpt);
	end
end

function askSLCuoc(nTypeMoney, nType)
	g_AskClientNumberEx(1, 999999999, "NhËp Sè TiÒn:", { processDatCuoc, {nTypeMoney, nType}});
end

function getSexTitle()
	if GetSex() == 0 then
		return "§¹i hiÖp"
	else
		return "N÷ hiÖp";
	end
end

function isCanCuoc()
	local isCanCuoc = 0;
	local nNpcIndex = GetLastDiagNpc();
	local isStart = GetNpcParam(nNpcIndex, %DN_IsStart);
	local isEnd  = GetNpcParam(nNpcIndex, %DN_IsEnd);
	local isProcess  = GetNpcParam(nNpcIndex, %DN_IsProcess);
	local isRunning  = GetNpcParam(nNpcIndex, %DN_IsRunning);
	local isAnalyze  = GetNpcParam(nNpcIndex, %DN_IsAnalyze);
    
	if isStart == 0 and isEnd == 1 then
		Talk(1,"", "Ho¹t ®éng <color=green>§ua ngùa<color> <color=red>®· kÕt thóc<color>. Ho¹t ®çng diÔn ra vµo lóc <color=yellow>14:00 - 15:00<color> vµ <color=yellow>18:00 - 19:00<color>");
	elseif isRunning == 1 then
		Talk(1,"", format("Ho¹t ®éng <color=green>§ua ngùa<color> <color=red>®· b¾t ®Çu<color>. %s vui lßng <color=yellow>quay l¹i vµo ®ît kÕ<color>. B©y giê h·y <color=green>cç vò cho c¸c tay ®ua nµo<color>!", getSexTitle()));
	end
     
	if isStart == 1 and isRunning == 0 and isEnd == 0 and isAnalyze == 0 then
		isCanCuoc = 1;
	end
	return isCanCuoc;
end

function processDatCuoc(nTypeMoney, nType, nNum)    
	local sSexTitle = getSexTitle();
	if nTypeMoney == DN_nTienDong then
		local nTotalTienDongCuoc = getTongTienDongCuoc();
		if nNum + nTotalTienDongCuoc > N_MAX_TIEN_DONG_CUOC then
			Talk(1,"", format("%s chØ cã thÓ c­îc tèi ®a <color=yellow>%s tiÒn ®ång/1 vßng ®ua<color>. HiÖn t¹i %s ®· c­îc <color=yellow>%s tiÒn ®ång<color> cßn cã thÓ c­îc <color=yellow>%s tiÒn ®ång<color>",
			sSexTitle, N_MAX_TIEN_DONG_CUOC, sSexTitle, nTotalTienDongCuoc, N_MAX_TIEN_DONG_CUOC - nTotalTienDongCuoc));
			return
		elseif CalcEquiproomItemCount(4,417,1,1) < nNum then            
			Talk(1,"", format("%s ®ang ®ïa víi ta sao. %s <color=red>kh«ng ®ñ<color> <color=green>%s<color> <color=yellow>tiÒn v¹n<color>", sSexTitle, sSexTitle, nNum));
			return
		elseif mod(nNum, 10) ~= 0 then
			Talk(1,"", format("§èi víi <color=yellow>TiÒn ®ång<color> ChØ cã thÓ ®Æt c­îc sè tiÒn lµ <color=red>béi sè cña 10(chia hÕt cho 10)<color> <color=green>vÝ dô: 10, 20, 30,...<color>. %s vui lßng ®Æt l¹i!", sSexTitle));
			return
		end
	elseif nTypeMoney == DN_nTienVan then
		local nTotalTienVanCuoc = getTongTienVanCuoc();
		if nNum + nTotalTienVanCuoc> N_MAX_TIEN_VAN_CUOC then
			Talk(1,"", format("%s chØ cã thÓ c­îc tèi ®a <color=yellow>%s v¹n/1 vßng ®ua<color>. HiÖn t¹i %s ®· c­îc <color=yellow>%s v¹n<color> cßn cã thÓ c­îc <color=yellow>%s v¹n<color>", 
			sSexTitle, N_MAX_TIEN_VAN_CUOC, sSexTitle, nTotalTienVanCuoc, N_MAX_TIEN_VAN_CUOC - nTotalTienVanCuoc));
			return
		elseif GetCash() < nNum*10000 then          
			Talk(1,"", format("%s ®ang ®ïa víi ta sao. %s <color=red>kh«ng ®ñ<color> <color=green>%s<color> <color=yellow>tiÒn v¹n<color>", sSexTitle, sSexTitle, nNum));
			return
		end
	end     
	if isCanCuoc() == 1 then
		local curTime = FormatTime2String("%Y%m%dT%H:%M:%S", GetCurServerTime());
		local curDate = FormatTime2String("%d%m%Y", GetCurServerTime());
		local sFileName = format("duanguacuoc_%s.txt", curDate); 
		local tbDuaNgua = {}
		tinsert(tbDuaNgua, {GetAccount(), GetName(), nType, nNum, nTypeMoney, curTime, GetSex()});
		Msg2SubWorld(format("%s <color=%s>%s<color> võa lÊy <color=yellow>%s<color> %s ®Æt vµo tay ®ua <color=green>%s<color>", sSexTitle, toColor(249, 4, 237), 
              GetName(), nNum, layTenTienTe(nTypeMoney),layTenItemDatCuoc(nType)));
		DNFiles_TableSaveFile(DN_sFilePath, sFileName, "a+", tbDuaNgua); 
		updateTaskDuaNgua(nType, nNum, nTypeMoney);
		if nTypeMoney == DN_nTienDong then
			ConsumeEquiproomItem(nNum,4,417,1,-1);
		elseif nTypeMoney == DN_nTienVan then
			Pay(nNum*10000);
       	 end 
		local prePlayTime = HN_GetTaskID(T_TIME_PLAY_DUA_NGUA);        
		if prePlayTime == 0 or tostring(prePlayTime) ~= STR_TIME_DUANGUA then
			HN_SetTaskID(T_TIME_PLAY_DUA_NGUA, STR_TIME_DUANGUA);
		end 
	end
end

function layTenTienTe(nTypeMoney)
    if nTypeMoney == DN_nTienVan then
        return F_TIEN_VAN;
    else
        return F_TIEN_DONG;
    end
end

function mod(a, b)
    if b ~= 0 and b ~= null then
        return a - floor(a/b)*b;
    end
    return 0;
end

function layTenItemDatCuoc(nIndex)
    local sName = "";
    if nIndex == DN_nKim then
        sName = DN_sKim;
    elseif nIndex == DN_nMoc then
        sName = DN_sMoc;
    elseif nIndex == DN_nThuy then
        sName = DN_sThuy;
    elseif nIndex == DN_nHoa then
        sName = DN_sHoa;
    elseif nIndex == DN_nTho then
        sName = DN_sTho;
    end

    return sName;
end

function updateTaskDuaNgua(nType, nNum, nTypeMoney)
    local taskID = 0;
    if nType == DN_nKim then
        if nTypeMoney== DN_nTienVan then
            taskID  = T_DN_KIM_TVAN;
        elseif nTypeMoney == DN_nTienDong then
            taskID  = T_DN_KIM_TDONG;
        end
    elseif nType == DN_nMoc then
        if nTypeMoney== DN_nTienVan then
            taskID  = T_DN_MOC_TVAN;
        elseif nTypeMoney == DN_nTienDong then
            taskID  = T_DN_MOC_TDONG;
        end
    elseif nType == DN_nThuy then
        if nTypeMoney == DN_nTienVan then
            taskID  = T_DN_THUY_TVAN;
        elseif nTypeMoney == DN_nTienDong then
            taskID  = T_DN_THUY_TDONG;
        end
    elseif nType == DN_nHoa then
        if nTypeMoney == DN_nTienVan then
            taskID  = T_DN_HOA_TVAN;
        elseif nTypeMoney == DN_nTienDong then
            taskID  = T_DN_HOA_TDONG;
        end
    elseif nType == DN_nTho then
        if nTypeMoney == DN_nTienVan then
            taskID  = T_DN_THO_TVAN;
        elseif nTypeMoney == DN_nTienDong then
            taskID  = T_DN_THO_TDONG;
        end
    end
    local preNum = HN_GetTaskID(taskID);
    if preNum > 0 then
        nNum = nNum + preNum
    end
    HN_SetTaskID(taskID, nNum);
end
