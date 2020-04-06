--Exiting from the Main GUI.

local SP = script.Parent
local plr = game.Players.LocalPlayer
local Main = SP.Parent.Parent
local pos = Main.Parent


SP.MouseEnter:Connect(function()
	SP.TextColor3 = Color3.fromRGB(166,0,0)
end)

SP.MouseLeave:Connect(function()
	SP.TextColor3 = Color3.fromRGB(0,0,0)
end)

SP.MouseButton1Click:Connect(function()
	Main.Parent.UIPL:Destroy()
	Main.Parent.UISC:Destroy()
	SP.Parent.Parent:TweenPosition(UDim2.new(Main.Position.X.Scale, Main.Position.X.Offset, -1, Main.Position.Y.Offset), Enum.EasingDirection.In, Enum.EasingStyle.Sine)
	wait(1)
	plr.Character.Range.Disabled = false
	SP.Parent.Parent:remove()
end)