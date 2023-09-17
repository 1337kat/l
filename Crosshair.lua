local ScreenGui = Instance.new("ScreenGui")
local ImageLabel = Instance.new("ImageLabel")
--Properties:
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

ImageLabel.Parent = ScreenGui
ImageLabel.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel.BackgroundTransparency = 100
ImageLabel.Position = UDim2.new(0.5, -10, 0.5, -19)
ImageLabel.Size = UDim2.new(0, 30, 0, 30)
ImageLabel.Image = "rbxassetid://316279304"