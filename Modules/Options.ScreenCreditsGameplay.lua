return function()
	if GAMESTATE:GetCurrentGame():GetName() == "dance" then
		local Songs = SONGMAN:GetSongsInGroup("OutFox")
		
		if Songs == nil then
			--SM(":(")
			return "ScreenTitleMenu"; 
		end
		
		local Song
		for _,song in ipairs(Songs) do
			if string.find(song:GetDisplayMainTitle(), "After The Ending") then
				Song = song
			end
		end
		
		if Song == nil then
			--SM(":(")
			return "ScreenTitleMenu"; 
		end

		GAMESTATE:SetCurrentPlayMode("PlayMode_Regular")
		GAMESTATE:SetCurrentSong(Song)
		GAMESTATE:SetCurrentStyle('versus')
		GAMESTATE:SetCurrentSteps(PLAYER_1,Song:GetAllSteps()[3])
		GAMESTATE:SetCurrentSteps(PLAYER_2,Song:GetAllSteps()[3])
	
		return "ScreenCreditsGameplay"
	end
	--SM("Set to \"Dance\" mode first.")
	return "ScreenTitleMenu"
end