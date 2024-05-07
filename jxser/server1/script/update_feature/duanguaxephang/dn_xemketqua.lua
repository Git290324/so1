Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\basic.lua")
Include("\\script\\update_feature\\duanguaxephang\\dn_variables.lua")
Include("\\script\\update_feature\\duanguaxephang\\dn_lib_files.lua")



function showKetQuaTruocDo()    

    local tbKetQuaBauCua = DNFiles_TableFromFile(DN_sFilePath, DN_sFileName_KetQuaLanTruoc, DN_tbPackQuaDuaNguaLanTruoc);
    local nSize = 0;
        

    if tbKetQuaBauCua ~= nil then
        nSize  = getn(tbKetQuaBauCua);
    end

    if nSize > 0 then
        local sDateTime = tbKetQuaBauCua[1][DN_sDateTime]; 
        local sKetQua = tbKetQuaBauCua[1][DN_nKetQua];
        
        local strTitle = format("<npc><color=green>KÕt qu¶ cña vßng ®ua lÇn tr­íc<color>(<color=red>%s<color>) lµ: <color=green>%s<color>",
                        FormatTime2String("%H:%M - %d/%m/%Y", sDateTime), sKetQua);
    
        local tbOpt =
        {       
            {"Quay l¹i", main},
            {"Tho¸t"}
        }
        CreateNewSayEx(strTitle, tbOpt);
    else
        Talk(1, "", format("KÕt qu¶ lÇn tr­íc <color=red>vÉn ch­a cã<color>, %s vui lßng chê <color=green>ho¹t ®éng c«ng bè kÕt qu¶<color>!", getSexTitle()));      
    end 
end

function getSexTitle()
   local sexID = GetSex()
   if sexID == 0 then
       return "§¹i hiÖp";
   else
       return "N÷ hiÖp";
   end
end