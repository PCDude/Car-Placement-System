local SP = script.Parent.Parent.Parent
local plr = game.Players.LocalPlayer
local Bool = plr.Character.Range.Main_Bool_Value


script.Parent.Parent.Parent.Changed:Connect(function(Parent)
	if SP.Parent.Name == "PlayerGui" then
		Bool.Value = true
		plr.Character.Range.Current.Value = false
		while wait(0.5) do
			local S = script.Parent
			S.TextColor3 = Color3.fromRGB(255,255,255)
			wait(0.5)
			S.TextColor3 = Color3.fromRGB(0,0,0)
		end
	else
		wait(1)
		Bool.Value = false
		print(SP.Parent.Name.." Non - Supported Parent.")
	end
end)