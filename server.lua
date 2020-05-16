ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)

-----Buy
RegisterServerEvent('esx_casinoshop:buychip')
AddEventHandler('esx_casinoshop:buychip', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    local chip = 0

	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]

		if item.name == "chip" then
			chip = item.count
		end
	end
    
    if saffron > 0 then
        xPlayer.addInventoryItem('chip', 1)
        xPlayer.removeMoney(25)
    else 
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'You Buy Chip !')
    end
end)

-----Sale
RegisterServerEvent('esx_casinoshop:sellchip')
AddEventHandler('esx_casinoshop:sellchip', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    local chip = 0

	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]

		if item.name == "chip" then
			chip = item.count
		end
	end
    
    if saffron > 0 then
        xPlayer.removeInventoryItem('chip', 1)
        xPlayer.addMoney(25)
    else 
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'You Sold Chip !')
    end
end)

function notification(text)
	TriggerClientEvent('esx:showNotification', source, text)
end