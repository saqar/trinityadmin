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

function ModelRotateLeft()
  ma_modelframe.rotation = ma_modelframe.rotation - 0.03
  ma_modelframe:SetRotation(ma_modelframe.rotation)
  PlaySound("igInventoryRotateCharacter")
end

function ModelRotateRight()
  ma_modelframe.rotation = ma_modelframe.rotation + 0.03
  ma_modelframe:SetRotation(ma_modelframe.rotation)
  PlaySound("igInventoryRotateCharacter")
end

function InitModelFrame()
  ma_modelframe:SetScript("OnUpdate", function() MangAdminModelOnUpdate(arg1) end)
  ma_modelframe.rotation = 0.61;
  ma_modelframe:SetRotation(ma_modelframe.rotation)
  ma_modelframe:SetUnit("player")
end


function MangAdminModelOnUpdate(elapsedTime)
  if ( ma_modelrotatelbutton:GetButtonState() == "PUSHED" ) then
    this.rotation = this.rotation + (elapsedTime * 2 * PI * ROTATIONS_PER_SECOND)
    if ( this.rotation < 0 ) then
      this.rotation = this.rotation + (2 * PI)
    end
    this:SetRotation(this.rotation);
  end
  if ( ma_modelrotaterbutton:GetButtonState() == "PUSHED" ) then
    this.rotation = this.rotation - (elapsedTime * 2 * PI * ROTATIONS_PER_SECOND)
    if ( this.rotation > (2 * PI) ) then
      this.rotation = this.rotation - (2 * PI)
    end
    this:SetRotation(this.rotation);
  end
end

function ModelChanged()
  if not MangAdmin:Selection("none") then
    ma_modelframe:SetUnit("target")
  else
    ma_modelframe:SetUnit("player")
  end
  ma_modelframe:RefreshUnit()
end

function KillSomething()
  local target = UnitName("target") or UnitName("player")
  MangAdmin:ChatMsg(".die")
  MangAdmin:LogAction("Killed "..target..".")
end

function RevivePlayer()
  if MangAdmin:Selection("player") or MangAdmin:Selection("self") or MangAdmin:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    MangAdmin:ChatMsg(".revive")
    MangAdmin:LogAction("Revived player "..player..".")
  else
    MangAdmin:Print(Locale["selectionerror1"])
  end
end

function SavePlayer()
  if MangAdmin:Selection("player") or MangAdmin:Selection("self") or MangAdmin:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    MangAdmin:ChatMsg(".save")
    MangAdmin:LogAction("Saved player "..player..".")
  else
    MangAdmin:Print(Locale["selectionerror1"])
  end
end

function KickPlayer()
  if MangAdmin:Selection("player") or MangAdmin:Selection("self") or MangAdmin:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    MangAdmin:ChatMsg(".kick")
    MangAdmin:LogAction("Kicked player "..player..".")
  else
    MangAdmin:Print(Locale["selectionerror1"])
  end
end

function Cooldown()
  if MangAdmin:Selection("player") or MangAdmin:Selection("self") or MangAdmin:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    MangAdmin:ChatMsg(".cooldown")
    MangAdmin:LogAction("Cooled player "..player..".")
  else
    MangAdmin:Print(Locale["selectionerror1"])
  end
end

function ShowGUID()
    local player = UnitName("target") or UnitName("player")
    MangAdmin:ChatMsg(".guid")
    MangAdmin:LogAction("Got GUID for player "..player..".")
end

function Pinfo()
  if MangAdmin:Selection("player") or MangAdmin:Selection("self") or MangAdmin:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    MangAdmin:ChatMsg(".pinfo")
    MangAdmin:LogAction("Got Player Info for player "..player..".")
  else
    MangAdmin:Print(Locale["selectionerror1"])
  end
end

function Distance()
    local player = UnitName("target") or UnitName("player")
    MangAdmin:ChatMsg(".distance")
    MangAdmin:LogAction("Got distance to player "..player..".")
end

function Recall()
  if MangAdmin:Selection("player") or MangAdmin:Selection("self") or MangAdmin:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    MangAdmin:ChatMsg(".recall")
    MangAdmin:LogAction("Recalled player "..player..".")
  else
    MangAdmin:Print(Locale["selectionerror1"])
  end
end

function Demorph()
    local player = UnitName("target") or UnitName("player")
    MangAdmin:ChatMsg(".demorph")
    MangAdmin:LogAction("Demorphed player "..player..".")
end

function ToggleMapsChar(value)
  MangAdmin:ChatMsg(".explorecheat "..value)
  if value == 1 then
    MangAdmin:LogAction("Revealed all maps for selected player.")
  else
    MangAdmin:LogAction("Hide all unexplored maps for selected player.")
  end
end

function GPS()
  if MangAdmin:Selection("player") or MangAdmin:Selection("self") or MangAdmin:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    MangAdmin:ChatMsg(".gps")
    MangAdmin:LogAction("Got GPS coordinates for player "..player..".")
  else
    MangAdmin:Print(Locale["selectionerror1"])
  end
end

function LearnSpell(value, state)
  if MangAdmin:Selection("player") or MangAdmin:Selection("self") or MangAdmin:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    local class = UnitClass("target") or UnitClass("player")
    local command = ".learn"
    local logcmd = "Learned"
    if state == "RightButton" then
      command = ".unlearn"
      logcmd = "Unlearned"
    end
    if type(value) == "string" then
      if value == "all" then
        MangAdmin:ChatMsg(command.." all")
        MangAdmin:LogAction(logcmd.." all spells to "..player..".")
      elseif value == "all_crafts" then
        MangAdmin:ChatMsg(command.." all_crafts")
        MangAdmin:LogAction(logcmd.." all professions and recipes to "..player..".")
      elseif value == "all_gm" then
        MangAdmin:ChatMsg(command.." all_gm")
        MangAdmin:LogAction(logcmd.." all default spells for Game Masters to "..player..".")
      elseif value == "all_lang" then
        MangAdmin:ChatMsg(command.." all_lang")
        MangAdmin:LogAction(logcmd.." all languages to "..player..".")
      elseif value == "all_myclass" then
        MangAdmin:ChatMsg(command.." all_myclass")
        MangAdmin:LogAction(logcmd.." all spells available to the "..class.."-class to "..player..".")
      else
        MangAdmin:ChatMsg(command.." "..value)
        MangAdmin:LogAction(logcmd.." spell "..value.." to "..player..".")
      end
    elseif type(value) == "table" then
      for k,v in pairs(value) do
        MangAdmin:ChatMsg(command.." "..v)
        MangAdmin:LogAction(logcmd.." spell "..v.." to "..player..".")
      end
    end
  else
    MangAdmin:Print(Locale["selectionerror1"])
  end
end

function Modify(case, value) 
  if MangAdmin:Selection("player") or MangAdmin:Selection("self") or MangAdmin:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    if case == "money" then
      MangAdmin:ChatMsg(".modify money "..value)
      MangAdmin:LogAction("Give player "..player.." "..value.." copper).")
    elseif case == "levelup" then
      MangAdmin:ChatMsg(".levelup "..value)
      MangAdmin:LogAction("Leveled up player "..player.." by "..value.." levels.")
    elseif case == "leveldown" then
      MangAdmin:ChatMsg(".levelup "..value*(-1))
      MangAdmin:LogAction("Leveled down player "..player.." by "..value.." levels.")
    elseif case == "energy" then
      MangAdmin:ChatMsg(".modify energy "..value)
      MangAdmin:LogAction("Modified energy for "..player.." to "..value.." energy.")
    elseif case == "rage" then
      MangAdmin:ChatMsg(".modify rage "..value)
      MangAdmin:LogAction("Modified rage for "..player.." to "..value.." rage.")
    elseif case == "health" then
      MangAdmin:ChatMsg(".modify hp "..value)
      MangAdmin:LogAction("Modified hp for "..player.." to "..value.." healthpoints")
    elseif case == "mana" then
      MangAdmin:ChatMsg(".modify mana "..value)
      MangAdmin:LogAction("Modified mana for "..player.." to "..value.." mana")
    end
  else
    MangAdmin:Print(Locale["selectionerror1"])
  end
end

function Reset(value)
  if MangAdmin:Selection("player") or MangAdmin:Selection("self") or MangAdmin:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    MangAdmin:ChatMsg(".reset "..value)
    MangAdmin:LogAction("Reset "..value.."' for player "..player..".")
  else
    MangAdmin:Print(Locale["selectionerror1"])
  end
end

  -- LEARN LANG
function LearnLangDropDownInitialize()
    local level = 1
    local info = UIDropDownMenu_CreateInfo()
    local buttons = {
      {Locale["ma_AllLang"],"all_lang"},
      {Locale["Common"],"668"},
      {Locale["Orcish"],"669"},
      {Locale["Taurahe"],"670"},
      {Locale["Darnassian"],"671"},
      {Locale["Dwarvish"],"672"},
      {Locale["Thalassian"],"813"},
      {Locale["Demonic"],"815"},
      {Locale["Draconic"],"814"},
      {Locale["Titan"],"816"},
      {Locale["Kalimag"],"817"},
      {Locale["Gnomish"],"7340"},
      {Locale["Troll"],"7341"},
      {Locale["Gutterspeak"],"17737"},
      {Locale["Draenei"],"29932"}
    }
    for k,v in pairs(buttons) do
      info.text = v[1]
      info.value = v[2]
      info.func = function() UIDropDownMenu_SetSelectedValue(ma_learnlangdropdown, this.value) end
      info.checked = nil
      info.icon = nil
      info.keepShownOnClick = nil
      UIDropDownMenu_AddButton(info, level)
    end
    UIDropDownMenu_SetSelectedValue(ma_learnlangdropdown, "all_lang")
end  

  -- MODIFY
function ModifyDropDownInitialize()
    local level = 1
    local info = UIDropDownMenu_CreateInfo()
    local buttons = {
      {Locale["ma_LevelUp"],"levelup"},
      {Locale["ma_LevelDown"],"leveldown"},
      {Locale["ma_Money"],"money"},
      {Locale["ma_Energy"],"energy"},
      {Locale["ma_Rage"],"rage"},
      {Locale["ma_Mana"],"mana"},
      {Locale["ma_Healthpoints"],"health"}
    }
    for k,v in pairs(buttons) do
      info.text = v[1]
      info.value = v[2]
      info.func = function() UIDropDownMenu_SetSelectedValue(ma_modifydropdown, this.value) end
      info.checked = nil
      info.icon = nil
      info.keepShownOnClick = nil
      UIDropDownMenu_AddButton(info, level)
    end
    UIDropDownMenu_SetSelectedValue(ma_modifydropdown, "levelup")
end  

  -- RESET
function ResetDropDownInitialize()
    local level = 1
    local info = UIDropDownMenu_CreateInfo()
    local buttons = {
      {Locale["ma_Talents"],"talents"},
      {Locale["ma_Stats"],"stats"},
      {Locale["ma_Spells"],"spells"},
      {Locale["ma_Honor"],"honor"},
      {Locale["ma_Level"],"level"}
    }
    for k,v in pairs(buttons) do
      info.text = v[1]
      info.value = v[2]
      info.func = function() UIDropDownMenu_SetSelectedValue(ma_resetdropdown, this.value) end
      info.checked = nil
      info.icon = nil
      info.keepShownOnClick = nil
      UIDropDownMenu_AddButton(info, level)
    end
    UIDropDownMenu_SetSelectedValue(ma_resetdropdown, "talents")
end  
