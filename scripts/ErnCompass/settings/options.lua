--[[
ErnCompass for OpenMW.
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
local MOD_NAME = require("scripts.ErnCompass.ns")
local interfaces = require("openmw.interfaces")

local minFatigue = { "0%", "25%", "50%", "75%" }
local cameraModes = { "first", "third" }

local function groupKey(groupName)
    return 'SettingsGlobal' .. MOD_NAME .. groupName
end

interfaces.Settings.registerGroup {
    key = groupKey("Admin"),
    l10n = MOD_NAME,
    name = "modSettingsAdminTitle",
    description = "modSettingsAdminDesc",
    page = MOD_NAME,
    permanentStorage = true,
    order = 10,
    settings = { {
        key = "disable",
        name = "disable_name",
        description = "disable_description",
        default = false,
        renderer = "checkbox"
    }, {
        key = "debugMode",
        name = "debugMode_name",
        description = "debugMode_description",
        default = false,
        renderer = "checkbox"
    }, {
        key = "firstRun",
        name = "firstRun_name",
        default = true,
        renderer = "checkbox",
    } }
}
