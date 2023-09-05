if Config.DumpsterDiving.Enable then if Config.Debug then print("^5Debug^7: ^2Loading^7: '^6Dumpster Diving^7'") end
    local Searching = false -- No touch
    --Dumpster Third Eye
    exports['qb-target']:AddTargetModel(Config.DumpsterDiving.dumpsterModels,
        { options = {
            { event = "jim-recycle:Dumpsters:Search",
            icon = "fas fa-dumpster",
            label = Loc[Config.Lan].target["search_trash"],
        }, }, distance = 1.5 })

    --Search animations
    local function startSearching(coords) local Ped = PlayerPedId()
        Searching = true
        --Calculate if you're facing the trash--
        if #(coords - GetEntityCoords(Ped)) > 1.5 then TaskGoStraightToCoord(Ped, coords, 0.4, 200, 0.0, 0) Wait(300) end
        lookEnt(coords)
        --    if not IsPedHeadingTowardsPosition(Ped, coords, 20.0) then TaskTurnPedToFaceCoord(Ped, coords, 1500) Wait(1500) end
        loadAnimDict('amb@prop_human_bum_bin@base')
        --Play Serach animation
        TaskPlayAnim(Ped, 'amb@prop_human_bum_bin@base', 'base', 2.0, 2.0, Config.Debug and 1000 or Config.DumpsterDiving.searchTime, 1, 1, 0, 0, 0)
        FreezeEntityPosition(Ped, true)
        Wait(searchTime)
        --Stop Animation
        ClearPedTasks(Ped)
        FreezeEntityPosition(Ped, false)
        --Allow a new search
        Searching = false
        unloadAnimDict('amb@prop_human_bum_bin@base')
        --Give rewards
        TriggerServerEvent("jim-recycle:Dumpsters:Reward")
    end

    RegisterNetEvent('jim-recycle:Dumpsters:Search', function() local Ped = PlayerPedId()
        if not Searching then Searching = true else return end
        local dumpsterFound = false
        local dumpsterModels = Config.DumpsterDiving.dumpsterModels
        for i = 1, #dumpsterModels do
            local toDumpster = GetClosestObjectOfType(GetEntityCoords(Ped), 1.0, dumpsterModels[i], false, false, false)
            if #(GetEntityCoords(Ped) - GetEntityCoords(toDumpster)) < 1.8 then
                if Config.Debug then print("^5Debug^7: ^2Starting Search of entity^7: '^6"..toDumpster.."^7'") end
                for i = 1, #Config.DumpsterDiving.searched do
                    if Config.DumpsterDiving.searched[i] == toDumpster then dumpsterFound = true end -- Theres a dumpster nearby
                    if i == #Config.DumpsterDiving.searched and dumpsterFound then triggerNotify(nil, Loc[Config.Lan].error["searched"], "error") return -- Let player know already searched
                    elseif i == #Config.DumpsterDiving.searched and not dumpsterFound then -- If hasn't been searched yet
                        loadAnimDict("anim@amb@machinery@speed_drill@")
                        TaskPlayAnim(Ped, "anim@amb@machinery@speed_drill@", "look_around_left_02_amy_skater_01", 1.0, 1.0, 3500, 1.5, 5, 0, 0, 0)
                        if Config.useQBLock then
                            local success = exports['qb-lock']:StartLockPickCircle(math.random(2,4), math.random(10,15), success)
                            if success then
                                triggerNotify(nil, Loc[Config.Lan].success["get_trash"], "success")
                                startSearching(GetEntityCoords(toDumpster))
                                Config.DumpsterDiving.searched[i+1] = toDumpster
                            else
                                triggerNotify(nil, Loc[Config.Lan].error["nothing"], "error")
                                Config.DumpsterDiving.searched[i+1] = toDumpster
                                ClearPedTasks(Ped)
                            end
                        else
                            local Skillbar = exports['qb-skillbar']:GetSkillbarObject()
                            Skillbar.Start({ duration = math.random(2500,5000), pos = math.random(10, 30), width = math.random(10, 20), }, function()
                                triggerNotify(nil, Loc[Config.Lan].success["get_trash"], "success")
                                startSearching(GetEntityCoords(toDumpster))
                                Config.DumpsterDiving.searched[i+1] = toDumpster
                                Wait(1000)
                            end, function()
                                triggerNotify(nil, Loc[Config.Lan].error["nothing"], "error")
                                Config.DumpsterDiving.searched[i+1] = toDumpster
                                ClearPedTasks(PlayerPedId())
                                Wait(1000)
                            end)
                        end
                        break
                    end
                end
            end
        end
    end)
end