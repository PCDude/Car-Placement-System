local SP

local S

local desk

local ddistance = 100000
local distance = 200
local totaldistance = 50

local newtarget

local plr = game.Players.LocalPlayer
local char = plr.Character

local work = game:GetService("workspace")


wait(math.pi/2)
for i,v in pairs(work:GetChildren()) do
	if v.Name == script.Parent.Car_Range.Car.Value..plr.Name then
		print(v.Name..",  Found Parent! Assigning...")
		SP = v.PrimaryPart
		S = v
	else
		print(v.Name..",  Invalid Parent: Iterating...")
	end
end

print("STARTING TO GO")

for _,v in pairs(work:FindFirstChild("Desks"):GetChildren()) do
  if v:IsA("Part") then
	for _,k in pairs(char:GetChildren()) do
		if k.Name == "UpperTorso" or k.Name == "Torso" then
			newtarget = k
	end
end	
	if (v.Position - newtarget.Position).magnitude < ddistance then
			ddistance = v.Position.magnitude
			desk = v.Position
		end
 	else
		print(v.Name..", Not A Part")
	end
end

print("MODLING")


while wait(1/2) do
		if (SP.Position - newtarget.Position).magnitude < distance then
			if (SP.Position - desk).magnitude >= totaldistance then
				script:Destroy()
			else
				print(SP.magnitude.." To Close To: "..desk.magnitude.." Keeping...")
			end
			
		elseif (SP.Position - newtarget.Position).magnitude > distance then
			print(newtarget.Position.magnitude.." To Far Away From: "..SP.magnitude.." Deleting...")
				S:Destroy()
				script:Destroy()
		elseif (SP.Position - newtarget.Position).magnitude == distance then
			print(newtarget.Position.magnitude.." Exactly Where: "..SP.magnitude.." Keeping...")
			
	end
end


