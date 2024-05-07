Include("\\script\\activitysys\\config\\1032\\head.lua")
Include("\\script\\activitysys\\config\\1032\\config.lua")
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\misc\\taskmanager.lua")
pActivity.tbConfig = tbConfig
pActivity:InitTaskGroup()
G_ACTIVITY:AddActivity(pActivity)
