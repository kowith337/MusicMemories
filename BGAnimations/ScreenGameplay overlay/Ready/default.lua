local function Diff2Cli(d,i)
CD = GameColor.Difficulty[d];
return CD[i]
end;

local CL;


local function BtS(x)
	return GAMESTATE:GetCurrentSong():GetTimingData():GetElapsedTimeFromBeat(x) or 0;
end

local function NumtoST(n)
if math.mod(n,100) <= 10 then
	if math.mod(n,10) == 1 then
		return n.."st"
	elseif math.mod(n,10) == 2 then
		return n.."nd"
	elseif math.mod(n,10) == 3 then
		return n.."rd"
	else
		return n.."th"
	end
elseif math.mod(n,100) <= 20 then
	return n.."th"
else
	if math.mod(n,10) == 1 then
		return n.."st"
	elseif math.mod(n,10) == 2 then
		return n.."nd"
	elseif math.mod(n,10) == 3 then
		return n.."rd"
	else
		return n.."th"
	end
end
end;

local NS = GAMESTATE:GetCurrentStageIndex()+1;

local RDText = "nil STAGE :(";
	if TP.Battle.IsBattle then
		RDText = NumtoST(NS).." ROUND";
	elseif GAMESTATE:IsCourseMode() then
		RDText = "Ready?"
	elseif ToEnumShortString(GAMESTATE:GetCurrentStage()) == "Event" then
		RDText = NumtoST(NS).." STAGE";
	else
						local playMode = GAMESTATE:GetPlayMode()
						local sStage = ""
						sStage = GAMESTATE:GetCurrentStage()
						if playMode ~= 'PlayMode_Regular' and playMode ~= 'PlayMode_Rave' and playMode ~= 'PlayMode_Battle' then
						  sStage = playMode;
						end
		RDText = ToEnumShortString(sStage).." STAGE";
	end


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


local lenA,lenB;--Use like zom
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
	lenA = BtS(FB-5)-BtS(FB-8);
	lenB = BtS(FB-4)-BtS(FB-5);
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
};
};
for i = 1,string.len( RDText ) do
	Tune[#Tune+1]=Def.ActorFrame{
		OnCommand=cmd(x,SCREEN_CENTER_X+(i-((string.len( RDText )+1)/2))*40;CenterY;zoom,0.85;
			diffuse,Meter2Color(
				(GAMESTATE:GetCurrentSteps(PLAYER_1):GetMeter() or GAMESTATE:GetCurrentSteps(PLAYER_2):GetMeter())/2 +
				(GAMESTATE:GetCurrentSteps(PLAYER_2):GetMeter() or GAMESTATE:GetCurrentSteps(PLAYER_1):GetMeter())/2 
				)
			);
		AppMessageCommand=cmd(ease,lenA+lenB+0.1,80;x,SCREEN_CENTER_X+(i-((string.len( RDText )+1)/2))*55;zoom,0.7);
		DanceMessageCommand=cmd(x,SCREEN_CENTER_X+(i-((string.len( RDText )+1)/2))*60;zoom,0.65);
		LoadFont("Common Large")..{
			InitCommand=cmd(settext,string.sub( RDText, i, i );diffusealpha,0);
			AppMessageCommand=cmd(linear,math.min(0.7,lenA);diffusealpha,1;sleep,math.max(lenA-0.7,0.001);decelerate,lenB;zoomx,0);
			DanceMessageCommand=cmd(diffusealpha,1;y,-115;effectclock,"beat";bounce;effectmagnitude,0,10*(math.mod(i,2)==0 and 1 or -1),0;effecttiming,0.02,0.08,0.25,0.65);
			RIPMessageCommand=cmd(decelerate,0.5;zoomx,0);
		};
	};
end





return Tune;