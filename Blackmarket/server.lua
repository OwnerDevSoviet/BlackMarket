ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('sov:notifyPolice')
AddEventHandler('sov:notifyPolice', function()
	local xPlayers = ESX.GetPlayers()

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' then
			TriggerClientEvent('sov:policeNotification', xPlayers[i])
		end
	end
end)

RegisterNetEvent('recovery:decrypt')
AddEventHandler('recovery:decrypt', function(price)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xItem   = xPlayer.getInventoryItem('goldenusb')
	local usbCount = xPlayer.getInventoryItem('usbstick').count
	local laptopCount = xPlayer.getInventoryItem('laptop').count
	if xItem.count < xItem.limit and usbCount > 0 and laptopCount > 0 then
		xPlayer.removeInventoryItem('usbstick', 1)
		xPlayer.removeInventoryItem('laptop', 1)
		xPlayer.addInventoryItem('goldenusb', 1)
	else
		TriggerClientEvent('soviet:noitems', source)
	end
end)

RegisterNetEvent('recovery:smuggler')
AddEventHandler('recovery:smuggler', function(price)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xItem = xPlayer.getInventoryItem('weaponcase')
	local weaponCount = xPlayer.getInventoryItem('goldenusb').count

	if xItem.count < xItem.limit and weaponCount > 0  then
		xPlayer.removeInventoryItem('goldenusb', 1)
		xPlayer.addInventoryItem('weaponcase', 1)
		TriggerClientEvent('soviet:usbstocked', source)
	else
		TriggerClientEvent('soviet:noitems', source)
	end
end)

RegisterNetEvent('recovery:weapdude')
AddEventHandler('recovery:weapdude', function(price)
	local xPlayer = ESX.GetPlayerFromId(source)
	local weaponCount = xPlayer.getInventoryItem('weaponcase').count
	local randomchance = math.random(1, 5)

	if weaponCount > 0  then
		xPlayer.removeInventoryItem('weaponcase', 1)
		TriggerClientEvent('soviet:sold', source)
	end
	if randomchance == 1 then
		xPlayer.addWeapon(Config.One, 200)
		xPlayer.addWeapon(Config.Two, 20)
	elseif randomchance == 2 then
		xPlayer.addWeapon(Config.Three, 20)
		xPlayer.addWeapon(Config.Four, 200)
	elseif randomchance == 3 then
		xPlayer.addWeapon(Config.Five, 20)
		xPlayer.addWeapon(Config.Six, 200)
	elseif randomchance == 4 then
		xPlayer.addWeapon(Config.Seven, 200)
		xPlayer.addWeapon(Config.Eight, 200)
	elseif randomchance == 5 then
		xPlayer.addWeapon(Config.Nine, 200)
		xPlayer.addWeapon(Config.Ten, 200)
	else
		TriggerClientEvent('soviet:noitems', source)
	end
end)

RegisterNetEvent('recovery:payup')
AddEventHandler('recovery:payup', function(price)
	local xPlayer = ESX.GetPlayerFromId(source)
	local money = xPlayer.getBank()

	if money >= price then
		TriggerClientEvent('sov:paidprice', source, true)
		xPlayer.removeAccountMoney('bank', price)
		xPlayer.addInventoryItem('usbstick', 1)
	else
		TriggerClientEvent('sov:paidprice', source, false)	
	end
end)
RegisterNetEvent('recovery:paidup')
AddEventHandler('recovery:paidup', function(price)
	local xPlayer = ESX.GetPlayerFromId(source)
	local money = xPlayer.getBank()

	if money >= price then
		TriggerClientEvent('sov:payd', source, true)
		xPlayer.removeAccountMoney('bank', price)
		xPlayer.addInventoryItem('laptop', 1)
	else
		TriggerClientEvent('sov:payd', source, false)	
	end
end)

