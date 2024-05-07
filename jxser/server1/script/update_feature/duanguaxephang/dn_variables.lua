Include("script\\updateconfig\\tasklist.lua")
----------------------------------------------
DN_sFilePath = "tempdata/duanguaxephang/";
DN_sFilePathDuaNguaChuaNhan = "tempdata/duanguaxephang/duanugachuanhan/";
DN_sFileName_ChuaNhan       = "duanguachuanhan.txt";
DN_sFileName_KetQuaLanTruoc = "duanguaketqualantruoc.txt";
DN_tbPackKetQuaDuaNgua = {"*n", "*n", "*w", "*w", "*n"};
DN_nNpcDuaIndex        = 1;
DN_nNpcSeries          = 2;
DN_sFTimeComplete      = 3;
DN_sTimeComplete       = 4;
DN_nIsComplete         = 5;
DN_Rank_nNpcDuaIndex = 1;
DN_Rank_nNpcSeries   = 2;
DN_Rank_nRank        = 3;

DN_tbKetQuaDuaNguaLanTruocCuaHeader    = {"Date", "Time", "Date_Time", "Ket_Qua"};
DN_tbPackQuaDuaNguaLanTruoc      = {"*w", "*w", "*n", "*w"};
DN_nDateKQ                 = 1;
DN_nTimeKQ                 = 2;
DN_sDateTime               = 3;
DN_nKetQua                 = 4;

DN_tbDuaNguaChuaNhanHeader = {"Player_Account", "Player_Name", "Tien_Van", "Tien_Dong", "Ket_Qua", "DS_Trung", "Create_Date", "IsReceived", "Received_Date"};
DN_tbPackDuaNguaChuaNhan   = {"*w", "*w", "*n", "*n", "*w", "*w", "*w", "*n", "*w"};

DN_tbPackCuocDuaNgua  = {"*w", "*w", "*n", "*n", "*n", "*w", "*w"};
DN_Cuoc_sAccount      = 1;
DN_Cuoc_sPlayerName   = 2;
DN_Cuoc_nType         = 3;
DN_Cuoc_nTienCuoc     = 4;
DN_Cuoc_nLoaiTienCuoc = 5;
DN_Cuoc_sTime         = 6;
DN_Cuoc_nSex          = 7;

DN_Cuoc_CN_nIPlayerAccount = 1;
DN_Cuoc_CN_nIPlayerName    = 2;
DN_Cuoc_CN_nITienVan       = 3;
DN_Cuoc_CN_nITienDong      = 4;
DN_Cuoc_CN_nIKetQua        = 5;
DN_Cuoc_CN_nIDSTrung       = 6;
DN_Cuoc_CN_nICreateDate    = 7;
DN_Cuoc_CN_nIIsReceived    = 8;
DN_Cuoc_CN_nIReceivedDate  = 9;

DN_nTienVan                = 1;
DN_nTienDong               = 4;
DN_nTienVanIndex           = 2;
DN_nTienDongIndex          = 3;
DN_nTotalItem              = 6;

DN_TH_sPlayerName = 6;
DN_TH_nSex        = 7;

DN_TK_sAccount       = 1;
DN_TK_sPlayerName    = 2;
DN_TK_nSex           = 3;
DN_TK_nVangCuoc      = 4;
DN_TK_nVangTrung     = 5;
DN_TK_sDsTVTrung     = 6;
DN_TK_nTienDongCuoc  = 7;
DN_TK_nTienDongTrung = 8;
DN_TK_sDsTDTrung     = 9;

DN_RankAll_nNpcDuaRank = 1;
DN_RankAll_nNpcSeries  = 2;
DN_RankAll_nRank       = 3;

DN_sKim  = "H­¬u §èm";
DN_nKim  = 1;
DN_sMoc  = "Sãi X¸m";
DN_nMoc  = 2;
DN_sThuy = "Tr©u Rõng";
DN_nThuy = 3;
DN_sHoa  = "Heo Rõng";
DN_nHoa  = 4;
DN_sTho  = "B¹ch Hæ";
DN_nTho  = 5;

function getNpcDuaNameByIndex(nIndex)
    local sNpcName = "";
    if nIndex  == DN_nKim then
        sNpcName = DN_sKim;
    elseif nIndex == DN_nMoc then
        sNpcName = DN_sMoc;
    elseif nIndex == DN_nThuy then
        sNpcName = DN_sThuy;
    elseif nIndex == DN_nHoa then
        sNpcName = DN_sHoa;
    elseif nIndex == DN_nTho then
        sNpcName = DN_sTho;
    end
    return sNpcName;
end

DN_NPC_DUA_NO       = 1;
DN_NPC_PARAM_POS    = 2;
DN_NPC_QLTDIndex    = 3;
DN_NPC_Rank         = 4;
DN_NPC_IsSlowSpeed  = 5;
DN_NPC_Series       = 6;
DN_NPC_IsSwap       = 7;
DN_NPC_TotalFastPos = 8;
DN_NPC_TotalSlowPos = 9;

DN_NPC_NSeries = 0;

DN_TIME_TICK        = 10;
DN_TIME_RESTART     = 30;
DN_TIME_INFORM      = 30;
DN_TIME_TIME_ADD    = 10;
DN_TIME_ANALYZE     = 30;
DN_TIME_CUOC        = 60;
DN_TIME_RUN         = 200;
DN_TIME_TRAO_THUONG = 30; 
             

DN_StartTimeBet = 1;                  
DN_ExcuteTime   = 2;
DN_EndTime      = 3;
DN_IsFirstTick  = 4;
DN_IsStart      = 5;
DN_IsAddingTime = 6;
DN_IsEnd        = 7;
DN_IsRunning    = 8;
DN_IsAnalyze    = 9;

DN_tbBeginTime = {
	{07, 12, 2, 0},
	{13, 18, 2, 0},
	{19, 23, 2, 0},
}

DN_tbNpcDua_ID = {
	[1] = {1809, 1810, 1811}, 
	[2] = {1812, 1813, 1814}, 
	[3] = {1815, 1816, 1817}, 
	[4] = {1818, 1819, 1820},
	[5] = {1821, 1822, 1823},
}

DN_tbNpcDuas = {
	[1] ={1570, 2943},
	[2] = {1571, 2944},
	[3] ={1578, 2951},
	[4] ={1585, 2958},
	[5] = {1586, 2959}
}
