local channel = game:GetService("TextChatService"):WaitForChild("TextChannels"):WaitForChild("RBXGeneral")
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local ppart = char:WaitForChild("HumanoidRootPart")
local ESPFolder = Instance.new("Folder")
ESPFolder.Name = "ESPFolder"
ESPFolder.Parent = workspace
player.CharacterAdded:Connect(function(c)
	char = c
	ppart = c:WaitForChild("HumanoidRootPart")
	humanoid = c:WaitForChild("Humanoid")
	notifiedRoles = {}
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

function createBillboard(texts, adornee, bname)
	local billboard = Instance.new("BillboardGui")
	local text = Instance.new("TextLabel")
	text.Parent = billboard
	text.Size = UDim2.new(1,0,1,0)
	text.Text = texts
	billboard.Adornee = adornee
	billboard.Name = bname
	billboard.Parent = ESPFolder
end

local MainTab = Window:CreateTab("Main", 4483362458)

local murderer, hero, sheriff
local notifiedRoles = {}

local snitchroles = Instance.new("BoolValue", script)
local automwin = Instance.new("BoolValue", script)
local hg = Instance.new("BoolValue", script)
local notify = Instance.new("BoolValue", script)
local tptogundrop = Instance.new("BoolValue", script)
local cesp = Instance.new("BoolValue", script)

function notifyr(playerrole, role)
	if notifiedRoles[playerrole] then return end
	notifiedRoles[playerrole] = true
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
			Content = playerrole.Name .. " is the " .. role .. "!",
			Duration = 3.5,
			Image = "rewind",
		})
		if snitchroles.Value then
			channel:SendAsync(playerrole.Name .. " is the " .. role .. "!", "All")
		end
	end
	if automwin.Value and playerrole == player and role == "Murderer" and char then
		local primarypartk = char.PrimaryPart
		for _, playerv in pairs(Players:GetPlayers()) do
			if playerv ~= player then
				local c = playerv.Character
				if c and c:FindFirstChild("HumanoidRootPart") then
					repeat
						primarypartk.CFrame = c.HumanoidRootPart.CFrame
						task.wait()
					until c:FindFirstChildWhichIsA("Humanoid").Health <= 0
				end
			end
		end
	end
	if role == "Sheriff" and sheriff ~= player and hg.Value and murderer ~= player then
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

MainTab:CreateToggle({
	Name = "Notify Roles",
	CurrentValue = false,
	Flag = "NotifyToggle", 
	Callback = function(Value)
		notify.Value = Value
	end,
})

MainTab:CreateToggle({
	Name = "Snitch roles",
	CurrentValue = false,
	Flag = "SnitchRoles", 
	Callback = function(Value)
		snitchroles.Value = Value
	end,
})

MainTab:CreateToggle({
	Name = "Auto murderer win",
	CurrentValue = false,
	Flag = "AutoMWin", 
	Callback = function(Value)
		automwin.Value = Value
	end,
})

MainTab:CreateToggle({
	Name = "Hero Godmode (Kills You)",
	CurrentValue = false,
	Flag = "HG", 
	Callback = function(Value)
		hg.Value = Value
	end,
})

MainTab:CreateToggle({
	Name = "Coin Esp",
	CurrentValue = false,
	Flag = "CESP", 
	Callback = function(Value)
		cesp.Value = Value
	end,
})

MainTab:CreateToggle({
	Name = "Get gundrop",
	CurrentValue = false,
	Flag = "GrabGunToggle", 
	Callback = function(Value)
		tptogundrop.Value = Value
	end,
})

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
	if cesp.Value == true then
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
	if cesp.Value == true then
		if coin.Name == "CoinVisual" then
			createBillboard("Coin", coin, "coinesp")
		end
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

RS.RenderStepped:Connect(function()
	if not notify.Value then return end
	local rs = RPS:FindFirstChild("GetPlayerData", true):InvokeServer()
	for i, v in pairs(rs) do
		local p = Players:FindFirstChild(i)
		if p and (v.Role == "Murderer" or v.Role == "Sheriff" or v.Role == "Hero") then
			notifyr(p, v.Role)
		end
	end
end)

game.Workspace.DescendantAdded:Connect(function(d)
	if d.Name == "GunDrop" and tptogundrop.Value and d:IsA("Part") then
		task.wait(0.1)
		local oldcf = char.PrimaryPart.CFrame
		char.PrimaryPart.CFrame = d.CFrame
		task.wait(0.1)
		char.PrimaryPart.CFrame = oldcf
	end
end)
