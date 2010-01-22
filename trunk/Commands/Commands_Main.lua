-------------------------------------------------------------------------------------------------------------
--
-- MangAdmin Version 1.0
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
-- Official Forums: http://www.manground.org/forum/
-- GoogleCode Website: http://code.google.com/p/mangadmin/
-- Subversion Repository: http://mangadmin.googlecode.com/svn/
--
-------------------------------------------------------------------------------------------------------------

function DisplayAccountLevel()
  MangAdmin:ChatMsg(".account")
end

function ToggleGMMode(value)
  MangAdmin:ChatMsg(".gm "..value)
  MangAdmin:LogAction("Turned GM-mode to "..value..".")
end

function ToggleFlyMode(value)
  --if self:Selection("player") or self:Selection("self") or self:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    MangAdmin:ChatMsg(".gm fly "..value)
    MangAdmin:LogAction("Turned Fly-mode "..value.." for "..player..".")
  --[[else
    self:Print(Locale["selectionerror1"])
  end]]
end

function ToggleHoverMode(value)
  MangAdmin:ChatMsg(".hover "..value)
  local status
  if value == 1 then
    status = "on"
  else
    status = "off"
  end
  MangAdmin:LogAction("Turned Hover-mode "..status..".")
end

function ToggleWhisper(value)
  MangAdmin:ChatMsg(".whispers "..value)
  MangAdmin:LogAction("Turned accepting whispers to "..value..".")
end

function ToggleVisible(value)
  MangAdmin:ChatMsg(".gm visible "..value)
  if value == "on" then
    MangAdmin:LogAction("Turned you visible.")
  else
    MangAdmin:LogAction("Turned you invisible.")
  end  
end

function ToggleTaxicheat(value)
  if MangAdmin:Selection("player") or MangAdmin:Selection("self") or MangAdmin:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    MangAdmin:ChatMsg(".taxicheat "..value)
    if value == 1 then
      MangAdmin:LogAction("Activated taxicheat to "..player..".")
    else
      MangAdmin:LogAction("Disabled taxicheat to "..player..".")
    end
  else
    MangAdmin:Print(Locale["selectionerror1"])
  end
end

function ToggleMaps(value)
  MangAdmin:ChatMsg(".explorecheat "..value)
  if value == 1 then
    MangAdmin:LogAction("Revealed all maps for selected player.")
  else
    MangAdmin:LogAction("Hide all unexplored maps for selected player.")
  end
end

function InstantKill()
  MangAdmin.db.char.instantKillMode = ma_instantkillbutton:GetChecked()
end

function SetSpeed()
  local value = string.format("%.1f", ma_speedslider:GetValue())
  if MangAdmin:Selection("player") or MangAdmin:Selection("self") or MangAdmin:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    --self:ChatMsg(".modify speed "..value)
    --self:ChatMsg(".modify fly "..value)
    --self:ChatMsg(".modify swim "..value)
    MangAdmin:ChatMsg(".modify aspeed "..value)
    MangAdmin:LogAction("Set speed of "..player.." to "..value..".")
  else
    MangAdmin:Print(Locale["selectionerror1"])
    ma_speedslider:SetValue(1)
  end
end

function SetScale()
  local value = string.format("%.1f", ma_scaleslider:GetValue())
  if MangAdmin:Selection("player") or MangAdmin:Selection("self") or MangAdmin:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    MangAdmin:ChatMsg(".modify scale "..value)
    MangAdmin:LogAction("Set scale of "..player.." to "..value..".")
  else
    MangAdmin:Print(Locale["selectionerror1"])
    ma_scaleslider:SetValue(1)
  end
end

function Screenie()
  UIParent:Hide()
  Screenshot()
  UIParent:Show()
end

function ShowBank()
  MangAdmin:ChatMsg(".bank")
end

function DismountPlayer()
  if MangAdmin:Selection("player") or MangAdmin:Selection("self") or MangAdmin:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    MangAdmin:ChatMsg(".dismount")
    MangAdmin:LogAction("Dismounted player "..player..".")
  else
    MangAdmin:Print(Locale["selectionerror1"])
  end
end

function SetJail_A()
    MangAdmin:ChatMsg(".tele del ma_AllianceJail")
    local i = 1
    while i<100 do
        i=i+1
        MangAdmin:ChatMsg(".")
    end
    MangAdmin:ChatMsg(".tele add ma_AllianceJail")
    MangAdmin:LogAction("Set location of Alliance Jail")
end

function SetJail_H()
    MangAdmin:ChatMsg(".tele del ma_HordeJail")
    local i = 1
    while i<100 do
        i=i+1
        MangAdmin:ChatMsg(".")
    end
    MangAdmin:ChatMsg(".tele add ma_HordeJail")
    MangAdmin:LogAction("Set location of Horde Jail")
end

function GridNavigate(x, y)
  local way = MangAdmin.db.char.nextGridWay
  if not x and not y then
    table.insert(MangAdmin.db.char.functionQueue, "GridNavigate")
    MangAdmin:ChatMsg(".gps")
  else
    if pcall(function() return ma_gridnavieditbox:GetText() + 10 end) then
      local step = ma_gridnavieditbox:GetText()
      local newy
      local newx
      if way == "east" then  --East
        newy = y - step
        newx = x
      elseif way == "north" then --North
        newy = y
        newx = x + step
      elseif way == "south" then  --South
        newy = y
        newx = x - step
      else  --Wast
        newy = y + step
        newx = x
      end
      MangAdmin:ChatMsg(".go xy "..newx.." "..newy)
      MangAdmin:LogAction("Teleported to grid position: X: "..newx.." Y: "..newy)
    else
      MangAdmin:Print("Value must be a number!")
    end
  end
end