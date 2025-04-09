local vim = game:GetService("VirtualInputManager")

local camera = workspace.CurrentCamera
local channel = game:GetService("TextChatService"):WaitForChild("TextChannels"):WaitForChild("RBXGeneral")
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local ppart = char:WaitForChild("HumanoidRootPart")
local ESPFolder = Instance.new("Folder")
ESPFolder.Name = "ESPFolder"
ESPFolder.Parent = workspace

local Players = game:GetService("Players")
local RPS = game:GetService("ReplicatedStorage")
local RS = game:GetService("RunService")
local TeleportService = game:GetService("TeleportService")
local PlaceId = game.PlaceId
local JobId = game.JobId

local murderer, sheriff, hero
local notifiedRoles = {}

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local humanoid = char:FindFirstChildWhichIsA("Humanoid")
player.CharacterAdded:Connect(function(c)
	char = c
	ppart = c:WaitForChild("HumanoidRootPart")
	humanoid = c:WaitForChild("Humanoid")
	notifiedRoles = {}
end)



local Window = Rayfield:CreateWindow({
	Name = "Synapse Hub MM2 ver".. game.PlaceId,
	LoadingTitle = "Loading interface",
	LoadingSubtitle = "by Synapse",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = nil,
		FileName = "SynapseHubMM2"
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

function createBillboard(texts, adornee, bname)
	local billboard = Instance.new("BillboardGui")
	billboard.Size = UDim2.new(0, 50, 0, 20)
	billboard.StudsOffset = Vector3.new(0, 0, 0)
	billboard.AlwaysOnTop = true
	billboard.Name = bname
	billboard.Adornee = adornee
	billboard.Parent = ESPFolder

	local text = Instance.new("TextLabel")
	text.Size = UDim2.new(1, 0, 1, 0)
	text.BackgroundTransparency = 1
	text.TextScaled = true
	text.TextColor3 = Color3.new(1, 1, 1)
	text.TextStrokeTransparency = 0
	text.Font = Enum.Font.SourceSansBold
	text.Text = texts
	text.Parent = billboard
end

local MainTab = Window:CreateTab("Main", 4483362458)

local snitchroles = Instance.new("BoolValue", script)
local automwin = Instance.new("BoolValue", script)
local hg = Instance.new("BoolValue", script)
local notify = Instance.new("BoolValue", script)
local tptogundrop = Instance.new("BoolValue", script)
local cesp = Instance.new("BoolValue", script)
local murdereraimbot = Instance.new("BoolValue", script)
local sheriffaimbot = Instance.new("BoolValue", script)
local noclip = Instance.new("BoolValue", script)
local antifling = Instance.new("BoolValue", script)

RS.RenderStepped:Connect(function()
	if murdereraimbot.Value and murderer and murderer.Character and murderer.Character:FindFirstChild("HumanoidRootPart") then
		camera.CFrame = CFrame.new(camera.CFrame.Position, murderer.Character.HumanoidRootPart.Position)
	end
	if sheriffaimbot.Value then
		if sheriff and sheriff.Character and sheriff.Character:FindFirstChild("HumanoidRootPart") then
			camera.CFrame = CFrame.new(camera.CFrame.Position, sheriff.Character.HumanoidRootPart.Position)
		elseif hero and hero.Character and hero.Character:FindFirstChild("HumanoidRootPart") then
			camera.CFrame = CFrame.new(camera.CFrame.Position, hero.Character.HumanoidRootPart.Position)
		end
	end
	if char then
		for _, part in pairs(char:GetChildren()) do
			if part:IsA("BasePart") and part.Name == "HumanoidRootPart" or part.Name == "Torso" or part.Name == "LowerTorso" or part.Name == "UpperTorso" then
				part.CanCollide = not noclip.Value
			end
		end
	end
	for _, prplayer in pairs(Players:GetPlayers()) do
		if prplayer ~= player and prplayer.Character then
			for _, part in pairs(prplayer.Character:GetChildren()) do
				if part:IsA("BasePart") and part.Name == "HumanoidRootPart" or part.Name == "Torso" or part.Name == "LowerTorso" or part.Name == "UpperTorso" then
					part.CanCollide = not antifling.Value
				end
			end
		end
	end
end)

function notifyr(p, role)
	if not p or not p.Character or notifiedRoles[p] then return end
	notifiedRoles[p] = true

	if p ~= player and role ~= "Innocent" then
		if role == "Murderer" and murderer == nil then
			print(p, ",", role)
			Rayfield:Notify({
				Title = "Roles",
				Content = p.Name .. " is the " .. role .. "!",
				Duration = 3.5,
				Image = "rewind",
			}) 
		elseif role == "Sheriff" and sheriff == nil then
			print(p, ",", role)
			Rayfield:Notify({
				Title = "Roles",
				Content = p.Name .. " is the " .. role .. "!",
				Duration = 3.5,
				Image = "rewind",
			})
		elseif role == "Hero" and hero == nil then
			print(p, ",", role)
			Rayfield:Notify({
				Title = "Roles",
				Content = p.Name .. " is the " .. role .. "!",
				Duration = 3.5,
				Image = "rewind",
			})
		end
		if snitchroles.Value then
			channel:SendAsync(p.Name .. " is the " .. role .. "!", "All")
		end
	end

	if automwin.Value and p == player and role == "Murderer" and char then
		local primarypartk = char:FindFirstChild("HumanoidRootPart")
		for _, playerv in pairs(Players:GetPlayers()) do
			if playerv ~= player then
				local c = playerv.Character
				if c and c:FindFirstChild("HumanoidRootPart") and c:FindFirstChildWhichIsA("Humanoid") then
					player.Backpack.ChildAdded:Connect(function()
						getgenv().KEY = "One" 

						vim:SendKeyEvent(true, getgenv().KEY, false, game)
						task.wait(0.1)
						vim:SendKeyEvent(false, getgenv().KEY, false, game)

					end)
					repeat
						primarypartk.CFrame = c.HumanoidRootPart.CFrame
						
						vim:SendMouseButtonEvent(0, 0, 0, true, game, 0)
						task.wait(0.1)
						vim:SendMouseButtonEvent(0, 0, 0, false, game, 0)
						task.wait()
					until c:FindFirstChildWhichIsA("Humanoid").Health <= 0 or not automwin.Value
				end
			end
		end
	end
	task.wait()

	if role == "Murderer" then
		murderer = p
		if murderer:IsA("Player") then
			local mc = murderer.Character
			if mc then
				local hum = mc:FindFirstChildWhichIsA("Humanoid")
				if hum then
					hum.Died:Connect(function()
						murderer = nil
					end)
				end
			end
		end
	end
	if role == "Sheriff" then
		sheriff = p
		if sheriff:IsA("Player") then
			local mc = sheriff.Character
			if mc then
				local hum = mc:FindFirstChildWhichIsA("Humanoid")
				if hum then
					hum.Died:Connect(function()
						sheriff = nil
					end)
				end
			end
		end
	end
	if role == "Hero" then
		hero = p
		if hero:IsA("Player") then
			local mc = hero.Character
			if mc then
				local hum = mc:FindFirstChildWhichIsA("Humanoid")
				if hum then
					hum.Died:Connect(function()
						hero = nil
					end)
				end
			end
		end
	end
	if role == "Innocent" then
	end

	if role == "Sheriff" and hg.Value and murderer ~= player then
		local h = player.Character and player.Character:FindFirstChildWhichIsA("Humanoid")
		if h then h.Health = 0 end
	end
end




local ESP = MainTab:CreateButton({
	Name = "Player ESP",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Ihaveash0rtnamefordiscord/Releases/main/MurderMystery2HighlightESP"))()
	end,
})

MainTab:CreateToggle({ Name = "Notify Roles", CurrentValue = false, Flag = "NotifyToggle", Callback = function(Value) notify.Value = Value end })
MainTab:CreateToggle({ Name = "Snitch roles", CurrentValue = false, Flag = "SnitchRoles", Callback = function(Value) snitchroles.Value = Value end })
MainTab:CreateToggle({ Name = "Auto murderer win", CurrentValue = false, Flag = "AutoMWin", Callback = function(Value) automwin.Value = Value end })
MainTab:CreateToggle({ Name = "Hero Godmode (Kills You)", CurrentValue = false, Flag = "HG", Callback = function(Value) hg.Value = Value end })
MainTab:CreateToggle({ Name = "Coin Esp", CurrentValue = false, Flag = "CESP", Callback = function(Value) cesp.Value = Value end })
MainTab:CreateToggle({ Name = "Get gundrop", CurrentValue = false, Flag = "GrabGunToggle", Callback = function(Value) tptogundrop.Value = Value end })
MainTab:CreateToggle({ Name = "Murderer Aimbot (Must enable notify)", CurrentValue = false, Flag = "MAimbot", Callback = function(Value) murdereraimbot.Value = Value end })
MainTab:CreateToggle({ Name = "Sheriff Aimbot (Must enable notify)", CurrentValue = false, Flag = "SAimbot", Callback = function(Value) sheriffaimbot.Value = Value end })
MainTab:CreateToggle({ Name = "Noclip", CurrentValue = false, Flag = "Noclip", Callback = function(Value) noclip.Value = Value end })
MainTab:CreateToggle({ Name = "AntiFling", CurrentValue = false, Flag = "AntiFling", Callback = function(Value) antifling.Value = Value end })
MainTab:CreateButton({
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

cesp.Changed:Connect(function()
	if cesp.Value then
		for _, coin in pairs(workspace:GetDescendants()) do
			if coin.Name == "CoinVisual" then
				createBillboard("Coin", coin, "coinesp")
			end
		end
	else
		for _, coinesp in pairs(ESPFolder:GetChildren()) do
			if coinesp.Name == "coinesp" then
				coinesp:Destroy()
			end
		end
	end
end)

workspace.DescendantAdded:Connect(function(coin)
	if cesp.Value and coin.Name == "CoinVisual" then
		createBillboard("Coin", coin, "coinesp")
	end
end)

MainTab:CreateButton({
	Name = "Teleport to Murderer (Must enable notify)",
	Callback = function()
		if murderer and murderer.Character and murderer.Character:FindFirstChild("HumanoidRootPart") then
			ppart.CFrame = murderer.Character.HumanoidRootPart.CFrame
		end
	end,
})

MainTab:CreateButton({
	Name = "Teleport to Sheriff (Must enable notify)",
	Callback = function()
		if sheriff and sheriff.Character and sheriff.Character:FindFirstChild("HumanoidRootPart") then
			ppart.CFrame = sheriff.Character.HumanoidRootPart.CFrame
		end
	end,
})

MainTab:CreateButton({
	Name = "Teleport to Hero (Must enable notify)",
	Callback = function()
		if hero and hero.Character and hero.Character:FindFirstChild("HumanoidRootPart") then
			ppart.CFrame = hero.Character.HumanoidRootPart.CFrame
		end
	end,
})



local function sr()
	if not notify.Value then return end
	local success, rs = pcall(function()
		return RPS:FindFirstChild("GetPlayerData", true):InvokeServer()
	end)
	if success then
		for name, data in pairs(rs) do
			local p = Players:FindFirstChild(name)
			if p and data and (data.Role == "Murderer" or data.Role == "Sheriff" or data.Role == "Hero" or data.Role == "Innocent") then
				if not notifiedRoles[p] then
					notifyr(p, data.Role)
				end
			end
		end
	end
end

RS.RenderStepped:Connect(sr)
RS.RenderStepped:Connect(function()
	if murdereraimbot.Value and murderer and murderer.Character then
		local mc = murderer.Character
		local tp = mc:FindFirstChild("Torso") or mc:FindFirstChild("LowerTorso") or mc:FindFirstChild("UpperTorso") or mc:FindFirstChild("HumanoidRootPart")

		if tp then
			local ro = camera.CFrame.Position
			local rd = (tp.Position - ro).unit * 500

			local rr = workspace:Raycast(ro, rd)

			if rr and rr.Instance == tp then
				vim:SendMouseButtonEvent(0, 0, 0, true, game, 0)
				task.wait(0.1)
				vim:SendMouseButtonEvent(0, 0, 0, false, game, 0)
			end
		end
	end
end)

workspace.DescendantAdded:Connect(function(d)
	if d.Name == "GunDrop" and tptogundrop.Value and d:IsA("Part") then
		task.wait(0.1)
		local oldcf = char.PrimaryPart.CFrame
		char.PrimaryPart.CFrame = d.CFrame
		task.wait(0.1)
		char.PrimaryPart.CFrame = oldcf
	end
end)
