Include("\\script\\dailogsys\\dailogsay.lua");
Include("\\script\\global\\jingli.lua")

tbBuyMagic = {
    [1] = { --? khU
    --Tªn option, Op hiÖn lµ 1 Èn lµ 0, ng? hµnh 99 lµ kh«ng ca v× option hiÖn, 126 lµ ID option, sè 10 ë cuèi lµ MAGATTRLVL_END trong magicattriblevel_index. Dïng cho ®å tUm, option max
    {"S¸t th*¬ng vËt lu ngo¹i c«ng (%)",1,99,126,10},
    {"Tû lÖ c«ng k?ch ch?nh x¸c",1,99,166,20},
    {"Tèc ®é ®¸nh ngo¹i c«ng",1,99,115,30},
    {"Bá qua n? tr¸nh",1,99,58,40},
    {"Hót sinh lùc",1,99,136,130},
    {"Hót néi lùc",1,99,137,140},
    {"Sinh lùc",1,99,85,150},
    {"Néi lùc",1,99,89,160},
    --Tªn option. Option Èn lµ 0, ng? hµnh 0 lµ Kim, ID option 121
    {"STVL ngo¹i c«ng ®iÓm (Kim)",0,0,121,220},
    {"§éc s¸t ngo¹i c«ng (Méc)",0,1,125,230},
    {"B¨ng s¸t ngo¹i c«ng(Thñy)",0,2,123,240},
    --{"Háa s¸t ngo¹i c«ng(Háa)",0,3,122},
    --{"L«i s¸t ngo¹i c«ng(Thæ)",0,4,124},
    {"Kh¸ng ®éc (Kim)",0,0,101,290},
    {"Kh¸ng b¨ng (Thæ)",0,4,105,300},
    {"Kh¸ng háa (Thñy)",0,2,102,310},
    {"Kh¸ng l«i (Méc)",0,1,103,320},
    {"Thêi gian cho¸ng (Thñy)",0,2,110,340},
    {"Thêi gian lµm chËm (Háa)",0,3,106,360},
    {"Thêi gian tróng ®éc (Thæ)",0,4,108,380},
    {"STVL néi c«ng (Kim)",0,0,168,440},
    {"B¨ng s¸t néi c«ng (Thñy)",0,2,169,450},
    {"Háa s¸t néi c«ng (Háa)",0,3,170,460},
    {"L«i s¸t néi c«ng (Thæ)",0,4,171,470},
    {"§éc s¸t néi c«ng (Méc)",0,1,172,480},
    },
    [2] = { --trang b~ kh¸c
    --{"OptionName",a,b,c,d,e},
    --OptionName : Tªn option, tªn nµo c?ng ®*îc chØ ®Ó hiÓn th~ th«i
    --a : 0 - Option Èn 1-Option hiÖn
    --b : Ng? hµnh, 0-Kim 1-Méc 2-Thñy 3-Háa 4-Thæ 99-Kh«ng ng? hµnh
    --c : ID Option trong magicattriblevel hoÆc magicattriblevel_index
    --d : Lµ MAGATTRLVL_END trong magicattriblevel_index
    --f : 5-Option chØ ca giÇy 2-ChØ ca ¸o 99-Lo¹i g× c?ng ca
    {"Tèc ®é di chuyÓn (GiÇy)",1,99,111,70,{5}}, --ChØ giÇy míi ca
    {"Ph¶n ®ßn vËt l? (¸o)",1,99,117,80,{2}}, --¸o
    {"Thêi gian phôc håi (¸o)",1,99,113,90,{2}}, --chØ ¸o
    {"Sinh lùc",1,99,85,150,{2,5,6,7,8}},
    {"Néi lùc",1,99,89,160,{2,5,6,7,8}},
    {"Phôc håi sinh lùc",1,99,88,180,{2,5,6,7,8}},
    {"ChuyÓn ho¶ s¸t th­¬ng thµnh néi lùc (Kim)",0,0,134,270,{2,5,6,7,8}},
    {"Phßng thñ vËt lu (Háa)",0,3,104,280,{2,5,6,7,8}},
    {"Kh¸ng ®éc (Kim)",0,0,101,290,{2,5,6,7,8}},
    {"Kh¸ng b¨ng (Thæ)",0,4,105,300,{2,5,6,7,8}},
    {"Kh¸ng háa (Thñy)",0,2,102,310,{2,5,6,7,8}},
    {"Kh¸ng l«i (Méc)",0,1,103,320,{2,5,6,7,8}},
    {"Thêi gian cho¸ng (Thñy)",0,2,110,340,{2,5,6,7,8}},
    {"Thêi gian lµm chËm (Háa)",0,3,106,360,{2,5,6,7,8}},
    {"Th©n ph¸p (Háa)",0,3,98,370,{2,5,6,7,8}},
    {"Thêi gian tróng ®éc (Thæ)",0,4,108,380,{2,5,6,7,8}},
    },
}
function main()
dofile("script/00ff/npc/thuongnhantayvuc.lua")
    local tab_Content = {
        "Mua ph«i trang b? t?m./BuyMagicType", --Voa lµ ph«i voa lµ vËt phÈm cho Q D· TÈu
        "Mua trang b? t?m./dotim", --Mua ®å xong lµ kh¶m n¹m xong råi
        "K?t thóc ®èi tho¹i./Quit"
    }
    Say("<enter>C¸c trang b? xanh, ta ph©n ph¸t miÔn ph?.<enter>? ®¹i hiÖp nµy muèn mua g× ? ", getn(tab_Content), tab_Content);
end
function BuyMagicType()
    local tb = {
    "<dec><npc>Ta c? mét ?t trang b? xanh víi c¸c t?nh n¨ng c? s½n, ch¼ng hay ng­¬i c? muèn mua hay kh«ng ? Ta b¸n 500 v¹n ll­îng 1 m?n mµ th«i.",
    "Cho ta mua ph«i ? khU./#BuyMagicType1(1)", --1 lµ ? khU
    "Cho ta mua ph«i trang bÞ kh¸c./#BuyMagicType1(2)", --2 lµ quÇn ¸o giÇy ? ®ai l*ng g¨ng tay
    "Quay l¹i.",
    "Tho¸t./Quit",
    }
    CreateTaskSay(tb)
end
function BuyMagicType1(ID)
    local tb = {
    "<dec><npc>Ta ca mét Ýt trang bÞ xanh, c¸c tÝnh n¨ng ca s½n . Ng*¬i ca muèn mua kh«ng?.",
    "Mua ph«i dßng 1./#BuyMagicType2("..ID..",1)",
    "Mua ph«i dßng 2./#BuyMagicType2("..ID..",2)",
    "Mua ph«i dßng 3./#BuyMagicType2("..ID..",3)",
    "Mua ph«i dßng 4./#BuyMagicType2("..ID..",4)",
    "Mua ph«i dßng 5./#BuyMagicType2("..ID..",5)",
    "Mua ph«i dßng 6./#BuyMagicType2("..ID..",6)",
    "Quay l¹i./main",
    "Tho¸t./Quit",
    }
    CreateTaskSay(tb)
end
function BuyMagicType2(ID1,ID2)
    --ID1 lµ 1 lµ ? khU, 2 lµ thø cßn l¹i nh* ¸o m? giÇy.....
    --ID2 lµ sè dßng to 1 ®On 6. 1 item tèi ®a 6 dßng
    if ID2 == 1 or ID2 == 3 or ID2 == 5 then --§©y lµ nh÷ng dßng hiÖn, kh«ng yªu cÇu ng? hµnh
        local tb = {
        "<dec><npc>H·y lùa chän tUnh n¨ng mµ ng*¬i muèn.",
        }
        for i=1,getn(tbBuyMagic[ID1]) do
            if tbBuyMagic[ID1][i][2] == 1 then
                tinsert(tb,tbBuyMagic[ID1][i][1].."/#BuyMagicType3("..ID2..","..tbBuyMagic[ID1][i][4]..","..ID1..","..tbBuyMagic[ID1][i][3]..")")
            end
        end
        tinsert(tb,"Tho¸t./Quit")
        CreateTaskSay(tb)
    else --B©y giê tøc lµ ID2 = 2 4 6 c¸c dßng Èn, c¸c dßng nµy sÏ cÇn ca ng? hµnh.
        local tb = {
        "<dec><npc>H·y lùa chän tUnh n¨ng mµ ng*¬i muèn."
        }
        for i=1,getn(tbBuyMagic[ID1]) do
            if tbBuyMagic[ID1][i][2] == 0 then
                tinsert(tb,tbBuyMagic[ID1][i][1].."/#BuyMagicType3("..ID2..","..tbBuyMagic[ID1][i][4]..","..ID1..","..tbBuyMagic[ID1][i][3]..")")
            end
        end
        tinsert(tb,"Tho¸t./Quit")
        CreateTaskSay(tb)
    end
end
function BuyMagicType3(Op1,Op2,Op3,Op4)
    --Op1 lµ lùa chän dßng mÊy
    --Op 2 lµ ID option
    --Op3 lµ lùa chän ? khU hay quÇn ¸o to BuyMagicType()
    --Op4 lµ ng? hµnh, nOu lµ 99 th× ko ca ng? hµnh
    if Op3 == 1 then --Lùa chän ? khU
        if Op4 == 99 then --Kh«ng ca ng? hµnh tøc c¸c dßng hiÖn
            local magictype1, p1
            while    magictype1~=Op2 do
                local Item = AddItem(0,1,0,10,0,100,10)
                magictype1, p1 = GetItemMagicAttrib(Item,Op1)
                if magictype1 ~= Op2 then
                    RemoveItemByIndex(Item)
                end
            end
        else --Lóc nµy Op4 kh¸c 99 tøc c¸c option Èn
            local magictype2, p2
            while    magictype2~=Op2 do
                local Item = AddItem(0,1,0,10,Op4,100,10)
                magictype2, p2 = GetItemMagicAttrib(Item,Op1)
                if magictype2 ~= Op2 then
                    RemoveItemByIndex(Item)
                end
            end
        end
    else --NOu lùa chän quÇn ¸o
        if Op2 == 111 then --Tèc ch¹y chØ giÇy míi ca
            a,b,c = 0,5,0
        elseif Op2 == 117 or Op2 == 113 then --ChØ ca ë ¸o, phôc håi vµ ph¶n ®ßn
            a,b,c = 0,2,1
        else
            a,b,c = 0,6,0
        end
        if Op4 == 99 then --kh«ng ca ng? hµnh
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