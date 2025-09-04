-- Gui Teleport Safe by RatRoblox

-- Services
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local HRP = player.Character:WaitForChild("HumanoidRootPart")

-- Saved coordinates table
local saves = {}

-- ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "TeleportGui"
ScreenGui.Parent = game.CoreGui

-- Main Frame
local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 250, 0, 300)
Frame.Position = UDim2.new(0.05, 0, 0.2, 0)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true
Frame.Parent = ScreenGui

-- Title
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Title.Text = "Teleport GUI - by RatRoblox"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Parent = Frame

-- Minimize Button
local Minimize = Instance.new("TextButton")
Minimize.Size = UDim2.new(0, 30, 0, 30)
Minimize.Position = UDim2.new(1, -30, 0, 0)
Minimize.Text = "-"
Minimize.Parent = Frame

-- Circle when minimized
local CircleBtn = Instance.new("TextButton")
CircleBtn.Size = UDim2.new(0, 50, 0, 50)
CircleBtn.Position = UDim2.new(0, 0, 0.5, -25)
CircleBtn.Text = "by\nRatRoblox"
CircleBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
CircleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CircleBtn.Visible = false
CircleBtn.Parent = ScreenGui

-- Scroll for saves
local Scroll = Instance.new("ScrollingFrame")
Scroll.Size = UDim2.new(1, -10, 1, -60)
Scroll.Position = UDim2.new(0, 5, 0, 40)
Scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
Scroll.ScrollBarThickness = 5
Scroll.BackgroundTransparency = 1
Scroll.Parent = Frame

-- Add button
local AddBtn = Instance.new("TextButton")
AddBtn.Size = UDim2.new(1, -10, 0, 30)
AddBtn.Position = UDim2.new(0, 5, 1, -35)
AddBtn.Text = "+ Dodaj save"
AddBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
AddBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
AddBtn.Parent = Frame

-- Functions
local function refreshList()
    Scroll:ClearAllChildren()
    local y = 0
    for name, coords in pairs(saves) do
        local Btn = Instance.new("TextButton")
        Btn.Size = UDim2.new(1, -10, 0, 30)
        Btn.Position = UDim2.new(0, 5, 0, y)
        Btn.Text = name
        Btn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
        Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        Btn.Parent = Scroll

        Btn.MouseButton1Click:Connect(function()
            HRP.CFrame = coords
        end)

        local Remove = Instance.new("TextButton")
        Remove.Size = UDim2.new(0, 30, 0, 30)
        Remove.Position = UDim2.new(1, -35, 0, 0)
        Remove.Text = "X"
        Remove.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
        Remove.TextColor3 = Color3.fromRGB(255, 255, 255)
        Remove.Parent = Btn

        Remove.MouseButton1Click:Connect(function()
            saves[name] = nil
            refreshList()
        end)

        y = y + 35
    end
    Scroll.CanvasSize = UDim2.new(0, 0, 0, y)
end

-- Add save
AddBtn.MouseButton1Click:Connect(function()
    local name = "Safe_" .. tostring(#(Scroll:GetChildren()))
    saves[name] = HRP.CFrame
    refreshList()
end)

-- Minimize logic
Minimize.MouseButton1Click:Connect(function()
    Frame.Visible = false
    CircleBtn.Visible = true
end)

CircleBtn.MouseButton1Click:Connect(function()
    Frame.Visible = true
    CircleBtn.Visible = false
end)
