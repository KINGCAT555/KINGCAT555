local DiscordLib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/discord%20lib.txt")()

local win = DiscordLib:Window("Ultimate Tower Defense")

local serv = win:Server("Preview", "")

local main = serv:Channel("Main")


main:Toggle("Auto Fish",false, function()
game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("GlobalInit"):WaitForChild("RemoteEvents"):WaitForChild("PlayerCatchFish"):FireServer()
end)

local drops = serv:Channel("Dropdowns")

local drop = drops:Dropdown("Select Map",{"PlanetNamek","HidenLeaFVillage"}, function(map)
end)

drops:Button("Play", function()
local args = {
    [1] = "map"
}

game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("GlobalInit"):WaitForChild("RemoteEvents"):WaitForChild("PlayerSelectedMap"):FireServer(unpack(args))

game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("GlobalInit"):WaitForChild("RemoteEvents"):WaitForChild("PlayerQuickstartTeleport"):FireServer()
        
end)


local clrs = serv:Channel("Colorpickers")

clrs:Colorpicker("ESP Color", Color3.fromRGB(255,1,1), function(t)
print(t)
end)

local textbs = serv:Channel("Textboxes")

textbs:Textbox("Gun power", "Type here!", true, function(t)
print(t)
end)

local lbls = serv:Channel("Labels")

lbls:Label("This is just a label.")

local bnds = serv:Channel("Binds")

bnds:Bind("Kill bind", Enum.KeyCode.RightShift, function()
print("Killed everyone!")
end)

serv:Channel("by dawid#7205")
