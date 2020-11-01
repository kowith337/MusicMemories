function Diff2Cli(d,i)
CD = GameColor.Difficulty[d];
return CD[i]
end;

local CL;




local PPeng;
if GAMESTATE:IsCourseMode() then
PPeng = GAMESTATE:GetCurrentCourse():GetCourseEntry(0):GetSong();
else
PPeng = GAMESTATE:GetCurrentSong();
end


local APoDC = false;
local RIPY = false;
local WY = false;



local wai = -80;
local d = 0.7;
local FB = round(round(PPeng:GetFirstBeat())/4)*4
if FB >= 8 then
wai = 0;
d = 0
end


local Sped = 50;--Use like zom
local zom = .7;--Use for change scale in other font


local lim;--Use for make sure if that song so fast than command;(Use as Second)

local Tune = Def.ActorFrame{

--
Def.Quad{
OnCommand=cmd(sleep,0.1;queuecommand,"GM");--Use For Delay
--IDK Why SM use > 0 beat and then turn back to real beat :(
GMCommand=function(self)
		if GAMESTATE:IsPlayerEnabled(PLAYER_1) and GAMESTATE:IsPlayerEnabled(PLAYER_2) then
		CL = Meter2Color(GAMESTATE:GetCurrentSteps(PLAYER_1):GetMeter()/2+GAMESTATE:GetCurrentSteps(PLAYER_2):GetMeter()/2)
		elseif GAMESTATE:IsPlayerEnabled(PLAYER_1) then
		CL = Meter2Color(GAMESTATE:GetCurrentSteps(PLAYER_1):GetMeter())
		elseif GAMESTATE:IsPlayerEnabled(PLAYER_2) then
		CL = Meter2Color(GAMESTATE:GetCurrentSteps(PLAYER_2):GetMeter())
		end
	lim = GAMESTATE:GetCurrentSong():GetTimingData():GetElapsedTimeFromBeat(FB)-GAMESTATE:GetCurrentSong():GetTimingData():GetElapsedTimeFromBeat(FB-4);


MESSAGEMAN:Broadcast("SFB")
end;
};

LoadFont("Common Normal")..{
InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y*0.65;rainbow);
SFBMessageCommand=function(self)
self:playcommand("Nep")
end;
NepCommand=function(self)
if FB >= 8 then
	if GAMESTATE:GetSongBeat() >= FB-4 then
	if not RIPY then
	MESSAGEMAN:Broadcast("RIP")
	RIPY = true
	end
	elseif GAMESTATE:GetSongBeat() >= FB-8 and GAMESTATE:GetSongBeat() < FB-4 then
	if not APoDC then
	MESSAGEMAN:Broadcast("App")
	APoDC = true
	end
	else
	if not WY then
	MESSAGEMAN:Broadcast("Waitman")
	WY = true
	end
	end
else
	if GAMESTATE:GetSongBeat() >= FB then
	if not RIPY then
	MESSAGEMAN:Broadcast("RIP")
	RIPY = true
	end
	else
	if not APoDC then
	MESSAGEMAN:Broadcast("Dance")
	APoDC = true
	end
	end


end
if GAMESTATE:GetSongBeat() < FB+10 then
self:sleep(1/30):queuecommand("Nep")
end
end;
};

Def.ActorFrame{
OnCommand=cmd(y,wai);
Def.Quad{
OnCommand=cmd(visible,true);
DanceMessageCommand=function()
if IsNetConnected() and ((SCREENMAN:GetTopScreen():GetChild('PlayerP1') and SCREENMAN:GetTopScreen():GetChild('PlayerP1'):GetX() == SCREEN_CENTER_X)
			or (SCREENMAN:GetTopScreen():GetChild('PlayerP2') and SCREENMAN:GetTopScreen():GetChild('PlayerP2'):GetX() == SCREEN_CENTER_X)) then
	if SCREENMAN:GetTopScreen():GetChild('PlayerP1') then
		SCREENMAN:GetTopScreen():GetChild('PlayerP1'):decelerate(0.5)
		SCREENMAN:GetTopScreen():GetChild('PlayerP1'):addx(-80)
	elseif SCREENMAN:GetTopScreen():GetChild('PlayerP2') then
		SCREENMAN:GetTopScreen():GetChild('PlayerP2'):decelerate(0.5)
		SCREENMAN:GetTopScreen():GetChild('PlayerP2'):addx(-80)
	end
end
end;
AppMessageCommand=function()
if IsNetConnected() and ((SCREENMAN:GetTopScreen():GetChild('PlayerP1') and SCREENMAN:GetTopScreen():GetChild('PlayerP1'):GetX() == SCREEN_CENTER_X)
			or (SCREENMAN:GetTopScreen():GetChild('PlayerP2') and SCREENMAN:GetTopScreen():GetChild('PlayerP2'):GetX() == SCREEN_CENTER_X)) then
	if SCREENMAN:GetTopScreen():GetChild('PlayerP1') then
		SCREENMAN:GetTopScreen():GetChild('PlayerP1'):decelerate(0.5)
		SCREENMAN:GetTopScreen():GetChild('PlayerP1'):addx(-80)
	elseif SCREENMAN:GetTopScreen():GetChild('PlayerP2') then
		SCREENMAN:GetTopScreen():GetChild('PlayerP2'):decelerate(0.5)
		SCREENMAN:GetTopScreen():GetChild('PlayerP2'):addx(-80)
	end
end
end;
};
Def.ActorFrame{
RIPMessageCommand=cmd(linear,0.8;x,math.random(-SCREEN_CENTER_X,SCREEN_CENTER_X));
LoadFont("_century schoolbook 108px")..{
Text = "R";
SFBMessageCommand=cmd(x,SCREEN_CENTER_X+Sped*-2.5;CenterY;diffuse,CL;zoom,d);
DanceMessageCommand=cmd(effectclock,"beat";bounce;effectmagnitude,-10,-10,0;effecttiming,0.02,0.08,0.25,0.65);
AppMessageCommand=cmd(sleep,math.random(0,(lim/8)*50)/50;decelerate,(lim/2);zoom,zom);
RIPMessageCommand=cmd(finishtweening;stopeffect;decelerate,0.2;y,SCREEN_CENTER_Y*.6;accelerate,0.6;y,SCREEN_BOTTOM+150;rotationz,math.random(-80,80)/4);
};
};
Def.ActorFrame{
RIPMessageCommand=cmd(linear,0.8;x,math.random(-SCREEN_CENTER_X,SCREEN_CENTER_X));
LoadFont("_century schoolbook 108px")..{
Text = "e";
SFBMessageCommand=cmd(x,SCREEN_CENTER_X+Sped*-1.5;CenterY;diffuse,CL;zoom,d);
DanceMessageCommand=cmd(effectclock,"beat";bounce;effectmagnitude,-6,10,0;effecttiming,0.02,0.08,0.25,0.65);
AppMessageCommand=cmd(sleep,math.random(0,(lim/8)*50)/50;decelerate,(lim/2);zoom,zom);
RIPMessageCommand=cmd(finishtweening;stopeffect;decelerate,0.2;y,SCREEN_CENTER_Y*.6;accelerate,0.6;y,SCREEN_BOTTOM+150;rotationz,math.random(-80,80)/4);
};
};
Def.ActorFrame{
RIPMessageCommand=cmd(linear,0.8;x,math.random(-SCREEN_CENTER_X,SCREEN_CENTER_X));
LoadFont("_century schoolbook 108px")..{
Text = "a";
SFBMessageCommand=cmd(x,SCREEN_CENTER_X+Sped*-0.5;CenterY;diffuse,CL;zoom,d);
DanceMessageCommand=cmd(effectclock,"beat";bounce;effectmagnitude,-2,-10,0;effecttiming,0.02,0.08,0.25,0.65);
AppMessageCommand=cmd(sleep,math.random(0,(lim/8)*50)/50;decelerate,(lim/2);zoom,zom);
RIPMessageCommand=cmd(finishtweening;stopeffect;decelerate,0.2;y,SCREEN_CENTER_Y*.6;accelerate,0.6;y,SCREEN_BOTTOM+150;rotationz,math.random(-80,80)/4);
};
};
Def.ActorFrame{
RIPMessageCommand=cmd(linear,0.8;x,math.random(-SCREEN_CENTER_X,SCREEN_CENTER_X));
LoadFont("_century schoolbook 108px")..{
Text = "d";
SFBMessageCommand=cmd(x,SCREEN_CENTER_X+Sped*0.5;CenterY;diffuse,CL;zoom,d);
DanceMessageCommand=cmd(effectclock,"beat";bounce;effectmagnitude,2,-10,0;effecttiming,0.02,0.08,0.25,0.65);
AppMessageCommand=cmd(sleep,math.random(0,(lim/8)*50)/50;decelerate,(lim/2);zoom,zom);
RIPMessageCommand=cmd(finishtweening;stopeffect;decelerate,0.2;y,SCREEN_CENTER_Y*.6;accelerate,0.6;y,SCREEN_BOTTOM+150;rotationz,math.random(-80,80)/4);
};
};
Def.ActorFrame{
RIPMessageCommand=cmd(linear,0.8;x,math.random(-SCREEN_CENTER_X,SCREEN_CENTER_X));
LoadFont("_century schoolbook 108px")..{
Text = "y";
SFBMessageCommand=cmd(x,SCREEN_CENTER_X+Sped*1.5;CenterY;diffuse,CL;zoom,d);
DanceMessageCommand=cmd(effectclock,"beat";bounce;effectmagnitude,6,10,0;effecttiming,0.02,0.08,0.25,0.65);
AppMessageCommand=cmd(sleep,math.random(0,(lim/8)*50)/50;decelerate,(lim/2);zoom,zom);
RIPMessageCommand=cmd(finishtweening;stopeffect;decelerate,0.2;y,SCREEN_CENTER_Y*.6;accelerate,0.6;y,SCREEN_BOTTOM+150;rotationz,math.random(-80,80)/4);
};
};
Def.ActorFrame{
RIPMessageCommand=cmd(linear,0.8;x,math.random(-SCREEN_CENTER_X,SCREEN_CENTER_X));
LoadFont("_century schoolbook 108px")..{
Text = "?";
SFBMessageCommand=cmd(x,SCREEN_CENTER_X+Sped*2.5;CenterY;diffuse,CL;zoom,d);
DanceMessageCommand=cmd(effectclock,"beat";bounce;effectmagnitude,10,-10,0;effecttiming,0.02,0.08,0.25,0.65);
AppMessageCommand=cmd(sleep,math.random(0,(lim/8)*50)/50;decelerate,(lim/2);zoom,zom);
RIPMessageCommand=cmd(finishtweening;stopeffect;decelerate,0.2;y,SCREEN_CENTER_Y*.6;accelerate,0.6;y,SCREEN_BOTTOM+150;rotationz,math.random(-80,80)/4);
};
};
};


};
return Tune;