-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "InfernalUI"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Create Draggable Frame
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 300, 0, 500)
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -250)
mainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
mainFrame.BackgroundTransparency = 0.3
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

-- Enable Scrolling
local scrollingFrame = Instance.new("ScrollingFrame")
scrollingFrame.Name = "ScrollingFrame"
scrollingFrame.Size = UDim2.new(1, 0, 1, 0)
scrollingFrame.CanvasSize = UDim2.new(0, 0, 3, 0) -- Increased to fit all buttons
scrollingFrame.ScrollBarThickness = 8
scrollingFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 200)
scrollingFrame.BackgroundTransparency = 0.4
scrollingFrame.BorderSizePixel = 0
scrollingFrame.Parent = mainFrame

-- Add Title
local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "TitleLabel"
titleLabel.Size = UDim2.new(1, 0, 0, 50)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.Text = "Infernal UI"
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 20
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 200)
titleLabel.BackgroundTransparency = 0.2
titleLabel.BorderSizePixel = 0
titleLabel.Parent = scrollingFrame

-- Function to create buttons dynamically
local function createButton(name, positionIndex, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0.9, 0, 0, 50) -- Consistent button size
    button.Position = UDim2.new(0.05, 0, 0, 60 * positionIndex) -- Dynamic Y position
    button.Text = name
    button.Font = Enum.Font.Gotham
    button.TextSize = 18
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.BackgroundColor3 = Color3.fromRGB(0, 0, 200)
    button.BackgroundTransparency = 0.3
    button.BorderSizePixel = 0
    button.Parent = scrollingFrame
    button.MouseButton1Click:Connect(callback)
    return button
end

-- Create Buttons
local buttons = {
    { name = "Bang V2", callback = function()
        local character = game.Players.LocalPlayer.Character
        if character and character:FindFirstChild("Humanoid") then
            local rigType = character.Humanoid.RigType
            if rigType == Enum.HumanoidRigType.R15 then
                loadstring(game:HttpGet("https://pastebin.com/raw/1ePMTt9n"))()
            elseif rigType == Enum.HumanoidRigType.R6 then
                loadstring(game:HttpGet("https://pastebin.com/raw/aPSHMV6K"))()
            end
        else
            warn("Character or Humanoid not found!")
        end
    end },
    { name = "fe neko girl", callback = function()
        local DisableFlingHealthBar = false
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Neko"))()
    end },
    { name = "fe ak 47", callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/AK-47"))()
    end },
    { name = "Cool Gunz", callback = function()
        loadstring(game:HttpGet("https://paste.ee/r/bXruF/0"))()
    end }
}

-- Dynamically position buttons
for index, buttonData in ipairs(buttons) do
    createButton(buttonData.name, index, buttonData.callback)
end

-- Add Toggleable Cube
local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 30, 0, 30)
toggleButton.Position = UDim2.new(1, -40, 0, 10)
toggleButton.Text = "X"
toggleButton.Font = Enum.Font.GothamBold
toggleButton.TextSize = 14
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.BackgroundColor3 = Color3.fromRGB(0, 0, 200)
toggleButton.BackgroundTransparency = 0.2
toggleButton.BorderSizePixel = 0
toggleButton.Parent = mainFrame

-- Toggle GUI visibility
local guiVisible = true
toggleButton.MouseButton1Click:Connect(function()
    guiVisible = not guiVisible
    mainFrame.Visible = guiVisible
end)
