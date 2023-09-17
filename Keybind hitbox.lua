-- Settings
local settings = {
    headScale = Vector3.new(5, 5, 5)
}

-- Variables
local plr = game:GetService("Players").LocalPlayer
local newSizes = {} -- A table to store the new sizes of the heads
local userInputService = game:GetService("UserInputService") -- Get the UserInputService

-- Functions
local function changeHeadSize(object)
    if object and object:IsA("Part") then
        local originalSize = object.Size
        local newSize = settings.headScale -- Use the fixed size here instead of adding to the original size
        object.Size = newSize
        newSizes[object] = newSize -- Store the new size in the table using the object as a key
    end
end

local function updateHeadSize(player)
    local character = player.Character or player.CharacterAdded:Wait()
    local head = character:FindFirstChild("Head")
    if head and head:IsA("Part") then
        if newSizes[head] then -- Check if the head has a new size stored in the table
            local size = newSizes[head]
            head.Size = size
        end
    end
end

local function checkHeads()
    local models = workspace:GetChildren() -- Get all the models in the workspace
    local heads = {} -- A table to store all the head parts
    for _, model in pairs(models) do -- Loop through all the models
        if model:IsA("Model") and model:FindFirstChild("Head") then -- Check if the model has a head part
            local head = model.Head
            table.insert(heads, head) -- Add the head part to the table
        end
    end
    for _, head in pairs(heads) do -- Loop through all the head parts
        changeHeadSize(head) -- Call the function to change the head size
    end
end

-- Main
checkHeads() -- Call the function once at the start

game.Players.PlayerAdded:Connect(function(player) -- Connect the function to the PlayerAdded event
    updateHeadSize(player) -- Call the function to update the head size
    player.CharacterAdded:Connect(function() -- Connect the function to the CharacterAdded event
        updateHeadSize(player) -- Call the function to update the head size
    end)
end)

workspace.ChildAdded:Connect(function(child) -- Connect the function to the ChildAdded event
    if child:IsA("Model") and child:FindFirstChild("Head") then -- Check if the child is a model with a head part
        local head = child.Head
        changeHeadSize(head) -- Call the function to change the head size
    end
end)

workspace.ChildRemoved:Connect(function(child) -- Connect the function to the ChildRemoved event
    if child:IsA("Model") and child:FindFirstChild("Head") then -- Check if the child is a model with a head part
        local head = child.Head
        newSizes[head] = nil
    end
end)

userInputService.InputBegan:Connect(function(inputObject, gameProcessedEvent)
    if gameProcessedEvent then return end
    local keyCode = inputObject.KeyCode -- Get which key was pressed 
    if keyCode == Enum.KeyCode.Q then -- Keybind
        settings.headScale = Vector3.new(8, 8, 8) -- Units
        checkHeads() -- Update all heads 
    elseif keyCode == Enum.KeyCode.T then -- Keybind
        settings.headScale = Vector3.new(5.2, 5.2, 5.2) -- Units
        checkHeads() -- Update all heads 
    elseif keyCode == Enum.KeyCode.Z then -- Keybind
        settings.headScale = Vector3.new(1, 1, 1) -- Units
        checkHeads() -- Update all heads 
    elseif keyCode == Enum.KeyCode.F then -- Keybind
        settings.headScale = Vector3.new(13, 13, 13) -- Units
        checkHeads() -- Update all heads 
    end
end)
