local object = script.Parent
object.Enabled = true
local Sidebar = object.Sidebar
local loader = object.Loader
local Progressbar = loader.Progress.Bar
local lmain = loader.Main
local lsub = loader.Sub
local lbutton = loader.Btn

function fail(err, desc)
	lbutton.BackgroundColor3 = Color3.fromRGB(155, 0, 0)
	lbutton.TextTransparency = 0
	lbutton.Interactable = true
	lbutton.Text = "Retry"
	lmain.Text = err
	lsub.Text = desc
end

function retry()
	loadstring()
end

lbutton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
lbutton.TextTransparency = 0.5
lbutton.Interactable = false

fail("This is a error", "We are sorry")
