local RP = {};
local DLP = {};
local Now = 1;
local ALOne = {};
local LP = {0,0};
local SONGg;
if GAMESTATE:IsCourseMode() then
SONGg = GAMESTATE:GetCurrentCourse():GetCourseEntry(0):GetSong();
else
SONGg = GAMESTATE:GetCurrentSong();
end
local Lim = round(math.min(SONGg:GetLastSecond(),300))*1.5;
local t = Def.ActorFrame{};
for i = 1,Lim do
ALOne[i] = false;
end
t[#t+1] = Def.Quad {
InitCommand=cmd(x,0;y,SCREEN_BOTTOM-4;zoomy,8;horizalign,left);
OnCommand=cmd(playcommand,"SBTL");
SBTLCommand=function(self)
self:zoomx(math.max(SCREEN_RIGHT*((GAMESTATE:GetCurMusicSeconds()/SONGg:GetLastSecond()))),0)

self:sleep(1/60):queuecommand("SBTL")
end;
};
t[#t+1] = Def.Quad {
OnCommand=cmd(visible,false);
CurrentSongChangedMessageCommand=function(self)
if GAMESTATE:IsCourseMode() then
SONGg = GAMESTATE:GetCurrentCourse():GetCourseEntry(GAMESTATE:GetCourseSongIndex()-1):GetSong();
else
SONGg = GAMESTATE:GetCurrentSong();
end
Lim = round(math.min(SONGg:GetLastSecond(),300))*1.5;
for i = 1,Lim do
ALOne[i] = false;
end
end;
};
for i = 1,Lim do
t[#t+1] = Def.Quad {
InitCommand=cmd(x,(SCREEN_RIGHT/Lim)*(i-1);y,SCREEN_BOTTOM-4;zoomy,8;diffuse,color("#FF770000");horizalign,left;zoomx,SCREEN_RIGHT/Lim;);
OnCommand=cmd(playcommand,'Nepa');
NepaCommand=function(self)
if GAMESTATE:IsPlayerEnabled(PLAYER_1) then
LP[1] = SCREENMAN:GetTopScreen():GetLifeMeter(PLAYER_1):GetLife()
else
LP[1] = 0;
end

if GAMESTATE:IsPlayerEnabled(PLAYER_2) then
LP[2] = SCREENMAN:GetTopScreen():GetLifeMeter(PLAYER_2):GetLife()
else
LP[2] = 0;
end
if (SONGg:GetLastSecond()/Lim)*i < SONGg:GetFirstSecond() and (SONGg:GetLastSecond()/Lim)*i < GAMESTATE:GetCurMusicSeconds() then
self:diffuse(color("#FF7700FF"));
elseif (SONGg:GetLastSecond()/Lim)*i < SONGg:GetFirstSecond() then
self:diffuse(color("#FF770099"));
elseif (SONGg:GetLastSecond()/Lim)*i < GAMESTATE:GetCurMusicSeconds() then
if not ALOne[i] then
DLP[i] = {LP[1],LP[2]};
ALOne[i] = true
end

if LP[1] ~= 0 and LP[2] ~= 0 then--No Dead
RP[i] = (DLP[i][1]+DLP[i][2])/2--Use Mean
elseif LP[1] == 0 then--P1 Dead
RP[i] = (DLP[i][2])--Use P2
elseif LP[2] == 0 then--P2 Dead
RP[i] = (DLP[i][1])--Use P1
else--RIP
RP[i] = 0--Dead
end

self:diffuse(color((math.min(1-RP[i],0.5)*2)..","..(1-((math.max(1-RP[i],0.5)-0.5)*2))..",0,1"))
else
self:diffusealpha(0)
end
self:sleep(SONGg:GetLastSecond()/(Lim*2)):queuecommand("Nepa")
end;
};
end
t[#t+1] = Def.Quad {
InitCommand=cmd(x,0;y,SCREEN_BOTTOM-4;zoomy,8;horizalign,left);
OnCommand=cmd(playcommand,"SBTL");
SBTLCommand=function(self)
self:zoomx(math.max(SCREEN_RIGHT*((GAMESTATE:GetCurMusicSeconds()/SONGg:GetLastSecond()))),0)
self:diffusealpha((-math.abs(math.mod(math.abs(GAMESTATE:GetSongBeat()),2)-1)+1)*.5)

self:sleep(1/60):queuecommand("SBTL")
end;
};
return t;