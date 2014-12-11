function newFrame(title,width,height)
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
text:SetWidth(50)
text.text = text:CreateFontString(nil,nil, "GameFontNormal")
text.text:SetAllPoints()
text:SetPoint("CENTER", -15 , (height/2 - 12))

-- Sets the text for the title text.
function textMessage(title)
  text.text:SetText(title);
  text:Show()
end
textMessage(title)
return frame
end

-- Creates a new button.
function newButton(text, width, height, parent, onClick)
local button = CreateFrame("Button",nil,parent,"UIPanelButtonTemplate")
button:SetPoint("CENTER",0,0)
button:SetWidth(width)
button:SetHeight(height)
button:SetText(text)
button:SetScript("OnClick", onClick) -- OnClick must exist before creating the button.
return button
end

print("frameTemplate loaded.")