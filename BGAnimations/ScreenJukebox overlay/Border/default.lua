function Diff2Cl(d,A)
CD = GameColor.Difficulty[d];
return { CD[1], CD[2], CD[3], CD[4]*A }
end;
local LP={0,0};
local DP={0,0};
local t = Def.ActorFrame{};
t[#t+1] = Def.Quad{
InitCommand=cmd(CenterX;y,35.5;zoomx,99999;zoomy,(1/6)*SCREEN_BOTTOM;diffusealpha,0.1);
OnCommand=cmd(queuecommand,"Nep");
		CurrentSongChangedMessageCommand=cmd(queuecommand,"Nep");
		NepCommand=function(self)
		if GAMESTATE:IsPlayerEnabled(PLAYER_1) and GAMESTATE:IsPlayerEnabled(PLAYER_2) then
		self:diffuserightedge(Diff2Cl(GAMESTATE:GetCurrentSteps(PLAYER_2):GetDifficulty(),0.35))
		self:diffuseleftedge(Diff2Cl(GAMESTATE:GetCurrentSteps(PLAYER_1):GetDifficulty(),0.35))
		elseif GAMESTATE:IsPlayerEnabled(PLAYER_1) then
		self:diffuse(Diff2Cl(GAMESTATE:GetCurrentSteps(PLAYER_1):GetDifficulty(),0.35))
		elseif GAMESTATE:IsPlayerEnabled(PLAYER_2) then
		self:diffuse(Diff2Cl(GAMESTATE:GetCurrentSteps(PLAYER_2):GetDifficulty(),0.35))
		end
		end;
};
t[#t+1] = Def.ActorFrame{
LoadActor("Under lay.png")..{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;zoomtowidth,SCREEN_WIDTH;zoomtoheight,SCREEN_HEIGHT);
		OnCommand=cmd(queuecommand,"Nep");
		CurrentSongChangedMessageCommand=cmd(queuecommand,"Nep");
		NepCommand=function(self)
		if GAMESTATE:IsPlayerEnabled(PLAYER_1) and GAMESTATE:IsPlayerEnabled(PLAYER_2) then
		self:diffuserightedge(Diff2Cl(GAMESTATE:GetCurrentSteps(PLAYER_2):GetDifficulty(),1))
		self:diffuseleftedge(Diff2Cl(GAMESTATE:GetCurrentSteps(PLAYER_1):GetDifficulty(),1))
		elseif GAMESTATE:IsPlayerEnabled(PLAYER_1) then
		self:diffuse(Diff2Cl(GAMESTATE:GetCurrentSteps(PLAYER_1):GetDifficulty(),1))
		elseif GAMESTATE:IsPlayerEnabled(PLAYER_2) then
		self:diffuse(Diff2Cl(GAMESTATE:GetCurrentSteps(PLAYER_2):GetDifficulty(),1))
		end
		end;
};
LoadActor("Under lay.png")..{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;zoomtowidth,SCREEN_WIDTH;zoomtoheight,SCREEN_HEIGHT);
		OnCommand=cmd(playcommand,'Super');
		SuperCommand=function(self)
		if true then
		DB = math.abs(math.sin(GAMESTATE:GetSongBeat()*(3.14)))*0.396+0.6
		DB2 = math.abs(math.sin(GAMESTATE:GetSongBeat()*(3.14)))*0.45
		self:diffuse(color(DB..","..DB..","..DB..","..DB2))
		P = GAMESTATE:GetSongBeat() / GAMESTATE:GetCurrentSong():GetLastBeat()
		self:cropright(1-(P))
		self:sleep(1/60) 
		self:queuecommand('Super')
		end
		end;
};
Def.ActorFrame{
		OnCommand=cmd(queuecommand,"Nep");
		CurrentSongChangedMessageCommand=cmd(queuecommand,"Nep");
		NepCommand=function(self)
		if GAMESTATE:IsPlayerEnabled(PLAYER_1) and GAMESTATE:IsPlayerEnabled(PLAYER_2) then
		self:diffuserightedge(Diff2Cl(GAMESTATE:GetCurrentSteps(PLAYER_2):GetDifficulty(),1))
		self:diffuseleftedge(Diff2Cl(GAMESTATE:GetCurrentSteps(PLAYER_1):GetDifficulty(),1))
		elseif GAMESTATE:IsPlayerEnabled(PLAYER_1) then
		self:diffuse(Diff2Cl(GAMESTATE:GetCurrentSteps(PLAYER_1):GetDifficulty(),1))
		elseif GAMESTATE:IsPlayerEnabled(PLAYER_2) then
		self:diffuse(Diff2Cl(GAMESTATE:GetCurrentSteps(PLAYER_2):GetDifficulty(),1))
		end
		end;
LoadActor("Awesome.png")..{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;zoomtowidth,SCREEN_WIDTH;zoomtoheight,SCREEN_HEIGHT);
		OnCommand=cmd(playcommand,"Nyaa");
		NyaaCommand=function(self)
		if GAMESTATE:IsPlayerEnabled(PLAYER_2) then
				LP[2] = math.max(SCREENMAN:GetTopScreen():GetLifeMeter(PLAYER_2):GetLife()*100-50,0)*2;
		end
		if GAMESTATE:IsPlayerEnabled(PLAYER_1) then
				LP[1] = math.max(SCREENMAN:GetTopScreen():GetLifeMeter(PLAYER_1):GetLife()*100-50,0)*2;
		end
		
		if GAMESTATE:IsPlayerEnabled(PLAYER_1) and GAMESTATE:IsPlayerEnabled(PLAYER_2) then
		if GAMESTATE:GetPlayMode() == "PlayMode_Rave" or (GAMESTATE:GetPlayerState(PLAYER_1):GetCurrentPlayerOptions():DrainSetting() == "DrainType_SuddenDeath" and GAMESTATE:GetPlayerState(PLAYER_2):GetCurrentPlayerOptions():DrainSetting() == "DrainType_SuddenDeath") then
			self:diffusealpha((1-(math.mod(GAMESTATE:GetSongBeat(),1)))/2)
		else
			if LP[1] > LP[2] then
				self:diffusealpha(LP[1]/100)
			elseif LP[1] < LP[2] then
				self:diffusealpha(LP[2]/100)
			end
		end
		
		elseif GAMESTATE:IsPlayerEnabled(PLAYER_1) then
			if GAMESTATE:GetPlayerState(PLAYER_1):GetCurrentPlayerOptions():DrainSetting() == "DrainType_SuddenDeath" then
			self:diffusealpha((1-(math.mod(GAMESTATE:GetSongBeat(),1)))/2)
			else
			self:diffusealpha(LP[1]/100)
			end
			
		elseif GAMESTATE:IsPlayerEnabled(PLAYER_2) then
			if GAMESTATE:GetPlayerState(PLAYER_2):GetCurrentPlayerOptions():DrainSetting() == "DrainType_SuddenDeath" then
			self:diffusealpha((1-(math.mod(GAMESTATE:GetSongBeat(),1)))/2)
			else
			self:diffusealpha(LP[2]/100)
			end
		end
		self:sleep(1/50)
		self:queuecommand("Nyaa")
		end;
		};
};
};
if GAMESTATE:IsPlayerEnabled(PLAYER_1) then
t[#t+1]=LoadActor("Under aorrar.png")..{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;zoomtowidth,SCREEN_WIDTH;zoomtoheight,SCREEN_HEIGHT;diffuse,color("#FF0000"));
		OnCommand=cmd(playcommand,"Nyaa");
		NyaaCommand=function(self)
		if GAMESTATE:IsPlayerEnabled(PLAYER_1) then
				DP[1] = 50-(math.min(SCREENMAN:GetTopScreen():GetLifeMeter(PLAYER_1):GetLife()*100,50));
		end
		
		if GAMESTATE:IsPlayerEnabled(PLAYER_2) then
		self:cropright(0.5)
		end
			if GAMESTATE:GetPlayerState(PLAYER_1):GetCurrentPlayerOptions():DrainSetting() == "DrainType_SuddenDeath" then
			self:diffusealpha((1-(math.mod(GAMESTATE:GetSongBeat(),1)))/2)
			else
			self:diffusealpha(DP[1]/50)
			end
		if SCREENMAN:GetTopScreen():GetLifeMeter(PLAYER_1):IsFailing() then
		self:playcommand("Fail1")
		else
		self:sleep(1/50)
		self:queuecommand("Nyaa")
		end
		end;
		Fail1Command=cmd(diffuse,PlayerColor(PLAYER_1);decelerate,0.5;diffuse,color("#00000000"));
		};
end
if GAMESTATE:IsPlayerEnabled(PLAYER_2) then
t[#t+1]=LoadActor("Under aorrar.png")..{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;zoomtowidth,SCREEN_WIDTH;zoomtoheight,SCREEN_HEIGHT;diffuse,color("#FF0000"));
		OnCommand=cmd(playcommand,"Nyaa");
		NyaaCommand=function(self)
		if GAMESTATE:IsPlayerEnabled(PLAYER_2) then
				DP[2] = 50-(math.min(SCREENMAN:GetTopScreen():GetLifeMeter(PLAYER_2):GetLife()*100,50));
		end
		
		if GAMESTATE:IsPlayerEnabled(PLAYER_1) then
		self:cropleft(0.5)
		end
			if GAMESTATE:GetPlayerState(PLAYER_2):GetCurrentPlayerOptions():DrainSetting() == "DrainType_SuddenDeath" then
			self:diffusealpha((1-(math.mod(GAMESTATE:GetSongBeat(),1)))/2)
			else
			self:diffusealpha(DP[2]/50)
			end
		if SCREENMAN:GetTopScreen():GetLifeMeter(PLAYER_2):IsFailing() then
		self:playcommand("Fail2")
		else
		self:sleep(1/50)
		self:queuecommand("Nyaa")
		end
		end;
		Fail2Command=cmd(diffuse,PlayerColor(PLAYER_2);decelerate,0.5;diffuse,color("#00000000"));
		};
end
return t;