Include("\\script\\update_feature\\duanguaxephang\\mathlibrary.lua")
Include("\\script\\update_feature\\duanguaxephang\\dn_lib_files.lua")
Include("\\script\\lib\\basic.lua")
Include("\\script\\update_feature\\duanguaxephang\\dn_rank.lua")
Include("\\script\\update_feature\\duanguaxephang\\dn_variables.lua")

NPC_DUA_1_TbPos = {}
NPC_DUA_2_TbPos = {}
NPC_DUA_3_TbPos = {}
NPC_DUA_4_TbPos = {}
NPC_DUA_5_TbPos = {}

NPC_DUA_Range = 8;

NPC_DUA_TimeTickRun = 1;
NPC_DUA_TimeTickStand = 2;

NPC_DUA_MAX_SLOW_POS_SWAP = 3;
NPC_DUA_MAX_FAST_POS_SWAP = 4;

NPC_DUA_DICH_TbPos ={
	[1] = {1318,3195},
	[2] = {1319,3196},
	[3] = {1326,3203},
	[4] = {1333,3210},
	[5] = {1334,3211}
}

function addNpcDua(nNpcQLTDIndex)
    local tbNPCDuas = {};
    local nCurrent = 1;
    for i = 1, getn(DN_tbNpcDuas) do   
         local nXPos = DN_tbNpcDuas[i][1];
         local nYPos = DN_tbNpcDuas[i][2];    
                     
         local nNpcIndex =  AddNpcEx(DN_tbNpcDua_ID[i][1], 1, 1, SubWorldID2Idx(176), nXPos*32, nYPos*32, 0, getNpcDuaNameByIndex(i), 0);
             if nNpcIndex > 0 then
                   
                   SetNpcParam(nNpcIndex, %DN_NPC_QLTDIndex, nNpcQLTDIndex);                  
                   SetNpcParam(nNpcIndex, %DN_NPC_PARAM_POS, 1);
                   SetNpcParam(nNpcIndex, %DN_NPC_DUA_NO, nCurrent);
                   SetNpcParam(nNpcIndex, %DN_NPC_Series, nCurrent);
                   SetNpcParam(nNpcIndex, %DN_NPC_TotalFastPos, 1); 
              

                    SetNpcAI(nNpcIndex, 0);       
                    SetNpcActiveRegion(nNpcIndex, 1);       

                    if nCurrent == 1 then
                        NPC_DUA_1_TbPos = generateNpcPosPlan(nXPos, nYPos);
                    elseif nCurrent == 2 then
                        NPC_DUA_2_TbPos = generateNpcPosPlan(nXPos, nYPos);
                    elseif nCurrent == 3 then
                        NPC_DUA_3_TbPos = generateNpcPosPlan(nXPos, nYPos);
                    elseif nCurrent == 4 then
                        NPC_DUA_4_TbPos = generateNpcPosPlan(nXPos, nYPos);
                    elseif nCurrent == 5 then
                        NPC_DUA_5_TbPos = generateNpcPosPlan(nXPos, nYPos);
                    end
                 
                    AddTimer(NPC_DUA_TimeTickRun*18, "NPCDuaTimer", nNpcIndex); 
                    nCurrent = nCurrent + 1;    
             end
    end
end

function processUpdateKetQuaNpcDua(nNpcIndex, nNpcIndexDua, curTime, isComplete)  
    local tbKetQua = {}
    local curComplete = GetCurServerTime();
    local nSeries = GetNpcParam(nNpcIndex, %DN_NPC_Series);
    tinsert(tbKetQua, {nNpcIndexDua, nSeries, FormatTime2String("%H:%M:%S", curComplete), curComplete, isComplete});
    local sKetQuaFileName = format("duanguaketqua_%s.txt", FormatTime2String("%d%m%Y", curTime));
    DNFiles_TableSaveFile(DN_sFilePath, sKetQuaFileName, "a+", tbKetQua);   
end





function processGetRank(nNpcDuaIndex, curTime)
    local sKetQuaFileName = format("duanguaketqua_%s.txt", FormatTime2String("%d%m%Y", curTime));
    local sDuaNguaTitle = format("[DUANGUA-%s]", FormatTime2String("%H%M", curTime));

    local tbResult = {}
    tbResult = DNFiles_DuaNguaFromFile(DN_sFilePath, sKetQuaFileName , DN_tbPackKetQuaDuaNgua, sDuaNguaTitle);    
    return getRankOfNpcDuaIndex(nNpcDuaIndex, tbResult);
end




  
function NPCDuaTimer(nNpcIndex, nTimeOut)

    local nNpcQLTDIndex = GetNpcParam(nNpcIndex, %DN_NPC_QLTDIndex);
    local isStart = GetNpcParam(nNpcQLTDIndex, %DN_IsStart);
    local isRunning = GetNpcParam(nNpcQLTDIndex, %DN_IsRunning);
    local isEnd = GetNpcParam(nNpcQLTDIndex, %DN_IsStart);
    local isAddingTime = GetNpcParam(nNpcQLTDIndex, %DN_IsAddingTime);
    local startTime = GetNpcParam(nNpcQLTDIndex, %DN_StartTimeBet);
    local isAnalyze = GetNpcParam(nNpcQLTDIndex, %DN_IsAnalyze);
    local isSwap = GetNpcParam(nNpcIndex, %DN_NPC_IsSwap);
    local isSlowSpeed = GetNpcParam(nNpcIndex, %DN_NPC_IsSlowSpeed);

   

    if isRunning == 1 then
        local nIndexStart = GetNpcParam(nNpcIndex, %DN_NPC_DUA_NO);

     if isSwap == 1 then
         if isSlowSpeed  == 1 then
            NpcChat(nNpcIndex, "Tù d­ng c¶m thÊy cho¸ng v¸ng"); 
         else
            NpcChat(nNpcIndex, "T¨ng tèc!"); 
         end
            SetNpcParam(nNpcIndex, %DN_NPC_IsSwap, 0);      
     end

        local nPosId = GetNpcParam(nNpcIndex, %DN_NPC_PARAM_POS);
        local tbCurPos =  {}  
        if nIndexStart == 1 then       
            tbCurPos = NPC_DUA_1_TbPos;
        elseif nIndexStart == 2 then
            tbCurPos = NPC_DUA_2_TbPos;
        elseif nIndexStart == 3 then
            tbCurPos = NPC_DUA_3_TbPos;
        elseif nIndexStart == 4 then
            tbCurPos = NPC_DUA_4_TbPos;
        elseif nIndexStart == 5 then
            tbCurPos = NPC_DUA_5_TbPos;
        end
        
        local tbPos = tbCurPos[nPosId];  
       
            
        if not tbPos then
            print("Pos null");
            return
        end
        
        if GetNpcParam(nNpcIndex, %NPC_PARAM_DEATH) == 1 then
            print("Npc Death");
            return 
        end
        
        if is_arrive_at(nNpcIndex, NPC_DUA_DICH_TbPos[nIndexStart][1],  NPC_DUA_DICH_TbPos[nIndexStart][2]) then
             local curRank = GetNpcParam(nNpcIndex, %DN_NPC_Rank);
             if curRank == nil or curRank == 0 then
                processUpdateKetQuaNpcDua(nNpcIndex, nIndexStart, startTime, 1);     
                curRank = processGetRank(nIndexStart, startTime);
                SetNpcParam(nNpcIndex, %DN_NPC_Rank, curRank);
             end    
            
             NpcChat(nNpcIndex, "VÒ tíi §Ých H¹ng "..curRank);
             return NPC_DUA_TimeTickRun*18, nNpcIndex; 
        end
        
        if is_arrive_at(nNpcIndex, tbPos[1], tbPos[2]) then             
            local isSlowSpeed = GetNpcParam(nNpcIndex, %DN_NPC_IsSlowSpeed);
            local totalSlowPos = GetNpcParam(nNpcIndex, %DN_NPC_TotalSlowPos);
            local totalFastPos = GetNpcParam(nNpcIndex, %DN_NPC_TotalFastPos);
        
            local rand = random(1,3);     
             
            if (rand == 1 and isSlowSpeed == 0 and totalSlowPos ~= NPC_DUA_MAX_SLOW_POS_SWAP) or 
                            totalFastPos == NPC_DUA_MAX_FAST_POS_SWAP then
                
                local nNpcDuaIndex = GetNpcParam(nNpcIndex, %DN_NPC_Series);
                local nNpcSwapIndex =  AddNpcEx(DN_tbNpcDua_ID[nNpcDuaIndex][3], 1, %DN_NPC_NSeries, SubWorldID2Idx(176), tbPos[1]*32, tbPos[2]*32, 0, getNpcDuaNameByIndex(nNpcDuaIndex), 0);
                local nNpcPosID = nPosId + 1;        
        
                SetNpcParam(nNpcSwapIndex, %DN_NPC_DUA_NO, nIndexStart);
                SetNpcParam(nNpcSwapIndex, %DN_NPC_QLTDIndex, nNpcQLTDIndex);                  
                SetNpcParam(nNpcSwapIndex, %DN_NPC_PARAM_POS, nNpcPosID);
                SetNpcParam(nNpcSwapIndex, %DN_NPC_Series, nNpcDuaIndex);
                SetNpcParam(nNpcSwapIndex, %DN_NPC_IsSwap, 1);
                SetNpcParam(nNpcSwapIndex, %DN_NPC_IsSlowSpeed, 1);
                SetNpcParam(nNpcSwapIndex, %DN_NPC_TotalSlowPos, 1);
                SetNpcAI(nNpcSwapIndex, 0);       
                SetNpcActiveRegion(nNpcSwapIndex, 1);   

                   
                AddTimer(NPC_DUA_TimeTickRun*18, "NPCDuaTimer", nNpcSwapIndex);   
                    
                DelNpc(nNpcIndex);

                return 0, 0;
            elseif (rand == 2 and isSlowSpeed == 1) or totalSlowPos == NPC_DUA_MAX_SLOW_POS_SWAP then
                local nNpcDuaIndex = GetNpcParam(nNpcIndex, %DN_NPC_Series);
                local speedRand = random(1,2);  
                
                local nNpcSwapIndex =  AddNpcEx(DN_tbNpcDua_ID[nNpcDuaIndex][speedRand], 1, %DN_NPC_NSeries, SubWorldID2Idx(176), tbPos[1]*32, tbPos[2]*32, 0, getNpcDuaNameByIndex(nNpcDuaIndex), 0);
                local nNpcPosID = nPosId + 1;

                SetNpcParam(nNpcSwapIndex, %DN_NPC_DUA_NO, nIndexStart);
                SetNpcParam(nNpcSwapIndex, %DN_NPC_QLTDIndex, nNpcQLTDIndex);                  
                SetNpcParam(nNpcSwapIndex, %DN_NPC_PARAM_POS, nNpcPosID);
                SetNpcParam(nNpcSwapIndex, %DN_NPC_Series, nNpcDuaIndex);
                SetNpcParam(nNpcSwapIndex, %DN_NPC_IsSwap, 1);
                SetNpcParam(nNpcSwapIndex, %DN_NPC_TotalFastPos, 1); 
                SetNpcAI(nNpcSwapIndex, 0);       
                SetNpcActiveRegion(nNpcSwapIndex, 1);      
             
                AddTimer(NPC_DUA_TimeTickRun*18, "NPCDuaTimer", nNpcSwapIndex); 
   
                DelNpc(nNpcIndex); 
                return 0, 0;
            else
                if isSlowSpeed == 1 then
                    totalSlowPos = totalSlowPos + 1;
                     SetNpcParam(nNpcIndex, %DN_NPC_TotalSlowPos, totalSlowPos);
                else
              totalFastPos = totalFastPos + 1;
                    SetNpcParam(nNpcIndex, %DN_NPC_TotalFastPos, totalFastPos);
                end
                nPosId = nPosId + 1
                SetNpcParam(nNpcIndex, %DN_NPC_PARAM_POS, nPosId);
                tbPos =  tbCurPos[nPosId]
                NpcWalk(nNpcIndex, tbPos[1], tbPos[2])                
            end      
        else
            NpcWalk(nNpcIndex, tbPos[1], tbPos[2]);
        end
    elseif isAddingTime == 1 then
       local curRank = GetNpcParam(nNpcIndex, %DN_NPC_Rank);    
       if curRank == nil or curRank == 0 then
            local nPosId = GetNpcParam(nNpcIndex, %DN_NPC_PARAM_POS);
            local tbCurPos =  {}  
            if nIndexStart == 1 then       
                tbCurPos = NPC_DUA_1_TbPos;
            elseif nIndexStart == 2 then
                tbCurPos = NPC_DUA_2_TbPos;
            elseif nIndexStart == 3 then
                tbCurPos = NPC_DUA_3_TbPos;
            elseif nIndexStart == 4 then
                tbCurPos = NPC_DUA_4_TbPos;
            elseif nIndexStart == 5 then
                tbCurPos = NPC_DUA_5_TbPos;
            end
        
            local tbPos = tbCurPos[nPosId];  

            if is_arrive_at(nNpcIndex, tbPos[1], tbPos[2]) then
                NpcWalk(nNpcIndex, NPC_DUA_DICH_TbPos[nIndexStart][1],  NPC_DUA_DICH_TbPos[nIndexStart][2]);
                processUpdateKetQuaNpcDua(nNpcIndex, nIndexStart, startTime, 1);
                SetNpcParam(nNpcIndex, %DN_NPC_IsCompleted, 1); 
                curRank = processGetRank(nIndexStart, startTime);
                SetNpcParam(nNpcIndex, %DN_NPC_Rank, curRank);
            end
            NpcChat(nNpcIndex, "VÒ muén H¹ng "..curRank);  
       else
            NpcChat(nNpcIndex, "VÒ tíi §Ých H¹ng "..curRank);
       end      
    elseif isStart == 0 and isRunning == 0 and isAnalyze == 0 then
          DelNpc(nNpcIndex);
       return 0, 0;
    end
      
    return NPC_DUA_TimeTickRun*18, nNpcIndex; 
end

function is_arrive_at(nNpcIndex, nX, nY)
    local nX32, nY32 = GetNpcPos(nNpcIndex);

     local MAX_DIS = 30;
     local nX32, nY32 = GetNpcPos(nNpcIndex)

     if abs(nX*32 - nX32) < MAX_DIS and abs(nY*32 - nY32) < MAX_DIS then
    return 1
     end
end  
  
function mod(a, b)  
    if b ~= 0 and b ~= null then
        return a - floor(a/b)*b;
    end
    return 0;
end
  

function generateNpcPosPlan(nXPos, nYPos)
    local tbPos = {};
    local nXHPos = nXPos;
    local nYHPos = nYPos;
    for j = 1, 128 do      
        nXHPos = nXHPos - 2;
        nYHPos = nYHPos + 2;
   
        if j == 128 then
           nXHPos = nXHPos + (j - 126)*2
           nYHPos = nYHPos - (j - 126)*2
        end
       
        if mod(j, NPC_DUA_Range) == 0 then

           tinsert(tbPos, {nXHPos, nYHPos});
        end
   end
    return tbPos;
end 

