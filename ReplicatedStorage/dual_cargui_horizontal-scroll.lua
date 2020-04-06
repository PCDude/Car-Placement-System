--Originally, implemented in a Horizontal Scrolling System, to Swap Which Cars you'd Pick. Use-case for both Left and Right.

local Count = 0
local diffcount = 0
local maincount = 0

local SP = script.Parent
local op = SP.Position

SP.MouseEnter:Connect(function()
	SP:TweenPosition(UDim2.new(0.935, 0,0.46, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Sine,.35)

end)

SP.MouseLeave:Connect(function()
	SP:TweenPosition(UDim2.new(0.872, 0,0.46, 0), Enum.EasingDirection.In, Enum.EasingStyle.Sine,.35)
end)




SP.MouseButton1Click:Connect(function()
maincount = maincount + 1
if maincount == 1 then
	for _,v in pairs(SP.Parent:GetChildren()) do
	  if v.Name ~= "UIPL" or v.Name ~= "UISC" then
		if string.len(v.Name) == 11 and v.Valid.Value == true and SP.Parent.Parent.Parent.Front.Count.Value > 0 and diffcount == 0 or string.len(v.Name) == 12 and v.Valid.Value == true  and SP.Parent.Parent.Parent.Front.Count.Value and diffcount == 0 then
			v:TweenPosition(UDim2.new(0.001, 0,0.239, 0), Enum.EasingDirection.In, Enum.EasingStyle.Sine,.3)	
			diffcount = diffcount + 1
			Count = 0
			for i = 0,1,0.1 do
				wait()
				v.BackgroundTransparency = i
				v.Spawn_Ask.TextTransparency = i
				v.Model_txt.TextTransparency = i
				v.Price_txt.TextTransparency = i
			end
			v.Parent = SP.Parent.Parent.Parent.Front
		end
	end
	
	for i,v in pairs(SP.Parent.Parent.Parent.Front:GetChildren()) do
	  if v.Name ~= "UIPL" or v.Name ~= "UISC" then
		if string.len(v.Name) == 11 and v.Valid.Value == true and Count == 0 and SP.Parent.Parent.Parent.Front.Count.Value > 0 or string.len(v.Name) == 12 and v.Valid.Value == true  and SP.Parent.Parent.Parent.Front.Count.Value and Count == 0 then
				v.Position = UDim2.new(0.506, 0,0.239, 0)
				v.Parent = SP.Parent
				Count = Count + 1
				diffcount = 0
				v:TweenPosition(UDim2.new(0.242, 0,0.239, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Sine,.3)
				for i = 1,0,-0.1 do
				wait()
				v.BackgroundTransparency = i
				v.Spawn_Ask.TextTransparency = i
				v.Model_txt.TextTransparency = i
				v.Price_txt.TextTransparency = i
					end
				end
			end
        end
    end
	wait(1)
elseif maincount >= 3 then
	wait(2.5)
	maincount = 0
elseif maincount >= 4 then
	wait(3.5)
	maincount = 0
elseif maincount >= 5 then
	wait(4.5)
	maincount = 0
	end
end)