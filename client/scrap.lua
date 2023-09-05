if Config.ScrapyardSearching.Enable then if Config.Debug then print("^5Debug^7: ^2Loading^7: '^6Scrapyard Searching^7'") end
    local Searching = false
	--Dumpster Third Eye
	exports['qb-target']:AddTargetModel(Config.ScrapyardSearching.models,
    { options = {
        { event = "jim-recycle:Scrap:Search",
        icon = "fas fa-dumpster",
        label = Loc[Config.Lan].target["search"],
    }, }, distance = 1.5 })


    --Search animations
    local function startSearching(coords) local Ped = PlayerPedId()
        Searching = true
        --Calculate if you're facing the trash--
        if #(coords - GetEntityCoords(Ped)) > 1.5 then TaskGoStraightToCoord(Ped, coords.x, coords.y, coords.z, 0.4, 200, 0.0, 0) Wait(300) end
        lookEnt(coords)
        loadAnimDict('amb@prop_human_bum_bin@base')
        --Play Serach animation
        TaskPlayAnim(Ped, 'amb@prop_human_bum_bin@base', 'base', 2.0, 2.0, Config.Debug and 1000 or Config.ScrapyardSearching.searchTime, 1, 1, 0, 0, 0)
        FreezeEntityPosition(Ped, true)
        Wait(searchTime)
        --Stop Animation
        ClearPedTasks(Ped)
        FreezeEntityPosition(Ped, false)
        --Allow a new search
        Searching = false
        unloadAnimDict('amb@prop_human_bum_bin@base')
        --Give rewards
        TriggerServerEvent("jim-recycle:Scrap:Reward")
    end

    RegisterNetEvent('jim-recycle:Scrap:Search', function() local Ped = PlayerPedId()
        if not Searching then Searching = true else return end
        local scrapFound = false
        local scrapModels = Config.ScrapyardSearching.models
        for i = 1, #scrapModels do
            local toScrap = GetClosestObjectOfType(GetEntityCoords(Ped), 2.0, scrapModels[i], false, false, false)
            if #(GetEntityCoords(Ped) - GetEntityCoords(toScrap)) < 2.0 then
                if Config.Debug then print("^5Debug^7: ^2Starting Search of entity^7: '^6"..toScrap.."^7'") end
                for i = 1, #Config.ScrapyardSearching.searched do
                    if Config.ScrapyardSearching.searched[i] == toScrap then scrapFound = true end -- Theres a dumpster nearby
                    if i == #Config.ScrapyardSearching.searched and scrapFound then triggerNotify(nil, Loc[Config.Lan].error["searched"], "error") return -- Let player know already searched
                    elseif i == #Config.ScrapyardSearching.searched and not scrapFound then -- If hasn't been searched yet
                        loadAnimDict("anim@amb@machinery@speed_drill@")
                        TaskPlayAnim(Ped, "anim@amb@machinery@speed_drill@", "look_around_left_02_amy_skater_01", 1.0, 1.0, 3500, 1.5, 5, 0, 0, 0)
                        if Config.useQBLock then
                            local success = exports['qb-lock']:StartLockPickCircle(math.random(2,4), math.random(10,15), success)
                            if success then
                                triggerNotify(nil, Loc[Config.Lan].success["get_scrap"], "success")
                                startSearching(GetEntityCoords(toScrap))
                                searched[i+1] = toScrap
                                Searching = false
                            else
                                triggerNotify(nil, Loc[Config.Lan].error["nothing"], "error")
                                searched[i+1] = toScrap
                                ClearPedTasks(Ped)
                                Searching = false
                            end
                        else
                            local Skillbar = exports['qb-skillbar']:GetSkillbarObject()
                            Skillbar.Start({duration = math.random(2500,5000), pos = math.random(10, 30), width = math.random(10, 20), }, function()
                                triggerNotify(nil, Loc[Config.Lan].success["get_scrap"], "success")
                                startSearching(GetEntityCoords(toScrap))
                                searched[i+1] = toScrap
                                Wait(1000)
                                Searching = false
                            end, function()
                                triggerNotify(nil, Loc[Config.Lan].error["nothing"], "error")
                                searched[i+1] = toScrap
                                ClearPedTasks(Ped)
                                Wait(1000)
                                Searching = false
                            end)
                        end
                        break
                    end
                end
            end
        end
    end)
end