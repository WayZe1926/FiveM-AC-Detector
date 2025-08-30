 Citizen.CreateThread(function()
    -- Wait a moment for resources to fully load (optional)
    Wait(2000)

    local numResources = GetNumResources()
    local acDetected = false

    print("^7[AC Scanner] ^5Starting scan for active anticheats...^7")

    for i = 0, numResources - 1 do
        local resourceName = GetResourceByFindIndex(i)

        -- Skip this script's own resource (optional)
        if resourceName == GetCurrentResourceName() then continue end

        -- Check for FiveGuard
        local fiveGuardFile = LoadResourceFile(resourceName, "shared_fg-obfuscated.lua")
        if fiveGuardFile then
            print("^1[FiveGuard]^3 Detected in Resource: (^9"..resourceName.."^3)")
            acDetected = true
        end

        -- Check for WaveShield
        local waveShieldFile = LoadResourceFile(resourceName, "waveshield.lua")
        if waveShieldFile then
            print("^2[WaveShield]^3 Detected in Resource: (^9"..resourceName.."^3)")
            acDetected = true
        end

        -- Check for FireAC
        local fireacFile = LoadResourceFile(resourceName, "fire-config.lua")
        if fireacFile then
            print("^1[FireAC]^3 Detected in Resource: (^9"..resourceName.."^3)")
            acDetected = true
        end

        -- Check for SecureServe
        local secureserveFile = LoadResourceFile(resourceName, "secureserve.key")
        if secureserveFile then
            print("^2[SecureServe]^3 Detected in Resource: (^9"..resourceName.."^3)")
            acDetected = true
        end
    end

    if not acDetected then
        print("^3[AC Scanner] No known anticheat systems detected.^7")
    else
        print("^7[AC Scanner] ^2Scan complete. Some anticheats were found.^7")
    end
end)
