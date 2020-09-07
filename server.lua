ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('sov:gunPay')
AddEventHandler('sov:gunPay', function(location)
	TriggerClientEvent('sov:gunPayStart', -1, location)
	TriggerClientEvent('sov:cokeLocationMessage', source, location)
end)

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

RegisterNetEvent('recovery:laptop')
AddEventHandler('recovery:laptop', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	local laptopCount = xPlayer.getInventoryItem('laptop').count
	local usbCount = xPlayer.getInventoryItem('usbstick').count
	if laptopCount > 0 and usbCount > 0 then
		xPlayer.removeInventoryItem('usbstick', 1)
		Wait(250)
		xPlayer.removeInventoryItem('laptop', 1)
		Wait(250)
	end
end)
ESX.RegisterUsableItem('laptop', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	local laptopCount = xPlayer.getInventoryItem('laptop').count
	local usbstickCount = xPlayer.getInventoryItem('usbstick').count
	if laptopCount > 0 and usbstickCount > 0 then
		xPlayer.removeInventoryItem('usbstick', 1)
		Wait(250)
		xPlayer.removeInventoryItem('laptop', 1)
		Wait(250)
		x = 159.0
		y = 1643.0
		z = 228.88

		BLIP_1 = AddBlipForCoord(x,  y,  z)
		etBlipSprite(BLIP_1, 50)
		SetBlipRoute(BLIP_1,  true) -- waypoint to blip

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
