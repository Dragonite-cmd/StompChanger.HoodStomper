local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer
local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/Ethan-star557/StompChanger.HoodStomper/refs/heads/main/Orionlib.lua'))()
local Window = OrionLib:MakeWindow({
    Name = "Hood Stomper Hub",
    HidePremium = false,
    IntroEnabled = true,
    IntroText = "Loading Hood Stomper Hub...",
    SaveConfig = true,
    ConfigFolder = "HoodStomperConfig"
})
local originalNames = {}
local folder = ReplicatedStorage:FindFirstChild("KillFX")
local function showMessage(message)
    OrionLib:MakeNotification({
        Name = "Hood Stomper",
        Content = message,
        Image = "rbxassetid://4483362458",
        Time = 5
    })
end
local currentEffect = ""
local desiredEffect = ""
local HomeTab = Window:MakeTab({
    Name = "Home",
    Icon = "rbxassetid://4483362458",
    PremiumOnly = false
})
local MainTab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483362458", 
    PremiumOnly = false
})
local EffectsTab = Window:MakeTab({
    Name = "Stomp Effects",
    Icon = "rbxassetid://4483362458", 
    PremiumOnly = false
})
HomeTab:AddParagraph("Welcome", "Welcome to Hood Stomper! Use the other tabs to configure settings and view stomp effects.")
HomeTab:AddParagraph("Information", [[
This script is for fun and may be patched anytime. Updates are provided when available.
Refer to the Stomp Effects tab for a full list of effects.
]])
HomeTab:AddParagraph("?!", [[
made by ethantherizzler_1
]])
MainTab:AddLabel("Stomp Loader")
MainTab:AddTextbox({
    Name = "Current Stomp Effect",
    Default = "",
    TextDisappear = false,
    Callback = function(value)
        currentEffect = value
        print("Current Effect: " .. currentEffect)
    end
})
MainTab:AddTextbox({
    Name = "Desired Stomp Effect",
    Default = "",
    TextDisappear = false,
    Callback = function(value)
        desiredEffect = value
        print("Desired Effect: " .. desiredEffect)
    end
})

MainTab:AddButton({
    Name = "Load Stomp Effect",
    Callback = function()
        if not folder then
            showMessage("KillFX folder not found!💔")
            return
        end

        local currentModule = folder:FindFirstChild(currentEffect)
        if currentModule and currentModule:IsA("ModuleScript") then
            originalNames[currentEffect] = currentModule.Name
            currentModule.Name = "uwu"
        else
            showMessage("Current stomp effect not found!💔")
            return
        end

        local desiredModule = folder:FindFirstChild(desiredEffect)
        if desiredModule and desiredModule:IsA("ModuleScript") then
            desiredModule.Name = currentEffect
            showMessage("Stomp effect loaded successfully")
        else
            showMessage("Desired stomp effect not found💔")
        end
    end
})
MainTab:AddButton({
    Name = "Reset Stomp Changes (Broken)💔",
    Callback = function()
        if not folder then
            showMessage("KillFX folder not found!💔")
            return
        end

        for name, originalName in pairs(originalNames) do
            local module = folder:FindFirstChild(name)
            if module and module:IsA("ModuleScript") then
                module.Name = originalName
            end
        end

        showMessage("Stomp changes reset!")
    end
})
EffectsTab:AddLabel("Available Stomp Effects")
EffectsTab:AddParagraph("Effects List", [[

    Tsukuyomi
    Tonka
    Yggdrasil
    Saitama
    ShapeShifter
    Stratosphere
    Spooky Spirit
    Spirit
    Shiny Spirit
    Raycodex (Bugged) 💔
    Kurohitsugi
    Dragon
    Lotus
    Atomic
                                     [New stomps Comming Soon]
]])
OrionLib:MakeNotification({
    Name = "Loaded",
    Content = "Hood Stomper Hub Loaded Successfully!",
    Image = "rbxassetid://4483362458", 
    Time = 5
})
OrionLib:Init()
