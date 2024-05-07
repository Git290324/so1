Include("\\script\\missions\\challengeoftime\\include.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\settings\\trigger_challengeoftime.lua")

function want_playboat_caocap_todoi()
	DynamicExecute("\\settings\\trigger_challengeoftime.lua", "OnTrigger");

	OldSubWorld = SubWorld
	OldPlayer = PlayerIndex
	local totalboat = 0
	local freeboat = 0
	local startboat = 0
	local blevel = 1
	if (IsCaptain() ~= 1) then
		Say("Xin l�i! C�n ph�i l� ��i tr��ng m�i c� t� c�ch b�o danh tham gia 'Nhi�m v� Th�ch th�c th�i gian'",0)
		return
	end
	if (GetTeamSize() < 2) then
		Say("Xin l�i! ��i tham gia 'Nhi�m v� Th�ch th�c th�i gian' c�n ph�i c� �t nh�t <color=red>2<color> ng��i!",0)
		return
	end
	if(GetLevel() < 50) then
		Say("Xin l�i! ��ng c�p d��i 50 kh�ng th� tham gia 'Nhi�m v� Th�ch th�c th�i gian'.",0);
		return
	end
	
	for i = 1, GetTeamSize() do 
		PlayerIndex = GetTeamMember(i)
		local bmbrlevel = 0
		if(GetLevel() < 50) then
			Say("Xin l�i! ��ng c�p d��i 50 kh�ng th� tham gia 'Nhi�m v� Th�ch th�c th�i gian'.",0);
			Msg2Team("Xin l�i! Trong ��i b�n c� th�nh vi�n d��i c�p 50, kh�ng th� tham gia 'Nhi�m v� Th�ch th�c th�i gian'.");
			return
		end
	end
	
	PlayerIndex = OldPlayer
	for i = 1, getn(map_map) do 
		sub = SubWorldID2Idx(map_map[i])
		if (sub >= 0) then
			--print("have "..map_map[i])
			totalboat = totalboat + 1
			SubWorld = sub
			local state = GetMissionV(VARV_STATE)
			if (state > 0) then
				startboat = 1
			end
			if ( state == 1 and GetMSPlayerCount(MISSION_MATCH, 1) == 0 and map_isadvanced[map_map[i]] == blevel) then
				freeboat = freeboat + 1
			end
		end
	end

	local strlevel ="";
	if (blevel == 0) then
		strlevel = "V��t �i (s� c�p -  t� ��i)"
	else
		strlevel = "V��t �i (cao c�p -  t� ��i)"
	end
	
	if (startboat == 1) then
		if (freeboat == 0) then
			Say("Khu v�c n�y"..strlevel.."�� b�t ��u. Kh�ng c�n ch� n�a�.",0)
			return
		else
			Say(""..strlevel.."Y�u c�u : <enter>1 v�n l��ng<enter>1 s�t th� gi�n",2, "Ph�i! Ta mu�n d�n d�t ��i c�a ta tham gia./dragon_join_caocap_todoi", "Kh�ng c�n/onCancel")
			return
		end
	else
		Say("Xin l�i! Khu v�c n�y"..strlevel.."Hi�n t�i kh�ng c� nhi�m v� khi�u chi�n th�i gian �� tham gia. B�o danh v�o  <color=red>��ng m�i ti�ng ��ng h�<color> b�t ��u, l�" .. TIME_SIGNUP .."ph�t, xin h�y l�u � th�ng b�o c�a h� th�ng.",0)
		return
	end
	
end

function dragon_join_caocap_todoi()
	local blevel = 1
	local havesword = 0
	local nNowDate = tonumber(GetLocalDate("%y%m%d"));

	if(GetTask(1551) == nNowDate) then
		if (GetTask(1550) <= 0) then
			Say("Nhi�p Th� Tr�n: H�m nay nhi�m v� th�ch ��u �� l�m h�t r�i, ��i ng�y mai h�y ��n l�i.",0);
			return
		end
	end
	if (IsCaptain() ~= 1) then
		Say("Xin l�i! C�n ph�i l� ��i tr��ng m�i c� t� c�ch b�o danh tham gia 'Nhi�m v� Th�ch th�c th�i gian'",0)
		return
	end
	if(GetLevel() < 50) then
		Say("Xin l�i! ��ng c�p d��i 50 kh�ng th� tham gia 'Nhi�m v� Th�ch th�c th�i gian'.",0);
		return
	end
	if (GetTeamSize() < 2) then
		Say("Xin l�i! ��i tham gia 'Nhi�m v� Th�ch th�c th�i gian' c�n ph�i c� �t nh�t <color=red>2<color> ng��i!",0)
		return
	end
	
	if (GetCash() < 10000) then
		Say("Tham gia nhi�m v� �Th�ch th�c th�i gian� c�n <color=red>1 v�n l��ng<color>. Chu�n b� �� ti�n r�i h�y quay l�i!", 0)
		return
	end
	
	local OldPlayer = PlayerIndex
	
	for i = 1, GetTeamSize() do 
		PlayerIndex = GetTeamMember(i)
		local bmbrlevel = 0
		local MemberNowDate = tonumber(GetLocalDate("%y%m%d"));
		if(GetTask(1551) == MemberNowDate) then
			if(GetTask(1550) <= 0) then
				Say("Nhi�m v� Th�ch th�c th�i gian m�i ng�y ch� ���c tham gia 1 l�n. S� l�n tha gia c�a t� b�n �� ��! Ng�y mai tr� l�i nh�!",0);
				Msg2Team("Nhi�m v� Th�ch th�c th�i gian m�i ng�y ch� ���c tham gia 1 l�n. S� l�n tha gia c�a t� b�n �� ��! Ng�y mai tr� l�i nh�!");
				return
			end
		end
		if(GetLevel() < 50) then
			Say("Xin l�i! ��ng c�p d��i 50 kh�ng th� tham gia 'Nhi�m v� Th�ch th�c th�i gian'.",0);
			Msg2Team("Xin l�i! Trong ��i b�n c� th�nh vi�n d��i c�p 50, kh�ng th� tham gia 'Nhi�m v� Th�ch th�c th�i gian'.");
			return
		end
		
		havesword = CalcEquiproomItemCount( 6, 1, 400, 90 )

		if (havesword < 1 ) then
			Say("Nhi�p Th� Th�n: H�y chu�n b� 1 s�t th� gi�n r�i quay l�i g�p ta",0)
			Msg2Team("Trong t� ��i c�a ng��i c� ng��i kh�ng c� S�t Th� Gi�n , xin  ki�m tra l�i r�i h�y b�o danh tham gia !")
			return
		end
	end
	
	PlayerIndex = OldPlayer
	
	OldSubWorld = SubWorld
	
	for i = 1, getn(map_map) do 
		sub = SubWorldID2Idx(map_map[i])
		if (sub >= 0) then
			SubWorld = sub
			local state = GetMissionV(VARV_STATE)
			if ( state == 1 and GetMSPlayerCount(MISSION_MATCH, 1) == 0 and blevel == map_isadvanced[map_map[i]] ) then
				local tabplayer = {}
				for i = 1, GetTeamSize() do 
					tabplayer[i] = GetTeamMember(i)
				end
				PlayerIndex = tabplayer[1]
				w,x,y = GetWorldPos()
				SetMissionV(VARV_SIGNUP_WORLD, w)
				SetMissionV(VARV_SIGNUP_POSX, x)
				SetMissionV(VARV_SIGNUP_POSY, y)
				SetMissionS(VARS_TEAM_NAME,GetName())
				SetMissionS(VARS_TEAMLEADER_FACTION,GetLastFactionNumber())
				SetMissionS(VARS_TEAMLEADER_GENDER,GetSex())

				Pay(10000)
				
				for i = 1 , getn(tabplayer) do 
					PlayerIndex = tabplayer[i]
					
					ConsumeEquiproomItem( 1, 6, 1, 400, 90)

					w,x,y = GetWorldPos();
					if w==208 then
					else
						local MemberNowDate = tonumber(GetLocalDate("%y%m%d"));
						if(GetTask(1551) ~= MemberNowDate) then
							SetTask(1550,COUNT_LIMIT);  
							SetTask(1551,MemberNowDate);					
						end
						SetTask(1550,GetTask(1550)-1);
						JoinMission(MISSION_MATCH, 1)
					end
					
					G_ACTIVITY:OnMessage("SignUpChuangguan", tabplayer[i], blevel + 1)
					--Ghi log c�c t�nh n�ng key - Modified By DinhHQ - 20120410
					PlayerFunLib:AddTaskDaily(3079, 1)
					if PlayerFunLib:GetTaskDailyCount(3079) > 1 then
						tbLog:PlayerActionLog("TinhNangKey","BaoDanhVuotAiThuPhi")
					else
						tbLog:PlayerActionLog("TinhNangKey","BaoDanhVuotAiMienPhi")
					end
				end
				
				local ndate = tonumber(GetLocalDate("%H"))
				if ndate <= 22 and ndate >= 10 and blevel == 1 then
					SetMissionV(VARV_BATCH_MODEL,1)
				else
					SetMissionV(VARV_BATCH_MODEL,0)
				end
				
				tbLog:PlayerActionLog("EventChienThang042011","BaoDanhVuotAi")-- ������־				
				return
			end
		end
	end
	SubWorld = OldSubWorld
	PlayerIndex = OldPlayer
	local strlevel ="";
	if (blevel == 0) then
		strlevel = "Nhi�m v� Th�ch th�c th�i gian S� c�p "
	else
		strlevel = " 'Nhi�m v� Th�ch th�c th�i gian' Cao c�p "
	end
	Say("Xin l�i! Hi�n t�i khu v�c <color=red>"..strlevel.."<color>�� kh�ng c�n ch�. Xin ��i v�ng sau!",0)
end