local t = Def.ActorFrame{};
local GT = GAMESTATE:GetCurrentGame():GetName();
if GT == 'dance' then
t[#t+1] = LoadActor("Da");
elseif GT == 'pump' then
t[#t+1] = LoadActor("Pu");
end
return t;