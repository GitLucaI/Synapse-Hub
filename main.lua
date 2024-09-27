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
