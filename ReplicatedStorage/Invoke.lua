--Invokes Original Car Pick, and Real-World Placement

local SP = script.Parent
local S_PP_PP = script.Parent.Parent.Parent.Parent.Parent
local Price = script.Parent.Parent.Price.Value
local plr = game.Players.LocalPlayer

local RP = game:GetService("ReplicatedStorage"):WaitForChild("Remote_Functions"):FindFirstChild("Conduct_Car_Return_1")

local distance = 1000000
local Count = 0

local newdistance 
local new
local target

local Can = true

SP.MouseEnter:Connect(function()
	SP.TextColor3 = Color3.fromRGB(255,255,255)
end)

SP.MouseLeave:Connect(function()
	SP.TextColor3 = Color3.fromRGB(0,0,0)
end)

function Call_Check()
    for i,v in pairs(plr.Cars:GetChildren()) do
        if v.Value == SP.Parent.Model.Value and v.Name ~= "Count" and Count == 0 then
            print("Already Owned")
            Count = Count + 1
            local newModel = Instance.new("StringValue", plr.Cars)
                newModel.Name = SP.Parent.Model.Value
                newModel.Value = SP.Parent.Model.Value
            SP.Text = "Spawned"
                new = newModel.Value
            for _,k in pairs(plr.Character:GetChildren()) do
                if k.Name == "UpperTorso" or k.Name == "Torso" then
                    target = k
                end
            end
            for i, v in pairs(workspace.Spawners:GetChildren()) do
                if v:IsA("Part") then
                    if (v.Position - target.Position).magnitude < distance and v.Parked.Value == false then
                        print(v)
                            distance = v.Position.magnitude
                            newdistance = v.Position
                        end
                else
                    print(v.Name..", Is Not A Part")
                end
            end
                local RP = game:GetService("ReplicatedStorage"):WaitForChild("Remote_Functions"):FindFirstChild("Access_Storage")
                RP:InvokeServer(plr, newdistance, new)

                S_PP_PP.Gui_Car_Spawn_Detection.Car.Value = newModel.Value
                plr.Character.Range.Disabled = false
                SP.Parent.Parent.Parent:Destroy()
        end
    end 
end

SP.MouseButton1Click:Connect(function()
    local RP_2 = game:GetService("ReplicatedStorage"):WaitForChild("Remote_Functions"):FindFirstChild("Access_CarAmountS")
    print("Starting")
        RP_2:InvokeServer()
            if S_PP_PP.Gui_Car_Spawn_Detection.CarRun.Value == true and Can == true then 
	            S_PP_PP.Gui_Car_Spawn_Detection.CarRun.Value = false
	                Can = false
	            if plr.PlayerGui.Count.Value > 0 and plr.leaderstats.Money.Value >= Price or plr.PlayerGui.Count.Value > 0 and plr.leaderstats.Money.Value < Price then Call_Check()					
			    elseif v.Value ~= SP.Parent.Model.Value and Count == 0 and v.Name ~= "Count" and plr.leaderstats.Money.Value >= Price then Call_Check()
                elseif plr.PlayerGui.Count.Value == 0 and plr.leaderstats.Money.Value >= Price then Call_Check() 
                end
	        else
                wait(1)
                    SP.TextColor3 = Color3.fromRGB(255,0,0)
                    SP.Text = "Not Enough Money Have: "..plr.leaderstats.Money.Value..", Need: "..Price
                wait(2)
                    SP.TextColor3 = Color3.fromRGB(255,255,255)
                    SP.Text = "Spawn"
                Count = 0
            end 
        end)
