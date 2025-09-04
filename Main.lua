-- Universal Remote Menu - Delta Executor
-- Autor: ChatGPT dla Diwi

-- Usuwamy stare GUI jeśli istnieje
if game.CoreGui:FindFirstChild("UniversalRemoteMenu") then
    game.CoreGui.UniversalRemoteMenu:Destroy()
end

local gui = Instance.new("ScreenGui")
gui.Name = "UniversalRemoteMenu"
gui.Parent = game.CoreGui
gui.ResetOnSpawn = false

-- Przycisk otwierania/zamykania
local toggleMain = Instance.new("TextButton")
toggleMain.Size = UDim2.new(0, 120, 0, 40)
toggleMain.Position = UDim2.new(0, 20, 0, 200)
toggleMain.BackgroundColor3 = Color3.fromRGB(0,170,255)
toggleMain.Text = "Open Menu"
toggleMain.TextColor3 = Color3.fromRGB(255,255,255)
toggleMain.Parent = gui

-- Frame główny
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 320, 0, 200)
frame.Position = UDim2.new(0.5, -160, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(40,40
  ,40)
