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
function OBJGo()
    local player = UnitName("target") or UnitName("player")
    local obj =	ma_Obj_guidbutton:GetText()
    MangAdmin:ChatMsg(".go object "..obj)
    MangAdmin:LogAction("Go Object for player "..player..".")
end

function OBJAdd()
    local player = UnitName("target") or UnitName("player")
    local obj =	ma_Obj_idbutton:GetText()
    MangAdmin:ChatMsg(".gobject add "..obj)
    MangAdmin:LogAction("Object Add for player "..player..".")
end

function OBJMove()
    local player = UnitName("target") or UnitName("player")
    local obj =	ma_Obj_guidbutton:GetText()
    MangAdmin:ChatMsg(".gobject move "..obj)
    MangAdmin:LogAction("Object Move for player "..player..".")
end

function OBJTurn()
    local player = UnitName("target") or UnitName("player")
    local obj =	ma_Obj_guidbutton:GetText()
    MangAdmin:ChatMsg(".gobject turn "..obj)
    MangAdmin:LogAction("Object Turn for player "..player..".")
end

function OBJDel()
    local player = UnitName("target") or UnitName("player")
    local obj =	ma_Obj_guidbutton:GetText()
    MangAdmin:ChatMsg(".gobject delete "..obj)
    MangAdmin:LogAction("Object Delete for player "..player..".")
end

function OBJNear()
    local player = UnitName("target") or UnitName("player")
    MangAdmin:ChatMsg(".gobject near")
    MangAdmin:LogAction("Object Near for player "..player..".")
end

function OBJTarget()
	MangAdmin:OID_Setting_Start_Write(1)
    local player = UnitName("target") or UnitName("player")
    MangAdmin:ChatMsg(".gobject target")
    MangAdmin:LogAction("Object Target for player "..player..".")
end

function OBJActivate()
    local player = UnitName("target") or UnitName("player")
    MangAdmin:ChatMsg(".gobject activate "..ma_Obj_guidbutton:GetText())
    MangAdmin:LogAction("Object "..ma_Obj_guidbutton:GetText().." activated for player "..player..".")
end

function OBJAddTemp()
    local player = UnitName("target") or UnitName("player")
    local obj =	ma_Obj_idbutton:GetText()
    MangAdmin:ChatMsg(".gobject add temp "..obj)
    MangAdmin:LogAction("Object Add(Temp) for player "..player..".")
end

function OBJInfo()
    local player = UnitName("target") or UnitName("player")
    MangAdmin:ChatMsg(".gobject info")
    MangAdmin:LogAction("Object "..ma_Obj_guidbutton:GetText().." info obtained for player "..player..".")
end

function OBJSetPhase()
    local player = UnitName("target") or UnitName("player")
    local obj =	ma_Obj_guidbutton:GetText()
    local phase = ma_gobsetphaseinput:GetText()
    MangAdmin:ChatMsg(".gobject set phase "..obj.." "..phase)
    MangAdmin:LogAction("Object "..obj.." phase set to "..phase.." for player "..player..".")
end