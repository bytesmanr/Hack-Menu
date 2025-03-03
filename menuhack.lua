local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local flying = false
local bodyVelocity = nil

local playerGui = player:FindFirstChild("PlayerGui") or Instance.new("PlayerGui", player)
local screenGui = Instance.new("ScreenGui", playerGui)

-- Ana Menü Çerçevesi
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0.6, 0, 0.7, 0)
frame.Position = UDim2.new(0.2, 0, 0.15, 0)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Parent = screenGui

-- Başlık (Bytesman HUB Sol Üst)
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(0.3, 0, 0.08, 0)
titleLabel.Position = UDim2.new(0.02, 0, 0.02, 0)
titleLabel.Text = "📛 Bytesman HUB"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextSize = 18
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.BackgroundTransparency = 1
titleLabel.Parent = frame

-- Menü Aç/Kapat Butonu ("-" ve "+")
local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0.08, 0, 0.08, 0)
toggleButton.Position = UDim2.new(0.92, 0, 0.02, 0)
toggleButton.Text = "-"
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
toggleButton.Parent = frame

-- Fly Aç/Kapat Butonu
local flyButton = Instance.new("TextButton")
flyButton.Size = UDim2.new(0.9, 0, 0.1, 0)
flyButton.Position = UDim2.new(0.05, 0, 0.15, 0)
flyButton.Text = "Fly Aç"
flyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
flyButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Kırmızı (Kapalı)
flyButton.Parent = frame

-- Fly Aç/Kapat Fonksiyonu
local function toggleFly()
    if flying then
        -- Fly kapatma
        if bodyVelocity then
            bodyVelocity:Destroy()
            bodyVelocity = nil
        end
        humanoid.PlatformStand = false
        flying = false
        flyButton.Text = "Fly Aç"
        flyButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Kırmızı (Kapalı)
    else
        -- Fly açma
        bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
        bodyVelocity.Velocity = Vector3.new(0, 50, 0) -- Yükseğe uçma
        bodyVelocity.Parent = character.HumanoidRootPart
        humanoid.PlatformStand = true
        flying = true
        flyButton.Text = "Fly Kapat"
        flyButton.BackgroundColor3 = Color3.fromRGB(0, 0, 255) -- Mavi (Açık)
    end
end

flyButton.MouseButton1Click:Connect(toggleFly)

-- Menü Aç/Kapat Fonksiyonu
local isMinimized = false
toggleButton.MouseButton1Click:Connect(function()
    if isMinimized then
        frame:TweenSize(UDim2.new(0.6, 0, 0.7, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.5, true)
        toggleButton:TweenSize(UDim2.new(0.08, 0, 0.08, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.5, true)
        toggleButton.Text = "-"
    else
        frame:TweenSize(UDim2.new(0.6, 0, 0.05, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.5, true)
        toggleButton:TweenSize(UDim2.new(0.08, 0, 0.05, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.5, true)
        toggleButton.Text = "+"
    end
    isMinimized = not isMinimized
end)
