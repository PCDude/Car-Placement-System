local destroy = {}

function destroy:Destroy(plr, Car)
	local SP = script.Parent
	for i,v in pairs(workspace:GetChildren()) do
		if v.Name == Car..plr.Name then
			print(v.Name..", Coming From: "..SP.Name..", ONLY ONE CAR ALLOWED: DELETING...")
			v:Destroy()
		end
	end
end


return destroy
