-- Roblox Studio'da LocalScript içinde kullanın

-- Menü öğelerini oluştur
local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 300)
frame.Position = UDim2.new(0, 10, 0, 50)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30) -- Dark tema
frame.Parent = screenGui
frame.ClipsDescendants = true  -- İçeriğin taşmasını engelle

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 40)
titleLabel.Text = "BytesHUB"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.BackgroundTransparency = 1
titleLabel.TextSize = 24
titleLabel.TextAlign = Enum.TextAlign.Center
titleLabel.Parent = frame

local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 40, 0, 40)
toggleButton.Position = UDim2.new(1, -50, 0, 10)  -- Sağ üstte olacak
toggleButton.Text = "+"
toggleButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.TextSize = 30
toggleButton.Parent = frame

-- Menü içeriği
local menuContent = Instance.new("Frame")
menuContent.Size = UDim2.new(1, 0, 1, -40)  -- Menü içeriği
menuContent.Position = UDim2.new(0, 0, 0, 40)
menuContent.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
menuContent.Visible = false  -- Başlangıçta gizli
menuContent.Parent = frame

-- Menü içerisine örnek bir etkileşim ekleyelim
local label = Instance.new("TextLabel")
label.Size = UDim2.new(1, 0, 0, 60)
label.Text = "Örnek Menü Elemanı"
label.TextColor3 = Color3.fromRGB(255, 255, 255)
label.BackgroundTransparency = 1
label.TextSize = 20
label.TextAlign = Enum.TextAlign.Center
label.Parent = menuContent

-- Menü açma/kapatma işlevselliği
local menuOpen = false
toggleButton.MouseButton1Click:Connect(function()
    menuOpen = not menuOpen
    if menuOpen then
        menuContent.Visible = true
        toggleButton.Text = "-"
    else
        menuContent.Visible = false
        toggleButton.Text = "+"
    end
end)

-- Menü taşınabilir hale getirme
local dragging = false
local dragStart = nil
local startPos = nil

frame.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position
    end
end)

frame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

frame.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
