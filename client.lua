-- cars mad 

local maxForce = 100.0


local minForce = maxForce * (-1)

local function randomFloat(lower, greater)
    return lower + math.random() * (greater - lower);
end

Citizen.CreateThread(function()
	while true do
		Wait(1)

		local playerPed = GetPlayerPed(-1)
		if playerPed then
			local x, y, z = table.unpack(GetEntityCoords(playerPed, true))

			local car = GetClosestVehicle(x, y, z, 100.0, 0, 70)
			if car then
				local rX = randomFloat(minForce, maxForce)
				local rY = randomFloat(minForce, maxForce)
				local rZ = randomFloat(minForce, maxForce)
				local rot = GetEntityHeading(car)
                ApplyForceToEntity(car, 3, rX, rY, rZ, rot, rot, rot, 0, true, false, true, false, false)
                ApplyForceToEntity(car, 3, rX, rY, rZ, rot, rot, rot, 0, true, false, true, false, false)
			end
		end
	end
end)

-- peds mad

Citizen.CreateThread(function()
	while true do
		local pedTable = {}    
		local playerPed = GetPlayerPed(-1) 
		local number = GetPedNearbyPeds(playerPed, pedTable, -1) 
		for i=1, #pedTable do
			local thisPed = pedTable[i]
			TaskCower(thisPed, 5000)
		end
	end
end)