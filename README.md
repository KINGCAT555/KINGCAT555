--Script By. KINGCAT

local ScreenGui = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local Seastone = Instance.new("TextButton")
local BossSeastone = Instance.new("TextButton")
local TextLabel = Instance.new("TextLabel")

ScreenGui.Parent = game.CoreGui

Main.Name = "Main"
Main.Parent = ScreenGui
Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Main.Position = UDim2.new(0.238276303, 0, 0.343079925, 0)
Main.Size = UDim2.new(0, 456, 0, 264)
Main.Active = true
Main.Draggable = true

Seastone.Name = "Seastone"
Seastone.Parent = Main
Seastone.BackgroundColor3 = Color3.fromRGB(143, 255, 58)
Seastone.BorderColor3 = Color3.fromRGB(34, 53, 47)
Seastone.Position = UDim2.new(0.0344289951, 0, 0.246411487, 0)
Seastone.Size = UDim2.new(0, 204, 0, 50)
Seastone.Font = Enum.Font.SourceSans
Seastone.Text = "หมัดบอส(ติดต่อเจ้าของ)"
Seastone.TextColor3 = Color3.fromRGB(0, 0, 0)
Seastone.TextSize = 25.000
Seastone.MouseButton1Down:connect(function()
	local A_1 = "Seastone Cestus"
	local Event = game:GetService("Workspace").UserData["User_1051324405"].UpdateMelee
	Event:FireServer(A_1)
end)

BossSeastone.Name = "Boss Seastone"
BossSeastone.Parent = Main
BossSeastone.BackgroundColor3 = Color3.fromRGB(138, 255, 60)
BossSeastone.Position = UDim2.new(0.530326486, 0, 0.246411487, 0)
BossSeastone.Size = UDim2.new(0, 200, 0, 50)
BossSeastone.Font = Enum.Font.SourceSans
BossSeastone.Text = "วาปเกราะบอส"
BossSeastone.TextColor3 = Color3.fromRGB(0, 0, 0)
BossSeastone.TextSize = 22.000
ฺBossSeastone.MouseButton1Down:connect(function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1644.94861, 1223.2832, 9979.9043, -0.999999702, 1.71399515e-05, -0.000692844449, -2.72848411e-12, 0.999694169, 0.0247309636, 0.000693056441, 0.0247309562, -0.999693871)
end)

TextLabel.Parent = Main
TextLabel.BackgroundColor3 = Color3.fromRGB(162, 255, 56)
TextLabel.Position = UDim2.new(-0.000758782029, 0, -0.00161704421, 0)
TextLabel.Size = UDim2.new(0, 456, 0, 50)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "Test GUI | Beta By. KINGCAT"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextSize = 28.000
