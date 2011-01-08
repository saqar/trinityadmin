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

-- Initializing dynamic frames with LUA and FrameLib
-- This script must be listed in the .toc after "MangFrames_SectionTele.lua"
-- Also some variables are globally taken from MangAdmin.lua

function MangAdmin:CreateGOSection()
  local transparency = {
    bg = MangAdmin.db.account.style.transparency.backgrounds,
    btn = MangAdmin.db.account.style.transparency.buttons,
    frm = MangAdmin.db.account.style.transparency.frames
  }
  
  local color = {
    bg = MangAdmin.db.account.style.color.backgrounds,
    btn = MangAdmin.db.account.style.color.buttons,
    frm = MangAdmin.db.account.style.color.frames
  }

  FrameLib:BuildButton({
    name = "ma_objgobutton",
    group = "go",
    parent = ma_midframe,
    texture = {
      name = "ma_objgobutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 12,
      offY = -102
    },
    text = Locale["ma_OBJGo"]
  })

  FrameLib:BuildButton({
    name = "ma_objaddbutton",
    group = "go",
    parent = ma_midframe,
    texture = {
      name = "ma_objaddbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 96,
      offY = -102
    },
    text = Locale["ma_OBJAdd"]
  })

  FrameLib:BuildButton({
    name = "ma_objmovebutton",
    group = "go",
    parent = ma_midframe,
    texture = {
      name = "ma_objmovebutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 12,
      offY = -128
    },
    text = Locale["ma_OBJMove"]
  })

  FrameLib:BuildButton({
    name = "ma_objturnbutton",
    group = "go",
    parent = ma_midframe,
    texture = {
      name = "ma_objturnbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 96,
      offY = -128
    },
    text = Locale["ma_OBJTurn"]
  })

  FrameLib:BuildButton({
    name = "ma_objdelbutton",
    group = "go",
    parent = ma_midframe,
    texture = {
      name = "ma_objdelbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 12,
      offY = -154
    },
    text = Locale["ma_OBJDel"]
  })


  FrameLib:BuildButton({
    name = "ma_objnearbutton",
    group = "go",
    parent = ma_midframe,
    texture = {
      name = "ma_objnearbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 12,
      offY = -12
    },
    text = Locale["ma_OBJNear"]
  })

  FrameLib:BuildButton({
    name = "ma_objtargetbutton",
    group = "go",
    parent = ma_midframe,
    texture = {
      name = "ma_objtargetbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 96,
      offY = -12
    },
    text = Locale["ma_OBJTarget"]
  })  

  FrameLib:BuildFontString({
    name = "ma_gobguidlabel",
    group = "go",
    parent = ma_midframe,
    text = "GOb GUID",
    setpoint = {
      pos = "TOPLEFT",
      offX = 12,
      offY = -37
    },
  })

  FrameLib:BuildFontString({
    name = "ma_gobentrylabel",
    group = "go",
    parent = ma_midframe,
    text = "GOb EntryID",
    setpoint = {
      pos = "TOPLEFT",
      offX = 93,
      offY = -37
    },
  })
  
  FrameLib:BuildFrame({
    type = "EditBox",
    name = "ma_Obj_guidbutton",
    group = "go",
    parent = ma_midframe,
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 12,
      offY = -53
    },
    maxLetters = 10,
    multiline = false,
    inherits = "InputBoxTemplate"
  })
  
  FrameLib:BuildFrame({
    type = "EditBox",
    name = "ma_Obj_idbutton",
    group = "go",
    parent = ma_midframe,
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 96,
      offY = -53
    },
    maxLetters = 10,
    multiline = false,
    inherits = "InputBoxTemplate"
  })
  
  FrameLib:BuildButton({
    name = "ma_gobactivatebutton",
    group = "go",
    parent = ma_midframe,
    texture = {
      name = "ma_gobactivatebutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 96,
      offY = -154
    },
    text = Locale["ma_OBJActivate"]
  })

  FrameLib:BuildButton({
    name = "ma_gobaddtempbutton",
    group = "go",
    parent = ma_midframe,
    texture = {
      name = "ma_gobaddtempbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 12,
      offY = -180
    },
    text = Locale["ma_OBJAddTemp"]
  })

  FrameLib:BuildButton({
    name = "ma_gobinfobutton",
    group = "go",
    parent = ma_midframe,
    texture = {
      name = "ma_gobinfobutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 96,
      offY = -180
    },
    text = Locale["ma_OBJInfo"]
  })

  FrameLib:BuildButton({
    name = "ma_gobsetphasebutton",
    group = "go",
    parent = ma_midframe,
    texture = {
      name = "ma_gobsetphasebutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 12,
      offY = -206
    },
    text = Locale["ma_OBJSetPhase"]
  })

  FrameLib:BuildFrame({
    type = "EditBox",
    name = "ma_gobsetphaseinput",
    group = "go",
    parent = ma_midframe,
    size = {
      width = 40,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 98,
      offY = -207
    },
    maxLetters = 5,
    multiline = false,
    inherits = "InputBoxTemplate"
  })
end
