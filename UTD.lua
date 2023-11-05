local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua"))()
local GUI = Mercury:Create{
    Name = "Ultimate Tower Defense",
    Size = UDim2.fromOffset(600, 400),
    Theme = Mercury.Themes.Dark,
    Link = "Search"
}
local Tab = GUI:Tab{
	Name = "New Tab",
	Icon = "rbxassetid://8569322835"
}
