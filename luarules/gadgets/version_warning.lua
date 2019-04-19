function gadget:GetInfo()
  return {
    name      = "Version Warning",
    desc      = "Prints a warning if engine version is too low/high",
    author    = "Bluestone",
    date      = "Horses",
    license   = "",
    layer     = math.huge,
    enabled   = true  --  loaded by default?
  }
end

if (gadgetHandler:IsSyncedCode()) then
	return
end

minEngineVersion = { -- version comparison uses *strict* inequality
	[1] = 104,
	[2] = 0,
	[3] = 1,
	[4] = 1200,
}

maxEngineVersion = { 
	[1] = 104,
	[2] = 0,
	[3] = 1,
	[4] = 5000,
}

engineBranches = {
	["maintenance"] = true,
	["master"] = true,
}


local red = "\255\255\1\1"

function Split(s, separator)
	local results = {}
	for part in s:gmatch("[^"..separator.."]+") do
		results[#results + 1] = part
	end
	return results
end

function printEngineVersion(t)
	if t[4] > 0 then
		return "Spring " .. tostring(t[1]) .. "." .. tostring(t[2]) .. "." .. tostring(t[3]) .. "-" .. tostring(t[4])
	end
	return "Spring " .. tostring(t[1])
end

function printEngineBranches(t)
	branches = ""
	for branch in pairs(engineBranches) do
		branches = branches .. " " .. branch
	end
	return branches
end

function gadget:GameStart()
	engineVersion = {[1]=0,[2]=0,[3]=1,[4]=0}
	if Engine and Engine.version then
		engineVersion = Split(Engine.version, '-. ')
	end
	
	engineVersion[1] = engineVersion[1] and tonumber(engineVersion[1]) or 0
	engineVersion[2] = engineVersion[2] and tonumber(engineVersion[2]) or 0 
	engineVersion[3] = engineVersion[3] and tonumber(engineVersion[3]) or 1 -- hack to pass   stable version numbers
	engineVersion[4] = engineVersion[4] and tonumber(engineVersion[4]) or 0
	-- 5 is commit hash 
	engineBranch = engineVersion[6] or "master"
	
	if not engineBranches[engineBranch] then
		Spring.Echo(red .. "WARNING: YOU ARE USING SPRING " .. Engine.version .. " WHICH IS NOT SUPPORTED BY THIS GAME.")
		Spring.Echo(red .. "Please use Spring " .. printEngineVersion(minEngineVersion) .. " - " .. printEngineVersion(maxEngineVersion) .. " (branches:" .. printEngineBranches(engineBranches) .. ").")	
		return
	end

	result = 0
	for i=1,4 do
		if engineVersion[i] > maxEngineVersion[i] then
			result = 1
			break
		elseif engineVersion[i] < minEngineVersion[i] then
			result = -1
			break
		end
	end
	
	if result == -1 then
		Spring.Echo(red .. "WARNING: YOU ARE USING SPRING " .. Engine.version .. " WHICH IS TOO OLD FOR THIS GAME.")
		Spring.Echo(red .. "Please update your Spring engine to " .. printEngineVersion(minEngineVersion) .. " - " .. printEngineVersion(maxEngineVersion) .. " (branches: " .. printEngineBranches(engineBranches) .. ").")
	elseif result == 1 then
		Spring.Echo(red .. "WARNING: YOU ARE USING SPRING " .. Engine.version .. " WHICH IS TOO RECENT FOR THIS GAME.")
		Spring.Echo(red .. "Please downgrade your Spring engine to " .. printEngineVersion(minEngineVersion) .. " - " .. printEngineVersion(maxEngineVersion) .. " (branches: " .. printEngineBranches(engineBranches) .. ").")
	end           
end




--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
