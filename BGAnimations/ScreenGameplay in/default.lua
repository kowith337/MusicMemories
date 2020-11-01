local SongNumberInCourse = 0



-- get the PlayerOptions string for any human players and store it now
-- we'll retreive it the next time ScreenSelectMusic loads and re-apply those same mods
-- in this way, we can override the effects of songs that forced modifiers during gameplay
-- the old-school (ie. ITG) way of GAMESTATE:ApplyGameCommand()
--local Players = GAMESTATE:GetHumanPlayers()
local Players = GAMESTATE:GetHumanPlayers()

local InitializeStreamuAndModsLevel = function()	
	for player in ivalues(Players) do
		local pn = ToEnumShortString(player)
		local huh;

		-- Check if Streamu is turned on;
		-- we may (or may not) need to parse the chart.
		local mods = TP[pn].ActiveModifiers
		if mods.Streamu and mods.Streamu ~= "Nope" then
		
			if mods.Streamu == "AUTO" then
				huh = "6969th"
			else
				huh = mods.Streamu
			end

			local song_dir, steps
			if GAMESTATE:IsCourseMode() then
				song_dir = GAMESTATE:GetCurrentTrail(player):GetTrailEntries()[SongNumberInCourse+1]:GetSong():GetSongDir()
				steps = GAMESTATE:GetCurrentTrail(player):GetTrailEntries()[SongNumberInCourse+1]:GetSteps()
			else
				song_dir = GAMESTATE:GetCurrentSong():GetSongDir()
				steps = GAMESTATE:GetCurrentSteps(player)
			end
			
			local steps_type = ToEnumShortString( steps:GetStepsType() ):gsub("_", "-"):lower()
			local difficulty = ToEnumShortString( steps:GetDifficulty() )
			local notes_per_measure = tonumber(huh:match("%d+"))
			local threshold_to_be_stream = 2
			local des = steps:GetDescription()
			
			-- if any of these don't match what we're currently looking for...
			if TP[pn].Streams.SongDir ~= song_dir or TP[pn].Streams.StepsType ~= step_type or TP[pn].Streams.Difficulty ~= difficulty then

				-- ...then parse the simfile, given the current parameters
				TP[pn].Streams.Measures = GetStreams(song_dir, steps_type, difficulty, notes_per_measure, threshold_to_be_stream,player,des)
				-- and set these so we can check again next time.
				TP[pn].Streams.SongDir = song_dir
				TP[pn].Streams.StepsType = steps_type
				TP[pn].Streams.Difficulty = difficulty
			end
		end
	end
end

InitializeStreamuAndModsLevel()

local t = Def.ActorFrame{
	OnCommand=cmd(draworder,50000;);
}

local CX = SCREEN_CENTER_X;
local CY = SCREEN_CENTER_Y;
local SB = math.random(6,14);

for i = 1, SB+1 do
	t[#t+1] = Def.Quad {
		InitCommand=function(self)
		self:diffuse(color("#000000FF"))
		self:x(CX*2/SB*(i-1));
		self:zoomx(CX*2/SB);
		self:CenterY();
		self:zoomy(CY*2);
	
	end,
	OnCommand=cmd(sleep,math.random(0,70)/70*0.7;draworder,600;accelerate,2;fadetop,2;linear,0.5;diffusealpha,0)
}
end

TP.Eva:initialize()


return t