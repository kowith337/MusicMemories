local t = Def.ActorFrame{};
local MiniGame = {{"Mem all it!","ScreenGamesMem"},{"Audition",},{"JukeBox","ScreenJukeboxMenu"},{"Back!","ScreenSelectMiniorTool"}};
local Row = 1;
local InputOfArrow = function( event )
	if not event then return end

	if event.type == "InputEventType_FirstPress" then
		if (event.button == "Left" or event.button == "Up" or event.button == "DownLeft") then
			Row = math.max(1,Row - 1);
			MESSAGEMAN:Broadcast('Chan')
		elseif (event.button == "Down" or event.button == "Right" or event.button == "DownRight") then
			Row = math.min(#MiniGame,Row + 1);
			MESSAGEMAN:Broadcast('Chan')
		elseif event.button == "Start" or event.button == "Center" then
			MESSAGEMAN:Broadcast('TorPai')--TorPai in Thai is mean Next
			SCREENMAN:GetTopScreen():SetNextScreenName(MiniGame[Row][2]):StartTransitioningScreen("SM_GoToNextScreen")
		elseif event.button == "Back" or event.button == "UpLeft" or event.button == "UpRight" then
			MESSAGEMAN:Broadcast('Nope')
			SCREENMAN:GetTopScreen():SetNextScreenName("ScreenSelectMiniorTool"):StartTransitioningScreen("SM_GoToNextScreen")
			SCREENMAN:GetTopScreen():RemoveInputCallback(InputOfArrow)
	end
	end
end;
t[#t+1] = Def.ActorFrame{
	name = "I hope Neptune have good dream";
	InitCommand=cmd(sleep,9999);
	OnCommand=function(self)
	SCREENMAN:GetTopScreen():AddInputCallback(InputOfArrow)
	end;
		LoadActor( THEME:GetPathS("Common","start") )..{
			TorPaiMessageCommand=cmd(play);
		};
		LoadActor( THEME:GetPathS("Common","cancel") )..{
			NopeMessageCommand=cmd(play);
		};
		LoadActor( THEME:GetPathS("Common","value") )..{
			ChanMessageCommand=cmd(play);
		};
};

for i = 1,#MiniGame do
t[#t+1] = LoadFont("_special elite 108px")..{
OnCommand=cmd(x,SCREEN_CENTER_X*.5;y,100+123*0.3*(i-1);zoom,0.3;settext,MiniGame[i][1];queuecommand,"Chan");
ChanMessageCommand=function(self)
	self:finishtweening()
		self:bounceend(0.5)
	if Row == i then
		self:diffuse(color("#FF8800"));
		self:zoom(0.5)
	else
		self:diffuse(color("#FFFFFF"));
		self:zoom(0.3)
	end
end;
};
end
return t;