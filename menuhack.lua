-- Fly Özelliği ve Menü Kontrolü Scripti (ScriptBlox için)

-- Değişkenler
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local flying = false
local bodyVelocity = nil

-- Menü GUI Elemanları
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player.PlayerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 250, 0, 300)
frame.Position = UDim2.new(0, 20, 0, 20)
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame.BackgroundTransparency = 0.5
frame.Parent = screenGui
frame.Visible = false  -- Başlangıçta menü gizli olacak

-- Menünün Başlığı
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(0, 250, 0, 50)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.Text = "BytesHUB"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextSize = 24
titleLabel.BackgroundTransparency = 1
titleLabel.Parent = frame

-- Fly Butonu
local flyButton = Instance.new("TextButton")
flyButton.Size = UDim2.new(0, 220, 0, 50)
flyButton.Position = UDim2.new(0, 15, 0, 60)
flyButton.Text = "Fly Aç"
flyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
flyButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
flyButton.Parent = frame

-- Menü Açma-Kapama Butonu
local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 100, 0, 50)
toggleButton.Position = UDim2.new(0, 15, 0, 120)
toggleButton.Text = "Aç/Kapat"
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
toggleButton.Parent = frame

-- Fly Açma ve Kapama Fonksiyonu
local function toggleFly()
    if flying then
        -- Fly kapama
        if bodyVelocity then
            bodyVelocity:Destroy()
            bodyVelocity = nil
        end
        humanoid.PlatformStand = false
        flying = false
        flyButton.Text = "Fly Aç"
    else
        -- Fly açma
        bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
        bodyVelocity.Velocity = Vector3.new(0, 50, 0)  -- Uçma hızı
        bodyVelocity.Parent = character.HumanoidRootPart
        humanoid.PlatformStand = true
        flying = true
        flyButton.Text = "Fly Kapat"
    end
end

-- Menü Açma ve Kapatma Fonksiyonu
local menuVisible = false
local function toggleMenu()
    menuVisible = not menuVisible
    frame.Visible = menuVisible
end

-- Menü açma/kapama butonuna tıklanıldığında menüyü göster veya gizle
toggleButton.MouseButton1Click:Connect(toggleMenu)

-- Fly butonuna tıklanıldığında fly özelliğini açıp kapat
flyButton.MouseButton1Click:Connect(toggleFly)
