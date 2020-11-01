return function()
    local Timings = {}
    for _,v in ipairs(TimingWindow) do
        Name,Tims = v()
        if Name == LoadModule("Config.Load.lua")("SmartTimings","Save/OutFoxPrefs.ini") then
            for k,v2 in pairs(Tims) do
                if v2 ~= 0 and string.find(k, "W") then Timings[#Timings+1] = ToEnumShortString(k) end
            end
        end
    end
    return Timings,#Timings
end