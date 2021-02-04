ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('np_selltonpc:dodeal')
AddEventHandler('np_selltonpc:dodeal', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer ~= nil then
		local weedprice = math.random(150, 500)
		local weedamount = math.random(1, 5)

		local finalamount = weedprice * weedamount

		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Kazandın '  .. weedamount .. ' Uyuşturucu için $' .. finalamount, length = 4000 })
		xPlayer.removeInventoryItem('weed2', weedamount)
		Citizen.Wait(100)
		xPlayer.addInventoryItem('cash', finalamount)
	end
end)

RegisterNetEvent('checkD')
AddEventHandler('checkD', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer ~= nil then
		local weed = xPlayer.getInventoryItem('weed2').count
		if weed >= 1 then
			TriggerClientEvent("checkR", source, true)
		else
			TriggerClientEvent("checkR", source, false)
		end
	end
end)

RegisterServerEvent('np_selltonpc:saleInProgress')
AddEventHandler('np_selltonpc:saleInProgress', function(streetName, playerGender)
	if playerGender == 0 then
		playerGender = 'Female'
	else
		playerGender = 'Male'
	end
	TriggerClientEvent('alert:alerttipebak', '12 - 16' , 'Uyuşturucu Satmayı Deniyor!')
end)