-------------------------------------------------------------------------------------------------------------
--
-- TrinityAdmin Version 3.x
-- TrinityAdmin is a derivative of MangAdmin.
--
-- Copyright (C) 2007 Free Software Foundation, Inc.
-- License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
-- This is free software: you are free to change and redistribute it.
-- There is NO WARRANTY, to the extent permitted by law.
--
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to the Free Software
-- Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
--
-- Official Forums: http://groups.google.com/group/trinityadmin
-- GoogleCode Website: http://code.google.com/p/trinityadmin/
-- Subversion Repository: http://trinityadmin.googlecode.com/svn/
-- Dev Blog: http://trinityadmin.blogspot.com/
-------------------------------------------------------------------------------------------------------------
--Convention:
-- MangAdmin:PrepareScript(*nameofbutton*     , Locale["*tooltiplocalisation*"]   , function() *functionnameandparameters()* end)


function InitControls()
--[[GM Tab]]
  MangAdmin:PrepareScript(ma_displaylevelbutton   , Locale["tt_DisplayAccountLvl"]  , function() DisplayAccountLevel() end)
  MangAdmin:PrepareScript(ma_gmonbutton           , Locale["tt_GMOnButton"]         , function() ToggleGMMode("on") end)
  MangAdmin:PrepareScript(ma_gmoffbutton          , Locale["tt_GMOffButton"]        , function() ToggleGMMode("off") end)
  MangAdmin:PrepareScript(ma_flyonbutton          , Locale["tt_FlyOnButton"]        , function() ToggleFlyMode("on") end)
  MangAdmin:PrepareScript(ma_flyoffbutton         , Locale["tt_FlyOffButton"]       , function() ToggleFlyMode("off") end)
  MangAdmin:PrepareScript(ma_hoveronbutton        , Locale["tt_HoverOnButton"]      , function() ToggleHoverMode(1) end)
  MangAdmin:PrepareScript(ma_hoveroffbutton       , Locale["tt_HoverOffButton"]     , function() ToggleHoverMode(0) end)
  MangAdmin:PrepareScript(ma_whisperonbutton      , Locale["tt_WhispOnButton"]      , function() ToggleWhisper("on") end)
  MangAdmin:PrepareScript(ma_whisperoffbutton     , Locale["tt_WhispOffButton"]     , function() ToggleWhisper("off") end)
  MangAdmin:PrepareScript(ma_invisibleonbutton    , Locale["tt_InvisOnButton"]      , function() ToggleVisible("off") end)
  MangAdmin:PrepareScript(ma_invisibleoffbutton   , Locale["tt_InvisOffButton"]     , function() ToggleVisible("on") end)
  MangAdmin:PrepareScript(ma_taxicheatonbutton    , Locale["tt_TaxiOnButton"]       , function() ToggleTaxicheat("on") end)
  MangAdmin:PrepareScript(ma_taxicheatoffbutton   , Locale["tt_TaxiOffButton"]      , function() ToggleTaxicheat("off") end)
  MangAdmin:PrepareScript(ma_mapsonbutton         , Locale["tt_ShowMapsButton"]     , function() ToggleMaps(1) end)
  MangAdmin:PrepareScript(ma_mapsoffbutton        , Locale["tt_HideMapsButton"]     , function() ToggleMaps(0) end)
  MangAdmin:PrepareScript(ma_instantkillbutton    , Locale["tt_instakill"]          , function() InstantKill() end)
  MangAdmin:PrepareScript(ma_speedslider          , Locale["tt_SpeedSlider"]        , {{"OnMouseUp", function() SetSpeed() end},{"OnValueChanged", function() ma_speedsliderText:SetText(string.format("%.1f", ma_speedslider:GetValue())) end}})
  MangAdmin:PrepareScript(ma_scaleslider          , Locale["tt_ScaleSlider"]        , {{"OnMouseUp", function() SetScale() end},{"OnValueChanged", function() ma_scalesliderText:SetText(string.format("%.1f", ma_scaleslider:GetValue())) end}})  
  MangAdmin:PrepareScript(ma_screenshotbutton     , Locale["tt_ScreenButton"]       , function() Screenie() end)
  MangAdmin:PrepareScript(ma_bankbutton           , Locale["tt_BankButton"]         , function() ShowBank() end)
  MangAdmin:PrepareScript(ma_dismountbutton       , Locale["tt_Dismount"]           , function() DismountPlayer() end)
  MangAdmin:PrepareScript(ma_setjail_a_button     , Locale["tt_SetJail_A_Button"]   , function() SetJail_A() end)
  MangAdmin:PrepareScript(ma_setjail_h_button     , Locale["tt_SetJail_H_Button"]   , function() SetJail_H() end)
  MangAdmin:PrepareScript(ma_gridnaviaheadbutton  , Locale["tt_N"]                  , function() GridNavigate(nil, nil); MangAdmin.db.char.nextGridWay = "north" end)
  MangAdmin:PrepareScript(ma_gridnavibackbutton   , Locale["tt_S"]                  , function() GridNavigate(nil, nil); MangAdmin.db.char.nextGridWay = "south" end)
  MangAdmin:PrepareScript(ma_gridnavirightbutton  , Locale["tt_E"]                  , function() GridNavigate(nil, nil); MangAdmin.db.char.nextGridWay = "east" end)
  MangAdmin:PrepareScript(ma_gridnavileftbutton   , Locale["tt_W"]                  , function() GridNavigate(nil, nil); MangAdmin.db.char.nextGridWay = "west" end)
  -- Speed Slider
  ma_speedslider:SetOrientation("HORIZONTAL")
  ma_speedslider:SetMinMaxValues(1, 10)
  ma_speedslider:SetValueStep(0.1)
  ma_speedslider:SetValue(1)
  ma_speedsliderText:SetText("1.0")
  -- Scale Slider
  ma_scaleslider:SetOrientation("HORIZONTAL")
  ma_scaleslider:SetMinMaxValues(0.1, 3)
  ma_scaleslider:SetValueStep(0.1)
  ma_scaleslider:SetValue(1)
  ma_scalesliderText:SetText("1.0")

--[[Char Tab]]
  InitModelFrame()
  MangAdmin:PrepareScript(ma_modelrotatelbutton   , Locale["tt_RotateLeft"]         , function() ModelRotateLeft() end)
  MangAdmin:PrepareScript(ma_modelrotaterbutton   , Locale["tt_RotateRight"]        , function() ModelRotateRight() end)
  MangAdmin:PrepareScript(ma_killbutton           , Locale["tt_killbutton"]         , function() KillSomething() end)
  MangAdmin:PrepareScript(ma_revivebutton         , Locale["tt_reviveplayer"]       , function() RevivePlayer() end)
  MangAdmin:PrepareScript(ma_savebutton           , Locale["tt_saveplayer"]         , function() SavePlayer() end)
  MangAdmin:PrepareScript(ma_kickbutton           , Locale["tt_KickButton"]         , function() KickPlayer() end)
  MangAdmin:PrepareScript(ma_cooldownbutton       , Locale["tt_CooldownButton"]     , function() Cooldown() end)
  MangAdmin:PrepareScript(ma_guidbutton           , Locale["tt_GUIDButton"]         , function() ShowGUID() end)
  MangAdmin:PrepareScript(ma_pinfobutton          , Locale["tt_PinfoButton"]        , function() Pinfo() end)
  MangAdmin:PrepareScript(ma_distancebutton       , Locale["tt_DistanceButton"]     , function() Distance() end)
  MangAdmin:PrepareScript(ma_recallbutton         , Locale["tt_RecallButton"]       , function() Recall() end)
  MangAdmin:PrepareScript(ma_demorphbutton        , Locale["tt_DemorphButton"]      , function() Demorph() end)
  MangAdmin:PrepareScript(ma_showmapsbutton       , Locale["tt_ShowMapsCharButton"] , function() ToggleMapsChar(1) end)
  MangAdmin:PrepareScript(ma_hidemapsbutton       , Locale["tt_HideMapsCharButton"] , function() ToggleMapsChar(0) end)
  MangAdmin:PrepareScript(ma_gpsbutton            , Locale["tt_GPSButton"]          , function() GPS() end)
  MangAdmin:PrepareScript(ma_learnlangbutton      , Locale["tt_learnlangbutton"]    , function() LearnSpell(UIDropDownMenu_GetSelectedValue(ma_learnlangdropdown)) end)
  MangAdmin:PrepareScript(ma_modifybutton         , Locale["tt_modifybutton"]       , function() Modify(UIDropDownMenu_GetSelectedValue(ma_modifydropdown),ma_modifyeditbox:GetText()) end)
  MangAdmin:PrepareScript(ma_resetbutton          , Locale["tt_resetbutton"]        , function() Reset(UIDropDownMenu_GetSelectedValue(ma_resetdropdown)) end)
  LearnLangDropDownInitialize()
  UIDropDownMenu_Initialize(ma_learnlangdropdown, LearnLangDropDownInitialize)
  UIDropDownMenu_SetWidth(ma_learnlangdropdown,100)
  UIDropDownMenu_SetButtonWidth(ma_learnlangdropdown,20)
  ModifyDropDownInitialize()
  UIDropDownMenu_Initialize(ma_modifydropdown, ModifyDropDownInitialize)
  UIDropDownMenu_SetWidth(ma_modifydropdown, 100)
  UIDropDownMenu_SetButtonWidth(ma_modifydropdown, 20)
  ResetDropDownInitialize()
  UIDropDownMenu_Initialize(ma_resetdropdown, ResetDropDownInitialize)
  UIDropDownMenu_SetWidth(ma_resetdropdown, 100)
  UIDropDownMenu_SetButtonWidth(ma_resetdropdown, 20)
--[[Char2 Tab]]
  MangAdmin:PrepareScript(ma_banbutton            , Locale["tt_banbutton"]          , function() BanButton() end)
  MangAdmin:PrepareScript(ma_gonamebutton         , Locale["tt_gonamebutton"]       , function() GoNameButton() end)
  MangAdmin:PrepareScript(ma_createguildbutton    , Locale["tt_createguildbutton"]  , function() CreateGuildButton() end)
  MangAdmin:PrepareScript(ma_teleaddbutton        , Locale["tt_teleaddbutton"]      , function() TeleAddButton() end)
  MangAdmin:PrepareScript(ma_baninfobutton        , Locale["tt_baninfobutton"]      , function() BanInfoButton() end)
  MangAdmin:PrepareScript(ma_groupgobutton        , Locale["tt_groupgobutton"]      , function() GroupGoButton() end)
  MangAdmin:PrepareScript(ma_guildinvitebutton    , Locale["tt_guildinvitebutton"]  , function() GuildInviteButton() end)
  MangAdmin:PrepareScript(ma_teledelbutton        , Locale["tt_teledelbutton"]      , function() TeleDelButton() end)
  MangAdmin:PrepareScript(ma_banlistbutton        , Locale["tt_banlistbutton"]      , function() BanlistButton() end)
  MangAdmin:PrepareScript(ma_namegobutton         , Locale["tt_namegobutton"]       , function() NameGoButton() end)
  MangAdmin:PrepareScript(ma_guildrankbutton      , Locale["tt_guildrankbutton"]    , function() GuildRankButton() end)
  MangAdmin:PrepareScript(ma_telegroupbutton      , Locale["tt_telegroupbutton"]    , function() TeleGroupButton() end)
  MangAdmin:PrepareScript(ma_unbanbutton          , Locale["tt_unbanbutton"]        , function() UnBanButton() end)
  MangAdmin:PrepareScript(ma_guilddeletebutton    , Locale["tt_guilddeletebutton"]  , function() GuildDeleteButton() end)
  MangAdmin:PrepareScript(ma_guilduninvitebutton  , Locale["tt_guilduninvitebutton"], function() GuildUninviteButton() end)
  MangAdmin:PrepareScript(ma_telenamebutton       , Locale["tt_telenamebutton"]     , function() TeleNameButton() end)
  MangAdmin:PrepareScript(ma_mutebutton           , Locale["tt_mutebutton"]         , function() MuteButton() end)
  MangAdmin:PrepareScript(ma_charmorphbutton      , Locale["tt_charmorphbutton"]    , function() CharMorphButton() end)
  MangAdmin:PrepareScript(ma_charaurabutton       , Locale["tt_charaurabutton"]     , function() CharAuraButton() end)
  MangAdmin:PrepareScript(ma_charunaurabutton     , Locale["tt_charunaurabutton"]   , function() CharUnAuraButton() end)
  MangAdmin:PrepareScript(ma_jailabutton          , Locale["tt_JailAButton"]        , function() JailA() end)
  MangAdmin:PrepareScript(ma_jailhbutton          , Locale["tt_JailHButton"]        , function() JailH() end)
  MangAdmin:PrepareScript(ma_unjailbutton         , Locale["tt_UnJailButton"]       , function() UnJail() end)
  MangAdmin:PrepareScript(ma_unmutebutton         , Locale["tt_UnMuteButton"]       , function() UnMuteButton() end) 
  MangAdmin:PrepareScript(ma_questaddbutton       , Locale["tt_QuestAddButton"]     , function() QuestAddButton() end) 
  MangAdmin:PrepareScript(ma_questcompletebutton  , Locale["tt_QuestCompleteButton"], function() QuestCompleteButton() end) 
  MangAdmin:PrepareScript(ma_questremovebutton    , Locale["tt_QuestRemoveButton"]  , function() QuestRemoveButton() end) 
  MangAdmin:PrepareScript(ma_damagebutton         , Locale["tt_DamageButton"]       , function() DamageButton() end) 
  MangAdmin:PrepareScript(ma_hideareabutton       , Locale["tt_HideAreaButton"]     , function() HideAreaButton() end) 
  MangAdmin:PrepareScript(ma_showareabutton       , Locale["tt_ShowAreaButton"]     , function() ShowAreaButton() end) 
  MangAdmin:PrepareScript(ma_honoraddbutton       , Locale["tt_HonorAddButton"]     , function() HonorAddButton() end) 
  MangAdmin:PrepareScript(ma_honorupdatebutton    , Locale["tt_HonorUpdateButton"]  , function() HonorUpdateButton() end) 

--[[NPC Tab]]
  InitModelFrameNPC()
  MangAdmin:PrepareScript(ma_npcmodelrotatelbutton, Locale["tt_NPCRotateLeft"]      , function() NpcModelRotateLeft() end)
  MangAdmin:PrepareScript(ma_npcmodelrotaterbutton, Locale["tt_NPCRotateRight"]     , function() NpcModelRotateRight() end)
  MangAdmin:PrepareScript(ma_npckillbutton        , Locale["tt_NPCKillButton"]      , function() NPCKillSomething() end)
  MangAdmin:PrepareScript(ma_respawnbutton        , Locale["tt_npcrespawn"]         , function() Respawn() end)
  MangAdmin:PrepareScript(ma_npcdistancebutton    , Locale["tt_NPCDistanceButton"]  , function() NPCDistance() end)
  MangAdmin:PrepareScript(ma_way_showonbutton     , Locale["tt_WayShow1"]           , function() WayShowOn() end)
  MangAdmin:PrepareScript(ma_npcguidbutton        , Locale["tt_NPCGUIDButton"]      , function() NPCShowGUID() end)
  MangAdmin:PrepareScript(ma_npcinfobutton        , Locale["tt_NPCInfoButton"]      , function() NPCInfo() end)
  MangAdmin:PrepareScript(ma_npcdemorphbutton     , Locale["tt_NPCDemorph"]         , function() NPCDemorph() end)
  MangAdmin:PrepareScript(ma_way_showoffbutton    , Locale["tt_WayShow0"]           , function() WayShowOff() end)
  MangAdmin:PrepareScript(ma_movestackbutton      , Locale["tt_MoveStackButton"]    , function() ShowMove() end)
  MangAdmin:PrepareScript(ma_npcfreezebutton      , Locale["tt_NPCFreezeButton"]    , function() NPCFreeze() end)
  MangAdmin:PrepareScript(ma_npcfreezedelbutton   , Locale["tt_NPCFreezeDelButton"] , function() NPCFreezeDEL() end)
  MangAdmin:PrepareScript(ma_way_modifyaddbutton  , Locale["tt_WayMAdd"]            , function() WayModifyAdd() end)
  MangAdmin:PrepareScript(ma_npcunfreeze_randombutton , Locale["tt_NPCUnFreeze_RandomButton"]  , function() NPCUnFreeze_Random() end)
  MangAdmin:PrepareScript(ma_npcunfreeze_waybutton, Locale["tt_NPCUnFreeze_WayButton"], function() NPCUnFreeze_Way() end)
  MangAdmin:PrepareScript(ma_npcmovebutton        , Locale["tt_NPCMove"]            , function() NPCMove() end)
  MangAdmin:PrepareScript(ma_way_modifydelbutton  , Locale["tt_WayModifyDel"]       , function() WayModifyDel() end)
  MangAdmin:PrepareScript(ma_way_endaddbutton     , Locale["tt_WayEndAdd"]          , function() WayEndAdd() end)
  MangAdmin:PrepareScript(ma_npcunfreeze_addwaybutton , Locale["tt_NPCAddWay"]      , function() NPCAdd_Way() end)
  MangAdmin:PrepareScript(ma_npcunfreeze_addway_showonbutton , Locale["tt_NPCAdd_WayShowOn"] , function() NPCAdd_WayShowOn() end)
  MangAdmin:PrepareScript(ma_npcdelbutton         , Locale["tt_NPCDel"]             , function() NPCDel() end)
  MangAdmin:PrepareScript(ma_NPC_guidgetbutton    , Locale["tt_getguid"]            , function() NPC_GUID_Get() end)
  MangAdmin:PrepareScript(ma_NPC_addbutton        , Locale["tt_NPCAdd"]             , function() NPC_Add() end)
  MangAdmin:PrepareScript(ma_npcgobutton          , Locale["tt_NPCGo"]              , function() NPCGo() end)
  MangAdmin:PrepareScript(ma_npcmorphbutton       , Locale["tt_NPCMorph"]           , function() NPCMorph() end)
  MangAdmin:PrepareScript(ma_npcsaybutton         , Locale["tt_NPCSay"]             , function() NPCSay() end)
  MangAdmin:PrepareScript(ma_npcyellbutton        , Locale["tt_NPCYell"]            , function() NPCYell() end)
  MangAdmin:PrepareScript(ma_npcaurabutton        ,  Locale["tt_NPCAura"]           , function() NPCAura() end)
  MangAdmin:PrepareScript(ma_npcunaurabutton      , Locale["tt_NPCUnaura"]          , function() NPCUnaura() end)
  MangAdmin:PrepareScript(ma_npcemotebutton       , Locale["tt_PlayEmote"]          , function() NpcEmote(UIDropDownMenu_GetSelectedValue(ma_npcemotedropdown)) end)
  MangAdmin:PrepareScript(ma_npcemotebutton_a     , Locale["tt_PlayEmote"]          , function() NpcEmote(UIDropDownMenu_GetSelectedValue(ma_npcemotedropdown_a)) end)

--[[Gob Tab]]
  MangAdmin:PrepareScript(ma_objgobutton          , Locale["tt_ObjGo"]              , function() OBJGo() end)
  MangAdmin:PrepareScript(ma_objaddbutton         , Locale["tt_ObjAdd"]             , function() OBJAdd() end)
  MangAdmin:PrepareScript(ma_objmovebutton        , Locale["tt_ObjMove"]            , function() OBJMove() end)
  MangAdmin:PrepareScript(ma_objturnbutton        , Locale["tt_ObjTurn"]            , function() OBJTurn() end)
  MangAdmin:PrepareScript(ma_objdelbutton         , Locale["tt_ObjDel"]             , function() OBJDel() end)
  MangAdmin:PrepareScript(ma_objnearbutton        , Locale["tt_ObjNear"]            , function() OBJNear() end)
  MangAdmin:PrepareScript(ma_objtargetbutton      , Locale["tt_ObjTarget"]          , function() OBJTarget() end)

--[[Tele Tab]]
--[[Tickets Tab]]
--[[Misc Tab]]
--[[Server Tab]]
--[[Log Tab]]

end