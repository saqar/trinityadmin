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
function ShowTicketTab()
  --ma_tpinfo_text:SetText(Locale["ma_TicketsNoInfo"])
  --ma_ticketeditbox:SetText(Locale["ma_TicketsNotLoaded"])
  --ResetTickets()
  ma_deleteticketbutton:Disable()
  ma_answerticketbutton:Disable()
  ma_getcharticketbutton:Disable()
  ma_gocharticketbutton:Disable()
  ma_whisperticketbutton:Disable()
  MangAdmin:InstantGroupToggle("ticket")
   ResetTickets()
   RefreshTickets()
   RefreshTickets()
  --self:LoadTickets(nil)
end

function RefreshTickets()
--    wipe(MangAdmin.db.account.buffer.tickets)
    --MangAdmin.db.account.buffer.tickets = {}
      MangAdmin.db.char.requests.ticket = true
      InlineScrollUpdate()
end

function ResetTickets()
    wipe(MangAdmin.db.account.buffer.tickets)
    wipe(MangAdmin.db.account.buffer.tickets)
    wipe(MangAdmin.db.account.buffer.tickets)
    MangAdmin.db.account.buffer.tickets = {}
    MangAdmin.db.account.buffer.tickets = {}
    MangAdmin.db.account.buffer.tickets = {}
    MangAdmin.db.char.requests.ticket = true
    InlineScrollUpdate()
end



--[[function MangAdmin:LoadTickets(number)
  self.db.char.newTicketQueue = {}
  --self.db.account.tickets.requested = 0
  if number then
    if tonumber(number) > 0 then
      self.db.account.tickets.count = tonumber(number)
      if self.db.char.requests.ticket then
        self:LogAction("Load of tickets requested. Found "..number.." tickets!")
        self:RequestTickets()
        self:SetIcon(ROOT_PATH.."Textures\\icon.tga")
        --ma_resetsearchbutton:Enable()
      end
    else
      --ma_resetsearchbutton:Disable()
      self:NoResults("ticket")
    end
  else
    self.db.char.requests.ticket = true
    self.db.account.tickets.count = 0
    self.db.account.buffer.tickets = {}
    --self:ChatMsg(".ticket list")
    --self:LogAction("Requesting ticket numberz!")
  end
  InlineScrollUpdate()
end]]

--[[function MangAdmin:RequestTickets()
  self.db.char.requests.ticket = true
  local ticketCount = 0
  table.foreachi(self.db.account.buffer.tickets, function() ticketCount = ticketCount + 1 end)
  --ma_lookupresulttext:SetText(Locale["ma_TicketCount"]..count)
  ma_top2text:SetText(Locale["realm"].." "..Locale["tickets"]..self.db.account.tickets.count)
  local tnumber = self.db.account.tickets.count - ticketCount
  --self:LogAction("tNumber = "..tnumber..", Tc = "..ticketCount)
  if tnumber > 0 then
    self:ChatMsg(".ticket "..tnumber)
    --self:LogAction(".ticket "..tnumber)
    self:LogAction("Loading ticket "..tnumber.."...")
  else
    self:LogAction("Loaded all available tickets! No more to load...")
    ma_resetsearchbutton:Disable()
  end
end]]

function Ticket(value)
  local ticket = MangAdmin.db.account.tickets.selected
  if value == "delete" then
    MangAdmin:ChatMsg(".ticket close "..ma_ticketid:GetText())
    MangAdmin:LogAction("Closed ticket with number: "..ma_ticketid:GetText())
    wipe(MangAdmin.db.account.buffer.tickets)
    MangAdmin.db.account.buffer.tickets={}
--    MangAdmin:ChatMsg(".ticket delete"..ma_ticketid:GetText())
--    MangAdmin:LogAction("Deleted ticket with number: "..ma_ticketid:GetText())
    ShowTicketTab()
    ResetTickets()
    --InlineScrollUpdate()
  elseif value == "gochar" then
    MangAdmin:ChatMsg(".goname "..ma_ticketwho:GetText())
  elseif value == "getchar" then
    MangAdmin:ChatMsg(".namego "..ma_ticketwho:GetText())
  elseif value == "answer" then
--    MangAdmin:TogglePopup("mail", {recipient = ma_ticketwho:GetText(), subject = "Ticket("..ma_ticketid:GetText()..")"})
    MangAdmin:TogglePopup("mail", {recipient = ma_ticketwho:GetText(), subject = "Ticket("..ma_ticketid:GetText()..")"})
--    MangAdmin:TogglePopup("mail", {recipient = ma_ticketwho:GetText(), subject = "Ticket("..ma_ticketid:GetText()..")", body = ma_ticketdetail:GetText()})
    ma_maileditbox:SetText(ma_ticketdetail:GetText())
  elseif value == "whisper" then
    ChatFrameEditBox:Show()
    ChatFrameEditBox:Insert("/w "..ma_ticketwho:GetText().." ");
  end
end

--[[function MangAdmin:ToggleTickets(value)
  MangAdmin:ChatMsg(".ticket "..value)
  MangAdmin:LogAction("Turned receiving new tickets "..value..".")
end]]

function InlineScrollUpdate()
    --wipe(MangAdmin.db.account.buffer.tickets)
    MangAdmin:LogAction("Getting tickets.")
    MangAdmin:ChatMsg(".ticket list")
    local ticketCount = 0
    table.foreachi(MangAdmin.db.account.buffer.tickets, function() ticketCount = ticketCount + 1 end)
    if ticketCount == 0 then
        ma_ticketscrollframe1:Show()
            ma_ticketscrollframe1:Disable()
        ma_ticketscrollframe1:SetText(Locale["ma_TicketsNoTickets"])
        for i=2,12 do
            getglobal("ma_ticketscrollframe"..i):Hide()
        end
    end
    if ticketCount > 0 then
      --ma_top2text:SetText(Locale["realm"].." "..Locale["tickets"]..ticketCount)
      ma_ticketscrollframe1:SetText("Loading")
      local lineplusoffset
      local line
      ma_ticketscrollframe:Show()
      FauxScrollFrame_Update(ma_ticketscrollframe,ticketCount,12,16);
      for line = 1,12 do
        lineplusoffset = line + FauxScrollFrame_GetOffset(ma_ticketscrollframe)
--MangAdmin:ChatMsg("L+O:"..lineplusoffset.." Count:"..ticketCount)
        if lineplusoffset <= ticketCount then
          local object = MangAdmin.db.account.buffer.tickets[lineplusoffset]
          if object then
            --getglobal("ma_ticketscrollframe"..line):SetJustifyH("LEFT")
            getglobal("ma_ticketscrollframe"..line):SetText("Id: |cffffffff"..object["tNumber"].."|r Who: |cffffffff"..object["tChar"].."|r When: |cffffffff"..object["tLCreate"].."|r")
            MangAdmin.db.account.tickets.selected = object
            ma_deleteticketbutton:Enable()
            ma_answerticketbutton:Enable()
            ma_getcharticketbutton:Enable()
            ma_gocharticketbutton:Enable()
            ma_whisperticketbutton:Enable()
            getglobal("ma_ticketscrollframe"..line):SetScript("OnEnter", function() --[[Do nothing]] end)
            getglobal("ma_ticketscrollframe"..line):SetScript("OnLeave", function() --[[Do nothing]] end)
            getglobal("ma_ticketscrollframe"..line):SetScript("OnClick", function() ReadTicket(object["tNumber"], object["tChar"]) end)
            getglobal("ma_ticketscrollframe"..line):Enable()
            getglobal("ma_ticketscrollframe"..line):Show()
          end
        else
          getglobal("ma_ticketscrollframe"..line):Hide()
        end
      end
    else
      --MangAdmin:NoResults("ticket")
    end
--  else
--  end
MangAdmin.db.account.buffer.tickets = {}
--MangAdmin.db.char.requests.ticket = false
end

function ReadTicket(tNumber, tChar)
     MangAdmin.db.char.requests.ticket = false
     ma_deleteticketbutton:Enable()
     ma_answerticketbutton:Enable()
     ma_getcharticketbutton:Enable()
     ma_gocharticketbutton:Enable()
     ma_whisperticketbutton:Enable()
--   MangAdmin:ChatMsg(tNumber)
--   tNumber=string.gsub(tNumber, ".", "")
--   MangAdmin:ChatMsg(tNumber)
    --x = x - 1 
    tNumber = string.match(tNumber, "%d+")
    MangAdmin:ChatMsg(".ticket viewid "..tNumber)
    ma_ticketid:SetText(tNumber)
    ma_ticketwho:SetText(tChar)
    --MangAdmin:ChatMsg(".pinfo "..tChar)
    MangAdmin:LogAction("Displaying ticket number "..tNumber.." from player "..tChar)

    --MangAdmin:ChatMsg("???")
    --ma_ticketdetail:SetText("Hello")
    --MangAdmin:ChatMsg(MangAdmin.db.account.buffer.ticketsfull["tMsg"])
    local ticketdetail = MangAdmin.db.account.buffer.ticketsfull
    --ma_ticketdetail:SetText(ticketdetail["tMsg"])
    --    getglobal("ma_ticketdetail"):SetText("Id: |cffffffff"..tNumber.."|r Who: |cffffffff"..tChar.."|r Msg: |cffffffff"..ticketdetail["tMsg"].."|r")
--    ma_ticketdetail:SetText("Id: |cffffffff"..tNumber.."|r Who: |cffffffff"..tChar.."|r Msg: |cffffffff"..ticketdetail["tMsg"].."|r")
--    ma_ticketdetail:SetText(ticketdetail["tMsg"].."|r")
    --ma_ticketdetail:SetText("Hello")

end
