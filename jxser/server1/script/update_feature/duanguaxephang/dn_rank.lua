Include("\\script\\update_feature\\duanguaxephang\\dn_variables.lua")

function getAllRank(tbResult)
    local tbRank = {}

    for i=1, getn(tbResult) do
        local rank = 0;
        local nNpcDuaRank = tbResult[i][DN_nNpcDuaIndex];
        local nNpcSeries = tbResult[i][DN_nNpcSeries];
        
        if i == 1 then
            rank = i;
        else
           local preTime = tbResult[i-1][DN_sTimeComplete];
           local curTime = tbResult[i][DN_sTimeComplete];
           if preTime ~= curTime then
               rank = tbRank[i-1][DN_Rank_nRank] + 1;
           else
               rank = tbRank[i-1][DN_Rank_nRank];
           end
        end
	print(nNpcDuaRank, nNpcSeries, rank);
       tinsert(tbRank, {nNpcDuaRank, nNpcSeries, rank});
    end
    return tbRank;
end

function getRankOfNpcDuaIndex(nNpcDuaIndex, tbResult)
    local tbRank = {}
    local finalRank = 0;
    for i=1, getn(tbResult) do
        local rank = 0;
        local nNpcDuaRank = tbResult[i][DN_nNpcDuaIndex];
        local nNpcSeries = tbResult[i][DN_nNpcSeries];

        if i == 1 then
            rank = i;
        else
           local preTime = tbResult[i-1][DN_sTimeComplete];
           local curTime = tbResult[i][DN_sTimeComplete];
           if preTime ~= curTime then
               rank = tbRank[i-1][DN_Rank_nRank] + 1;
           else
               rank = tbRank[i-1][DN_Rank_nRank];
           end
        end
       tinsert(tbRank, {i, nNpcSeries, rank});
        if nNpcDuaRank  == nNpcDuaIndex then
            finalRank = rank;
            break;
        end
    end
    return finalRank;
end