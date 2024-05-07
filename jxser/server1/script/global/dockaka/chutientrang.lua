function main()
        dofile("script/global/dockaka/chutientrang.lua");
        Say("¤ng ch? tiÒn trang:  V? thiÕu hiÖp kia cÇn l·o phu gióp g?? ",3,
                                                                      "ta muon doi lay vang knb/doivang",
                                                                      "ta muon doi lay tien vang tienvang/doitien",
                                                                      "Ta ch?gh?qua th«i./no"
)
end

function  doivang()
              if (CalcEquiproomItemCount( 6, 1, 3037, 0 ) >= 100 ) then
                         AddItem(4,343,1,0,0,0,0)
                         ConsumeEquiproomItem(100,6,1,3037,-1)
                         Msg2Player("<color=green> nhan thanh cong.ban nhan duoc 1 KNB<color>")
              else
                        Talk(1,'""," cai gi do <enter>chuc mung nguoi")

end
end

function  doitien()
              if (CalcEquiproomItemCount( 6, 1, 3037, 0 ) >= 100 ) then
                         Earn(50000)
                         ConsumeEquiproomItem(100,6,1,3037,-1)
                         Msg2Player("<color=green> nhan thanh cong.ban nhan duoc 50 van<color>")
              else
                        Talk(1,'""," cai gi do <enter>chuc mung nguoi")

end
end