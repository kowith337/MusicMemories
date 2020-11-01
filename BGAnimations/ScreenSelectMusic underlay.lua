RPC_Update({details = "Selecting Song...",
large_image = "outfox",large_text = "Stepmania 5.3",
small_image = GAMESTATE:GetCurrentGame():GetName() , small_text = GAMESTATE:GetCurrentGame():GetName()})
local t = Def.ActorFrame {
	OnCommand=function(self)
		local player = GAMESTATE:GetMasterPlayerNumber()
		GAMESTATE:UpdateDiscordProfile(GAMESTATE:GetPlayerDisplayName(player))
		GAMESTATE:UpdateDiscordScreenInfo("Selecting Song","",1)
	end;
	
};

return t;
