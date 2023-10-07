--Original Script

--Thread1
local Thread1 = coroutine.create(function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/1337kat/l/main/Keybind%20hitbox.lua'))()
end)
coroutine.resume(Thread1)

--Thread2
local Thread2 = coroutine.create(function()
loadstring(game:HttpGet('https://github.com/1337kat/l/blob/main/Fullbright.lua'))()
end)
coroutine.resume(Thread2)

--Thread3
local Thread3 = coroutine.create(function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/1337kat/l/main/Crosshair.lua'))()
end)
coroutine.resume(Thread3)

--Thread4
local Thread4 = coroutine.create(function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/1337kat/l/main/Chams.lua'))()
end)
coroutine.resume(Thread4)

--Thread5
local Thread5 = coroutine.create(function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)
coroutine.resume(Thread5)

--Thread6
local Thread6 = coroutine.create(function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/1337kat/l/main/Armour%20Indicator.lua'))()
end)
coroutine.resume(Thread6)
