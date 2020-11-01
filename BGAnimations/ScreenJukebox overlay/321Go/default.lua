
local PPeng;
if GAMESTATE:IsCourseMode() then
PPeng = GAMESTATE:GetCurrentCourse():GetCourseEntry(0):GetSong();
else
PPeng = GAMESTATE:GetCurrentSong();
end


local FB = round(round(PPeng:GetFirstBeat())/4)*4


local Y = {false,false,false,false,false}


local function Diff2Cli(d,i)
CD = GameColor.Difficulty[d];
return CD[i]
end;

local CL = {1,1,1,1};




local Tune = Def.ActorFrame{

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
MESSAGEMAN:Broadcast("SFB")
end;
};



LoadFont("Common Normal")..{
InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y*0.4;settext,"";rainbow);
SFBMessageCommand=function(self)
self:playcommand("Nep")
end;
NepCommand=function(self)
if GAMESTATE:GetSongBeat() >= FB then
if not Y[5] then
MESSAGEMAN:Broadcast("RIPR")
Y[5] = true
end
elseif GAMESTATE:GetSongBeat() >= FB-1 then
--self:settext("GOO")

if not Y[1] then
MESSAGEMAN:Broadcast("Gooo")
Y[1] = true
end


elseif GAMESTATE:GetSongBeat() >= FB-2 then
--self:settext("1")
if not Y[2] then
MESSAGEMAN:Broadcast("Nueng")
Y[2] = true
end
elseif GAMESTATE:GetSongBeat() >= FB-3 then
--self:settext("2")
if not Y[3] then
MESSAGEMAN:Broadcast("Song")
Y[3] = true
end
elseif GAMESTATE:GetSongBeat() >= FB-4 then
--self:settext("3")
if not Y[4] then
MESSAGEMAN:Broadcast("Sam")
Y[4] = true
end
end
if GAMESTATE:GetSongBeat() < FB+10 then
self:sleep(1/30):queuecommand("Nep")
end
end;
};


LoadActor("count")..{
SFBMessageCommand=cmd(Center;animate,false;diffuse,CL;diffusealpha,0;rotationz,-10;zoom,2);
SamMessageCommand=cmd(diffusealpha,1;decelerate,(GAMESTATE:GetCurrentSong():GetTimingData():GetElapsedTimeFromBeat(FB-3)-GAMESTATE:GetCurrentSong():GetTimingData():GetElapsedTimeFromBeat(FB-4))/1.5;zoom,1;rotationz,0);
SongMessageCommand=cmd(setstate,1;rotationz,15;zoom,2;decelerate,(GAMESTATE:GetCurrentSong():GetTimingData():GetElapsedTimeFromBeat(FB-2)-GAMESTATE:GetCurrentSong():GetTimingData():GetElapsedTimeFromBeat(FB-3))/1.5;zoom,1;rotationz,0);
NuengMessageCommand=cmd(setstate,2;rotationz,-20;zoom,2;decelerate,(GAMESTATE:GetCurrentSong():GetTimingData():GetElapsedTimeFromBeat(FB-1)-GAMESTATE:GetCurrentSong():GetTimingData():GetElapsedTimeFromBeat(FB-2))/1.5;zoom,1;rotationz,0);
GoooMessageCommand=cmd(diffusealpha,0);
};


Def.ActorFrame{
SFBMessageCommand=cmd(Center;diffuse,CL;diffusealpha,0;rotationz,25;zoom,2);
GoooMessageCommand=cmd(Center;diffusealpha,1;decelerate,(GAMESTATE:GetCurrentSong():GetTimingData():GetElapsedTimeFromBeat(FB)-GAMESTATE:GetCurrentSong():GetTimingData():GetElapsedTimeFromBeat(FB-1))/1.5;zoom,1;rotationz,0);
RIPRMessageCommand=cmd(decelerate,0.2;y,SCREEN_CENTER_Y*.6;accelerate,0.6;y,SCREEN_BOTTOM+100;linear,0.2;diffusealpha,0);
LoadActor("count")..{
OnCommand=cmd(animate,false;setstate,3;cropright,0.5);
RIPRMessageCommand=cmd(linear,0.8;addx,math.random(-SCREEN_CENTER_X,SCREEN_CENTER_X);rotationz,math.random(-80,80)/4);
};
LoadActor("count")..{
OnCommand=cmd(animate,false;setstate,3;cropleft,0.5);
RIPRMessageCommand=cmd(linear,0.8;addx,math.random(-SCREEN_CENTER_X,SCREEN_CENTER_X);rotationz,math.random(-80,80)/4);
};
};





};
return Tune;