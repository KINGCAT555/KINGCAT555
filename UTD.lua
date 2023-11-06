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

local function autoselect()
   game:GetService("ReplicatedStorage").endpoints.client_to_server.request_join_lobby:InvokeServer("_lobbytemplategreen5")
   task.wait(1)
   game:GetService("ReplicatedStorage").endpoints.client_to_server.request_lock_level:InvokeServer("_lobbytemplategreen5","namek_infinite",false,"Hard")
end

local AutoPlay = Tab:CreateToggle({
   Name = "AutoGem",
   CurrentValue = false,
   Flag = "", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(atgem)
         if atgem then
            autoSelect()
         end
   end,
})

local DailyReward = Tab:CreateToggle({
    Name = "DailyReward",
    CurrentValue = false,
    Flag = "",
    Callback = function(autoDR)
        while autoDR do wait(1)
         game:GetService("ReplicatedStorage").endpoints.client_to_server.claim_daily_reward:InvokeServer()
         end
    end,
})
