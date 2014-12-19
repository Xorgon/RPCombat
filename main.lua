-- The primary scripting file.

-- Take turn

-- DM Encounter screen

-- Add Mobs
function addMob(previousFrame)
previousFrame:Hide()
local frame = newFrame("Add Mob",250,8)
local function returnToCreate()
createEncounter(frame))
end
rpcMobDiffs = {}
rpcMobRTs = {}
local inputBoxText = newText(210, "Mob name", frame, 8)
local inputBox = newInputBox(210, frame, 7)
local mobDiffText = newText(210, "Mob difficulty", frame, 6)
local mobDiff = newSlider(210, 1, 20, 10, frame, 5)
local mobRTText = newText(210, "Raid target icon", frame, 4)
local mobRT = newDropDown(210, {"Skull", "Cross", "Circle", "Star", "Square", "Triangle", "Diamond", "Moon"}, frame, 3)
local function saveMob()
local mobName = inputBoxText:GetText()
rpcMobDiffs[mobName] = round(slider:GetValue())
rpcMobRTs[mobName] = mobRT.value()
returnToCreate()
end
local save = newButton("Save", 210, frame, saveMob, 2)
local cancel = newButton("Cancel", 210, frame, returnToCreate, 1)
end

-- Create encounter
function createEncounter(previousFrame)
previousFrame:Hide()
local frame = newFrame("Create Encounter",180,2)
local function clickStart()
end
local startButton = newButton("Start encounter", 120, frame, nil, 1) -- TODO: Set the function for this.
local function clickAddMob()
addMob(frame)
end
local addMobButton = newButton("Add Mob", 120, frame, clickAddMob, 2)

end
-- Command
SLASH_RPC1 = '/rpc'
function SlashCmdList.RPC(msg, editbox)
local frame = newFrame("RPCombat", 180, 1)
local function click()
createEncounter(frame)
end
local button = newButton("Create encounter", 120, frame, click, 1)
end

print("main loaded.")
