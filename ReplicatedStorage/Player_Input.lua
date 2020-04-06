
local plr = game.Players.LocalPlayer
local Range = plr.Character.Range

local RP = game:GetService("ReplicatedStorage"):WaitForChild("GUI_Clone"):FindFirstChild("Car_Spawning_GUI"):Clone()
local UIS = game:GetService("UserInputService")

UIS.InputBegan:Connect(function(key, keyboard)
	if key.KeyCode == Enum.KeyCode.F then
		print(tostring(key.KeyCode).." Pressed")
		Range.Disabled = true
		plr.PlayerGui.F_GUI:remove()
		Range.Main_Bool_Value.Value = false
		Range.Current.Value = true
		RP.Parent = plr.PlayerGui
		script:Destroy()		
	elseif keyboard then
		print("Typing")
	end
end)
