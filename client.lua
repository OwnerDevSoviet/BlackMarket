ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

local carlos 	 =  -1868718465 -- DO NOT TOUCH
local troy 		 = 599294057 -- DO NOT TOUCH
local gunRun 	 = false
local gunPay 	 = 1000
local weaponBox1 = {x = 1259.03, y = -2571.41, z = 42.74} 
local weaponBox2 = {x = 1258.8, y = -2566.55, z = 42.74} 
local weaponBox3 = {x = 1262.89, y = -2563.75, z = 42.74} 
local weaponBox4 = {x = 1268.45, y = -2566.62, z = 42.74} 

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
--	TaskStartScenarioInPlace(ped, "WORLD_HUMAN_SMOKING", 0, true);

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
--	TaskStartScenarioInPlace(ped, "WORLD_HUMAN_SMOKING", 0, true);

end)

Citizen.CreateThread(function()
    while true do
		Wait(0)
		if PlayerPedId() then
            local playerPed = PlayerPedId()
			local location = GetEntityCoords(playerPed)
			if GetDistanceBetweenCoords(location, Config.Dealer.x, Config.Dealer.y, Config.Dealer.z, true) < 2 then
				ESX.ShowHelpNotification('Press ~INPUT_CONTEXT~ to talk with Little Timmy')
				if IsControlJustPressed(1, 38) and not gunRun then
					TriggerServerEvent('sov:paidprice')
					TriggerServerEvent('recovery:payup', gunPay)
				--	TriggerServerEvent('soviet:itempay')
				elseif IsControlJustPressed(1, 38) and gunRun then
					ESX.ShowNotification('invalid amount')
				end
			end
		end
	end
end)
RegisterNetEvent('soviet:gunRunStart')
AddEventHandler('soviet:gunRunStart', function(location)
	gunRun = true
	local location1 = {x = location.x, y = location.y - 800.0, z = location.z} -- sidecrate2
	weaponModel = CreateObject(GetHashKey("hei_prop_crate_stack_01"), location.x, location.y, location.z, true, false, false)
	SetEntityAsMissionEntity(weaponModel, true, true)
	FreezeEntityPosition(weaponModel, true)
	RequestNamedPtfxAsset("scr_biolab_heist")
    while not HasNamedPtfxAssetLoaded("scr_biolab_heist") do
        Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function()
    while true do
		Wait(0)
		if PlayerPedId() then
            local playerPed = PlayerPedId()
			local location = GetEntityCoords(playerPed)
			if GetDistanceBetweenCoords(location, Config.Hustler.x, Config.Hustler.y, Config.Hustler.z, true) < 2 then
				ESX.ShowHelpNotification('Press ~INPUT_CONTEXT~ to talk with Troy Kendra')
				if IsControlJustPressed(1, 38)  then
					--TriggerServerEvent('sov:troyprice')
					TriggerServerEvent('recovery:laptop')
				--	TriggerServerEvent('soviet:itempay')
				elseif IsControlJustPressed(1, 38) and gunRun then
					ESX.ShowNotification('invalid amount')
				end
			end
		end
	end
end)

RegisterNetEvent('sov:troyprice')
AddEventHandler('sov:troyprice', function(pay)
	if pay then
		ESX.ShowNotification("You paid $" .. gunPay)

		ESX.ShowAdvancedNotification('Little Timmy', 'Darkweb', 'Use this with another piece, dont tell my mommy I was here!', 'CHAR_LESTER', 1)
	else
		ESX.ShowAdvancedNotification('Little Timmy', 'Darkweb', 'STRANGER DANGER!', 'CHAR_LESTER', 1)
	end
end)

RegisterNetEvent('sov:paidprice')
AddEventHandler('sov:paidprice', function(pay)
	if pay then
		ESX.ShowNotification("You paid $" .. gunPay)
		ESX.ShowAdvancedNotification('Little Timmy', 'Darkweb', 'Use this with another piece, dont tell my mommy I was here!', 'CHAR_LESTER', 1)
	else
		ESX.ShowAdvancedNotification('Little Timmy', 'Darkweb', 'STRANGER DANGER!', 'CHAR_LESTER', 1)
	end
end)
RegisterNetEvent('soviet:noitems')
AddEventHandler('soviet:noitems', function()
	ESX.ShowAdvancedNotification('DarkMonitor', 'DarkwebAdministrator', 'You dont have the right shit you noob!', 'CHAR_LESTER', 1)
	--ESX.ShowNotification("You don't have the right shit you noob.")
end)





