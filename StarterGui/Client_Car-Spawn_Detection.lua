local RP = game:GetService("ReplicatedStorage"):WaitForChild("Remote_Functions"):FindFirstChild("RemoveCars")
local RP_2 = game:GetService("ReplicatedStorage"):WaitForChild("Remote_Functions"):FindFirstChild("Destroy")

local SP = script.Parent.Count
local plr = game.Players.LocalPlayer

local req 

print("Starting")
for i,v in pairs(plr.Cars:GetChildren()) do
	if v.Name ~= "Count" then
		print("Counted")
		SP.Value = SP.Value + 1
	end
end
	
plr.Cars.ChildAdded:Connect(function()
	SP.Value = SP.Value + 1
end)

plr.Cars.ChildRemoved:Connect(function()
	SP.Value = SP.Value - 1
end)

RP.OnClientInvoke = function()
	local plr = game.Players.LocalPlayer
	print("Starting_3")
	if script.CarRun.Value == false then
			if string.len(script.Car.Value) >= 2 and script.Car.Value ~= "" then
				print("Destroy")
				RP_2:InvokeServer(script.Car.Value, plr.Name)
				script.CarRun.Value = true
				script.Car.Value = ""
			elseif string.len(script.Car.Value) < 2 and script.Car.Value == "" then
				print("Not Destroying")
				script.CarRun.Value = true
				script.Car.Value = ""			
			end
		end
	end
