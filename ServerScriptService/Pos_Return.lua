local module = {}

function module:MAGNITUDE(plr, newdistance, new)
	local SP = script.Parent
	for _,k in pairs(SP.Parent.ServerStorage.Car_Clone:GetChildren()) do
		if k.Name == new then
			for i,v in pairs(plr.Character:GetChildren()) do 
				if v.Name == "Car_Range" then
					print(v.Name..": Deprecated Item, Destroying...")
					v:Destroy()
				else
					print(v.Name..": Valid Item, Iterating...")
				end
			end
			local k = k:Clone()			
			local RP = game:GetService("ReplicatedStorage"):WaitForChild("Car_Range"):Clone()
			RP.Disabled = false
                k.PrimaryPart.Orientation = Vector3.new(newdistance)
                k:SetPrimaryPartCFrame(CFrame.new(newdistance.X,k.PrimaryPart.Position.Y,newdistance.Z))
                k.Parent = workspace	
			local newvalue = Instance.new("StringValue", RP)
			newvalue.Name = "Car"
                newvalue.Value = new
                RP.Parent = plr.Character
                k.Name = k.Name..plr.Name
			wait(1/4)
			for _,v in pairs(plr.Character:GetChildren()) do
				if v:IsA("Part") or v:IsA("MeshPart") then
					for _,p in pairs(k:GetChildren()) do
						for _,l in pairs(p:GetChildren()) do
							if l.Name == "DriveSeat" then								
								v.CFrame = CFrame.new(l.Position)
							end
						end
					end
				end
			end
		end
	end
end

return module