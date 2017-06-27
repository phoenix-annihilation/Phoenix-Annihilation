
if addon.InGetInfo then
    return {
        name    = "BalanceCommittee",
        desc    = "Prints the names of the members of the balance committee",
        author  = "CommanderSpice",
        date    = "2017",
        license = "GPL2",
        layer   = 1,
        depend  = {},
        enabled = true,
    }
end

------------------------------------------

local font = gl.LoadFont("FreeSansBold.otf", 50, 20, 1.95)

VFS.Include("luaintro/committee_members.lua")
local committeeMembersText = "BALANCE COMMITTEE\n\n" .. table.concat(committeeMembers, "\n")

local width = font:GetTextWidth(committeeMembersText)
local _, _, numlines = font:GetTextHeight(committeeMembersText)

local border = 0.08

function addon.DrawLoadScreen()
    local vsx, vsy = gl.GetViewSizes()
    local textSize = vsy * 0.02

    gl.PushMatrix()
    gl.Scale(1/vsx,1/vsy,1)
    font:Begin()
    font:SetTextColor(1.0, 0.9, 0.33, 1.0)
    font:Print(committeeMembersText,
               vsx - width - vsx * border,
               textSize * numlines + vsy * border,
               textSize,
               "or")
    font:End()
    gl.PopMatrix()
end

