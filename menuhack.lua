local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:WaitForChild("HumanoidRootPart")
local flying = false
local flySpeed = 50
local bodyVelocity, bodyGyro

local playerGui = player:FindFirstChild("PlayerGui") or Instance.new("PlayerGui", player)
local screenGui = Instance.new("ScreenGui", playerGui)

-- Ana Menü
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0.6, 0, 0.7, 0)
frame.Position = UDim2.new(0.2, 0, 0.15, 0)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Parent = screenGui

-- Başlık (Bytesman HUB)
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(0.2, 0, 0.06, 0)
titleLabel.Position = UDim2.new(0.01, 0, 0.01, 0)
titleLabel.Text = "Bytesman HUB"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextSize = 16
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.BackgroundTransparency = 1
titleLabel.Parent = frame

-- Menü Aç/Kapat Butonu ("-" ve "+")
local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0.1, 0, 0.08, 0)
toggleButton.Position = UDim2.new(0.88, 0, 0.01, 0)
toggleButton.Text = "-"
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.TextSize = 20
toggleButton.Font = Enum.Font.SourceSansBold
toggleButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
toggleButton.Parent = frame

-- Fly Aç/Kapat Butonu
local flyButton = Instance.new("TextButton")
flyButton.Size = UDim2.new(0.05, 0, 0.05, 0)
flyButton.Position = UDim2.new(0.01, 0, 0.1, 0)
flyButton.Text = ""
flyButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Kırmızı (Kapalı)
flyButton.Parent = frame

local flyLabel = Instance.new("TextLabel")
flyLabel.Size = UDim2.new(0.12, 0, 0.05, 0)
flyLabel.Position = UDim2.new(0.07, 0, 0.1, 0)
flyLabel.Text = "Fly"
flyLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
flyLabel.TextSize = 18
flyLabel.Font = Enum.Font.SourceSansBold
flyLabel.BackgroundTransparency = 1
flyLabel.Parent = frame

-- Hız Artırma Butonu
local speedUp = Instance.new("TextButton")
speedUp.Size = UDim2.new(0.05, 0, 0.05, 0)
speedUp.Position = UDim2.new(0.18, 0, 0.1, 0)
speedUp.Text = "+"
speedUp.TextColor3 = Color3.fromRGB(255, 255, 255)
speedUp.TextSize = 20
speedUp.Font = Enum.Font.SourceSansBold
speedUp.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
speedUp.Parent = frame

-- Hız Azaltma Butonu
local speedDown = Instance.new("TextButton")
speedDown.Size = UDim2.new(0.05, 0, 0.05, 0)
speedDown.Position = UDim2.new(0.24, 0, 0.1, 0)
speedDown.Text = "-"
speedDown.TextColor3 = Color3.fromRGB(255, 255, 255)
speedDown.TextSize = 20
speedDown.Font = Enum.Font.SourceSansBold
speedDown.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
speedDown.Parent = frame

-- Fly Aç/Kapat Fonksiyonu
local function toggleFly()
    if flying then
        -- Fly kapatma
        if bodyVelocity then bodyVelocity:Destroy() end
        if bodyGyro then bodyGyro:Destroy() end
        humanoid.PlatformStand = false
        flying = false
        flyButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Kırmızı (Kapalı)
    else
        -- Fly açma
        bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
        bodyVelocity.Velocity = Vector3.new(0, 0, 0)
        bodyVelocity.Parent = rootPart

        bodyGyro = Instance.new("BodyGyro")
        bodyGyro.MaxTorque = Vector3.new(400000, 400000, 400000)
        bodyGyro.CFrame = rootPart.CFrame
        bodyGyro.Parent = rootPart

        humanoid.PlatformStand = true
        flying = true
        flyButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Yeşil (Açık)

        -- Hareket Kontrolleri
        game:GetService("RunService").RenderStepped:Connect(function()
            if flying then
                local moveDirection = humanoid.MoveDirection
                bodyVelocity.Velocity = moveDirection * flySpeed
                bodyGyro.CFrame = rootPart.CFrame
            end
        end)
    end
end

flyButton.MouseButton1Click:Connect(toggleFly)

-- Hız Artırma Fonksiyonu
speedUp.MouseButton1Click:Connect(function()
    flySpeed = flySpeed + 10
end)

-- Hız Azaltma Fonksiyonu
speedDown.MouseButton1Click:Connect(function()
    if flySpeed > 10 then
        flySpeed = flySpeed - 10
    end
end)

-- Menü Aç/Kapat Fonksiyonu
local isMinimized = false
toggleButton.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    if isMinimized then
        frame.Size = UDim2.new(0.15, 0, 0.06, 0)
        toggleButton.Text = "+"
    else
        frame.Size = UDim2.new(0.6, 0, 0.7, 0)
        toggleButton.Text = "-"
    end
end)
