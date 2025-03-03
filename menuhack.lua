local player = game.Players.LocalPlayer
local screenGui = script.Parent
local menu = screenGui:WaitForChild("BytesHUB")
local inputBox = menu:WaitForChild("InputBox")
local teleportButton = menu:WaitForChild("TeleportButton")
local closeButton = menu:WaitForChild("CloseButton")
local minimizeButton = menu:WaitForChild("MinimizeButton")
local maximizeButton = menu:WaitForChild("MaximizeButton")

local menuSize = 300 -- Başlangıç menü boyutu
local minimized = false -- Menü küçük mü?
local isOpen = true -- Menü açık mı?

-- Menü boyutlandırma (küçültme ve büyütme)
minimizeButton.MouseButton1Click:Connect(function()
    if not minimized then
        menu.Size = UDim2.new(0, menuSize, 0, 50) -- Küçült
        minimized = true
    else
        menu.Size = UDim2.new(0, menuSize, 0, menuSize) -- Büyüt
        minimized = false
    end
end)

-- Menü açma/kapama
closeButton.MouseButton1Click:Connect(function()
    if isOpen then
        menu.Visible = false
        isOpen = false
    else
        menu.Visible = true
        isOpen = true
    end
end)

-- Teleport işlevi
teleportButton.MouseButton1Click:Connect(function()
    local targetName = inputBox.Text
    local targetPlayer = game.Players:FindFirstChild(targetName) -- İsimle oyuncuyu bul
    
    if targetPlayer then
        -- Hedef oyuncu bulunduysa, kendini ona teleporte et
        player.Character:WaitForChild("HumanoidRootPart").CFrame = targetPlayer.Character:WaitForChild("HumanoidRootPart").CFrame
    else
        -- Eğer oyuncu bulunamazsa, bir uyarı verebiliriz (opsiyonel)
        print("Bu isimde bir oyuncu bulunamadı!")
    end
end)

-- Menü hareket ettirme
local dragging = false
local dragInput
local dragStart
local startPos

menu.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = menu.Position
    end
end)

menu.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        menu.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

menu.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)
