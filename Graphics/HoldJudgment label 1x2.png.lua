
local PN = Var "Player" or GAMESTATE:GetMasterPlayerNumber();
--Var "Player" is null :(


local JudF = TP[ToEnumShortString(PN)].ActiveModifiers.JudgmentGraphic
JudF = JudF:gsub(" %dx%d", ""):gsub(" %(doubleres%)", ""):gsub(".png", ""):gsub(" %[double%]",""):gsub(" %(res %d+x%d+%)","")

local path = "/"..THEMEDIR().."Resource/JudF/Hold/";

local files = FILEMAN:GetDirListing(path)
local RealFile = THEME:GetPathG("Def","HoldJ");

for k,filename in ipairs(files) do
    if string.match(filename, " 1x2.png") and string.match(filename,JudF) then
        RealFile = path..filename;
        break
    end
end


return LoadActor(RealFile);