﻿-------------------------------------------------------------------------------------------------------------
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

function WhoUpdate()
    MangAdmin:LogAction("Getting Who.")
    local whoCount = 0
    table.foreachi(MangAdmin.db.account.buffer.who, function() whoCount = whoCount + 1 end)
    --MangAdmin:ChatMsg("Who:"..whoCount)
    if whoCount > 0 then
      ma_whoscrollframe1:SetText("Loading")
      local lineplusoffset
      local line
      ma_whoscrollframe:Show()
      FauxScrollFrame_Update(ma_whoscrollframe,whoCount,12,16);
      for line = 1,12 do
        lineplusoffset = line + FauxScrollFrame_GetOffset(ma_whoscrollframe)
        --MangAdmin:ChatMsg("L+O:"..lineplusoffset)
        if lineplusoffset <= whoCount then
          local object = MangAdmin.db.account.buffer.who[lineplusoffset]
          if object then
            getglobal("ma_whoscrollframe"..line):SetText("Acct: |cffffffff"..object["tAcc"].."|r Char: |cffffffff"..object["tChar"].."|r IP: |cffffffff"..object["tIP"].."|r GMLvl: |cffffffff"..object["tGMLevel"].."|r Exp: |cffffffff"..object["tExp"].."|r")
--            MangAdmin.db.account.tickets.selected = object
            ma_deletewhobutton:Enable()
            ma_answerwhobutton:Enable()
            ma_summonwhobutton:Enable()
            ma_gocharwhobutton:Enable()
            ma_whisperwhobutton:Enable()
            getglobal("ma_whoscrollframe"..line):SetScript("OnEnter", function() --[[Do nothing]] end)
            getglobal("ma_whoscrollframe"..line):SetScript("OnLeave", function() --[[Do nothing]] end)
            getglobal("ma_whoscrollframe"..line):SetScript("OnClick", function() WhoDetail(object["tAcc"], object["tChar"]) end)
            getglobal("ma_whoscrollframe"..line):Enable()
            getglobal("ma_whoscrollframe"..line):Show()
          end
        else
          getglobal("ma_whoscrollframe"..line):Hide()
        end
      end
    else
      --MangAdmin:NoResults("ticket")
    end
--  else
--  end
--MangAdmin.db.account.buffer.tickets = {}
--MangAdmin.db.char.requests.ticket = false
end

function WhoDetail(tAcc, tChar)
--     MangAdmin.db.char.requests.ticket = false
--   MangAdmin:ChatMsg(tNumber)
--     tNumber=string.gsub(tNumber, "00", "")
--   MangAdmin:ChatMsg(tNumber)
    --x = x - 1 
--    tNumber = string.match(tNumber, "%d+")
    MangAdmin:ChatMsg(".pinfo "..tChar)
    ma_whoid:SetText(tAcc)
    ma_who:SetText(tChar)
    MangAdmin:LogAction("Displaying character detail on "..tAcc..":"..tChar)
--    local ticketdetail = MangAdmin.db.account.buffer.ticketsfull
end

function ResetWho()
    MangAdmin.db.account.buffer.who = {}
    wipe(MangAdmin.db.account.buffer.who)
    MangAdmin.db.account.buffer.who = {}
    WhoUpdate()
end

function Who(value)
  if value == "delete" then
    MangAdmin:ChatMsg(".kick "..ma_who:GetText())
    MangAdmin:LogAction("Kicked: "..ma_who:GetText())
    ResetWho()
  elseif value == "gochar" then
    MangAdmin:ChatMsg(".goname "..ma_who:GetText())
  elseif value == "getchar" then
    MangAdmin:ChatMsg(".namego "..ma_who:GetText())
  elseif value == "answer" then
    MangAdmin:TogglePopup("mail", {recipient = ma_who:GetText(), subject = ""})
  elseif value == "whisper" then
    ChatFrameEditBox:Show()
    ChatFrameEditBox:Insert("/w "..ma_who:GetText().." ");
  end
end