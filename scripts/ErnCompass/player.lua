--[[
ErnOneStick for OpenMW.
Copyright (C) 2025 Erin Pentecost

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as
published by the Free Software Foundation, either version 3 of the
License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
]]
local MOD_NAME = require("scripts.ErnOneStick.ns")
local state = require("scripts.ErnOneStick.state")
local radians = require("scripts.ErnOneStick.radians")
local targetui = require("scripts.ErnOneStick.targetui")
local keytrack = require("scripts.ErnOneStick.keytrack")
local targets = require("scripts.ErnOneStick.targets")
local fatigue = require("scripts.ErnOneStick.fatigue")
local unitoggle = require("scripts.ErnOneStick.unitoggle")
local shaderUtils = require("scripts.ErnOneStick.shader_utils")
local core = require("openmw.core")
local pself = require("openmw.self")
local camera = require('openmw.camera')
local util = require('openmw.util')
local async = require("openmw.async")
local types = require('openmw.types')
local input = require('openmw.input')
local controls = require('openmw.interfaces').Controls
local nearby = require('openmw.nearby')
local cameraInterface = require("openmw.interfaces").Camera
local uiInterface = require("openmw.interfaces").UI

local admin = require("scripts.ErnOneStick.settings.admin")
local inputSettings = require("scripts.ErnOneStick.settings.input")
local dpadSettings = require("scripts.ErnOneStick.settings.dpad")

local showCompass = false
local north = util.vector3(1, 0, 0)

local function getFacing()
    local facing = camera.viewportToWorldVector(util.vector2(0.5, 0.5)):normalize()
    -- dot product returns 0 if at 90*, 1 if codirectional, -1 if opposite.
    return facing:dot(north)
end


local function onUpdate(dt)
    if dt == 0 then return end
    if showCompass == false then return end
    print(tostring(getFacing()))
end

local function UiModeChanged(data)
    showCompass = data.newMode == nil
end

return {
    eventHandlers = {
        UiModeChanged = UiModeChanged,
    },
    engineHandlers = {
        onUpdate = onUpdate
    }
}
