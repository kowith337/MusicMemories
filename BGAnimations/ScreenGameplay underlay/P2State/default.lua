if not GAMESTATE:IsPlayerEnabled(PLAYER_2) then return end
local t = Def.ActorFrame{};
t[#t+1] = LoadActor("MeasureCounter.lua");
return t;