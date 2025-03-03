-- Değişkenler
local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player.PlayerGui

-- Menü Çerçevesi (Dark Tema)
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 250, 0, 150)  -- Menü boyutları
frame.Position = UDim2.new(0, 20, 0, 20)  -- Sol üstte
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)  -- Dark tema
frame.BackgroundTransparency = 0.8
frame.Parent = screenGui
frame.Visible = true  -- Başlangıçta menü görünür

-- Menü Başlığı (Bytesman HUB)
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(0, 220, 0, 50)
titleLabel.Position = UDim2.new(0, 15, 0, 10)
titleLabel.Text = "Bytesman HUB"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextSize = 24
titleLabel.BackgroundTransparency = 1
titleLabel.Parent = frame

-- Monster İkonu (Yanında)
local monsterIcon = Instance.new("ImageLabel")
monsterIcon.Size = UDim2.new(0, 30, 0, 30)
monsterIcon.Position = UDim2.new(0, 180, 0, 15)
monsterIcon.Image = "rbxassetid://10012125913"  -- Monster ikonu için Roblox Asset ID
monsterIcon.BackgroundTransparency = 1
monsterIcon.Parent = frame

-- Menü Açma/Kapama Butonu
local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 100, 0, 40)
toggleButton.Position = UDim2.new(0, 15, 0, 70)
toggleButton.Text = "Aç/Kapat"
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
toggleButton.Parent = frame

-- Menü Açma/Kapama Fonksiyonu
local menuVisible = true
local function toggleMenu()
    menuVisible = not menuVisible
    frame.Visible = menuVisible
end

-- Menü açma/kapama butonuna tıklanıldığında menüyü göster veya gizle
toggleButton.MouseButton1Click:Connect(toggleMenu)
