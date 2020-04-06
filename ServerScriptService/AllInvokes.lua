local RP = game:GetService("ReplicatedStorage"):WaitForChild("Remote_Functions"):FindFirstChild("Access_CarAmountS")
local RP_2 = game:GetService("ReplicatedStorage"):WaitForChild("Remote_Functions"):FindFirstChild("RemoveCars")

RP.OnServerInvoke = function(plr)
	print("Starting_2")
	if plr.PlayerGui.Gui_Car_Spawn_Detection.CarRun.Value == false then
		RP_2:InvokeClient(plr)
	else
		print("Value Is True Cannot Continue")
	end
end

local RP_3 = game:GetService("ReplicatedStorage"):WaitForChild("Remote_Functions"):FindFirstChild("Access_Storage")

RP_3.OnServerInvoke = function(plr, newdistance, new, other, another)
	local req = require(game:GetService("ServerScriptService"):WaitForChild("Pos_Return.mag")):MAGNITUDE(plr, new, other)
end

local RP_4 = game:GetService("ReplicatedStorage"):WaitForChild("Remote_Functions"):FindFirstChild("Destroy")

RP_4.OnServerInvoke = function(plr, Car)
 	local req_2 = require(game:GetService("ServerScriptService"):WaitForChild("Destroy_Car")):Destroy(plr, Car)
end


