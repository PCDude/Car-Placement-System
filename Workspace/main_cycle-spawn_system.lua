
repeat wait() until game:IsLoaded()

local work = script.Parent
local RF = game:GetService("ReplicatedStorage"):WaitForChild("RemoteFunctions"):FindFirstChild("rf_signal_stoc")

local primary_bool = false
local model 

RF.OnServerInvoke = function(plr, model_plr)
    primary_bool = true
    model = model_plr
end

function Request(v)
    if primary_bool then 
        local module = require(script["module_request_part"]):RequestPart(v, model)
    else return nil end
end


function Loop_Work()
    for i,v in pairs(work:GetChildren()) do
        if (v:IsA("Folder") and pcall(function() v:FindFirstChild("mod_val_ph") end)) then 
            local dict = {}
            local num = math.randomseed(os.time())
                v:FindFirstChild("mod_val_ph"):Destroy()
                table.insert(dict, 1, {v.Name, num})
            local module = require(script["module_request_part"])
                co=coroutine.resume(coroutine.create(function()
                    wait(math.pi/4)
                    for i,j in pairs(v:GetChildren()) do if v:IsA("Part") then Request(v) return true else end
                end
             end)) 
         end
     end
end

