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
                end
            end
        end
end)
game.Players.LocalPlayer.DevCameraOcclusionMode = "Invisicam"


Section:NewToggle("Auto Switch", "ToggleInfo", function(state0)
    if state0 then
getgenv().autoswitch = true
    else
getgenv().autoswitch = false
    end
    
    while getgenv().autoswitch == true do
        wait(0.5)
    
    for m,h in pairs(game:GetService("Players").LocalPlayer.Data.Units:GetDescendants()) do
        if h.Parent.Name == "Rimuru" and h.Name == "Slot" and tonumber(h.Value) == tonumber(game:GetService("Players").LocalPlayer.Data.UTeam.EUnit.Value) then
            game:GetService("ReplicatedStorage").GameStorage.Remotes.SwapEvent:FireServer()
        end
    end
    
    end
end)

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


getgenv().Distance = 7
Section:NewSlider("Distance", "SliderInfo", 20, -20, function(s) -- 500 (MaxValue) | 0 (MinValue)
    getgenv().Distance = s
end)


Section:NewToggle("Autofarm", "ToggleInfo", function(state2)
if state2 then
    getgenv().Autofarm = true
    else
    getgenv().Autofarm = false
end

    while getgenv().Autofarm and wait() do
        if getgenv().Autofarm == true then

    pcall(function()
    	for _,v in pairs(game:GetService("Workspace"):GetChildren()) do
    		if v:FindFirstChild("Enemy") and v:FindFirstChild("HumanoidRootPart") then
        		if v.Humanoid.Health > 0 then
        		    if v.Name == "Sniper Marine" then
        		        repeat wait()
        			    Plr.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame - Vector3.new(0, 0, (getgenv().Distance))
        			    Plr.Character.HumanoidRootPart.CFrame = CFrame.new(Plr.Character.HumanoidRootPart.Position, v.HumanoidRootPart.Position)
        		        until v.Humanoid.Health <= 0
        		    else
        		        Plr.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame - Vector3.new(0, 0, (getgenv().Distance))
        			    Plr.Character.HumanoidRootPart.CFrame = CFrame.new(Plr.Character.HumanoidRootPart.Position, v.HumanoidRootPart.Position)
        		    end
        		end
        	end
        end
    end)
    end

end
end)


Section:NewToggle("Auto Skill 1", "ToggleInfo", function(state3)
if state3 then
    getgenv().Skill1 = true
    else
    getgenv().Skill1 = false
end

local name = nil

while getgenv().Skill1 do
    
    for m,h in pairs(game:GetService("Players").LocalPlayer.Data.Units:GetDescendants()) do
    if h.Name == "Slot" and tonumber(h.Value) == tonumber(game:GetService("Players").LocalPlayer.Data.UTeam.EUnit.Value) then
        name = h.Parent.Name
    end
    end
    
    local aa = tostring(game:GetService("Players").LocalPlayer.Backpack.UnitLScript.UInfo.Value)
    
    
    wait(1)
    game:GetService("ReplicatedStorage").GameInfo.UnitInfo[name][aa].Remotes.Skill1:FireServer()
end

end)

Section:NewToggle("Auto Skill 2", "ToggleInfo", function(state7)
if state7 then
    getgenv().Skill2 = true
    else
    getgenv().Skill2 = false
end

local name = nil

while getgenv().Skill2 do
    
    for m,h in pairs(game:GetService("Players").LocalPlayer.Data.Units:GetDescendants()) do
    if h.Name == "Slot" and tonumber(h.Value) == tonumber(game:GetService("Players").LocalPlayer.Data.UTeam.EUnit.Value) then
        name = h.Parent.Name
    end
    end
    
    local aa = tostring(game:GetService("Players").LocalPlayer.Backpack.UnitLScript.UInfo.Value)
    
    
    wait(1)
    game:GetService("ReplicatedStorage").GameInfo.UnitInfo[name][aa].Remotes.Skill2:FireServer()
end

end)

Section:NewToggle("Auto Skill 3", "ToggleInfo", function(state8)
if state8 then
    getgenv().Skill3 = true
    else
    getgenv().Skill3 = false
end

local name = nil

while getgenv().Skill3 do
    
    for m,h in pairs(game:GetService("Players").LocalPlayer.Data.Units:GetDescendants()) do
    if h.Name == "Slot" and tonumber(h.Value) == tonumber(game:GetService("Players").LocalPlayer.Data.UTeam.EUnit.Value) then
        name = h.Parent.Name
    end
    end
    
    local aa = tostring(game:GetService("Players").LocalPlayer.Backpack.UnitLScript.UInfo.Value)
    
    
    wait(1)
    game:GetService("ReplicatedStorage").GameInfo.UnitInfo[name][aa].Remotes.Skill3:FireServer()
end

end)


local Tab2 = Window:NewTab("Stage Settings")

local Section2 = Tab2:NewSection("Auto Stage Options")

Section2:NewToggle("Auto Skip Dialogue", "ToggleInfo", function(state4)
if state4 then
    getgenv().Skip = true
    else
    getgenv().Skip = false
end

while getgenv().Skip do
wait(1)
--if game:GetService("Players").LocalPlayer.PlayerGui.MainGui.TalkBox.TalkGui.Visible == true then
    game:GetService("ReplicatedStorage").GameStorage.Remotes.TalkEvent:FireServer("Skip")
--end
end
end)

Section2:NewToggle("Auto Replay Stage", "ToggleInfo", function(state5)
if state5 then
    getgenv().replay = true
    else
    getgenv().replay = false
end

while getgenv().replay do
wait()
--if game:GetService("Players").LocalPlayer.PlayerGui.MainGui.SClearBox.ClearFrame.ReplayB.Visible == true then
    game:GetService("ReplicatedStorage").GameStorage.Remotes.StageEvents:FireServer("Replay")
--end
end
end)


Section2:NewToggle("Auto Next Stage", "ToggleInfo", function(state6)
if state6 then
    getgenv().nextstage = true
    else
    getgenv().nextstage = false
end

while getgenv().nextstage do
wait()
--if game:GetService("Players").LocalPlayer.PlayerGui.MainGui.SClearBox.ClearFrame.NextB.Visible == true then
    game:GetService("ReplicatedStorage").GameStorage.Remotes.StageEvents:FireServer("Next")
--end
end
end)
