local module = {}

function module.RequestPart(part, v)
    local distance = 3
        if v:IsA("Model") then 
            if (v.PrimaryPart.Position - part.Position).magnitude <= distance then return true else return nil end
        else return nil 
    end
end

return module 