function round(x)
  return x>=0 and math.floor(x+0.5) or math.ceil(x-0.5)
end

function newFrame(title,width,buttons)
local height = (buttons * 38) + 28
-- The main frame.
local frame = CreateFrame("Frame","pane",UIParent,"BasicFrameTemplate")
frame:SetPoint("CENTER",0,0)
frame:SetWidth(width)
frame:SetHeight(height)
frame:SetMovable(true)
frame:EnableMouse(true)

-- The region that allows the main frame to be dragged.
local region = frame:CreateTitleRegion()
region:SetPoint("CENTER",0,0)
region:SetWidth(width)
region:SetHeight(height)
region:SetParent(frame)

-- The title text.
local text = CreateFrame("Frame","title",frame)
text:SetHeight(50)
text:SetWidth(width-30)
text.text = text:CreateFontString(nil,nil, "GameFontNormal")
text.text:SetAllPoints()
text:SetPoint("CENTER", -15 , ((height/2) - 12))

-- Sets the text for the title text.
function textMessage(title)
  text.text:SetText(title);
  text:Show()
end
textMessage(title)
return frame
end

-- Creates a new button.
function newButton(text, width, parent, onClick, buttonNo)
local button = CreateFrame("Button",nil,parent,"UIPanelButtonTemplate")
button:SetWidth(width)
button:SetHeight(28)
button:SetText(text)
button:SetPoint("CENTER",0, ((38 * buttonNo) - (parent:GetHeight() * 0.5) - 14))
button:SetScript("OnClick", onClick) -- OnClick must exist before creating the button.
return button
end

-- Creates a new input box.
function newInputBox(width, parent, boxNo)
local box = CreateFrame("EditBox", nil, parent, "InputBoxTemplate")
box:SetWidth(width)
box:SetHeight(28)
box:SetPoint("CENTER",0, ((38 * boxNo) - (parent:GetHeight() * 0.5) - 14))
local function onEnter()
box:ClearFocus()
end
box:SetScript("OnEnterPressed", onEnter) -- onEnter must exist before creating the button.
return box
end

-- Creates a new drop down menu.
function newDropDown(width, items, parent, boxNo)
if not DropDownMenuTest then
   CreateFrame("Button", "DropDownMenuTest", parent, "UIDropDownMenuTemplate")
end
 
DropDownMenuTest:ClearAllPoints()
DropDownMenuTest:SetPoint("CENTER", 0, ((38 * boxNo) - (parent:GetHeight() * 0.5) - 14))
DropDownMenuTest:Show()
 
local function OnClick(self)
   UIDropDownMenu_SetSelectedID(DropDownMenuTest, self:GetID())
end
 
local function initialize(self, level)
   local info = UIDropDownMenu_CreateInfo()
   for k,v in pairs(items) do
      info = UIDropDownMenu_CreateInfo()
      info.text = v
      info.value = v
      info.func = OnClick
      UIDropDownMenu_AddButton(info, level)
   end
end
 
 
UIDropDownMenu_Initialize(DropDownMenuTest, initialize)
UIDropDownMenu_SetWidth(DropDownMenuTest, 100);
UIDropDownMenu_SetButtonWidth(DropDownMenuTest, 124)
UIDropDownMenu_SetSelectedID(DropDownMenuTest, 1)
UIDropDownMenu_JustifyText(DropDownMenuTest, "LEFT")
return dropDown
end

-- Creates a new text frame.
function newText(width, boxText, parent, boxNo)
local text = CreateFrame("Frame","title",parent)
text:SetHeight(28)
text:SetWidth(width)
text.text = text:CreateFontString(nil,nil, "GameFontNormal")
text.text:SetAllPoints()
text:SetPoint("CENTER", 0, ((38 * boxNo) - (parent:GetHeight() * 0.5) - 14))
text.text:SetText(boxText);
text:Show()
end

-- Creates a new slider.
function newSlider(width, minValue, maxValue, initial, parent, boxNo)
local slider = CreateFrame("Slider", nil, parent, "OptionsSliderTemplate")
slider:SetMinMaxValues(minValue, maxValue)
slider:SetWidth(width)
slider:SetHeight(28)
slider:SetPoint("CENTER",0, ((38 * boxNo) - (parent:GetHeight() * 0.5) - 14))
slider:SetValue(initial)
local text = CreateFrame("Frame","title",slider)
text:SetHeight(28)
text:SetWidth(width)
text.text = text:CreateFontString(nil,nil, "GameFontNormal")
text.text:SetAllPoints()
text:SetPoint("CENTER", 0, 0)
text.text:SetText(round(slider:GetValue()));
text:Show()
local function onSliderUpdate()
text.text:SetText(round(slider:GetValue()));
text:Show()
end
slider:SetScript("OnValueChanged", onSliderUpdate)
return slider
end
print("frameTemplate loaded.")