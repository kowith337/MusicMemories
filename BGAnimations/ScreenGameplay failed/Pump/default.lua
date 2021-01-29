

local curDir = THEMEDIR().."/BGAnimations/ScreenGameplay failed/Pump/Media/"

local files = FILEMAN:GetDirListing(curDir)

local pumpFail = {}

for k,filename in ipairs(files) do
    
    if string.match(filename, ".avi") or string.match(filename, ".mp4") then
        pumpFail[#pumpFail+1] = filename
    end
end

local VDOPath = nil
local SoundPath = nil

if #pumpFail == 0 then
    return def.ActorFrame{}
else
    VDOPath = "Media/"..(pumpFail[math.random(1,#pumpFail)])
    SoundPath = string.sub( VDOPath, 1,string.len(VDOPath)-4)..".ogg"
end



local t = Def.ActorFrame{
    LoadActor(VDOPath)..{
        InitCommand=cmd(FullScreen;loop,false);
        StartTransitioningCommand=cmd(play);
    };
    LoadActor(SoundPath)..{
        InitCommand=cmd(FullScreen);
        StartTransitioningCommand=cmd(play);
    };
};
return t;