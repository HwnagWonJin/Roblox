local Player = game:GetService("Players").LocalPlayer
local PlayerCharcter = Player.CharacterAdded:Wait()
local PlayerRootPart = PlayerCharcter:WaitForChild("HumanoidRootPart")
local keyboard = require(game:GetService("ReplicatedStorage").Packages.Input).Keyboard
local signal = require(game:GetService("ReplicatedStorage").Packages.Signal)

local cKeySignal = signal.new()

local key = keyboard.new()

key.KeyDown:Connect(function(keyCode)
    if keyCode == Enum.KeyCode.C then
        cKeySignal:Fire()
    end
end)

function cKey()
    local targetCFrame = (PlayerRootPart.CFrame * CFrame.Angles(0, math.rad(90), 0))
    while PlayerRootPart ~= targetCFrame do
        PlayerRootPart.CFrame = PlayerCharcter.HumanoidRootPart.CFrame:Lerp(PlayerCharcter.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(90), 0),0.05)
        task.wait()
    end
end

print(PlayerRootPart.Name)

-- print(PlayerRootPart.CFrame.ZVector)
-- print(PlayerRootPart.CFrame.YVector)
-- print(PlayerRootPart.CFrame.XVector)

cKeySignal:Connect(cKey)