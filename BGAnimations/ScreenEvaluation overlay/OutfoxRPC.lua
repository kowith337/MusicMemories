return Def.ActorFrame{
-------------------------------------
-- Discord GameSDK From Outfox Theme!
-------------------------------------
	OnCommand = function(self)
		local player = GAMESTATE:GetMasterPlayerNumber()
		local details = (PREFSMAN:GetPreference("ShowNativeLanguage") and GAMESTATE:GetCurrentSong():GetDisplayMainTitle() or GAMESTATE:GetCurrentSong():GetTranslitFullTitle()) .. " - " .. GAMESTATE:GetCurrentSong():GetGroupName()
		details = string.len(details) < 128 and details or string.sub(details, 1, 124) .. "..."
		local Difficulty = ToEnumShortString( GAMESTATE:GetCurrentSteps(player):GetDifficulty() ) .. " " .. GAMESTATE:GetCurrentSteps(player):GetMeter()
		local Percentage = STATSMAN:GetCurStageStats():GetPlayerStageStats(player):GetPercentDancePoints()
		local states = Difficulty .. " (".. string.format( "%.2f%%", Percentage*100) .. ")"
		GAMESTATE:UpdateDiscordProfile(GAMESTATE:GetPlayerDisplayName(player))
		GAMESTATE:UpdateDiscordScreenInfo(details,states,1)
	end



	
};
