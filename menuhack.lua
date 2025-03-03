local player = game.Players.LocalPlayer
local playerGui = player:FindFirstChild("PlayerGui") or Instance.new("PlayerGui", player)
local screenGui = Instance.new("ScreenGui", playerGui)

-- Ana Menü Çerçevesi (Büyük ve Ortalanmış)
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0.6, 0, 0.7, 0) -- %60 genişlik, %70 yükseklik
frame.Position = UDim2.new(0.2, 0, 0.15, 0) -- Ekranın tam ortasında
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20) -- Dark tema
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true -- Menü taşınabilir
frame.Parent = screenGui

-- Başlık (Bytesman HUB Sol Üst)
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(0.3, 0, 0.08, 0) -- Küçük ve sol üstte
titleLabel.Position = UDim2.new(0.02, 0, 0.02, 0)
titleLabel.Text = "📛 Bytesman HUB"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextSize = 18
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.BackgroundTransparency = 1
titleLabel.Parent = frame

-- Menü Aç/Kapat Butonu ("-" ve "+")
local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0.08, 0, 0.08, 0) -- Küçük buton
toggleButton.Position = UDim2.new(0.92, 0, 0.02, 0) -- Sağ üst köşe
toggleButton.Text = "-"
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
toggleButton.Parent = frame

local isMinimized = false -- Menü küçültme durumu

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
