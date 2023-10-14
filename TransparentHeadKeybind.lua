local settings = {
    headScale = Vector3.new(5, 5, 5), 
    headTransparency = 0.5 
}

local plr = game:GetService("Players").LocalPlayer
local newSizes = {} 
local newTransparencies = {} 
local userInputService = game:GetService("UserInputService") 

local function changeHeadSize(object) 
    if object and object:IsA("Part") then
        local originalSize = object.Size
        local newSize = settings.headScale 
        object.Size = newSize
        newSizes[object] = newSize 
    end
end

local function changeHeadTransparency(object) 
    if object and object:IsA("Part") then
        local originalTransparency = object.Transparency
        local newTransparency = settings.headTransparency 
        object.Transparency = newTransparency
        newTransparencies[object] = newTransparency 
    end
end

local function updateHeadSize(player) 
    local character = player.Character or player.CharacterAdded:Wait()
    local head = character:FindFirstChild("Head")
    if head and head:IsA("Part") then
        if newSizes[head] then 
            local size = newSizes[head]
            head.Size = size
        end
    end
end

local function updateHeadTransparency(player) 
    local character = player.Character or player.CharacterAdded:Wait()
    local head = character:FindFirstChild("Head")
    if head and head:IsA("Part") then
        if newTransparencies[head] then 
            local transparency = newTransparencies[head]
            head.Transparency = transparency
        end
    end
end

local function checkHeads() 
    local models = workspace:GetChildren() 
    local heads = {} 
    for _, model in pairs(models) do 
        if model:IsA("Model") and model:FindFirstChild("Head") then 
            local head = model.Head
            table.insert(heads, head) 
        end
    end

    for _, head in pairs(heads) do 
        changeHeadSize(head) 
        changeHeadTransparency(head) 
    end 
end 

checkHeads() 
game.Players.PlayerAdded:Connect(function(player) 
    updateHeadSize(player) 
    updateHeadTransparency(player) 
    player.CharacterAdded:Connect(function() 
        updateHeadSize(player) 
        updateHeadTransparency(player) 
    end) 
end) 

workspace.ChildAdded:Connect(function(child) 
    if child:IsA("Model") and child:FindFirstChild("Head") then 
        local head = child.Head 
        changeHeadSize(head) 
        changeHeadTransparency(head) 
    end 
end)

workspace.ChildRemoved:Connect(function(child) 
    if child:IsA("Model") and child:FindFirstChild("Head") then 
        local head = child.Head 
        newSizes[head] = nil 
        newTransparencies[head] = nil 
    end 
end) 

userInputService.InputBegan:Connect(function(inputObject, gameProcessedEvent) 
    if gameProcessedEvent then return end 
    local keyCode = inputObject.KeyCode 
    if keyCode == Enum.KeyCode.Q then 
        settings.headScale = Vector3.new(8, 8, 8) 
        settings.headTransparency = 0.4 
        checkHeads() 
    elseif keyCode == Enum.KeyCode.T then 
        settings.headScale = Vector3.new(5.2, 5.2, 5.2) 
        settings.headTransparency = 0.6 
        checkHeads() 
    elseif keyCode == Enum.KeyCode.Z then 
        settings.headScale = Vector3.new(1, 1, 1) 
        settings.headTransparency = 0.8 
        checkHeads() 
    elseif keyCode == Enum.KeyCode.F then 
        settings.headScale = Vector3.new(13, 13, 13) 
        settings.headTransparency = 0.2 
        checkHeads() 
    end
end)