
local Count = 0
local distance = 10
local ddistance = 1000

local SP_2 = script.Parent
local plr = game.Players.LocalPlayer
local character = plr.Character

local RP_2
local newtarget
local SP 
local target

local work = game:GetService("Workspace")

for _,v in pairs(work.Desks:GetChildren()) do
 if v:IsA("Part") then
  for _,k in pairs(plr.Character:GetChildren()) do
		if k.Name == "UpperTorso" and k:IsA("Part") or k.Name == "Torso" and k:IsA("Part") then
			newtarget = character[k.Name]
			print(k.Name)
		end
	end
	if (v.Position - newtarget.Position).magnitude < ddistance then
		ddistance = v.Position.magnitude
		SP = v.Position
	end	
else print(v.Name..", Is Not A Part") end

end


for i,v in pairs(plr.Character:GetChildren()) do
	if v.Name == "UpperTorso" or v.Name == "Torso" then
		target = v
		print(v.Name)
	else
		print(v.Name.." Not Valid Body Part")
	end
end



while wait(1/2) do
	if (SP - target.Position).magnitude < distance and SP_2.Range.Main_Bool_Value.Value == false then
		print(target.Parent.Name.." In Range")
		local RP = game:GetService("ReplicatedStorage"):WaitForChild("GUI_Clone"):FindFirstChild("F_GUI"):Clone()
	    RP_2 = game:GetService("ReplicatedStorage"):WaitForChild("Player_Input"):Clone()
		RP_2.Disabled = false
		RP.Parent = plr.PlayerGui
		RP_2.Parent = plr.PlayerScripts
	elseif  (SP - target.Position).magnitude <= distance and SP_2.Range.Main_Bool_Value.Value == true then
		print("GUI Already Open")
	elseif (SP - target.Position).magnitude >= distance and script.Current.Value == false then
		print(tostring(target.Position).." "..plr.Name.." To Far Away...")
		script.Main_Bool_Value.Value = false
		script.Current.Value = true
		RP_2.Disabled = true
		RP_2:Destroy()
		plr.PlayerGui.F_GUI:remove()
	else
		print(tostring(target.Position).." "..plr.Name.." To Far Away...")
		script.Main_Bool_Value.Value = false
	end
end