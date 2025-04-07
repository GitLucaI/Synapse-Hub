local channel = game:GetService("TextChatService"):WaitForChild("TextChannels"):WaitForChild("RBXGeneral")
	local player = game.Players.LocalPlayer
	local char = player.Character
	local ppart = char.PrimaryPart
	player.CharacterAdded:Connect(function(c)
		char = c
		ppart = c.PrimaryPart
	end)



	local humanoid = char:FindFirstChildWhichIsA("Humanoid")
	local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
	local RPS = game:GetService("ReplicatedStorage")
	local RS = game:GetService("RunService")
	local TeleportService = game:GetService("TeleportService")
	local Players = game:GetService("Players")
	local PlaceId = game.PlaceId
	local JobId = game.JobId
	local Window = Rayfield:CreateWindow({
		Name = "Synapse Hub MM2 ver".. game.PlaceId,
		LoadingTitle = "Loading interface",
		LoadingSubtitle = "by Synapse",
		ConfigurationSaving = {
			Enabled = true,
			FolderName = nil, 
			FileName = "Synapse Hub MM2 ver".. game.PlaceId
		},
		Discord = {
			Enabled = true,
			Invite = "vMbNSSa9TN",
			RememberJoins = true 
		},
		KeySystem = false, 
		KeySettings = {
			Title = "Untitled",
			Subtitle = "Key System",
			Note = "No method of obtaining the key is provided",
			FileName = "Key", 
			SaveKey = true,
			GrabKeyFromSite = false,
			Key = {"Hello"}
		}
	})

	local MainTab = Window:CreateTab("Main", 4483362458)

	local murderer
	local hero
	local sheriff

	local snitchroles = Instance.new("BoolValue")
	snitchroles.Parent = script

	local automwin = Instance.new("BoolValue")
	automwin.Parent = script

	local hg = Instance.new("BoolValue")
	hg.Parent = script

	function notifyr(playerrole, role)
		if role == "Murderer" then
			murderer = playerrole
		elseif role == "Sheriff" then
			sheriff = playerrole
		elseif role == "Hero" then
			hero = playerrole
		end
		if playerrole ~= player then
			Rayfield:Notify({
				Title = "Roles",
				Content = playerrole.. " is the ".. role.. "!",
				Duration = 3.5,
				Image = "rewind",
			})
			if snitchroles.Value == true then
				channel:SendAsync(playerrole.. " is the ".. role.. "!", "All")
			end
		end
		local ch = player.Character
		if automwin.Value == true and playerrole == player and role == "Murderer" and ch then
			local primarypartk = ch.PrimaryPart
			for _, playerv in pairs(Players:GetPlayers()) do
				local c = playerv.Character
				if c and ch and primarypartk then
					local primarypartv = c.PrimaryPart
					if primarypartv then
						repeat primarypartk.CFrame = primarypartv.CFrame

						until c:FindFirstChildWhichIsA("Humanoid").Health == 0
						task.wait()
					end
				end
				task.wait()
			end
		end
		if role == "Sheriff" and playerrole ~= player and hg.Value == true and murderer ~= player then
			local c = player.Character
			if c then
				local h = c:FindFirstChildWhichIsA("Humanoid")
				h.Health = 0
			end
		end
	end



	local ESP = MainTab:CreateButton({
		Name = "Player ESP",
		Callback = function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/Ihaveash0rtnamefordiscord/Releases/main/MurderMystery2HighlightESP"))()
		end,
	})

	local notify = Instance.new("BoolValue")
	notify.Parent = script

	local Toggle = MainTab:CreateToggle({
		Name = "Notify Roles",
		CurrentValue = false,
		Flag = "NotifyToggle", 
		Callback = function(Value)
			notify.Value = Value
		end,
	})

	local notifiedRoles = {}

	function tpto(playertt:Player, myprimarypart:BasePart)
		local c = playertt.Character
		if c then
			local tppart = c.PrimaryPart
			if tppart then

			end
		end
	end

	RS.RenderStepped:Connect(function()
		if not notify.Value then return end
		local rs = RPS:FindFirstChild("GetPlayerData", true):InvokeServer()
		for i, v in pairs(rs) do
			if not notifiedRoles[i] and (v.Role == "Murderer" or v.Role == "Sheriff" or v.Role == "Hero") then
				notifiedRoles[i] = true
				notifyr(i, v.Role)
			end
		end
	end)

	player.CharacterAdded:Connect(function(charNew)
		char = charNew
		humanoid = char:WaitForChild("Humanoid")
		notifiedRoles = {}
	end)

	local tptogundrop = Instance.new("BoolValue")
	tptogundrop.Parent = script


	local Toggle = MainTab:CreateToggle({
		Name = "Get gundrop",
		CurrentValue = false,
		Flag = "GrabGunToggle", 
		Callback = function(Value)
			tptogundrop.Value = Value
		end,
	})

	local Toggle = MainTab:CreateToggle({
		Name = "Snitch roles",
		CurrentValue = false,
		Flag = "SnitchRoles", 
		Callback = function(Value)
			snitchroles.Value = Value
		end,
	})

	local Toggle = MainTab:CreateToggle({
		Name = "Auto murderer win",
		CurrentValue = false,
		Flag = "AutoMWin", 
		Callback = function(Value)
			automwin.Value = Value
		end,
	})

	local Toggle = MainTab:CreateToggle({
		Name = "Hero Godmode (Kills You)",
		CurrentValue = false,
		Flag = "HG", 
		Callback = function(Value)
			hg.Value = Value
		end,
	})

	local Button = MainTab:CreateButton({
		Name = "Rejoin",
		Callback = function()
			if #Players:GetPlayers() <= 1 then
				Players.LocalPlayer:Kick("Server closed... Joining a new server!")
				wait()
				TeleportService:Teleport(PlaceId, Players.LocalPlayer)
			else
				TeleportService:TeleportToPlaceInstance(PlaceId, JobId, Players.LocalPlayer)
			end
		end,
	})

	local Button = MainTab:CreateButton({
		Name = "Teleport to Murderer",
		Callback = function()

		end,
	})

	local Button = MainTab:CreateButton({
		Name = "Teleport to Sheriff",
		Callback = function()

		end,
	})

	local Button = MainTab:CreateButton({
		Name = "Teleport to Hero",
		Callback = function()

		end,
	})


	game.Workspace.DescendantAdded:Connect(function(d)
		if d.Name == "GunDrop" and tptogundrop.Value == true and d:IsA("Part") then
			wait(0.1)
			local oldcf = char.PrimaryPart.CFrame
			char.PrimaryPart.CFrame = d.CFrame
			wait(0.1)
			char.PrimaryPart.CFrame = oldcf
		end
	end)
