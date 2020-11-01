local ttttime = GAMESTATE:GetCurrentSong():GetLastBeat()
local ttttec = GAMESTATE:GetCurrentSong():MusicLengthSeconds()
local bpmsA;
local StopA;
local DelayA;
local WarpA;
if GAMESTATE:IsHumanPlayer(PLAYER_1) then
bpmsA = GAMESTATE:GetCurrentSteps(PLAYER_1):GetTimingData():GetBPMsAndTimes(true);
StopA = GAMESTATE:GetCurrentSteps(PLAYER_1):GetTimingData():GetStops(true);
DelayA = GAMESTATE:GetCurrentSteps(PLAYER_1):GetTimingData():GetDelays(true);
WarpA = GAMESTATE:GetCurrentSteps(PLAYER_1):GetTimingData():GetWarps(true);
end;

local bpmsB;
local StopB;
local DelayB;
local WarpB;
if GAMESTATE:IsHumanPlayer(PLAYER_2) then
bpmsB = GAMESTATE:GetCurrentSteps(PLAYER_2):GetTimingData():GetBPMsAndTimes(true);
StopB = GAMESTATE:GetCurrentSteps(PLAYER_2):GetTimingData():GetStops(true);
DelayB = GAMESTATE:GetCurrentSteps(PLAYER_2):GetTimingData():GetDelays(true);
WarpB = GAMESTATE:GetCurrentSteps(PLAYER_2):GetTimingData():GetWarps(true);
end;
local function sangsen(Vera,nan,cee,zoooomy,wai,pppppy)--sangsen in thai is mean 'Create Line'
	local e = Def.ActorFrame { };
	if pppppy == 1 then
	Vera = GAMESTATE:GetCurrentSteps(PLAYER_1):GetTimingData():GetElapsedTimeFromBeat(Vera)
	elseif pppppy == 2 then
	Vera = GAMESTATE:GetCurrentSteps(PLAYER_2):GetTimingData():GetElapsedTimeFromBeat(Vera)
	end
if Vera <= 0 then
return Def.ActorFrame{}
else
e[#e+1] = Def.Quad {
InitCommand=function(self)
self:shadowlength(0);
self:horizalign(left)
self:zoomx(math.max((nan/ttttec)*SCREEN_RIGHT, 1));
self:zoomy(zoooomy)
self:x((Vera/ttttec)*SCREEN_RIGHT);
self:y(wai)
self:diffuse(color(cee));
self:fadetop(0.5);
end
};
end
return e
end
local t = Def.ActorFrame{};
if GAMESTATE:IsHumanPlayer(PLAYER_1) and GAMESTATE:IsHumanPlayer(PLAYER_2) and #bpmsA + #StopA + #DelayA + #WarpA < 500 and #bpmsB + #StopB + #DelayB + #WarpB < 500 then
for i=2,#bpmsA do
		t[#t+1] = sangsen(bpmsA[i][1],0,"#008080FF",4,-4,1);
end;
for i=2,#StopA do
		t[#t+1] = sangsen(StopA[i][1],0,"#FFFF00FF",4,-4,1);
end;
for i=2,#DelayA do
		t[#t+1] = sangsen(DelayA[i][1],0,"#8484FFFF",4,-4,1);
end;
for i=2,#WarpA do
		t[#t+1] = sangsen(WarpA[i][1],0,"#BB1213FF",4,-4,1);
end;

for i=2,#bpmsB do
		t[#t+1] = sangsen(bpmsB[i][1],0,"#008080FF",4,1,2);
end;
for i=2,#StopB do
		t[#t+1] = sangsen(StopB[i][1],0,"#FFFF00FF",4,1,2);
end;
for i=2,#DelayB do
		t[#t+1] = sangsen(DelayB[i][1],0,"#8484FFFF",4,1,2);
end;
for i=2,#WarpB do
		t[#t+1] = sangsen(WarpB[i][1],0,"#BB1213FF",4,1,2);
end;
elseif GAMESTATE:IsHumanPlayer(PLAYER_1) and #bpmsA + #StopA + #DelayA + #WarpA < 500 then
for i=2,#bpmsA do
		t[#t+1] = sangsen(bpmsA[i][1],0,"#008080FF",8,0,1);
end;
for i=2,#StopA do
		t[#t+1] = sangsen(StopA[i][1],0,"#FFFF00FF",8,0,1);
end;
for i=2,#DelayA do
		t[#t+1] = sangsen(DelayA[i][1],0,"#8484FFFF",8,0,1);
end;
for i=2,#WarpA do
		t[#t+1] = sangsen(WarpA[i][1],0,"#BB1213FF",8,0,1);
end;
elseif GAMESTATE:IsHumanPlayer(PLAYER_2) and #bpmsB + #StopB + #DelayB + #WarpB < 500 then
for i=2,#bpmsB do
		t[#t+1] = sangsen(bpmsB[i][1],0,"#008080FF",8,0,2);
end;
for i=2,#StopB do
		t[#t+1] = sangsen(StopB[i][1],0,"#FFFF00FF",8,0,2);
end;
for i=2,#DelayB do
		t[#t+1] = sangsen(DelayB[i][1],0,"#8484FFFF",8,0,2);
end;
for i=2,#WarpB do
		t[#t+1] = sangsen(WarpB[i][1],0,"#BB1213FF",8,0,2);
end;
end
return t;
