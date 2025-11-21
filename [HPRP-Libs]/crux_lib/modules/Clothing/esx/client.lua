-- if skin.sex == 0 then
--     TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_male)
-- else
--     TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_female)
-- end

CRUX = {}

function CRUX.OpenJobClothing(JobName)

    allFuncs.interface.menu({
        Id = 'clothing-bs',
        Title = 'Change your clothing',
        Items = {
            {
                Header = "Job Outfit",
                Icon = 'fas fa-tshirt',
                Args = { job = JobName },
                Event = allFuncs.Name..":module:selectOpenClothing",
            },
            {
                Header = "Casual Outfit",
                Icon = 'fas fa-tshirt',
                Args = { job = false },
                Event = allFuncs.Name..":module:selectOpenClothing",
            },
        }
    })
end

RegisterNetEvent(allFuncs.Name..":module:selectOpenClothing", function(args)
    CRUX.Debug("[CRUX] selectOpenClothing event triggered")
    if not ESX then
        ESX = exports['es_extended']:getSharedObject()
        CRUX.Debug("[CRUX] ESX object loaded")
    end
    if not args then
        CRUX.Debug("[CRUX] No args provided, aborting")
        return
    end
    if args.job then
        CRUX.Debug("[CRUX] Job outfit selected for job:", args.job)
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
            CRUX.Debug("[CRUX] Received skin and jobSkin from server for job outfit")
            TriggerEvent('skinchanger:loadSkin', skin)
            CRUX.Debug("[CRUX] Loaded job skin")
        end)
    else
        CRUX.Debug("[CRUX] Casual outfit selected")
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
            CRUX.Debug("[CRUX] Received skin and jobSkin from server for casual outfit")
            if skin.sex == 0 then
                CRUX.Debug("[CRUX] Player is male, loading male casual outfit")
                TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_male)
            else
                CRUX.Debug("[CRUX] Player is female, loading female casual outfit")
                TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_female)
            end
        end)
    end
end)

return CRUX