--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  file:    ico_customicons.lua
--  author:  Dave Rodgers
--
--  Copyright (C) 2007.
--  Licensed under the terms of the GNU GPL, v2 or later.
--
--------------------------------------------------------------------------------
-- This gadget checks through the attributes of each unitdef and assigns an appropriate icon for use in the minimap & zoomed out mode.
--
-- The reason that this is a gadget (it could also be a widget) and not part of weapondefs_post.lua/iconTypes.lua is the following:  
-- the default values for UnitDefs attributes that are not specified in our unitdefs lua files are only loaded into UnitDefs AFTER
-- unitdefs_post.lua and iconTypes.lua have been processed. For example, at the time of unitdefs_post, for most units ud.speed is  
-- nil and not a number, so we can't e.g. compare it to zero. Also, it's more modularized as a widget/gadget. 
-- [We could set the default values up in unitdefs_post to match engine defaults but thats just too hacky.]
--
-- Bluestone 27/04/2013
--------------------------------------------------------------------------------

function gadget:GetInfo()
  return {
    name      = "CustomIcons",
    desc      = "Sets custom unit icons for PA",
    author    = "trepan, BD, TheFatController",
    date      = "Jan 8, 2007",
    license   = "GNU GPL, v2 or later",
    layer     = -100,
    enabled   = true  --  loaded by default?
  }
end

--------------------------------------------------------------------------------

if (gadgetHandler:IsSyncedCode()) then
  return false
end

function gadget:Initialize()

  Spring.AddUnitIcon("armcom.user", "LuaUI/Icons/armcom.png", 2)
  Spring.AddUnitIcon("corcom.user", "LuaUI/Icons/corcom.png", 2)
  Spring.AddUnitIcon("cross.user", "LuaUI/Icons/cross.png")
  Spring.AddUnitIcon("diamond.user", "LuaUI/Icons/diamond.png", 1.1)
  Spring.AddUnitIcon("e.user", "LuaUI/Icons/e.png")
  Spring.AddUnitIcon("e2.user", "LuaUI/Icons/e.png", 1.4)
  Spring.AddUnitIcon("e3.user", "LuaUI/Icons/e.png", 1.8)
  Spring.AddUnitIcon("hemi-down.user", "LuaUI/Icons/hemi-down.png", 1.3)
  Spring.AddUnitIcon("hemi-up.user", "LuaUI/Icons/hemi-up.png")
  Spring.AddUnitIcon("hemi.user", "LuaUI/Icons/hemi.png")
  Spring.AddUnitIcon("hourglass-side.user", "LuaUI/Icons/hourglass-side.png")
  Spring.AddUnitIcon("hourglass.user", "LuaUI/Icons/hourglass.png")
  Spring.AddUnitIcon("krogoth.user", "LuaUI/Icons/krogoth.png", 3)
  Spring.AddUnitIcon("m-down.user", "LuaUI/Icons/m-down.png")
  Spring.AddUnitIcon("m-up.user", "LuaUI/Icons/m-up.png")
  Spring.AddUnitIcon("m.user", "LuaUI/Icons/m.png")
  Spring.AddUnitIcon("nuke.user", "LuaUI/Icons/nuke.png", 1.25)
  Spring.AddUnitIcon("slash.user", "LuaUI/Icons/slash.png") 
  Spring.AddUnitIcon("sphere.user", "LuaUI/Icons/ba_sphere.png", 1.1)
  Spring.AddUnitIcon("sphere2.user", "LuaUI/Icons/ba_sphere.png", 1.35)
  Spring.AddUnitIcon("sphere3.user", "LuaUI/Icons/ba_sphere.png", 1.7)
  Spring.AddUnitIcon("square.user", "LuaUI/Icons/square.png")
  Spring.AddUnitIcon("square_+.user", "LuaUI/Icons/square_+.png")
  Spring.AddUnitIcon("square_x.user", "LuaUI/Icons/square_x.png")
  Spring.AddUnitIcon("square_x_factory.user", "LuaUI/Icons/square_x.png", 1.5)
  Spring.AddUnitIcon("star-dark.user", "LuaUI/Icons/star-dark.png")
  Spring.AddUnitIcon("star.user", "LuaUI/Icons/star.png")
  Spring.AddUnitIcon("tiny-sphere.user", "LuaUI/Icons/ba_sphere.png", 0.55)
  Spring.AddUnitIcon("tiny-square.user", "LuaUI/Icons/square.png", 0.55)
  Spring.AddUnitIcon("tri-down.user", "LuaUI/Icons/tri-down.png", 1.3)
  Spring.AddUnitIcon("tri-up.user", "LuaUI/Icons/tri-up.png", 1.4)
  Spring.AddUnitIcon("tri-up_fighter.user", "LuaUI/Icons/tri-up.png", 0.9)
  Spring.AddUnitIcon("triangle-down.user", "LuaUI/Icons/triangle-down.png")
  Spring.AddUnitIcon("triangle-up.user", "LuaUI/Icons/triangle-up.png")
  Spring.AddUnitIcon("x.user", "LuaUI/Icons/x.png")
  Spring.AddUnitIcon("blank.user", "LuaUI/Icons/blank.png")
   
  -- Setup the unitdef icons
  for unitDefId, unitDef in pairs(UnitDefs) do
    if (unitDef ~= nil) then
      if (unitDef.name == "roost") or (unitDef.name == "meteor") then
        Spring.SetUnitDefIcon(unitDefId, "star.user")
      elseif string.sub(unitDef.name, 0, 7) == "critter" then
        Spring.SetUnitDefIcon(unitDefId, "blank.user")
      elseif (unitDef.name == "armwin") or (unitDef.name == "corwin") then
        Spring.SetUnitDefIcon(unitDefId, "e.user")
      elseif (unitDef.name == "armfig") or (unitDef.name == "corveng")
              or (unitDef.name == "armhawk") or (unitDef.name == "corvamp") then
        Spring.SetUnitDefIcon(unitDefId, "tri-up_fighter.user")
      elseif (unitDef.name == "cafus") or (unitDef.name == "aafus") then
        Spring.SetUnitDefIcon(unitDefId, "e3.user")
      elseif (unitDef.name == "armfus") or (unitDef.name == "corfus") or (unitDef.name == "armckfus")
              or (unitDef.name == "armdf") or (unitDef.name == "armuwfus") or (unitDef.name == "coruwfus") then
        Spring.SetUnitDefIcon(unitDefId, "e2.user")
      elseif (unitDef.name == "armcom") or (unitDef.name == "armdecom") then
        Spring.SetUnitDefIcon(unitDefId, "armcom.user")
      elseif (unitDef.name == "corcom") or (unitDef.name == "cordecom") then
        Spring.SetUnitDefIcon(unitDefId, "corcom.user")
      elseif (unitDef.name == "corkrog") then
        Spring.SetUnitDefIcon(unitDefId, "krogoth.user")
      elseif (unitDef.isFactory) then
        -- factories
        Spring.SetUnitDefIcon(unitDefId, "square_x_factory.user")
      elseif (unitDef.isBuilder) then
        -- builders
        if ((unitDef.speed > 0) and unitDef.canMove) then
          Spring.SetUnitDefIcon(unitDefId, "cross.user")     -- mobile
        else
          Spring.SetUnitDefIcon(unitDefId, "square_+.user")  -- immobile
        end
      elseif (unitDef.stockpileWeaponDef ~= nil) and not (unitDef.name == "mercury" or unitDef.name == "screamer") then
        -- nuke / antinuke ( stockpile weapon, but not mercury/screamer )
        Spring.SetUnitDefIcon(unitDefId, "nuke.user")
      elseif (unitDef.canFly) then
        -- aircraft
        Spring.SetUnitDefIcon(unitDefId, "tri-up.user")
      elseif ((unitDef.speed <= 0) and unitDef.shieldWeaponDef) then
        -- immobile shields
        Spring.SetUnitDefIcon(unitDefId, "hemi-up.user")
      elseif ((unitDef.extractsMetal > 0) or (unitDef.makesMetal > 0))
              or (unitDef.name == "armmakr") or (unitDef.name == "armfmkr") or (unitDef.name == "armmmkr")
              or (unitDef.name == "armuwmmm") or (unitDef.name == "cormakr") or (unitDef.name == "corfmkr")
              or (unitDef.name == "cormmkr") or (unitDef.name == "coruwmmm") then
        -- metal extractors and makers
        Spring.SetUnitDefIcon(unitDefId, "m.user")
      elseif ((unitDef.totalEnergyOut > 10) and (unitDef.speed <= 0)) then
        -- energy generators
        Spring.SetUnitDefIcon(unitDefId, "e.user")
      elseif (unitDef.isTransport) then
        -- transports
        Spring.SetUnitDefIcon(unitDefId, "diamond.user")
      elseif ((unitDef.minWaterDepth > 0) and (unitDef.speed > 0) and (unitDef.waterline > 12)) then
        -- submarines
        Spring.SetUnitDefIcon(unitDefId, "tri-down.user")
      elseif ((unitDef.minWaterDepth > 0) and (unitDef.speed > 0)) then
        -- ships
        Spring.SetUnitDefIcon(unitDefId, "hemi-down.user")
      elseif (((unitDef.radarRadius > 1) or (unitDef.sonarRadius > 1) or (unitDef.seismicRadius > 1))
              and (unitDef.speed <= 0) and (#unitDef.weapons <= 0)) then
        -- sensors
        Spring.SetUnitDefIcon(unitDefId, "hourglass-side.user")
      elseif (((unitDef.jammerRadius > 1) or (unitDef.sonarJamRadius > 1)) and (unitDef.speed <= 0)) then
        -- jammers
        Spring.SetUnitDefIcon(unitDefId, "hourglass.user")
      elseif (unitDef.isBuilding or (unitDef.speed <= 0)) then
        -- defenders and other buildings
        if (#unitDef.weapons <= 0) then
          Spring.SetUnitDefIcon(unitDefId, "square.user")
        else
          if unitDef.weapons[1].onlyTargets["vtol"] then
            Spring.SetUnitDefIcon(unitDefId, "slash.user")
          else
            Spring.SetUnitDefIcon(unitDefId, "x.user")
          end
        end
      else
        if (IsTech2Unit(unitDefId)) then
          Spring.SetUnitDefIcon(unitDefId, "sphere2.user")
        elseif (IsTech3Unit(unitDefId)) then
          Spring.SetUnitDefIcon(unitDefId, "sphere3.user")
        else
          Spring.SetUnitDefIcon(unitDefId, "sphere.user")
        end
      end
    end
  end
  
  -- Shrink scouts
  Spring.SetUnitDefIcon(UnitDefNames["corfav"].id, "tiny-sphere.user")
  Spring.SetUnitDefIcon(UnitDefNames["armfav"].id, "tiny-sphere.user")
  Spring.SetUnitDefIcon(UnitDefNames["corak"].id, "tiny-sphere.user")
  Spring.SetUnitDefIcon(UnitDefNames["armpw"].id, "tiny-sphere.user")
  Spring.SetUnitDefIcon(UnitDefNames["armflea"].id, "tiny-sphere.user")
  
  -- Walls
  Spring.SetUnitDefIcon(UnitDefNames["cordrag"].id, "tiny-square.user")
  Spring.SetUnitDefIcon(UnitDefNames["armdrag"].id, "tiny-square.user")
  Spring.SetUnitDefIcon(UnitDefNames["corfort"].id, "tiny-square.user")
  Spring.SetUnitDefIcon(UnitDefNames["armfort"].id, "tiny-square.user")
  Spring.SetUnitDefIcon(UnitDefNames["corfdrag"].id, "tiny-square.user")
  Spring.SetUnitDefIcon(UnitDefNames["armfdrag"].id, "tiny-square.user")

end

local function IsUnitProducedByAnyFactoryFromList(factories, unitDefId)
  if (factories and unitDefId) then
    for _, factory in pairs(factories) do
      local buildOptions = UnitDefNames[factory].buildOptions

      if (buildOptions) then
        for _, buildOption in pairs(buildOptions) do
          if (unitDefId == buildOption) then return true end
        end
      end
    end
  end
  return false
end

function IsTech2Unit(unitDefId)
  local t2factories = { "armalab", "armavp", "coralab", "coravp" }

  return IsUnitProducedByAnyFactoryFromList(t2factories, unitDefId)
end

function IsTech3Unit(unitDefId)
  local t3factories = { "armshltx", "armshltxuw", "corgant", "corgantuw" }

  return IsUnitProducedByAnyFactoryFromList(t3factories, unitDefId)
end



--------------------------------------------------------------------------------

