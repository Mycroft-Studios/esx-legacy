RegisterNetEvent('esx:playerLoaded') -- Store the players data
AddEventHandler('esx:playerLoaded', function(xPlayer, isNew)
	print("Player Loaded. New | " .. isNew)
	LocalPlayer.state.info = xPlayer
	ESX.PlayerLoaded = true
end)

RegisterNetEvent('esx:playerLogout') -- When a player logs out (multicharacter), reset their data
AddEventHandler('esx:playerLogout', function()
	ESX.PlayerLoaded = false
	LocalPlayer.state.info = {}
end)

-- These two functions can perform the same task
RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	print('PlayerData.job was set to '..job)
	if LocalPlayer.state.info.job.name ~= job.name then
		print('You are now in a different job')
	end
	LocalPlayer.state.info.job = job
end)

function OnPlayerData(key, val, last)
	if type(val) == 'table' then val = json.encode(val) end
	print('PlayerData.'..key..' was set to '..val)
	if key == 'job' then
		if last.name ~= val.name then
			print('You are now in a different job')
		end
	elseif key == 'dead' then -- However, this function can be used for other PlayerData
		if val == true then
			print('You die too easily')
			SetTimeout(2000, function()
				if LocalPlayer.state.info.dead then
					print('Why are you still dead?')
				end
			end)
		end
	end
end
-----------------------------------------------

RegisterCommand('closestobject', function()
	local result = ESX.Game.GetClosestObject(GetEntityCoordsLocalPlayer.state.info.ped))
	print(result)
end)

RegisterCommand('closestped', function()
	local result = ESX.Game.GetClosestPed(GetEntityCoordsLocalPlayer.state.info.ped))
	print(result)
end)

RegisterCommand('closestplayer', function()
	local result = ESX.Game.GetClosestPlayer(GetEntityCoordsLocalPlayer.state.info.ped))
	print(result)
end)

RegisterCommand('closestvehicle', function()
	local result = ESX.Game.GetClosestVehicle(GetEntityCoordsLocalPlayer.state.info.ped))
	print(result)
end)

RegisterCommand('areaplayer', function()
	local result = ESX.Game.GetPlayersInArea(GetEntityCoordsLocalPlayer.state.info.ped), 20)
	print(json.encode(result))
end)

RegisterCommand('areavehicle', function()
	local result = ESX.Game.GetVehiclesInArea(GetEntityCoordsLocalPlayer.state.info.ped), 20)
	print(json.encode(result))
end)
