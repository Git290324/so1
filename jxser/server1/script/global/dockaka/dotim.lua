Include("\\script\\dailogsys\\dailogsay.lua");
Include("\\script\\global\\jingli.lua")

tbBuyMagic = {
    [1] = { --? khU
    --T�n option, Op hi�n l� 1 �n l� 0, ng? h�nh 99 l� kh�ng ca v� option hi�n, 126 l� ID option, s� 10 � cu�i l� MAGATTRLVL_END trong magicattriblevel_index. D�ng cho �� tUm, option max
    {"S�t th*�ng v�t lu ngo�i c�ng (%)",1,99,126,10},
    {"T� l� c�ng k?ch ch?nh x�c",1,99,166,20},
    {"T�c �� ��nh ngo�i c�ng",1,99,115,30},
    {"B� qua n? tr�nh",1,99,58,40},
    {"H�t sinh l�c",1,99,136,130},
    {"H�t n�i l�c",1,99,137,140},
    {"Sinh l�c",1,99,85,150},
    {"N�i l�c",1,99,89,160},
    --T�n option. Option �n l� 0, ng? h�nh 0 l� Kim, ID option 121
    {"STVL ngo�i c�ng �i�m (Kim)",0,0,121,220},
    {"��c s�t ngo�i c�ng (M�c)",0,1,125,230},
    {"B�ng s�t ngo�i c�ng(Th�y)",0,2,123,240},
    --{"H�a s�t ngo�i c�ng(H�a)",0,3,122},
    --{"L�i s�t ngo�i c�ng(Th�)",0,4,124},
    {"Kh�ng ��c (Kim)",0,0,101,290},
    {"Kh�ng b�ng (Th�)",0,4,105,300},
    {"Kh�ng h�a (Th�y)",0,2,102,310},
    {"Kh�ng l�i (M�c)",0,1,103,320},
    {"Th�i gian cho�ng (Th�y)",0,2,110,340},
    {"Th�i gian l�m ch�m (H�a)",0,3,106,360},
    {"Th�i gian tr�ng ��c (Th�)",0,4,108,380},
    {"STVL n�i c�ng (Kim)",0,0,168,440},
    {"B�ng s�t n�i c�ng (Th�y)",0,2,169,450},
    {"H�a s�t n�i c�ng (H�a)",0,3,170,460},
    {"L�i s�t n�i c�ng (Th�)",0,4,171,470},
    {"��c s�t n�i c�ng (M�c)",0,1,172,480},
    },
    [2] = { --trang b~ kh�c
    --{"OptionName",a,b,c,d,e},
    --OptionName : T�n option, t�n n�o c?ng �*�c ch� �� hi�n th~ th�i
    --a : 0 - Option �n 1-Option hi�n
    --b : Ng? h�nh, 0-Kim 1-M�c 2-Th�y 3-H�a 4-Th� 99-Kh�ng ng? h�nh
    --c : ID Option trong magicattriblevel ho�c magicattriblevel_index
    --d : L� MAGATTRLVL_END trong magicattriblevel_index
    --f : 5-Option ch� ca gi�y 2-Ch� ca �o 99-Lo�i g� c?ng ca
    {"T�c �� di chuy�n (Gi�y)",1,99,111,70,{5}}, --Ch� gi�y m�i ca
    {"Ph�n ��n v�t l? (�o)",1,99,117,80,{2}}, --�o
    {"Th�i gian ph�c h�i (�o)",1,99,113,90,{2}}, --ch� �o
    {"Sinh l�c",1,99,85,150,{2,5,6,7,8}},
    {"N�i l�c",1,99,89,160,{2,5,6,7,8}},
    {"Ph�c h�i sinh l�c",1,99,88,180,{2,5,6,7,8}},
    {"Chuy�n ho� s�t th��ng th�nh n�i l�c (Kim)",0,0,134,270,{2,5,6,7,8}},
    {"Ph�ng th� v�t lu (H�a)",0,3,104,280,{2,5,6,7,8}},
    {"Kh�ng ��c (Kim)",0,0,101,290,{2,5,6,7,8}},
    {"Kh�ng b�ng (Th�)",0,4,105,300,{2,5,6,7,8}},
    {"Kh�ng h�a (Th�y)",0,2,102,310,{2,5,6,7,8}},
    {"Kh�ng l�i (M�c)",0,1,103,320,{2,5,6,7,8}},
    {"Th�i gian cho�ng (Th�y)",0,2,110,340,{2,5,6,7,8}},
    {"Th�i gian l�m ch�m (H�a)",0,3,106,360,{2,5,6,7,8}},
    {"Th�n ph�p (H�a)",0,3,98,370,{2,5,6,7,8}},
    {"Th�i gian tr�ng ��c (Th�)",0,4,108,380,{2,5,6,7,8}},
    },
}
function main()
dofile("script/00ff/npc/thuongnhantayvuc.lua")
    local tab_Content = {
        "Mua ph�i trang b? t?m./BuyMagicType", --Voa l� ph�i voa l� v�t ph�m cho Q D� T�u
        "Mua trang b? t?m./dotim", --Mua �� xong l� kh�m n�m xong r�i
        "K?t th�c ��i tho�i./Quit"
    }
    Say("<enter>C�c trang b? xanh, ta ph�n ph�t mi�n ph?.<enter>? ��i hi�p n�y mu�n mua g� ? ", getn(tab_Content), tab_Content);
end
function BuyMagicType()
    local tb = {
    "<dec><npc>Ta c? m�t ?t trang b? xanh v�i c�c t?nh n�ng c? s�n, ch�ng hay ng��i c? mu�n mua hay kh�ng ? Ta b�n 500 v�n ll��ng 1 m?n m� th�i.",
    "Cho ta mua ph�i ? khU./#BuyMagicType1(1)", --1 l� ? khU
    "Cho ta mua ph�i trang b� kh�c./#BuyMagicType1(2)", --2 l� qu�n �o gi�y ? �ai l*ng g�ng tay
    "Quay l�i.",
    "Tho�t./Quit",
    }
    CreateTaskSay(tb)
end
function BuyMagicType1(ID)
    local tb = {
    "<dec><npc>Ta ca m�t �t trang b� xanh, c�c t�nh n�ng ca s�n . Ng*�i ca mu�n mua kh�ng?.",
    "Mua ph�i d�ng 1./#BuyMagicType2("..ID..",1)",
    "Mua ph�i d�ng 2./#BuyMagicType2("..ID..",2)",
    "Mua ph�i d�ng 3./#BuyMagicType2("..ID..",3)",
    "Mua ph�i d�ng 4./#BuyMagicType2("..ID..",4)",
    "Mua ph�i d�ng 5./#BuyMagicType2("..ID..",5)",
    "Mua ph�i d�ng 6./#BuyMagicType2("..ID..",6)",
    "Quay l�i./main",
    "Tho�t./Quit",
    }
    CreateTaskSay(tb)
end
function BuyMagicType2(ID1,ID2)
    --ID1 l� 1 l� ? khU, 2 l� th� c�n l�i nh* �o m? gi�y.....
    --ID2 l� s� d�ng to 1 �On 6. 1 item t�i �a 6 d�ng
    if ID2 == 1 or ID2 == 3 or ID2 == 5 then --��y l� nh�ng d�ng hi�n, kh�ng y�u c�u ng? h�nh
        local tb = {
        "<dec><npc>H�y l�a ch�n tUnh n�ng m� ng*�i mu�n.",
        }
        for i=1,getn(tbBuyMagic[ID1]) do
            if tbBuyMagic[ID1][i][2] == 1 then
                tinsert(tb,tbBuyMagic[ID1][i][1].."/#BuyMagicType3("..ID2..","..tbBuyMagic[ID1][i][4]..","..ID1..","..tbBuyMagic[ID1][i][3]..")")
            end
        end
        tinsert(tb,"Tho�t./Quit")
        CreateTaskSay(tb)
    else --B�y gi� t�c l� ID2 = 2 4 6 c�c d�ng �n, c�c d�ng n�y s� c�n ca ng? h�nh.
        local tb = {
        "<dec><npc>H�y l�a ch�n tUnh n�ng m� ng*�i mu�n."
        }
        for i=1,getn(tbBuyMagic[ID1]) do
            if tbBuyMagic[ID1][i][2] == 0 then
                tinsert(tb,tbBuyMagic[ID1][i][1].."/#BuyMagicType3("..ID2..","..tbBuyMagic[ID1][i][4]..","..ID1..","..tbBuyMagic[ID1][i][3]..")")
            end
        end
        tinsert(tb,"Tho�t./Quit")
        CreateTaskSay(tb)
    end
end
function BuyMagicType3(Op1,Op2,Op3,Op4)
    --Op1 l� l�a ch�n d�ng m�y
    --Op 2 l� ID option
    --Op3 l� l�a ch�n ? khU hay qu�n �o to BuyMagicType()
    --Op4 l� ng? h�nh, nOu l� 99 th� ko ca ng? h�nh
    if Op3 == 1 then --L�a ch�n ? khU
        if Op4 == 99 then --Kh�ng ca ng? h�nh t�c c�c d�ng hi�n
            local magictype1, p1
            while    magictype1~=Op2 do
                local Item = AddItem(0,1,0,10,0,100,10)
                magictype1, p1 = GetItemMagicAttrib(Item,Op1)
                if magictype1 ~= Op2 then
                    RemoveItemByIndex(Item)
                end
            end
        else --L�c n�y Op4 kh�c 99 t�c c�c option �n
            local magictype2, p2
            while    magictype2~=Op2 do
                local Item = AddItem(0,1,0,10,Op4,100,10)
                magictype2, p2 = GetItemMagicAttrib(Item,Op1)
                if magictype2 ~= Op2 then
                    RemoveItemByIndex(Item)
                end
            end
        end
    else --NOu l�a ch�n qu�n �o
        if Op2 == 111 then --T�c ch�y ch� gi�y m�i ca
            a,b,c = 0,5,0
        elseif Op2 == 117 or Op2 == 113 then --Ch� ca � �o, ph�c h�i v� ph�n ��n
            a,b,c = 0,2,1
        else
            a,b,c = 0,6,0
        end
        if Op4 == 99 then --kh�ng ca ng? h�nh
            local magictype, p
            while    magictype~=Op2 do
                local Item = AddItem(a,b,c,10,0,100,10)
                magictype, p = GetItemMagicAttrib(Item,Op1)
                if magictype ~= Op2 then
                    RemoveItemByIndex(Item)
                end
            end
        else
            local magictype, p
            while    magictype~=Op2 do
                local Item = AddItem(a,b,c,10,Op4,100,10)
                magictype, p = GetItemMagicAttrib(Item,Op1)
                if magictype ~= Op2 then
                    RemoveItemByIndex(Item)
                end
            end
        end
    end
end  