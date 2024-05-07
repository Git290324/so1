Include("\\script\\update_feature\\duanguaxephang\\dn_variables.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\basic.lua") 
Include("\\script\\update_feature\\duanguaxephang\\dn_lib_files.lua")
Include("\\script\\update_feature\\duanguaxephang\\dn_npcdua.lua")
Include("\\script\\update_feature\\duanguaxephang\\dn_rank.lua")
---------------------------------------------------------------------------------
DN_sThongBaoKetThuc = "Ho¹t ®éng <color=green>®ua tr­<color> ®· kÕt thóc. Vui lßng quay l¹i vµo ®ît kÕ tiÕp. <color=yellow>Ho¹t ®éng diÔn ra tõ<color> <color=green>08:00 -> 23:00<color>";      

function addNPCQuanLyDuaNgua()
--=============================--
if (DuaNguaXepHang == 0) then
	return nil
end
--============================--
local nNpcID = 230;
local nMapID = 176;
local xPos = 1584;
local yPos = 2943;
    local sNpcName = "Qu¶n Lý Tr­êng §ua";
    local nNpcIndex =  AddNpcEx(nNpcID, 1, 2, SubWorldID2Idx(nMapID), xPos*32, yPos*32, 0, sNpcName, 3);
    if (nNpcIndex > 0) then
    local curTime = GetCurServerTime();
    local hour = tonumber(FormatTime2String("%H", curTime));
    local isHaveStart = 0;
        for i=1, getn(DN_tbBeginTime) do       
            local beginHour = DN_tbBeginTime[i][1];
            local endHour = DN_tbBeginTime[i][2];
            local isOverNight = DN_tbBeginTime[i][4];       
            
            if isInProcess(hour, beginHour, endHour, isOverNight) then 
                local minute = tonumber(FormatTime2String("%M", curTime));
                local startTime = curTime - minute*60;
                local endTime = startTime;
                endTime     = getEndTime(endTime, hour, beginHour, endHour, isOverNight);
                isHaveStart = 1;

                SetNpcParam(nNpcIndex, %DN_EndTime, endTime);
                SetNpcParam(nNpcIndex, %DN_StartTimeBet, curTime + DN_TIME_RESTART);
                SetNpcParam(nNpcIndex, %DN_ExcuteTime, curTime + DN_TIME_RESTART + DN_TIME_CUOC + DN_TIME_RUN + DN_TIME_TRAO_THUONG + DN_TIME_TIME_ADD); 
                SetNpcParam(nNpcIndex, %DN_IsFirstTick, 1);  
            end
        end
    if isHaveStart  == 0 then
        SetNpcParam(nNpcIndex, %DN_IsStart, 0);    
        SetNpcParam(nNpcIndex, %DN_IsAnalyze, 0);    
        SetNpcParam(nNpcIndex, %DN_IsEnd, 1);    
    end
   SetNpcScript(nNpcIndex,"\\script\\update_feature\\duanguaxephang\\npc_quanlyduangua.lua");    
     DNFiles_DefaultFile(DN_sFilePath, DN_sFileName_KetQuaLanTruoc);       
     AddTimer(DN_TIME_TICK*18, "DuaNguaOnTimer", nNpcIndex);
    end
end

function div(a, b)
    if b ~= 0 and b ~= null then
        result = a/b;
        if a >= 0 then 
            return floor(result); 
        else 
            return ceil(result); 
        end
    end
    return 0;   
end

function getEndTime(endTime, hour, beginHour, endHour, isOverNight)  
    if isOverNight == 1 then
        local totalHour = 0;
        if hour >= beginHour and hour <= 23 then            
            totalHour = 24 - hour + endHour;
        elseif hour >=0 and hour <= endHour then              
            totalHour = endHour - hour;
        end           
        endTime = endTime + (totalHour)*3600; 
    else
        endTime = endTime + (endHour - hour)*3600;          
    end     
    return endTime;
end

function isInProcess(hour, beginHour, endHour, isOverNight)
    if ((isOverNight == 0 and hour >= beginHour and hour < endHour )
               or (isOverNight == 1 and (hour >= beginHour and hour <= 23 or (hour >=0 and hour < endHour)))) then
        return 1;
    end
end


function processStartDuaNgua(curTime)    
    print(format("===================> Default Du Lieu Dua Ngua %s Player <=========================", FormatTime2String("%H:%M", curTime)));
    local sCuocFileName = format("duanguacuoc_%s.txt", FormatTime2String("%d%m%Y", curTime));
    local sKetQuaFileName = format("duanguaketqua_%s.txt", FormatTime2String("%d%m%Y", curTime));

    local sBauCuaTitle = format("[DUANGUA-%s]", FormatTime2String("%H%M", curTime));
    tbData = {}
    tinsert(tbData, {sBauCuaTitle});            
                
    DNFiles_TableSaveFile(DN_sFilePath, sCuocFileName , "a+", tbData);  
    DNFiles_TableSaveFile(DN_sFilePath, sKetQuaFileName , "a+", tbData);      
end

function DuaNguaOnTimer(nNpcIndex, nTimeOut)
    local curTime = GetCurServerTime();    

    local endTime = GetNpcParam(nNpcIndex, %DN_EndTime);
    local isStart = GetNpcParam(nNpcIndex, %DN_IsStart);
    local isAnalyze = GetNpcParam(nNpcIndex, %DN_IsAnalyze);
    local isEnd = GetNpcParam(nNpcIndex, %DN_IsEnd);
    local isFirstTick =  GetNpcParam(nNpcIndex, %DN_IsFirstTick);
    local excuteTime = GetNpcParam(nNpcIndex, %DN_ExcuteTime);
    local startNewBetTime = GetNpcParam(nNpcIndex, %DN_StartTimeBet);

    if isEnd == 1 and isFirstTick == 0 then
        local hour = tonumber(FormatTime2String("%H", curTime));
        local isHaveStart = 0;
        for i=1, getn(DN_tbBeginTime) do       
            local beginHour = DN_tbBeginTime[i][1];
            local endHour = DN_tbBeginTime[i][2];
            local isOverNight = DN_tbBeginTime[i][4];       
            
            if isInProcess(hour, beginHour, endHour, isOverNight) then 
                local minute = tonumber(FormatTime2String("%M", curTime));
                local startTime = curTime - minute*60;
                local endTime = startTime;
                endTime = getEndTime(endTime, hour, beginHour, endHour, isOverNight);

                isHaveStart  = 1;               
                SetNpcParam(nNpcIndex, %DN_EndTime, endTime);
                SetNpcParam(nNpcIndex, %DN_StartTimeBet, curTime + DN_TIME_RESTART);
                SetNpcParam(nNpcIndex, %DN_ExcuteTime, curTime + DN_TIME_RESTART + DN_TIME_CUOC + DN_TIME_RUN + DN_TIME_TRAO_THUONG + DN_TIME_TIME_ADD); 
             end
        end
        if isHaveStart == 1 then
            SetNpcParam(nNpcIndex, %DN_IsStart, 0);    
            SetNpcParam(nNpcIndex, %DN_IsAnalyze, 0);    
            SetNpcParam(nNpcIndex, %DN_IsEnd, 0);   
        end
    end

    if isFirstTick == 1 then
        if curTime + DN_TIME_RESTART ~= startNewBetTime then
            local preTime = curTime - 10;
            local hour = tonumber(FormatTime2String("%H", preTime));
            for i=1, getn(DN_tbBeginTime) do       
                local beginHour = DN_tbBeginTime[i][1];
                local endHour = DN_tbBeginTime[i][2];
                local isOverNight = DN_tbBeginTime[i][4];       
            
                if isInProcess(hour, beginHour, endHour, isOverNight) then 
                    SetNpcParam(nNpcIndex, %DN_StartTimeBet, preTime + DN_TIME_RESTART);
                    SetNpcParam(nNpcIndex, %DN_ExcuteTime, curTime + DN_TIME_RESTART + DN_TIME_CUOC + DN_TIME_RUN + DN_TIME_TRAO_THUONG + DN_TIME_TIME_ADD); 
                end
            end
        end
             
        SetNpcParam(nNpcIndex, %DN_IsFirstTick, 0);                
    end
    local isEnd = 0;
    local sTime = GetNpcParam(nNpcIndex, %DN_StartTimeBet);
    
    -- Tong Ket
    if (curTime == excuteTime) then
        
        print("==================> DUA NGUA ======== 1. Cap Nhat Trang Thai Tong Ket <============");
        -- Is Analyze
        updateProcessStatus(nNpcIndex, sTime, 0, 0, 0, 1, 0);
        
      
        print("==================> DUA NGUA ======== 2. Tao Ket Qua <============");
        local tbKetQua = processGetKetQua(sTime);
        if tbKetQua == nil then
            print("KET QUA NULL!!!");
        end
    
        local tbRanks = getAllRank(tbKetQua);  
        
        
        if curTime >= endTime then    
            isEnd = 1;
        else
            SetNpcParam(nNpcIndex, %DN_ExcuteTime, curTime + DN_TIME_RESTART + DN_TIME_CUOC + DN_TIME_RUN + DN_TIME_TRAO_THUONG); 
            SetNpcParam(nNpcIndex, %DN_StartTimeBet, curTime + DN_TIME_RESTART);
        end 
        
        
        local sThongBaoKetQua = "<color=green>KÕt qu¶ cña vßng ®ua nµy lµ<color>";
        Msg2SubWorld(sThongBaoKetQua);  
        local sKetQua1, sKetQua2 = processGetKetQuaStr(tbRanks);
     processUpdateKetQuaDua(startNewBetTime, sKetQua1, sKetQua2);
        Msg2SubWorld(sKetQua1);
        Msg2SubWorld(format("<enter>%s", sKetQua2));
        
        if isEnd == 0 then
           sThongBaoKetQua = format("Vßng ®ua tiÕp theo sÏ b¾t ®Çu<color> sau <color=yellow>%s gi©y<color> n÷a!", DN_TIME_RESTART);
           Msg2SubWorld(sThongBaoKetQua);
        end        
       
        
        print("==================> DUA NGUA ======== 3. Tong Hop Du Lieu <============");
        local tbDuaNguaPlayer = processGetCuoc(sTime);
        if tbDuaNguaPlayer ~= nil and tbKetQua ~= nil then
            if getn(tbDuaNguaPlayer) > 0 and getn(tbKetQua) > 0 then
                local tbDuaNguaCuoc = processTongHopDuLieu(tbDuaNguaPlayer);
          local tbRank = getAllRank(tbKetQua);
                print("==================> DUA NGUA ======== 4. Trao Thuong <============");
                local tbPlayerTrung = processTongKetKetQua(tbDuaNguaCuoc, tbRank);
                processTraoThuong(tbPlayerTrung, tbRank, sKetQua1, sKetQua2);                        
            end 
        end                      
       
        print("==================> DUA NGUA ======== 5. Cap Nhat Trang Thai Tong Ket <============");
        updateProcessStatus(nNpcIndex, sTime, 0, 0, 0, 0, isEnd);
        if isEnd == 1 then         
            Msg2SubWorld(DN_sThongBaoKetThuc); 
        end 
    end
    
   
    -- Confirm sap dua 30, 20, 10s cuoi dat cuoc
    if (curTime == startNewBetTime + DN_TIME_CUOC - 30) then
        Msg2SubWorld("<color=green>ChØ cßn 30s n÷a, cuéc ®ua sÏ chÝnh thøc khëi tranh<color>. C¸c nh©n sü h·y nhanh tay chän cho m×nh tay ®ua ­ng ý nµo!");
    end
    
    if (curTime == startNewBetTime + DN_TIME_CUOC - 20) then
        Msg2SubWorld("<color=green>ChØ cßn 20s n÷a, cuéc ®ua sÏ chÝnh thøc khëi tranh<color>. C¸c nh©n sü h·y nhanh tay chän cho m×nh tay ®ua ­ng ý nµo!");
    end
    
    if (curTime == startNewBetTime + DN_TIME_CUOC - 10) then
        Msg2SubWorld("<color=green>ChØ cßn 10s n÷a, cuéc ®ua sÏ chÝnh thøc khëi tranh<color>. C¸c nh©n sü h·y nhanh tay chän cho m×nh tay ®ua ­ng ý nµo!");
    end
 
     -- NPC Start Run
    if (curTime == startNewBetTime + DN_TIME_CUOC) then
        Msg2SubWorld("<color=green>Cuéc ®ua chÝnh thøc khëi tranh<color>, <color=yellow>c¸c tay ®ua ®· b¾t ®Çu xuÊt ph¸t<color>. C¸c nh©n sü h·y theo dâi vµ ñng hé nµo");
        updateProcessStatus(nNpcIndex, sTime, 0, 1, 0, 0, 0);
    end
    
    -- Move NPC Complete
    if (curTime == excuteTime - DN_TIME_TIME_ADD) then
        updateProcessStatus(nNpcIndex, sTime, 0, 0, 1, 0, 0);
    end
    
    -- Start to Player Cuoc
    if curTime == startNewBetTime then 
        print(format("==================> DUA NGUA ========Bat Dau Vong Cuoc Moi - %s <============", FormatTime2String("%H:%M", curTime)));
        updateProcessStatus(nNpcIndex, sTime, 1, 0, 0, 0, 0);
        processStartDuaNgua(sTime);
        addNpcDua(nNpcIndex);        
      
        Msg2SubWorld("<color=green>LÔ héi §ua Thó<color> chÝnh thøc <color=yellow>b¾t ®Çu<color>, c¸c nh©n sü giang hå cã thÓ ®Õn L©m An gÆp Qu¶n Lý Tr­êng §ua ®Ó chän cho m×nh nh÷ng tay ®ua ­ng ý.");        
    end
    
    if curTime == excuteTime - DN_TIME_INFORM then          
        local strChat = format("<pic=126>ChØ cßn <color=yellow>%ss<color> n÷a vßng ®ua sÏ chÝnh thøc <color=yellow>khÐp l¹i<color> h·y cç vò cho c¸c tay ®ua nµo<pic=46><pic=46><pic=46>", DN_TIME_INFORM);
        NpcChat(nNpcIndex, strChat) 
           
        local strThongBao = format("<pic=116> ChØ cßn <color=yellow>%ss<color> n÷a vßng ®ua sÏ chÝnh thøc <color=yellow>khÐp l¹i<color> h·y cç vò cho c¸c tay ®ua nµo c¸c nh©n sÜ<pic=46>", DN_TIME_INFORM);
        Msg2SubWorld(strThongBao);
        
    elseif(curTime > endTime and isEnd == 1) then
            NpcChat(nNpcIndex, DN_sThongBaoKetThuc);
    else
        local tab_Chat = {
        "     <pic=41><bclr=fire><enter>C¸c vÞ cã tõng nhí trß ch¬i nh©n gian gäi lµ<bclr> <color=yellow>§ua Thó<color> kh«ng?",
            "     <pic=135><bclr=blue><enter>Thêi gian 1 vßng c­îc lµ <color=yellow>1<color> phót. <color>",
            "     <pic=116><color=green><enter>Chµo mõng c¸c b¹n ®Õn víi tr­êng ®ua L©m An <color>",
            "     <pic=35><color=green><enter>Ho¹t ®éng diÔn ra vµo.<color><color=fire>\n 00h00 - 23h00!<color>",
            "     <pic=36><bclr=blue><enter>Chóc c¸c nh©n sü gÆp nhiÒu may m¾n vµ ph¸t tµi...! <bclr>",
            "     <pic=115><pic=115><pic=115><bclr=blue><enter>Gi¶i trÝ vui vÎ lµnh m¹nh <color=yelow>Thö tµi suy ®o¸n, thö vËn mai!!!<color><bclr>",
        }

        local rand = random(1,getn(tab_Chat)) 
        NpcChat(nNpcIndex, tab_Chat[rand]) 
    end
    
    return DN_TIME_TICK*18, nNpcIndex;
end

function processTraoThuong(tbPlayerTrung, tbRank, sKetQua1, sKetQua2)
    local sKetQua = format("%s<enter>%s", gsub(sKetQua1, " ", "Ù"), gsub(sKetQua2, " ", "Ù"));
    
    for i=1, getn(tbPlayerTrung) do
        local nVangTrung = tbPlayerTrung[i][DN_TK_nVangTrung];
        local nVangCuoc = tbPlayerTrung[i][DN_TK_nVangCuoc];
        local nTienDongTrung = tbPlayerTrung[i][DN_TK_nTienDongTrung];
        local nTienDongCuoc = tbPlayerTrung[i][DN_TK_nTienDongCuoc];
        local nFinalVangNhan = nVangCuoc + nVangTrung;
        local nFinalTienDongNhan = nTienDongCuoc + nTienDongTrung;
        local sPlayerName = tbPlayerTrung[i][DN_TK_sPlayerName];    
        local sAccount = tbPlayerTrung[i][DN_TK_sAccount];

        local curPlayerIndex = SearchPlayer(sPlayerName);
        local sSex = getSexTitleByID(tbPlayerTrung[i][DN_TK_nSex]);

        local sDsTVTrung = tbPlayerTrung[i][DN_TK_sDsTVTrung];
        local strThongBaoTienVan = format("Chøc mõng %s <color=green>%s<color> ®· ®Æt chÝnh x¸c %s vµ nhËn ®­îc <color=yellow>%s v¹n<color>",
                                sSex, sPlayerName, sDsTVTrung, nVangTrung);

        local sDsTDTrung = tbPlayerTrung[i][DN_TK_sDsTDTrung];
        local strThongBaoTienDong = format("Chøc mõng %s <color=green>%s<color> ®· tróng th­ëng %s vµ nhËn ®­îc <color=yellow>%s tiÒn ®ång<color>", 
                                           sSex, sPlayerName, sDsTDTrung, nTienDongTrung);  
        if curPlayerIndex > 0 then
            if nVangTrung > 0 then               
                local previousIndex = PlayerIndex;
                PlayerIndex = curPlayerIndex;         
                Msg2SubWorld(strThongBaoTienVan);
                Earn(nFinalVangNhan*10000);     
                Msg2Player(format("Chóc mõng b¹n nhËn ®­îc <color=yellow>%s v¹n<color>", nFinalVangNhan));   
                PlayerIndex = previousIndex;    
            end
            if nTienDongTrung > 0 then       
                local previousIndex = PlayerIndex;
                PlayerIndex = curPlayerIndex;         
         
                local nFree = CalcFreeItemCellCount();
                local nSLTD = div(nFinalTienDongNhan, 999);
                Msg2SubWorld(strThongBaoTienDong);

                if (nSLTD + 3) > nFree then
                    Talk(1, "", "Hµnh trang <color=red>kh«ng ®ñ kho¶ng trèng<color> kh«ng thÓ nhËn th­ëng. B¹n vui lßng ®Õn NPC <color=yellow>Qu¶n lý tr­êng ®ua<color> ®Ó <color=fire>nhËn l¹i phÇn th­ëng<color>");
                    Msg2Player("Hµnh trang <color=yellow>kh«ng ®ñ kho¶ng trèng<color> kh«ng thÓ nhËn th­ëng. B¹n vui lßng ®Õn NPC <color=yellow>Qu¶n lý tr­êng ®ua<color> ®Ó <color=fire>nhËn l¹i phÇn th­ëng<color>");
                    local tbHeader = {}
                    tinsert(tbHeader , DN_tbDuaNguaChuaNhanHeader);     
                    
                    local logTime = FormatTime2String("%Y%m%dT%H:%M:%S", GetCurServerTime());
                    local sFileName = format("%s_duanguachuanhan.txt", sAccount);
                    local sDSTrung = gsub(sDsTDTrung,  " ", "Ù");
                    

                    local tbThuong = {}
                    tinsert(tbThuong, {sAccount, sPlayerName, 0, nFinalTienDongNhan, sKetQua, sDSTrung, logTime, 0, "nil"});                        
                
                    DNFiles_TableSaveFileDefault(DN_sFilePathDuaNguaChuaNhan, sFileName, "a+", tbHeader,  tbThuong); 
                else
                    if nTienDongTrung > 999 then
                        tbAwardTemplet:GiveAwardByList({tbProp = {4,417,1,1,1,0,0,0}, nExpiredTime=nil, nBindState=1}, "TiÒn ®ång", nTienDongTrung);
                    else
                        AddStackItem(nTienDongTrung, 4,417,1,1,0,0,0);
                        Msg2Player(format("Chóc mõng b¹n nhËn ®­îc <color=yellow>%s TiÒn ®ång<color>", nTienDongTrung));                      
                    end
                end  
                PlayerIndex = previousIndex;
            end
        else
            local sFileName = format("%s_duanguachuanhan.txt", sAccount);
            local logTime = FormatTime2String("%Y%m%dT%H:%M:%S", GetCurServerTime());         

            local tbData = {0, 0, 0, 0, 0, 0, 0, 0, 0};
            tbData[DN_Cuoc_CN_nIPlayerAccount] = sAccount;
            tbData[DN_Cuoc_CN_nIPlayerName] = sPlayerName;                 
            tbData[DN_Cuoc_CN_nIKetQua] = sKetQua;
            tbData[DN_Cuoc_CN_nIDSTrung] = gsub(sDsTDTrung,  " ", "Ù");
            tbData[DN_Cuoc_CN_nICreateDate] = logTime;
            tbData[DN_Cuoc_CN_nIReceivedDate] = "nil";
            
            if nVangTrung > 0  then
                Msg2SubWorld(strThongBaoTienVan);
                tbData[DN_Cuoc_CN_nITienVan] = nFinalVangNhan;
            end

            if nTienDongTrung > 0 then
                tbData[DN_Cuoc_CN_nITienDong] = nFinalTienDongNhan;
                Msg2SubWorld(strThongBaoTienDong);
            end 
                
            local tbHeader = {}
            tinsert(tbHeader , DN_tbDuaNguaChuaNhanHeader);         
    
            local tbThuong = {}
            tinsert(tbThuong, tbData);                      
            
            DNFiles_TableSaveFileDefault(DN_sFilePathDuaNguaChuaNhan, sFileName, "a+", tbHeader,  tbThuong);    
        end
    end
end

function getRateRank(nRank)
    local nRate = 1;
    if nRank == 1 then
        nRate = 3;
    end   
    return nRate;
end

 
function findPlayer(tbPlayerTrung, sAccount, sPlayerName)
    if getn(tbPlayerTrung) > 0 then
        for i=1, getn(tbPlayerTrung) do
            if (tbPlayerTrung[i][DN_TK_sPlayerName] == sPlayerName and
                tbPlayerTrung[i][DN_TK_sAccount] == sAccount) then
                return i;
            end
        end
    end
    return nil;
end


function processTongKetKetQua(tbDuaNguaPlayer, tbRank)
   local tbPlayerTrung = {};
   local nCurRank = 0;
   local nTotalRankProcess = 0;
   for i = 1, getn(tbRank) do    
        local nType = tbRank[i][DN_Rank_nNpcSeries];
        local nRank = tbRank[i][DN_Rank_nRank];
        if nCurRank ~= nRank then
            nTotalRankProcess = nTotalRankProcess  + 1;
            nCurRank = nRank;
        end
        if nTotalRankProcess > 2 then
            break;
        end
        
        local sItemCuocName = getNpcDuaNameByIndex(nType);
        sItemCuocName = format("<color=%s>%s<color>", getColorByRank(nRank), sItemCuocName);
    
        for j = 1, getn(tbDuaNguaPlayer) do
           local sAccount = tbDuaNguaPlayer[j][1];          
           local nTienVanCuoc = tbDuaNguaPlayer[sAccount][nType][DN_nTienVanIndex];
           local nTienDongCuoc = tbDuaNguaPlayer[sAccount][nType][DN_nTienDongIndex];
           local sPlayerName  = tbDuaNguaPlayer[sAccount][DN_TH_sPlayerName][1];
        
           if nTienVanCuoc >0 or nTienDongCuoc > 0 then      
                local playerIndex = findPlayer(tbPlayerTrung, sAccount, sPlayerName);
                local curPlay = {};
                if playerIndex == nil then                  
                local nSexID = tbDuaNguaPlayer[sAccount][DN_TH_nSex][1];            
                     tinsert(tbPlayerTrung, {sAccount, sPlayerName, nSexID, 0, 0, "", 0, 0, ""});
                     curPlay = tbPlayerTrung[getn(tbPlayerTrung)];
                else
                     curPlay = tbPlayerTrung[playerIndex];
                end
                
                if nTienVanCuoc > 0  then
                    local sKetQua = curPlay[DN_TK_sDsTVTrung];
                    if sKetQua == "" then
                        sKetQua = sItemCuocName;
                    else
                        sKetQua = format("%s, %s", sKetQua, sItemCuocName);
                    end

                    curPlay[DN_TK_nVangCuoc] = curPlay[DN_TK_nVangCuoc] + nTienVanCuoc;
                    curPlay[DN_TK_nVangTrung] = curPlay[DN_TK_nVangTrung] + nTienVanCuoc*getRateRank(nRank);
                    curPlay[DN_TK_sDsTVTrung] = sKetQua;
                end    
                if nTienDongCuoc > 0  then
                    local sKetQua = curPlay[DN_TK_sDsTDTrung];
                    if sKetQua == "" then
                        sKetQua  = sItemCuocName;
                    else
                        sKetQua = format("%s, %s", sKetQua, sItemCuocName);
                    end
                    curPlay[DN_TK_nTienDongCuoc] = curPlay[DN_TK_nTienDongCuoc] + nTienDongCuoc;
                    curPlay[DN_TK_nTienDongTrung] = curPlay[DN_TK_nTienDongTrung] + nTienDongCuoc*getRateRank(nRank);
                    curPlay[DN_TK_sDsTDTrung] = sKetQua;
                end
                
                tbPlayerTrung[sAccount] = curPlay;
             end
       end
       
   end
   return tbPlayerTrung;
end

function getColorByRank(nRank)
    local sColor = "green";
    if nRank == 1 then
        sColor = "fire";
    elseif nRank == 2 then
        sColor = "pink";
    elseif nRank == 3 then
        sColor = "green";
    elseif nRank == 4 then
        sColor = "orange";
    elseif nRank == 5 then
        sColor = "orange";
    end
    return sColor;
end

function processGetCuoc(sTime)
    local sCuocFileName = format("duanguacuoc_%s.txt", FormatTime2String("%d%m%Y", sTime));
    local sDuaNguaTitle = format("[DUANGUA-%s]", FormatTime2String("%H%M", sTime));

    local tbResult = {}
    tbResult = DNFiles_DuaNguaFromFile(DN_sFilePath, sCuocFileName, DN_tbPackCuocDuaNgua, sDuaNguaTitle);
    
    return tbResult;
end

function processTongHopDuLieu(tbDuaNguaPlayer)
     local tbDuaNguaPlayerFinal = {}
     for i=1, getn(tbDuaNguaPlayer) do
         local sAccount = tbDuaNguaPlayer[i][DN_Cuoc_sAccount];
         local curPlay = tbDuaNguaPlayerFinal[sAccount];
         local nType = tbDuaNguaPlayer[i][DN_Cuoc_nType];
         local nMoney = tbDuaNguaPlayer[i][DN_Cuoc_nTienCuoc];
         local nTypeRate = tbDuaNguaPlayer[i][DN_Cuoc_nLoaiTienCuoc];
         if curPlay == nil then  
             local sPlayerName = tbDuaNguaPlayer[i][DN_Cuoc_sPlayerName];
             local nSexID = tbDuaNguaPlayer[i][DN_Cuoc_nSex];
             tinsert(tbDuaNguaPlayerFinal, {sAccount});
             tbDuaNguaPlayerFinal[sAccount] = {{DN_nKim, 0, 0}, {DN_nMoc, 0, 0}, {DN_nThuy, 0, 0}, {DN_nHoa, 0, 0}, {DN_nTho, 0, 0}, {sPlayerName}, {nSexID}}; 
             curPlay = tbDuaNguaPlayerFinal[sAccount];
         end
         
         if nTypeRate == DN_nTienVan  then
             curPlay[nType][DN_nTienVanIndex] = curPlay[nType][DN_nTienVanIndex] + nMoney;
         elseif nTypeRate == DN_nTienDong  then
             curPlay[nType][DN_nTienDongIndex] = curPlay[nType][DN_nTienDongIndex] + nMoney;
         end
         
         tbDuaNguaPlayerFinal[sAccount] = curPlay;
     end
     return tbDuaNguaPlayerFinal;
end




function processGetKetQuaStr(tbRanks)
    local top1 = "";   
    local top2 = "";
    local top3 = "";
    local top4 = "";
    local top5 = "";
    for i=1, getn(tbRanks) do
        local sNpcDuaName = layTenItemDatCuoc(tbRanks[i][DN_nNpcSeries]);
        if tbRanks[i][DN_Rank_nRank] == 1 then
            if top1 == "" then
                top1 = format("+ %s", sNpcDuaName);
            else
                top1 = format("%s <enter> + %s", top1, sNpcDuaName)
            end
        elseif tbRanks[i][DN_Rank_nRank] == 2 then
            if top2 == "" then
                top2 = format("+ %s", sNpcDuaName);
            else
                top2 = format("%s <enter> + %s", top2, sNpcDuaName)
            end
        elseif tbRanks[i][DN_Rank_nRank] == 3 then
            if top3 == "" then
                top3 = format("+ %s", sNpcDuaName);
            else
                top3 = format("%s <enter> + %s", top3, sNpcDuaName)
            end
     elseif tbRanks[i][DN_Rank_nRank] == 4 then
            if top4 == "" then
                top4 = format("+ %s", sNpcDuaName);
            else
                top4 = format("%s <enter> + %s", top4, sNpcDuaName)
            end
     elseif tbRanks[i][DN_Rank_nRank] == 5 then
            if top5 == "" then
                top5 = format("+ %s", sNpcDuaName);
            else
                top5 = format("%s <enter> + %s", top5, sNpcDuaName)
            end
        end


    end
    if top1 ~= "" then
        top1 = format("<enter><color=fire>H¹ng 1:<color> <enter><color=fire> %s<color>", top1); 
    end
    
    if top2 ~= "" then
        top2 = format("<color=pink>H¹ng 2:<color> <enter><color=pink> %s<color>", top2);
    else
        top2 = "<color=pink>H¹ng 2:...<color>"; 
    end
    
    if top3 ~= "" then
        top3 = format("<color=green>H¹ng 3:<color> <enter><color=green> %s<color>", top3); 
    else
        top3 = "<color=green>H¹ng 3:...<color>"; 
    end

    if top4 ~= "" then
        top4 = format("<color=orange>H¹ng 4:<color> <enter><color=orange> %s<color>", top4); 
    else
        top4 = "<color=orange>H¹ng 4:...<color>"; 
    end

    if top5 ~= "" then
        top5 = format("<color=orange>H¹ng 5:<color> <enter><color=orange> %s<color>", top5);
    else
        top5 = "<color=orange>H¹ng 5:...<color>"; 
    end
   return format("%s<enter>%s", top1, top2), format("%s<enter>%s<enter>%s", top3, top4, top5);
end

function processUpdateKetQuaDua(curTime, sKetQua1, sKetQua2)
    local sTime = format("%s", FormatTime2String("%H:%M", curTime));    
    local sDate = format("%s", FormatTime2String("%d%m%Y", curTime));   
    local sKetQua = format("%s<enter>%s", gsub(sKetQua1, " ", "Ù"), gsub(sKetQua2, " ", "Ù"));

    local tbKetQua= {}       
    tinsert(tbKetQua, DN_tbKetQuaDuaNguaLanTruocCuaHeader);  
    tinsert(tbKetQua, {sDate, sTime, curTime, sKetQua});                           
    DNFiles_TableSaveFile(DN_sFilePath, DN_sFileName_KetQuaLanTruoc, "w+",  tbKetQua);
end

function processGetKetQua(curTime)
    local sKetQuaFileName = format("duanguaketqua_%s.txt", FormatTime2String("%d%m%Y", curTime));
    local sDuaNguaTitle = format("[DUANGUA-%s]", FormatTime2String("%H%M", curTime));
    local tbResult =  DNFiles_DuaNguaFromFile(DN_sFilePath, sKetQuaFileName , DN_tbPackKetQuaDuaNgua, sDuaNguaTitle);    
    return tbResult;
end

function updateProcessStatus(nNpcIndex, curTime, nIsStart, nIsRunning, nIsAddingTime, nIsAnalyze, nIsEnd)
    print(format("===================> Cap Nhat DUA NGUA %s Status  <=========================", FormatTime2String("%H:%M", curTime))); 
    SetNpcParam(nNpcIndex, %DN_IsStart, nIsStart);    
    SetNpcParam(nNpcIndex, %DN_IsRunning, nIsRunning); 
    SetNpcParam(nNpcIndex, %DN_IsAddingTime, nIsAddingTime);   
    SetNpcParam(nNpcIndex, %DN_IsAnalyze, nIsAnalyze);   
    SetNpcParam(nNpcIndex, %DN_IsEnd, nIsEnd);  
end

function layTenItemDatCuoc(nIndex)
    local sName = "";
    if nIndex == DN_nKim  then
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

function getSexTitleByID(sexID)
    if sexID == 0 then
        return "§¹i hiÖp"
    else
        return "N÷ hiÖp"
    end
end


