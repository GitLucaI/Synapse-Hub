local vim = game:GetService("VirtualInputManager")
local camera = workspace.CurrentCamera
local channel = game:GetService("TextChatService"):WaitForChild("TextChannels"):WaitForChild("RBXGeneral")
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")
local hum = char:FindFirstChildWhichIsA("Humanoid")
local Players = game:GetService("Players")
local RPS = game:GetService("ReplicatedStorage")
local RS = game:GetService("RunService")
local TeleportService = game:GetService("TeleportService")
local PlaceId = game.PlaceId
local JobId = game.JobId

local autoparry = Instance.new("BoolValue", script)
local hidebubble = Instance.new("BoolValue", script)

local zone

local dzc = Color3.fromRGB(85, 255, 127)
local ipdzc = Color3.fromRGB(255, 255, 127)
local pdzc = Color3.fromRGB(255, 0, 0)

local radius = 25
local function cz()
	if zone then zone:Destroy() end
	zone = Instance.new("Part")
	zone.CastShadow = false
	zone.Size = Vector3.new(radius, radius, radius)
	zone.Transparency = 0.5
	zone.Anchored = true
	zone.CanCollide = false
	zone.Shape = Enum.PartType.Ball
	zone.Material = Enum.Material.ForceField
	zone.Color = dzc
	zone.Name = "DetectionZone"
	zone.Parent = workspace
end



local function check()
	for _, obj in pairs(workspace.Balls:GetDescendants()) do
		if obj:IsA("BasePart") and obj.Color == Color3.fromRGB(255, 30, 30) then
			if workspace:FindFirstChild("DetectionZone") and ipdzc then
				workspace:FindFirstChild("DetectionZone").Color = ipdzc
			end
		end
		if obj:IsA("BasePart") and (obj.Position - hrp.Position).Magnitude <= radius and obj.Color == Color3.fromRGB(255, 30, 30) then
			if workspace:FindFirstChild("DetectionZone") and pdzc then
				workspace:FindFirstChild("DetectionZone").Color = pdzc
			end
			repeat
				vim:SendMouseButtonEvent(0, 0, 0, true, game, 0)
				task.wait(0.1)
				vim:SendMouseButtonEvent(0, 0, 0, false, game, 0)
			until obj.Color ~= Color3.fromRGB(255, 30, 30) or hum.Health == 0
			if workspace:FindFirstChild("DetectionZone") and dzc then
				workspace:FindFirstChild("DetectionZone").Color = dzc
			end
		end
	end
end

RS.RenderStepped:Connect(function()
	if hrp and hrp.Parent and autoparry.Value == true then
		if not zone then
			cz()
		end
		check()
	end
end)

local function uncz()
	if workspace:FindFirstChild("DetectionZone") then
		workspace:FindFirstChild("DetectionZone"):Destroy()
	end
end

RS.RenderStepped:Connect(function()
	if hrp and hrp.Parent and zone then
		zone.CFrame = hrp.CFrame
	end
	if workspace:FindFirstChild("DetectionZone") and dzc then
		if hidebubble.Value == true then
			workspace:FindFirstChild("DetectionZone").Transparency = 1
		else
			workspace:FindFirstChild("DetectionZone").Transparency = 0
		end
		workspace:FindFirstChild("DetectionZone").Color = dzc
		workspace:FindFirstChild("DetectionZone").Size = Vector3.new(radius, radius, radius)
	end
end)

autoparry.Changed:Connect(function()
	if autoparry.Value == true then
		cz()
	else
		uncz()
	end
end)

player.CharacterAdded:Connect(function(c)
	char = c
	hrp = c:WaitForChild("HumanoidRootPart")
	hum = c:FindFirstChildWhichIsA("Humanoid")
	if autoparry.Value == true then
		cz()
	end
end)

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local humanoid = char:FindFirstChildWhichIsA("Humanoid")
player.CharacterAdded:Connect(function(c)
	if autoparry.Value == true then
		cz()
	end
end)

local Window = Rayfield:CreateWindow({
	Name = "Synapse Hub Blade Ball ver".. game.PlaceId,
	LoadingTitle = "Loading interface",
	LoadingSubtitle = "by Synapse",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = "SHBladeBall",
		FileName = "SynapseHubBB"
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

MainTab:CreateToggle({ Name = "Auto Parry", CurrentValue = false, Flag = "AP", Callback = function(Value) autoparry.Value = Value end })

MainTab:CreateToggle({ Name = "Hide Bubble", CurrentValue = false, Flag = "AP", Callback = function(Value) hidebubble.Value = Value end })

local Slider = MainTab:CreateSlider({
	Name = "Change Radius",
	Range = {25, 75},
	Increment = 1,
	Suffix = "Radius",
	CurrentValue = 25,
	Flag = "RadiusSlider",
	Callback = function(Value)
		radius = Value
	end,
})

local ColorPicker = MainTab:CreateColorPicker({
	Name = "Normal Color",
	Color = Color3.fromRGB(85, 255, 127),
	Flag = "ColorPicker1", 
	Callback = function(Value)
		dzc = Value
	end
})

local ColorPicker = MainTab:CreateColorPicker({
	Name = "Parrying Color",
	Color = Color3.fromRGB(255, 255, 127),
	Flag = "ColorPicker2", 
	Callback = function(Value)
		ipdzc = Value
	end
})


local ColorPicker = MainTab:CreateColorPicker({
	Name = "Parried Color",
	Color = Color3.fromRGB(255,0,0),
	Flag = "ColorPicker3", 
	Callback = function(Value)
		pdzc = Value
	end
})

