-- Gui to Lua
-- Version: 3.2

-- Instances:

local SynapseBootstrapper = Instance.new("ScreenGui")
local TopBar = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local TextLabel = Instance.new("TextLabel")
local ImageLabel = Instance.new("ImageLabel")
local Loader = Instance.new("Frame")
local TextLabel_2 = Instance.new("TextLabel")
local Main = Instance.new("TextLabel")
local Sub = Instance.new("TextLabel")
local Progress = Instance.new("Frame")
local Bar = Instance.new("Frame")
local Btn = Instance.new("TextButton")
local Sidebar = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")
local Network = Instance.new("TextLabel")
local Backup = Instance.new("TextLabel")
local Executorlevel = Instance.new("TextLabel")
local Validating = Instance.new("TextLabel")
local Loading = Instance.new("TextLabel")

--Properties:

SynapseBootstrapper.Name = "SynapseBootstrapper"
SynapseBootstrapper.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
SynapseBootstrapper.Enabled = false
SynapseBootstrapper.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

TopBar.Name = "TopBar"
TopBar.Parent = SynapseBootstrapper
TopBar.BackgroundColor3 = Color3.fromRGB(66, 66, 66)
TopBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
TopBar.BorderSizePixel = 0
TopBar.Position = UDim2.new(0.357414454, 0, 0.342615008, 0)
TopBar.Size = UDim2.new(0.285171092, 0, 0.0484261513, 0)

UICorner.Parent = TopBar

TextLabel.Parent = TopBar
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.0711111128, 0, 0.150000006, 0)
TextLabel.Size = UDim2.new(0.928888917, 0, 0.5, 0)
TextLabel.Font = Enum.Font.SourceSansBold
TextLabel.Text = "Synapse Hub"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true
TextLabel.TextXAlignment = Enum.TextXAlignment.Left

ImageLabel.Parent = TopBar
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BackgroundTransparency = 1.000
ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel.BorderSizePixel = 0
ImageLabel.Size = UDim2.new(0.0711111128, 0, 0.800000012, 0)
ImageLabel.Image = "rbxassetid://136456940340850"

Loader.Name = "Loader"
Loader.Parent = SynapseBootstrapper
Loader.BackgroundColor3 = Color3.fromRGB(89, 80, 80)
Loader.BorderColor3 = Color3.fromRGB(0, 0, 0)
Loader.BorderSizePixel = 0
Loader.Position = UDim2.new(0.357414454, 0, 0.381355941, 0)
Loader.Size = UDim2.new(0.285171092, 0, 0.27602905, 0)

TextLabel_2.Parent = Loader
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BackgroundTransparency = 1.000
TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_2.BorderSizePixel = 0
TextLabel_2.Position = UDim2.new(0, 0, 0.921052635, 0)
TextLabel_2.Size = UDim2.new(1, 0, 0.0789473653, 0)
TextLabel_2.Font = Enum.Font.SourceSans
TextLabel_2.Text = "https://discord.gg/vMbNSSa9TN for updates!"
TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.TextScaled = true
TextLabel_2.TextSize = 14.000
TextLabel_2.TextWrapped = true

Main.Name = "Main"
Main.Parent = Loader
Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Main.BackgroundTransparency = 1.000
Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0, 0, 0.0877192989, 0)
Main.Size = UDim2.new(1, 0, 0.157894731, 0)
Main.Font = Enum.Font.SourceSansBold
Main.Text = "Connecting with Synapse network"
Main.TextColor3 = Color3.fromRGB(255, 255, 255)
Main.TextScaled = true
Main.TextSize = 14.000
Main.TextWrapped = true

Sub.Name = "Sub"
Sub.Parent = Loader
Sub.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Sub.BackgroundTransparency = 1.000
Sub.BorderColor3 = Color3.fromRGB(0, 0, 0)
Sub.BorderSizePixel = 0
Sub.Position = UDim2.new(0, 0, 0.245614037, 0)
Sub.Size = UDim2.new(1, 0, 0.0701754391, 0)
Sub.Font = Enum.Font.SourceSans
Sub.Text = "Trying to connect with Synapse We are currently connecting with Synapse..."
Sub.TextColor3 = Color3.fromRGB(255, 255, 255)
Sub.TextScaled = true
Sub.TextSize = 14.000
Sub.TextWrapped = true

Progress.Name = "Progress"
Progress.Parent = Loader
Progress.BackgroundColor3 = Color3.fromRGB(61, 55, 55)
Progress.BorderColor3 = Color3.fromRGB(49, 44, 44)
Progress.BorderSizePixel = 2
Progress.Position = UDim2.new(0.0133327916, 0, 0.393069476, 0)
Progress.Size = UDim2.new(0.975556135, 0, 0.220965475, 0)

Bar.Name = "Bar"
Bar.Parent = Progress
Bar.BackgroundColor3 = Color3.fromRGB(150, 135, 135)
Bar.BorderColor3 = Color3.fromRGB(0, 0, 0)
Bar.BorderSizePixel = 0
Bar.Position = UDim2.new(-0.0022727272, 0, 0, 0)
Bar.Size = UDim2.new(0.231818184, 0, 1, 0)

Btn.Name = "Btn"
Btn.Parent = Loader
Btn.BackgroundColor3 = Color3.fromRGB(0, 154, 69)
Btn.BorderColor3 = Color3.fromRGB(49, 44, 44)
Btn.BorderSizePixel = 2
Btn.Position = UDim2.new(0.0111155873, 0, 0.663533807, 0)
Btn.Size = UDim2.new(0.977773726, 0, 0.222813383, 0)
Btn.Font = Enum.Font.SourceSansBold
Btn.Text = "Finish"
Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
Btn.TextScaled = true
Btn.TextSize = 14.000
Btn.TextWrapped = true

Sidebar.Name = "Sidebar"
Sidebar.Parent = SynapseBootstrapper
Sidebar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Sidebar.BackgroundTransparency = 1.000
Sidebar.BorderColor3 = Color3.fromRGB(0, 0, 0)
Sidebar.BorderSizePixel = 0
Sidebar.Position = UDim2.new(0.23700887, 0, 0.342615008, 0)
Sidebar.Size = UDim2.new(0.120405577, 0, 0.314769983, 0)

UIListLayout.Parent = Sidebar
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

Network.Name = "Network"
Network.Parent = Sidebar
Network.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Network.BackgroundTransparency = 1.000
Network.BorderColor3 = Color3.fromRGB(0, 0, 0)
Network.BorderSizePixel = 0
Network.Size = UDim2.new(0.947368443, 0, 0.200000003, 0)
Network.Font = Enum.Font.SourceSansBold
Network.Text = "🟡  Connecting with Synapse Network"
Network.TextColor3 = Color3.fromRGB(255, 255, 255)
Network.TextScaled = true
Network.TextSize = 14.000
Network.TextWrapped = true
Network.TextXAlignment = Enum.TextXAlignment.Left

Backup.Name = "Backup"
Backup.Parent = Sidebar
Backup.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Backup.BackgroundTransparency = 1.000
Backup.BorderColor3 = Color3.fromRGB(0, 0, 0)
Backup.BorderSizePixel = 0
Backup.Size = UDim2.new(0.947368443, 0, 0.200000003, 0)
Backup.Font = Enum.Font.SourceSansBold
Backup.Text = "🟡  Connecting with backup settings"
Backup.TextColor3 = Color3.fromRGB(255, 255, 255)
Backup.TextScaled = true
Backup.TextSize = 14.000
Backup.TextWrapped = true
Backup.TextXAlignment = Enum.TextXAlignment.Left

Executorlevel.Name = "Executorlevel"
Executorlevel.Parent = Sidebar
Executorlevel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Executorlevel.BackgroundTransparency = 1.000
Executorlevel.BorderColor3 = Color3.fromRGB(0, 0, 0)
Executorlevel.BorderSizePixel = 0
Executorlevel.Size = UDim2.new(0.947368443, 0, 0.200000003, 0)
Executorlevel.Font = Enum.Font.SourceSansBold
Executorlevel.Text = "🟡  Checking executor level"
Executorlevel.TextColor3 = Color3.fromRGB(255, 255, 255)
Executorlevel.TextScaled = true
Executorlevel.TextSize = 14.000
Executorlevel.TextWrapped = true
Executorlevel.TextXAlignment = Enum.TextXAlignment.Left

Validating.Name = "Validating"
Validating.Parent = Sidebar
Validating.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Validating.BackgroundTransparency = 1.000
Validating.BorderColor3 = Color3.fromRGB(0, 0, 0)
Validating.BorderSizePixel = 0
Validating.Position = UDim2.new(0, 0, 0.600000024, 0)
Validating.Size = UDim2.new(0.947368443, 0, 0.200000003, 0)
Validating.Font = Enum.Font.SourceSansBold
Validating.Text = "🟡  Validating Place Id"
Validating.TextColor3 = Color3.fromRGB(255, 255, 255)
Validating.TextScaled = true
Validating.TextSize = 14.000
Validating.TextWrapped = true
Validating.TextXAlignment = Enum.TextXAlignment.Left

Loading.Name = "Loading"
Loading.Parent = Sidebar
Loading.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Loading.BackgroundTransparency = 1.000
Loading.BorderColor3 = Color3.fromRGB(0, 0, 0)
Loading.BorderSizePixel = 0
Loading.Size = UDim2.new(0.947368443, 0, 0.200000003, 0)
Loading.Font = Enum.Font.SourceSansBold
Loading.Text = "🟡  Loading the script."
Loading.TextColor3 = Color3.fromRGB(255, 255, 255)
Loading.TextScaled = true
Loading.TextSize = 14.000
Loading.TextWrapped = true
Loading.TextXAlignment = Enum.TextXAlignment.Left

-- Scripts:

local function UPHVX_fake_script() -- SynapseBootstrapper.client 
	local script = Instance.new('LocalScript', SynapseBootstrapper)

	local object = script.Parent
	object.Enabled = true
	local Sidebar = object.Sidebar
	local loader = object.Loader
	local Progressbar = loader.Progress.Bar
	local lmain = loader.Main
	local lsub = loader.Sub
	local lbutton = loader.Btn
	local status = "loading"
	function fail(err, desc)
		status = "failed"
		lbutton.BackgroundColor3 = Color3.fromRGB(155, 0, 0)
		lbutton.TextTransparency = 0
		lbutton.Interactable = true
		lbutton.Text = "Retry"
		lmain.Text = err
		lsub.Text = desc
	end
	
	function retry()
		loadstring(game:httpget('https://raw.githubusercontent.com/GitLucaI/Synapse-Hub/refs/heads/main/main.lua'))()
		task.wait()
		object:Destroy()
	end
	
	function boot()
	end
	
	
	lbutton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	lbutton.TextTransparency = 0.5
	lbutton.Interactable = false
	local t = math.random(1,2)
	if t == 2 then
		fail("This is a error", "We are sorry")
	end
	
	
	lbutton.MouseButton1Click:Connect(function()
		if status == "loading" then
			return
		end
		if status == "failed" then
			retry()
		elseif status == "loaded" then
			boot()
		end
	end)
end
coroutine.wrap(UPHVX_fake_script)()
