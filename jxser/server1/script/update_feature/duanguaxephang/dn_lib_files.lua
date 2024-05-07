function DNFiles_TableFromFile(filePath, strFileName, tbPattern)  
    local tbResult = {}
    local file = openfile(filePath..strFileName, "r")
    if file == nil then
        return nil
    end    

    temp = read(file, "*l") 
    local tbTemp = {}
    while tbTemp  do      
        tbTemp = pack(read(file, unpack(tbPattern)))
        if tbTemp and tbTemp[1] then
            tinsert(tbResult, tbTemp)
        else
            break           
        end
    end
    closefile(file) 
    return tbResult
end


function DNFiles_TableSaveFile(filePath, strFileName, strMode, tbData)  
    local file = openfile(filePath..strFileName, strMode)
    if file == nil then
        execute(format("mkdir -p %s", filePath))
        file = openfile(filePath..strFileName, strMode)
    end
    if type(tbData[1]) == "table" then      
        for row = 1, getn(tbData) do
            for col = 1, getn(tbData[row]) do
                if col == getn(tbData[row]) then		      
                    write(file, tbData[row][col],"\n")
                else		     
                    write(file, tbData[row][col], "\t")
                end
            end
        end
    else        
        for i = 1, getn(tbData) do
            if i == getn(tbData) then
                write(file, tbData[i], "\n")
            else
                write(file, tbData[i], "\t")
            end
        end
    end 
    closefile(file)
end

function DNFiles_DefaultFile(filePath, strFileName)  
    local file =  openfile(filePath..strFileName, "w");
    if file == nil then
        execute(format("mkdir -p %s", filePath))
        file = openfile(filePath..strFileName, "w");    
	 closefile(file);     
    end
   
end


function DNFiles_TableSaveFileDefault(filePath, strFileName, strMode, tbHeader, tbData)  

    local file = openfile(filePath..strFileName, "r");
    local isNeedWriteHeader = 0;
    if file ==  nil then
        isNeedWriteHeader = 1;
    end

    file = openfile(filePath..strFileName, strMode);
    if file == nil then
        execute(format("mkdir -p %s", filePath))
        file = openfile(filePath..strFileName, strMode)         
    end
    
    if isNeedWriteHeader == 1 and tbHeader ~= nil then
        if type(tbHeader[1]) == "table" then
        for row = 1, getn(tbHeader) do
            for col = 1, getn(tbHeader[row]) do
                if col == getn(tbHeader[row]) then
                    write(file, tbHeader[row][col],"\n")
                else
                    write(file, tbHeader[row][col], "\t")
                end
            end
        end
        else
            for i = 1, getn(tbHeader) do
                if i == getn(tbHeader) then
                    write(file, tbHeader[i], "\n")
                else
                    write(file, tbHeader[i], "\t")
                end
            end
        end 
    end
    
    if type(tbData[1]) == "table" then
        for row = 1, getn(tbData) do
            for col = 1, getn(tbData[row]) do
                if col == getn(tbData[row]) then
                    write(file, tbData[row][col],"\n")
                else
                    write(file, tbData[row][col], "\t")
                end
            end
        end
    else
        for i = 1, getn(tbData) do
            if i == getn(tbData) then
                write(file, tbData[i], "\n")
            else
                write(file, tbData[i], "\t")
            end
        end
    end 
    closefile(file)
end

function DNFiles_DuaNguaFromFile(sFilePath, sFileName, tbPattern, sTitle)
    local tbResult = {}
    local file = openfile(sFilePath..sFileName, "r")
    if file == nil then
        print(format("Read file %s%s is null", sFilePath, sFileName));
        return nil
    end    

    local temp = read(file, "*l") 
    local tbTemp = {}
    local isReadFlag = 0;
    local index = strfind(temp, sTitle , 1);

    if(index == 2) then
        if  temp == sTitle then
            isReadFlag = 1;
        end
    end

    while tbTemp  do 
        if isReadFlag == 1 then
            tbTemp = pack(read(file, unpack(tbPattern)))
            if tbTemp and tbTemp[1] then
		  local index = strfind(tbTemp[1], sTitle, 1);
    		  if(index == 2) then
        	  	if  tbTemp[1] ~= sTitle then
                    		break
                	end
                end
                tinsert(tbResult, tbTemp)
            else
                break           
            end
        else
            temp  = read(file, "*l"); 
            if index == 2 then
                if isReadFlag == 1 and temp ~=  sTitle then                  
                    break;
                elseif temp == sTitle then
                    isReadFlag = 1;
                end     
            end
        end
    end

    closefile(file)
    return tbResult
end