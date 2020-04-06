local DataStoreService = game:GetService("DataStoreService")
local Players = game:GetService("Players")

local money = DataStoreService:GetDataStore("Money")
local cars = DataStoreService:GetDataStore("Cars")




game.Players.PlayerAdded:Connect(function(plr)
	local leaderstats = Instance.new("Folder", plr)
	leaderstats.Name = "leaderstats"
		
		local Money = Instance.new("IntValue", leaderstats)
		Money.Name = "Money"
		Money.Value = 120
		
	local Cars = Instance.new("Folder", plr)
	Cars.Name = "Cars"
	
	wait(1)
	
	local carsdata
	
	local getdata, getcars = pcall(function()
		carsdata = cars:GetAsync(plr.UserId.."cars")
	end)
	
	if getdata then
		Cars = carsdata
		
	else
		warn(getcars)
	end
	
	local moneydata
	
	local gettingmoney, getmoney = pcall(function()
		moneydata = money:GetAsync(plr.UserId.."money")
	end)
	
	if gettingmoney then
		Money.Value = moneydata
	else
		warn(getmoney)
	end
	
end)


game.Players.PlayerRemoving:Connect(function(plr)
	local setData, setcars = pcall(function()
		cars:SetAsync(plr.UserId.."cars", plr.Cars:GetChildren())
	end)
	
	if setData then
		print("Has Been Set")
	else
		warn(setcars)
	end
	
	local setmoneydata, setmoney = pcall(function()
		money:SetAsync(plr.UserId.."money", plr.leaderstats.Money.Value)
	end)
	
	if setmoneydata then
		print("Has Been Set")
	else
		warn(setmoney)
	end
end)
