local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Timer = require(ReplicatedStorage.Packages.Timer)

local part = Instance.new("Part")
part.Material = Enum.Material.Concrete
part.Transparency = 0.5
part.CFrame += Vector3.new(10,0,0)
part.Parent = workspace

part.Touched:Connect(function(otherPart)
    if otherPart.Name == "HumanoidRootPart" then
        print("touch")
    end
end)

local tickTime = 1
local rotateValue = 15

local timer = Timer.new(tickTime)
timer.Tick:Connect(function()
    part.CFrame *= CFrame.Angles(0, math.rad(rotateValue), 0)
end)

timer:Start()
