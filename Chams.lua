local s = {f=Color3.fromRGB(255, 0, 0);t=.75;o=Color3.fromRGB(255, 0, 0);p=0;}

local p = game:service'Players'.LocalPlayer
local h = Instance.new('Folder', game:service'CoreGui')
local function a(o)
    local h = Instance.new('Highlight', h)
    h.Adornee = o
    h.FillColor = s.f
    h.FillTransparency = s.t
    h.OutlineColor = s.o
    h.OutlineTransparency = s.p
    h.Adornee.Changed:Connect(function()
        if not h.Adornee or not h.Adornee.Parent then
            h:Destroy()
        end
    end)
    return h
end
local function b(o)
    if o:IsA'Model' and o.Parent.Name ~= tostring(p.TeamColor) then
        local h = o:FindFirstChild("Head")
        if h and t then
            a(h)
        end
    end
end
for i,v in pairs(workspace:GetDescendants()) do
    b(v)
end
workspace.DescendantAdded:Connect(function(v)
    b(v)
end)
