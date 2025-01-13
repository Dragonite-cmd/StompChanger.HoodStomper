local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Orion/main/source'))()
local Window = OrionLib:MakeWindow({
    Name = "Hood Stomper Hub",
    HidePremium = false,
    IntroEnabled = true,
    IntroText = "Loading Hood Stomper Hub...",
    SaveConfig = true,
    ConfigFolder = "HoodStomperConfig"
})
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
MainTab:AddLabel("Main Functionality")
MainTab:AddTextbox({
    Name = "Current Stomp Effect",
    Default = "",
    TextDisappear = false,
    Callback = function(value)
        print("Current Effect: " .. value)
    end
})
MainTab:AddTextbox({
    Name = "Desired Stomp Effect",
    Default = "",
    TextDisappear = false,
    Callback = function(value)
        print("Desired Effect: " .. value)
    end
})
MainTab:AddButton({
    Name = "Load Stomp Effect",
    Callback = function()
        print("Stomp Effect Loaded!")
    end
})
MainTab:AddButton({
    Name = "Reset Stomp Changes",
    Callback = function()
        print("Stomp Changes Reset!")
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
    Raycodex (Bugged)
    Kurohitsugi
    Dragon
    Lotus
    Atomic
]])

OrionLib:MakeNotification({
    Name = "Loaded",
    Content = "Hood Stomper Hub Loaded Successfully!",
    Image = "rbxassetid://4483362458", -- Optional image
    Time = 5
})
OrionLib:Init()
