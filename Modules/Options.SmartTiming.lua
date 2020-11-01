local TNS = {
    ['TapNoteScore_HitMine'] = {"Mine","Score"},
    ['TapNoteScore_Attack'] = {"Attack", "Score"},
    ['TapNoteScore_Hold'] = {"Hold","Timing"},
    ['TapNoteScore_Roll'] = {"Roll","Timing"},
    ['TapNoteScore_Checkpoint'] = {"Checkpoint","Timing"}
}

return Def.ActorFrame{
    OnCommand=function(self)
        self.mode = LoadModule("Config.Load.lua")("SmartTimings","Save/OutFoxPrefs.ini") or "Original"
        self.PadRelation = LoadModule("Config.Load.lua")("DisableLowerWindows","Save/OutFoxPrefs.ini") or false
    end,
    JudgmentWindowMessageCommand=function(self, params)
        local score = 'TapNoteScore_None'
        local TimingTable

        for i = 1,#TimingWindow do
            local Name,Timings = TimingWindow[i]()
            if self.mode == Name then
                TimingTable = Timings
                break
            end
        end

        for _,v in ipairs(TimingOrder(TimingTable)) do
            v[2] = GetWindowSeconds(v[2])

            if "Note" == params.Type or (TNS[v[1]] and TNS[v[1]][1] == params.Type) then
                if TNS[v[1]] and TNS[v[1]][2] == "Timing" then params.timing = v[2] break
                else if v[2] >= params.Window and (v[2]*-1) <= params.Window then score = v[1] break end end
            end
        end

        if score == 'TapNoteScore_Attack' then score = 'TapNoteScore_W1' end
        if self.PadRelation then
            for i=0,1 do
                if (score == 'TapNoteScore_W'..(5-i) and tonumber(self.PadRelation) >= (i+1)) then score = 'TapNoteScore_None' end
            end
        end

        params.score = score
    end
}