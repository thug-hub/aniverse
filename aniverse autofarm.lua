local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local Window = Library.CreateLib("Thug Hub - Aniverse", "DarkTheme")

local Tab = Window:NewTab("Main")

local Section = Tab:NewSection("Autofarm")

local me = game.Players.LocalPlayer

local Plr = game:GetService("Players").LocalPlayer

game:GetService("RunService").Stepped:Connect(function()
    if getgenv().Autofarm then
        for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if v:IsA("BasePart") and v.CanCollide == true then
                    v.CanCollide = false
                    game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
                end;
            end;
        end;
end);
game.Players.LocalPlayer.DevCameraOcclusionMode = "Invisicam"

Section:NewToggle("Auto Attack", "ToggleInfo", function(state)
    if state then
getgenv().autoattack = true
    else
getgenv().autoattack = false
    end
    
    local vim = game:GetService('VirtualInputManager')
    while getgenv().autoattack do
        wait(0.25)
        vim:SendMouseButtonEvent(0,0,0,true,game,0)
        wait()
        vim:SendMouseButtonEvent(0,0,0,false,game,0)
    end
end)


getgenv().Distance = 6
Section:NewSlider("Distance", "SliderInfo", 20, 2, function(s) -- 500 (MaxValue) | 0 (MinValue)
    getgenv().Distance = s
end)


Section:NewToggle("Autofarm", "ToggleInfo", function(state2)
if state2 then
    getgenv().Autofarm = true
    else
    getgenv().Autofarm = false
end

    while getgenv().Autofarm and wait() do

    pcall(function()
    	for _,v in pairs(game:GetService("Workspace"):GetChildren()) do
    		if v:FindFirstChild("Enemy") and v:FindFirstChild("HumanoidRootPart") then
        		if v.Humanoid.Health > 0 then
        			Plr.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame - Vector3.new(0, (getgenv().Distance), 0)
        			Plr.Character.HumanoidRootPart.CFrame = CFrame.new(Plr.Character.HumanoidRootPart.Position, v.HumanoidRootPart.Position)
        		end
        	end
        end
    end)

end
end)


Section:NewToggle("Auto Skill", "ToggleInfo", function(state3)
if state3 then
    getgenv().Skill = true
    else
    getgenv().Skill = false
end

local name = nil
for m,h in pairs(game:GetService("Players").LocalPlayer.Data.Units:GetDescendants()) do
    if h.Name == "Slot" and h.Value == 1 then
        name = h.Parent.Name
    end
end

print(name)
local aa = tostring(game:GetService("Players").LocalPlayer.Backpack.UnitLScript.UInfo.Value)

while getgenv().Skill do
    wait(1)
    game:GetService("ReplicatedStorage").GameInfo.UnitInfo[name][aa].Remotes.Skill1:FireServer()
    wait(0.15)
    game:GetService("ReplicatedStorage").GameInfo.UnitInfo[name][aa].Remotes.Skill2:FireServer()
    wait(0.15)
    game:GetService("ReplicatedStorage").GameInfo.UnitInfo[name][aa].Remotes.Skill3:FireServer()
end

end)

Section:NewToggle("Auto Skip Dialogue", "ToggleInfo", function(state4)
if state4 then
    getgenv().Skip = true
    else
    getgenv().Skip = false
end

while getgenv().Skip do
wait(1)
if game:GetService("Players").LocalPlayer.PlayerGui.MainGui.TalkBox.TalkGui.Visible == true then
    game:GetService("ReplicatedStorage").GameStorage.Remotes.TalkEvent:FireServer("Skip")
end
end
end)

Section:NewToggle("Auto Replay Stage", "ToggleInfo", function(state5)
if state5 then
    getgenv().replay = true
    else
    getgenv().replay = false
end

while getgenv().replay do
wait()
if game:GetService("Players").LocalPlayer.PlayerGui.MainGui.SClearBox.ClearFrame.ReplayB.Visible == true then
    game:GetService("ReplicatedStorage").GameStorage.Remotes.StageEvents:FireServer("Replay")
end
end
end)


Section:NewToggle("Auto Next Stage", "ToggleInfo", function(state6)
if state6 then
    getgenv().nextstage = true
    else
    getgenv().nextstage = false
end

while getgenv().nextstage do
wait()
if game:GetService("Players").LocalPlayer.PlayerGui.MainGui.SClearBox.ClearFrame.NextB.Visible == true then
    game:GetService("ReplicatedStorage").GameStorage.Remotes.StageEvents:FireServer("Next")
end
end
end)
