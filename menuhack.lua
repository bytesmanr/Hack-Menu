local player = game.Players.LocalPlayer
local playerGui = player:FindFirstChild("PlayerGui") or Instance.new("PlayerGui", player)
local screenGui = Instance.new("ScreenGui", playerGui)

-- Ana Menü Çerçevesi (Ortalanmış, Büyük)
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0.5, 0, 0.6, 0) -- %50 genişlik, %60 yükseklik
frame.Position = UDim2.new(0.25, 0, 0.2, 0) -- Tam ortalama
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20) -- Dark tema
frame.BorderSizePixel = 0
frame.Parent = screenGui

-- Başlık (Bytesman HUB + Monster İkonu)
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0.1, 0)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.Text = "📛 Bytesman HUB"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextSize = 28
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.BackgroundTransparency = 1
titleLabel.Parent = frame

-- Menü Aç/Kapat Butonu ("-" ve "+")
local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 50, 0, 50)
toggleButton.Position = UDim2.new(1, -55, 0, 5) -- Sağ üst köşe
toggleButton.Text = "-"
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
toggleButton.Parent = frame

local isMinimized = false -- Menü küçültme durumu

toggleButton.MouseButton1Click:Connect(function()
    if isMinimized then
        frame:TweenSize(UDim2.new(0.5, 0, 0.6, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.5, true)
        toggleButton.Text = "-"
    else
        frame:TweenSize(UDim2.new(0.5, 0, 0.05, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.5, true)
        toggleButton.Text = "+"
    end
    isMinimized = not isMinimized
end)
