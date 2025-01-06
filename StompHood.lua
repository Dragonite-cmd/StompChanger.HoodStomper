local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TitleLabel = Instance.new("TextLabel")
local CurrentEffectInput = Instance.new("TextBox")
local DesiredEffectInput = Instance.new("TextBox")
local LoadButton = Instance.new("TextButton")
local ResetButton = Instance.new("TextButton")
local CloseButton = Instance.new("TextButton")
local InfoButton = Instance.new("TextButton")
local InfoLabel = Instance.new("TextLabel")
ScreenGui.Parent = player:WaitForChild("PlayerGui")
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Size = UDim2.new(0.3, 0, 0.4, 0)
MainFrame.Position = UDim2.new(0.35, 0, 0.3, 0)
MainFrame.Active = true
MainFrame.Draggable = true
TitleLabel.Parent = MainFrame
TitleLabel.Text = "Hood Stomper"
TitleLabel.Font = Enum.Font.SourceSansBold
TitleLabel.TextSize = 20
TitleLabel.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
TitleLabel.Size = UDim2.new(1, 0, 0.15, 0)
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
CurrentEffectInput.Parent = MainFrame
CurrentEffectInput.PlaceholderText = "Enter Current Stomp Effect"
CurrentEffectInput.Font = Enum.Font.SourceSans
CurrentEffectInput.TextSize = 14
CurrentEffectInput.Size = UDim2.new(0.8, 0, 0.15, 0)
CurrentEffectInput.Position = UDim2.new(0.1, 0, 0.2, 0)
DesiredEffectInput.Parent = MainFrame
DesiredEffectInput.PlaceholderText = "Enter Desired Stomp Effect"
DesiredEffectInput.Font = Enum.Font.SourceSans
DesiredEffectInput.TextSize = 14
DesiredEffectInput.Size = UDim2.new(0.8, 0, 0.15, 0)
DesiredEffectInput.Position = UDim2.new(0.1, 0, 0.4, 0)
LoadButton.Parent = MainFrame
LoadButton.Text = "Load Stomp Effect"
LoadButton.Font = Enum.Font.SourceSansBold
LoadButton.TextSize = 16
LoadButton.Size = UDim2.new(0.8, 0, 0.15, 0)
LoadButton.Position = UDim2.new(0.1, 0, 0.6, 0)
LoadButton.BackgroundColor3 = Color3.fromRGB(50, 150, 50)
LoadButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ResetButton.Parent = MainFrame
ResetButton.Text = "Reset Stomp Changes"
ResetButton.Font = Enum.Font.SourceSansBold
ResetButton.TextSize = 16
ResetButton.Size = UDim2.new(0.8, 0, 0.15, 0)
ResetButton.Position = UDim2.new(0.1, 0, 0.8, 0)
ResetButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
ResetButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.Parent = MainFrame
CloseButton.Text = "X"
CloseButton.Font = Enum.Font.SourceSansBold
CloseButton.TextSize = 16
CloseButton.Size = UDim2.new(0.15, 0, 0.15, 0)
CloseButton.Position = UDim2.new(0.85, 0, 0, 0)
CloseButton.BackgroundColor3 = Color3.fromRGB(150, 50, 50)
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
InfoButton.Parent = MainFrame
InfoButton.Text = "Info"
InfoButton.Font = Enum.Font.SourceSansBold
InfoButton.TextSize = 16
InfoButton.Size = UDim2.new(0.2, 0, 0.15, 0)
InfoButton.Position = UDim2.new(0.4, 0, 0.9, 0)
InfoButton.BackgroundColor3 = Color3.fromRGB(50, 50, 150)
InfoButton.TextColor3 = Color3.fromRGB(255, 255, 255)
InfoLabel.Parent = ScreenGui
InfoLabel.Text = "More Stomps Coming Soon!"
InfoLabel.Font = Enum.Font.SourceSansBold
InfoLabel.TextSize = 20
InfoLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
InfoLabel.BackgroundTransparency = 1
InfoLabel.Position = UDim2.new(0.4, 0, 0.05, 0)
InfoLabel.Visible = false
local originalNames = {}
local folder = ReplicatedStorage:FindFirstChild("KillFX")
local function showMessage(message)
    game.StarterGui:SetCore("SendNotification", {
        Title = "Hood Stomper",
        Text = message,
        Duration = 5,
    })
end
LoadButton.MouseButton1Click:Connect(function()
    local currentEffect = CurrentEffectInput.Text
    local desiredEffect = DesiredEffectInput.Text

    if not folder then
        showMessage("KillFX folder not found!")
        return
    end
    local currentModule = folder:FindFirstChild(currentEffect)
    if currentModule and currentModule:IsA("ModuleScript") then
        originalNames[currentEffect] = currentModule.Name
        currentModule.Name = "uwu"
    else
        showMessage("Current stomp effect not found!")
        return
    end

    local desiredModule = folder:FindFirstChild(desiredEffect)
    if desiredModule and desiredModule:IsA("ModuleScript") then
        desiredModule.Name = currentEffect
        showMessage("Stomp effect loaded successfully!")
    else
        showMessage("Desired stomp effect not found!")
    end
end)
ResetButton.MouseButton1Click:Connect(function()
    if not folder then
        showMessage("KillFX folder not found!")
        return
    end

    for name, originalName in pairs(originalNames) do
        local module = folder:FindFirstChild(name)
        if module and module:IsA("ModuleScript") then
            module.Name = originalName
        end
    end

    showMessage("Stomp changes reset!")
end)
CloseButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
end)
InfoButton.MouseButton1Click:Connect(function()
    InfoLabel.Visible = not InfoLabel.Visible
end)
