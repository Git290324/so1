-- 算命先生.lua 看声望值的算命先生
-- By Dan_Deng(2003-11-11)

sexhead = {"Thi誹 hi謕","N� hi謕"}

Include("\\script\\global\\repute_head.lua")

function main()
	if (GetSex() == 0) then			-- 男女用不同的对话
		Say("V� thi誹 hi謕 n祔 kh� ph竎h b蕋 ph祄!  C� mu鑞 bi誸 tng lai s竛g l筺 c馻 m譶h kh玭g? Ch� c莕 5000 lng! ",2,"Л頲! в ta xem th� /view_repute_yes","Kh玭g c莕 u/no")
	else
		Say("V� n� hi謕 n祔 kh� ph竎h b蕋 ph祄!  C� mu鑞 bi誸 tng lai s竛g l筺 c馻 m譶h kh玭g? Ch� c莕 5000 lng! ",2,"Л頲! в ta xem th� /view_repute_yes","Kh玭g c莕 u/no")
	end
end

function view_repute_yes()
	if (GetCash() < 500) then
		Talk(1,"","l筰 m閠 ngi kh玭g c� ti襫 n鱝, l祄 ph� m蕋 n鯽 ng祔 tr阨")		
		return 0
	end
	Pay(500)
	repute_exp = GetRepute()
	repute_lvl = GetReputeLevel(repute_exp)
	if (repute_lvl == -1) then			-- 出错时
		Talk(1,"","T� c� anh t礽 產 kh� 秈!  Gian nan l� 甶襲 kh� tr竛h kh醝!  Nh� thng xuy猲 v竔 thi猲 th莕 c莡 ph骳 nh�! ")
	elseif (repute_lvl == 0) then
		Talk(2,"","X璦 nay anh h飊g thng kh� 秈, hi謓 gi� ngi 產ng g苝 kh鑞 kh�, th薽 ch� danh v鋘g giang h� c馻 ngi c騨g 產ng c� v蕁 . Xin h穣 甶 g苝 Thi猲 Th莕 c莡 ph骳 甶 ","Danh v鋘g giang h� c馻 ngi hi謓 gi� l� "..repute_exp.."giang h� xem ngi hi謓 gi� l� <color=red> B� T竛h B譶h D﹏ <color> ")
	elseif (repute_lvl == 1) then
		Talk(2,"","Th莕 Long gi� l祄 ngi tr莕 gian. Ngi m芻 d� hi謓 gi� 產ng long 畂ng, nh璶g s� ph竧 tri觧 r蕋 nhanh, ngi tinh � s� ph竧 hi謓 ra ngi l� thi猲 t礽 ","Danh v鋘g giang h� c馻 ngi hi謓 gi� l� "..repute_exp.."giang h� xem ngi hi謓 gi� l� <color=red> ngi m韎 T竔 Xu蕋 giang h� <color> ")
	elseif (repute_lvl == 2) then
		Talk(2,"","X璦 nay Anh h飊g thng kh� 秈, hi謓 gi� ngi 產ng g苝 kh鑞 kh�, th薽 ch� danh v鋘g giang h� c騨g 產ng c� v蕁 . Xin h穣 甶 g苝 th竛h th莕 c莡 ph骳 甶 ","Danh v鋘g giang h� c馻 ngi hi謓 gi� l� "..repute_exp.."giang h� xem ngi hi謓 gi� l� <color=red> V� Danh Ti觰 T鑤 <color> ")
	elseif (repute_lvl == 3) then
		Talk(2,"","X璦 nay Anh h飊g thng kh� 秈, hi謓 gi� ngi 產ng g苝 kh鑞 kh�, th薽 ch� danh v鋘g giang h� c騨g 產ng c� v蕁 . Xin h穣 甶 g苝 th竛h th莕 c莡 ph骳 甶 ","Danh v鋘g giang h� c馻 ngi hi謓 gi� l� "..repute_exp.."giang h� xem ngi hi謓 gi� l� <color=red> M芻 M芻 V� V╪ <color> ")
	elseif (repute_lvl == 4) then
		Talk(2,"","Ngi  c� nhi襲 kinh nghi謒 giang h�. B秐 l躰h  d莕 d莕 th� hi謓, c竎 Anh h飊g hi謕 ngh躠 trong giang h�  d莕 d莕 ch� � n Ngi ","Danh v鋘g giang h� c馻 ngi hi謓 gi� l� "..repute_exp.."giang h� xem ngi hi謓 gi� l� <color=red> S� Hi觧 Phong Mang <color> ")
	elseif (repute_lvl == 5) then
		Talk(2,"","Ngi  c� nhi襲 kinh nghi謒 giang h�. B秐 l躰h  d莕 d莕 th� hi謓, c竎 Anh h飊g hi謕 ngh躠 trong giang h�  d莕 d莕 ch� � n Ngi ","Danh v鋘g giang h� c馻 ngi hi謓 gi� l� "..repute_exp.."giang h� xem ngi hi謓 gi� l� <color=red> Ti觰 H鱱 Danh Kh� <color> ")
	elseif (repute_lvl == 6) then
		Talk(2,"","Ngi  c� nhi襲 kinh nghi謒 giang h�. B秐 l躰h  d莕 d莕 th� hi謓, c竎 Anh h飊g hi謕 ngh躠 trong giang h�  d莕 d莕 ch� � n Ngi ","Danh v鋘g giang h� c馻 ngi hi謓 gi� l� "..repute_exp.."giang h� xem ngi hi謓 gi� l� <color=red> Danh u Hng Lng <color> ")
	elseif (repute_lvl == 7) then
		Talk(2,"","Ngi  c� nhi襲 kinh nghi謒 giang h�. B秐 l躰h  d莕 th� hi謓, c竎 anh h飊g hi謕 ngh躠 trong giang h�  d莕 d莕 ch� � n ngi. ","Danh v鋘g giang h� c馻 ngi hi謓 gi� l� "..repute_exp.."giang h� xem ngi hi謓 gi� l� <color=red> Uy Tr蕁 Nh蕋 phng <color> ")
	elseif (repute_lvl == 8) then
		Talk(2,"","Ngi  c� nhi襲 kinh nghi謒 giang h�. B秐 l躰h  d莕 th� hi謓, c竎 anh h飊g hi謕 ngh躠 trong giang h�  d莕 d莕 ch� � n ngi ","Danh v鋘g giang h� c馻 ngi hi謓 gi� l� "..repute_exp.."giang h� xem ngi hi謓 gi� l� <color=red> Ng筼 Th� Qu莕 H飊g <color> ")
	elseif (repute_lvl == 9) then
		Talk(2,"","Danh v鋘g giang h�  t╪g l猲 t閠 nh, giang h� t玭 ngi l�: Nh蕋 Чi T玭g s�, V� L﹎ Чi Hi謕 ","Danh v鋘g giang h� c馻 ngi hi謓 gi� l� "..repute_exp.."giang h� xem ngi hi謓 gi� l� <color=red> Nh蕋 Чi T玭g S� <color> ")
	else
		Talk(2,"","Ngi  c� nhi襲 kinh nghi謒 giang h�. B秐 l躰h  d莕 d莕 th� hi謓, c竎 anh h飊g hi謕 ngh躠  d莕 d莕 ch� � n ngi ","Danh v鋘g giang h� c馻 ngi hi謓 gi� l� "..repute_exp.."giang h� xem ngi hi謓 gi� l� <color=red> Ti誹 Ng筼 giang h� <color> ")
	end
end

function no()
end
