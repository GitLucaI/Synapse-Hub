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
local zone

local function cz()
	if zone then zone:Destroy() end
	zone = Instance.new("Part")
	zone.Size = Vector3.new(20, 20, 20)
	zone.Transparency = 0.5
	zone.Anchored = true
	zone.CanCollide = false
	zone.Shape = Enum.PartType.Ball
	zone.Material = Enum.Material.ForceField
	zone.Color = Color3.fromRGB(255, 0, 0)
	zone.Name = "DetectionZone"
	zone.Parent = workspace
end

local function check()
	for _, obj in pairs(workspace.Balls:GetDescendants()) do
		if obj:IsA("BasePart") and (obj.Position - hrp.Position).Magnitude <= 35 and obj.Color == Color3.fromRGB(255, 30, 30) then
			repeat
				vim:SendMouseButtonEvent(0, 0, 0, true, game, 0)
				task.wait(0.1)
				vim:SendMouseButtonEvent(0, 0, 0, false, game, 0)
			until obj.Color ~= Color3.fromRGB(255, 30, 30) or hum.Health == 0
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
