local PL = PLAYER_1;
if not GAMESTATE:IsPlayerEnabled(PL) then return end
local t = Def.ActorFrame{};
if TP[ToEnumShortString(PL)].ActiveModifiers.Streamu ~= "Nope" then
t[#t+1] = LoadActor("MeasureCounter.lua");
end
return t;