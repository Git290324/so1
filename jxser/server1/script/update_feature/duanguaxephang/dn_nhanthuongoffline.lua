Include("\\script\\update_feature\\duanguaxephang\\dn_variables.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\basic.lua") 
Include("\\script\\update_feature\\duanguaxephang\\dn_lib_files.lua")

function processNhanThuong()    
    local nNpcIndex = GetLastDiagNpc();
    local isAnalyze  = GetNpcParam(nNpcIndex, %DN_IsAnalyze);

    local sSexTitle = getSexTitle();
    if isAnalyze  ~= 1 then
        local sFileName = format("%s_duanguachuanhan.txt", GetAccount());
        local tbDuaNguaChuaNhan = DNFiles_TableFromFile(DN_sFilePathDuaNguaChuaNhan, sFileName, DN_tbPackDuaNguaChuaNhan);
        local nTienVan = 0;
        local nTienDong = 0;        
        local sDsTrung = "";
        local sDsKetQua = "";
        if tbDuaNguaChuaNhan ~= nil then
            local nDuaNguaChuaNhan = getn(tbDuaNguaChuaNhan);       
            for i=1, nDuaNguaChuaNhan do        
                if tbDuaNguaChuaNhan[i][DN_Cuoc_CN_nIPlayerName] == GetName() and tbDuaNguaChuaNhan[i][DN_Cuoc_CN_nIIsReceived] == 0 then      
                    nTienVan  = nTienVan + tonumber(tbDuaNguaChuaNhan[i][DN_Cuoc_CN_nITienVan]);
                    nTienDong = nTienDong  + tonumber(tbDuaNguaChuaNhan[i][DN_Cuoc_CN_nITienDong]);
                end
                if i == nDuaNguaChuaNhan  then
                    sDsKetQua = tbDuaNguaChuaNhan[i][DN_Cuoc_CN_nIKetQua];
                    sDsTrung = tbDuaNguaChuaNhan[i][DN_Cuoc_CN_nIDSTrung]; 
                end
            end
        end
    
        if nTienVan > 0 or nTienDong > 0 then           
            showMenuNhanThuongOffline(sSexTitle, sDsKetQua, sDsTrung, nTienVan, nTienDong, tbDuaNguaChuaNhan);
        else
            Talk(1, "", format("%s hiÖn t¹i <color=red>kh«ng cã<color> <color=green>phÇn th­ëng tróng th­ëng Offline<color> nµo ®Ó nhËn. Vui lßng tham gia ho¹t ®éng ®Ó cã thÓ nhËn th­ëng!!!", sSexTitle));
        end
    else
        Talk(1, "", format("HÖ thèng ®ang tiÕn hµnh tæng hîp d÷ liÖu vµ trao th­ëng. %s vui lßng quay l¹i sau vµi gi©y!!!", getSexTitle()));
    end

end

function isCanNhan()
    local nNpcIndex = GetLastDiagNpc();
    local isAnalyze  = GetNpcParam(nNpcIndex, %DN_IsAnalyze);
    local isCanNhan = 0;
    if isAnalyze ~=1 then
        isCanNhan = 1;
    else
        Talk(1, "", format("HÖ thèng ®ang tiÕn hµnh tæng hîp d÷ liÖu vµ trao th­ëng. %s vui lßng quay l¹i sau vµi gi©y!!!", getSexTitle()));
    end
    return isCanNhan;
end

function getSexTitle()
   local sexID = GetSex()
   if sexID == 0 then
       return "§¹i hiÖp";
   else
       return "N÷ hiÖp";
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

function showMenuNhanThuongOffline(sSexTitle, sKetQua, sDsTrung, nTienVan, nTienDong, tbDuaNguaChuaNhan) 
    if isCanNhan() == 1 then
        local strTitle = "";
        local strTitleCommon = format("HiÖn t¹i c¸c <color=fire>phÇn th­ëng<color> %s cßn cã thÓ nhËn v× lý do <color=red>kh«ng<color> <color=green>Online<color> khi ho¹t ®éng c«ng bè kÕt qu¶ lµ:", sSexTitle);
        if sDsTrung ~= "" and sKetQua ~= "" then
            strTitle = format("<npc>KÕt qu¶ lÇn tr­íc lµ <color=green>%s<color>.\n<color=cyan>%s ®· c­îc tróng<color>: \n%s", sKetQua, sSexTitle, sDsTrung);
            strTitle = format("%s.\n%s", strTitle, strTitleCommon);
        else
            strTile = format("<npc>%s", strTitleCommon);
        end 

        if nTienVan > 0 then
            strTitle = format("%s \n + <color=yellow>TiÒn v¹n<color>: %s", strTitle, nTienVan);
        end

        if nTienDong > 0 then
            strTitle = format("%s \n + <color=fire>TiÒn ®ång<color>: %s", strTitle, nTienDong);
        end

        local tbOpt =
        {
            {"NhËn th­ëng", processFinalNhanThuong, {nTienVan, nTienDong, tbDuaNguaChuaNhan}},
            {"Quay l¹i", main},
            {"Tho¸t"}
        }
        CreateNewSayEx(strTitle, tbOpt);
    end
end

function processFinalNhanThuong(nTienVan, nTienDong, tbDuaNguaChuaNhan)
    local nFree = CalcFreeItemCellCount();
    local curTime = FormatTime2String("%Y%m%dT%H:%M:%S", GetCurServerTime());
    local tbFinalData = {}   
    tinsert(tbFinalData, DN_tbDuaNguaChuaNhanHeader);   
    
    for i=1, getn(tbDuaNguaChuaNhan) do
        if tbDuaNguaChuaNhan[i][DN_Cuoc_CN_nIPlayerName] == GetName() and tbDuaNguaChuaNhan[i][DN_Cuoc_CN_nIIsReceived] == 0 then
            tbDuaNguaChuaNhan[i][DN_Cuoc_CN_nIIsReceived] = 1;
            tbDuaNguaChuaNhan[i][DN_Cuoc_CN_nIReceivedDate] = curTime;
        end
        tinsert(tbFinalData, tbDuaNguaChuaNhan[i]);
    end         
    local sSexTitle = getSexTitle();
    if isCanNhan() == 1 then
        local strMsg = format("<color=green>Chóc mõng<color> %s <color=green>%s<color> nhËn l¹i phÇn th­ëng <color=green>Thö VËn Mai<color> do Offline <color=green>thµnh c«ng<color>. PhÇn th­ëng bao gåm:", 
                                    sSexTitle, GetName());
        if nTienDong > 0 then
            local nSLTD = div(nTienDong, 999);
            if (nSLTD + 3) > nFree then
                Talk(1, "", "Hµnh trang <color=red>kh«ng ®ñ kho¶ng trèng<color> kh«ng thÓ nhËn th­ëng. B¹n vui lßng <color=green>dän dÑp<color> ®Ó nhËn <color=fire>nhËn l¹i phÇn th­ëng<color>");
                return
            else
                if nTienDong > 999 then
                    tbAwardTemplet:GiveAwardByList({tbProp = {4,417,1,1,1,0,0,0}, nExpiredTime=nil, nBindState=1}, "TiÒn ®ång", nTienDong);
                else
                    AddStackItem(nTienDong, 4,417,1,1,0,0,0);
                    Msg2Player(format("B¹n nhËn ®­îc %s TiÒn ®ång", nTienDong));
                end

            end     
        end

        if nTienVan > 0 then
            Earn(nTienVan *10000);  
        end
        
        
        if nTienVan > 0 then
            strMsg  = format("%s \n + <color=yellow>%s v¹n<color>", strMsg, nTienVan);
        end
        
        if nTienDong > 0 then
            strMsg  = format("%s \n + <color=fire>%s tiÒn ®ång<color>", strMsg, nTienDong);
        end
        
        Msg2Player(strMsg); 
        Msg2SubWorld(strMsg);   
        local sFileName = format("%s_duanguachuanhan.txt", GetAccount());
        DNFiles_TableSaveFile(DN_sFilePathDuaNguaChuaNhan, sFileName, "w+", tbFinalData);    
    end
end
