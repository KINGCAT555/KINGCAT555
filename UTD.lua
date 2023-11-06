local RareX = loadstring(game:HttpGet"https://raw.githubusercontent.com/KINGCAT555/KINGCAT555/main/ui.lua")()

local Window = RareX:CreateWindow({
   Name = "RareX",
   LoadingTitle = "RareX Ui Loading",
   LoadingSubtitle = "Ui by Rayfield",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = RareX, -- Create a custom folder for your hub/game
      FileName = "RareX"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },
   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "RareX Key",
      Subtitle = "Key System",
      Note = "Script by Me:) Thank for Use",
      FileName = "Key RareX", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"RareXNo1", "ApinanNo1"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local Tab = Window:CreateTab("Main", 11254763865) -- Title(ชื่อ), Image(รูปภาพ)

local function startAutoParry()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local replicatedStorage = game:GetService("ReplicatedStorage")
    local runService = game:GetService("RunService")
    local parryButtonPress = replicatedStorage.Remotes.ParryButtonPress
    local ballsFolder = workspace:WaitForChild("Balls")
 
    print("Script successfully ran.")
 
    local function onCharacterAdded(newCharacter)
        character = newCharacter
    end
 
    player.CharacterAdded:Connect(onCharacterAdded)
 
    local focusedBall = nil  
 
    local function chooseNewFocusedBall()
        local balls = ballsFolder:GetChildren()
        focusedBall = nil
        for _, ball in ipairs(balls) do
            if ball:GetAttribute("realBall") == true then
                focusedBall = ball
                break
            end
        end
    end
 
    chooseNewFocusedBall()
 
    local function timeUntilImpact(ballVelocity, distanceToPlayer, playerVelocity)
        local directionToPlayer = (character.HumanoidRootPart.Position - focusedBall.Position).Unit
        local velocityTowardsPlayer = ballVelocity:Dot(directionToPlayer) - playerVelocity:Dot(directionToPlayer)
 
        if velocityTowardsPlayer <= 0 then
            return math.huge
        end
 
        local distanceToBeCovered = distanceToPlayer - 40
        return distanceToBeCovered / velocityTowardsPlayer
    end
 
    local BASE_THRESHOLD = 0.15
    local VELOCITY_SCALING_FACTOR = 0.002
 
    local function getDynamicThreshold(ballVelocityMagnitude)
        local adjustedThreshold = BASE_THRESHOLD - (ballVelocityMagnitude * VELOCITY_SCALING_FACTOR)
        return math.max(0.12, adjustedThreshold)
    end
 
    local function checkBallDistance()
        if not character:FindFirstChild("Highlight") then return end
        local charPos = character.PrimaryPart.Position
        local charVel = character.PrimaryPart.Velocity
 
        if focusedBall and not focusedBall.Parent then
            chooseNewFocusedBall()
        end
 
        if not focusedBall then return end
 
        local ball = focusedBall
        local distanceToPlayer = (ball.Position - charPos).Magnitude
 
        if distanceToPlayer < 10 then
            parryButtonPress:Fire()
            return
        end
 
        local timeToImpact = timeUntilImpact(ball.Velocity, distanceToPlayer, charVel)
        local dynamicThreshold = getDynamicThreshold(ball.Velocity.Magnitude)
 
        if timeToImpact < dynamicThreshold then
            parryButtonPress:Fire()
        end
    end
    heartbeatConnection = game:GetService("RunService").Heartbeat:Connect(function()
        checkBallDistance()
    end)
end
 
local function stopAutoParry()
    if heartbeatConnection then
        heartbeatConnection:Disconnect()
        heartbeatConnection = nil
    end
end

local AutoParry = Tab:CreateToggle({
    Name = "Auto Parry",
    CurrentValue = false,
    Flag = "AutoParryFlag",
    Callback = function(Value)
        if Value then
            startAutoParry()
        else
            stopAutoParry()
        end
    end,
})
