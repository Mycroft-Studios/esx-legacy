RegisterServerEvent('esx_barbershop:pay')
AddEventHandler('esx_barbershop:pay', function()
	local source = source
	local xPlayer = Player(source).state.Info

	xPlayer.removeMoney(Config.Price, "Haircut")
	TriggerClientEvent('esx:showNotification', source, TranslateCap('you_paid', ESX.Math.GroupDigits(Config.Price)))
end)

ESX.RegisterServerCallback('esx_barbershop:checkMoney', function(source, cb)
	local xPlayer = Player(source).state.Info

	cb(xPlayer.getMoney() >= Config.Price)
end)
