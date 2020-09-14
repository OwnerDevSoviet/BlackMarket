ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

local carlos 	 =  -1868718465 -- DO NOT CHANGE
local troy 		 = 599294057 -- DO NOT CHANGE
local hector     = -1773333796 -- DO NOT CHANGE
local bubba      = 1596003233 -- DO NOT CHANGE
--- Do not touch anything above this line unless you know what youre doing!!! 

Citizen.CreateThread(function()

	RequestModel(carlos)
	while not HasModelLoaded(carlos) do
	Wait(1)
	end
	ped = CreatePed(1, carlos, Config.Dealer.x, Config.Dealer.y, Config.Dealer.z, 40.0, false, true)
	SetBlockingOfNonTemporaryEvents(ped, true)
	SetPedDiesWhenInjured(ped, false)
	SetPedCanPlayAmbientAnims(ped, true)
	SetPedCanRagdollFromPlayerImpact(ped, false)
	SetEntityInvincible(ped, true)
	FreezeEntityPosition(ped, true)
	TaskStartScenarioInPlace(ped, "WORLD_HUMAN_SMOKING", 0, true);

end)
Citizen.CreateThread(function()
    while true do
		Wait(0)
		if PlayerPedId() then
            local playerPed = PlayerPedId()
			local location = GetEntityCoords(playerPed)
			if GetDistanceBetweenCoords(location, Config.Dealer.x, Config.Dealer.y, Config.Dealer.z, true) < 2 then
				ESX.ShowHelpNotification('Press ~INPUT_CONTEXT~ to talk with Little Timmy')
				if IsControlJustPressed(1, 38) then
					TriggerServerEvent('recovery:payup', Config.UsbPrice)
				elseif IsControlJustPressed(1, 38) then
					ESX.ShowNotification('invalid amount')
				end
			end
		end
	end
end)

RegisterNetEvent('sov:paidprice')
AddEventHandler('sov:paidprice', function(pay)
	if pay then
		ESX.ShowNotification("You paid $" .. Config.UsbPrice)
		ESX.ShowAdvancedNotification('Little Timmy', 'Darkweb', 'Use this with another piece, dont tell my mommy I was here!', 'CHAR_LESTER', 1)
	else
		ESX.ShowAdvancedNotification('Little Timmy', 'Darkweb', 'STRANGER DANGER!', 'CHAR_LESTER', 1)
	end
end)

Citizen.CreateThread(function()

	RequestModel(troy)
	while not HasModelLoaded(troy) do
	Wait(1)
	end
	ped = CreatePed(1, troy, Config.Hustler.x, Config.Hustler.y, Config.Hustler.z, 40.0, false, true)
	SetBlockingOfNonTemporaryEvents(ped, true)
	SetPedDiesWhenInjured(ped, false)
	SetPedCanPlayAmbientAnims(ped, true)
	SetPedCanRagdollFromPlayerImpact(ped, false)
	SetEntityInvincible(ped, true)
	FreezeEntityPosition(ped, true)
	TaskStartScenarioInPlace(ped, "WORLD_HUMAN_SMOKING", 0, true);

end)
Citizen.CreateThread(function()
    while true do
		Wait(0)
		if PlayerPedId() then
            local playerPed = PlayerPedId()
			local location = GetEntityCoords(playerPed)
			if GetDistanceBetweenCoords(location, Config.Hustler.x, Config.Hustler.y, Config.Hustler.z, true) < 2 then
				ESX.ShowHelpNotification('Press ~INPUT_CONTEXT~ to talk with Atmin Kendro')
				if IsControlJustPressed(1, 38) then
					TriggerServerEvent('recovery:paidup', Config.laptopPrice)
				elseif IsControlJustPressed(1, 38) then
					ESX.ShowNotification('invalid amount')
				end
			end
		end
	end
end)

RegisterNetEvent('sov:payd')
AddEventHandler('sov:payd', function(payd)
	if payd then
		ESX.ShowNotification("You paid $" .. Config.laptopPrice)
		ESX.ShowAdvancedNotification('Head Atmin Kendra', 'AtminPolice', 'Aint get it from me mofucka!', 'CHAR_LESTER', 1)
	else
		ESX.ShowAdvancedNotification('Head Atmin Kendra', 'AtminPolice', 'Step off my block!', 'CHAR_LESTER', 1)
	end
end)


Citizen.CreateThread(function()

	RequestModel(hector)
	while not HasModelLoaded(hector) do
	Wait(1)
	end
	ped = CreatePed(1, hector, Config.Smuggler.x, Config.Smuggler.y, Config.Smuggler.z, 40.0, false, true)
	SetBlockingOfNonTemporaryEvents(ped, true)
	SetPedDiesWhenInjured(ped, false)
	SetPedCanPlayAmbientAnims(ped, true)
	SetPedCanRagdollFromPlayerImpact(ped, false)
	SetEntityInvincible(ped, true)
	FreezeEntityPosition(ped, true)
	TaskStartScenarioInPlace(ped, "WORLD_HUMAN_SMOKING", 0, true);

end)
Citizen.CreateThread(function()
    while true do
		Wait(0)
		if PlayerPedId() then
            local playerPed = PlayerPedId()
			local location = GetEntityCoords(playerPed)
			if GetDistanceBetweenCoords(location, Config.Smuggler.x, Config.Smuggler.y, Config.Smuggler.z, true) < 2 then
				ESX.ShowHelpNotification('Press ~INPUT_CONTEXT~ to talk with this vato')
				if IsControlJustPressed(1, 38) then
					TriggerServerEvent('recovery:smuggler', Config.laptopPrice)
					TriggerServerEvent('sov:notifyPolice')
				elseif IsControlJustPressed(1, 38) then
					ESX.ShowNotification('invalid amount')
				end
			end
		end
	end
end)

Citizen.CreateThread(function()

	RequestModel(bubba)
	while not HasModelLoaded(bubba) do
	Wait(1)
	end
	ped = CreatePed(1, bubba, Config.ArmsDealer.x, Config.ArmsDealer.y, Config.ArmsDealer.z, 40.0, false, true)
	SetBlockingOfNonTemporaryEvents(ped, true)
	SetPedDiesWhenInjured(ped, false)
	SetPedCanPlayAmbientAnims(ped, true)
	SetPedCanRagdollFromPlayerImpact(ped, false)
	SetEntityInvincible(ped, true)
	FreezeEntityPosition(ped, true)
	TaskStartScenarioInPlace(ped, "WORLD_HUMAN_SMOKING", 0, true);

end)
Citizen.CreateThread(function()
    while true do
		Wait(0)
		if PlayerPedId() then
            local playerPed = PlayerPedId()
			local location = GetEntityCoords(playerPed)
			if GetDistanceBetweenCoords(location, Config.ArmsDealer.x, Config.ArmsDealer.y, Config.ArmsDealer.z, true) < 2 then
				ESX.ShowHelpNotification('Press ~INPUT_CONTEXT~ to talk to bubba')
				if IsControlJustPressed(1, 38) then
					TriggerServerEvent('recovery:weapdude')
					TriggerServerEvent('sov:notifyPolice')
				elseif IsControlJustPressed(1, 38) then
					ESX.ShowNotification('invalid amount')
				end
			end
		end
	end
end)


Citizen.CreateThread(function()
    while true do
		Wait(0)
		if PlayerPedId() then
            local playerPed = PlayerPedId()
			local coords = GetEntityCoords(playerPed)
			if GetDistanceBetweenCoords(coords, Config.Desk.x, Config.Desk.y, Config.Desk.z, true) < 0.5 then
				ESX.ShowHelpNotification('Press ~INPUT_CONTEXT~ to decrypt transactions')
				if IsControlJustPressed(1, 38)then 
					TriggerServerEvent('recovery:decrypt')
					TriggerServerEvent('sov:notifyPolice')
				end
			end
		end
	end
end)



Citizen.CreateThread(function()
    while true do
		Wait(0)
		if PlayerPedId() then
            local playerPed = PlayerPedId()
			local coords = GetEntityCoords(playerPed)
			if GetDistanceBetweenCoords(coords, Config.Final.x, Config.Final.y, Config.Final.z, true) < 2 then
				ESX.ShowHelpNotification('Press ~INPUT_CONTEXT~ to Pose as smuggler')
				if IsControlJustPressed(1, 38)then 
					TriggerServerEvent('recovery:smuggler')
					TriggerServerEvent('sov:notifyPolice')
				end
			end
		end
	end
end)


RegisterNetEvent('soviet:noitems')
AddEventHandler('soviet:noitems', function()
	ESX.ShowAdvancedNotification('DarkMonitor', 'DarkwebAdministrator', 'Either you have to much or not enough! Figure it out!', 'CHAR_LESTER', 1)
end)

RegisterNetEvent('soviet:usbstocked')
AddEventHandler('soviet:usbstocked', function()
	ESX.ShowAdvancedNotification('The Vatos', '', 'Move this load for me and maybe well break down some guns for you ese', 'CHAR_LESTER', 1)
end)


RegisterNetEvent('soviet:weapons')
AddEventHandler('soviet:weapons', function()
	ESX.ShowAdvancedNotification('The Vatos', '', 'Move this load for me and maybe well break down some guns for you ese', 'CHAR_LESTER', 1)
end)

RegisterNetEvent('soviet:sold')
AddEventHandler('soviet:sold', function()
	ESX.ShowAdvancedNotification('Bubba', '', 'I just got out the pen, I aint goin back. You dont know me, I dont know you ya feel me', 'CHAR_LESTER', 1)
end)
RegisterNetEvent('sov:policeNotification')
AddEventHandler('sov:policeNotification', function()
	ESX.ShowAdvancedNotification('Anonymous Tracking', '', 'Dont tell nobody, but someones tryin to smuggle some steel!', 'CHAR_LESTER', 1)
end)
