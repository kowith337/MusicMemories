local Players = GAMESTATE:GetHumanPlayers();
local t = Def.ActorFrame{};

-- Danger
for pn in ivalues(Players) do
	t[#t+1] = LoadActor("Danger", pn);
end

return t;