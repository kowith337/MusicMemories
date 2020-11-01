local t = Def.ActorFrame{};

local title = "NO!";
local SubTitle;
local Artist;
local charter={};
local BPM={"???","???"};
local Time;
local CEN;
if GAMESTATE:IsCourseMode() then
CEN = GAMESTATE:GetCurrentCourse():GetCourseEntries()
end

title = GAMESTATE:IsCourseMode() and GAMESTATE:GetCurrentCourse():GetDisplayFullTitle() or GAMESTATE:GetCurrentSong():GetDisplayMainTitle()
SubTitle = GAMESTATE:IsCourseMode() and ToEnumShortString( GAMESTATE:GetCurrentCourse():GetCourseType() ) or GAMESTATE:GetCurrentSong():GetDisplaySubTitle();

if GAMESTATE:IsPlayerEnabled(PLAYER_1) then 
if not GAMESTATE:IsCourseMode() then
if GAMESTATE:GetCurrentSteps(PLAYER_1):GetAuthorCredit() ~= "" then
charter[#charter+1] = GAMESTATE:GetCurrentSteps(PLAYER_1):GetAuthorCredit() 
end
local BPMA = GAMESTATE:GetCurrentSteps(PLAYER_1):GetDisplayBpms();
BPM[1] = round(BPMA[1]);BPM[2] = round(BPMA[2]);
end
end

if GAMESTATE:IsPlayerEnabled(PLAYER_2) and not GAMESTATE:IsCourseMode() then 
if not GAMESTATE:IsCourseMode() then
if GAMESTATE:GetCurrentSteps(PLAYER_2):GetAuthorCredit() ~= "" then
charter[#charter+1] = GAMESTATE:GetCurrentSteps(PLAYER_2):GetAuthorCredit() 
end
local BPMB = GAMESTATE:GetCurrentSteps(PLAYER_2):GetDisplayBpms();
if BPM[1] == "???" then BPM[1] = BPMB[1]; else BPM[1] = round(math.min(BPMB[1],BPM[1])); end
if BPM[2] == "???" then BPM[2] = BPMB[2]; else BPM[2] = round(math.max(BPMB[2],BPM[2])); end
end
end

if BPM[1] == BPM[2] then table.remove(BPM,1) end

if GAMESTATE:IsCourseMode() then
if GAMESTATE:IsPlayerEnabled(PLAYER_1) and GAMESTATE:IsPlayerEnabled(PLAYER_2) then
Time = (GAMESTATE:GetCurrentCourse():GetTotalSeconds(GAMESTATE:GetCurrentTrail(PLAYER_1):GetStepsType())+GAMESTATE:GetCurrentCourse():GetTotalSeconds(GAMESTATE:GetCurrentTrail(PLAYER_2):GetStepsType()))/2;
elseif GAMESTATE:IsPlayerEnabled(PLAYER_1) then
Time = GAMESTATE:GetCurrentCourse():GetTotalSeconds(GAMESTATE:GetCurrentTrail(PLAYER_1):GetStepsType())
elseif GAMESTATE:IsPlayerEnabled(PLAYER_2) then
Time = GAMESTATE:GetCurrentCourse():GetTotalSeconds(GAMESTATE:GetCurrentTrail(PLAYER_2):GetStepsType())
end
else
Time = GAMESTATE:GetCurrentSong():MusicLengthSeconds();
end


local Text1 = "Sample";
local Text2 = "";
local Sped = 65;
local See1;
See1 = color("#FF8800")
local See2;
See2 = color("#22FFAA")


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

NS = GAMESTATE:GetCurrentStageIndex()+1;

if IsNetConnected() then
	Text1 = "Online Mode";
	See1 = GameColor.Stage["Stage_Event"]
	See2 = NumStageColor(NS)
	Text2 = NumtoST(NS).." Stage";
	Fasst = 0.5;
elseif TP.Battle.IsBattle then--BattleTor
	Text1 = "Battle Mode";
	See1 = ModeIconColors["Rave"]
	See2 = NumStageColor(NS)
	Text2 = NumtoST(NS).." Round";
	Fasst = 0.5;
elseif ToEnumShortString(GAMESTATE:GetCurrentStage()) == "Event" then--if EventMode
	Text1 = "Event Mode";
	See1 = GameColor.Stage["Stage_Event"]
		if GAMESTATE:IsCourseMode() then -- Course
			if GAMESTATE:GetCurrentCourse():IsNonstop()  then
				See2 = ModeIconColors["Nonstop"]
				Text2 = "NonStop!!";
			elseif GAMESTATE:GetCurrentCourse():IsOni()  then
				See2 = ModeIconColors["Oni"]
				Text2 = "SurVIVE!!!";
			elseif GAMESTATE:GetCurrentCourse():IsEndless() then
				See2 = ModeIconColors["Endless"]
				Text2 = "Endless!";
			end
		elseif playMode == 'PlayMode_Rave' or playMode == 'PlayMode_Battle' then--Rave
			See2 = ModeIconColors["Rave"]
			Text2 = "Magic Dance";
		else
			See2 = NumStageColor(NS)
			Text2 = NumtoST(NS).." Stage";
		end
	Fasst = 0.5;
else
	if GAMESTATE:IsCourseMode() then -- Course
		if GAMESTATE:GetCurrentCourse():IsNonstop() then
			See1 = ModeIconColors["Nonstop"]
			Text1 = "NonStop!!";
		elseif GAMESTATE:GetCurrentCourse():IsOni() then
			See1 = ModeIconColors["Oni"]
			Text1 = "SurVIVE!!!";
		elseif GAMESTATE:GetCurrentCourse():IsEndless() then
			See1 = ModeIconColors["Endless"]
			Text1 = "Endless!";
		end
	elseif playMode == 'PlayMode_Rave' or playMode == 'PlayMode_Battle' then--Rave
		See1 = ModeIconColors["Rave"]
		Text1 = "Magic Dance";
	else
local playMode = GAMESTATE:GetPlayMode()

local sStage = ""
sStage = GAMESTATE:GetCurrentStage()

if playMode ~= 'PlayMode_Regular' and playMode ~= 'PlayMode_Rave' and playMode ~= 'PlayMode_Battle' then
  sStage = playMode;
end;
		See1 = NumStageColor(NS)
		Text1 = ToEnumShortString(sStage).." Stage";
	end
end

t[#t+1] = LoadActor("Floor")..{OnCommand=cmd(rotationx,-90;zoom,0.75);};
t[#t+1] = LoadActor("Zight")..{OnCommand=cmd(z,-113;y,-188.5;vertalign,top;zoom,SCREEN_RIGHT/1900;zoomy,3);};
t[#t+1] = LoadActor("TABLE")..{OnCommand=cmd(zoom,0.25;rotationy,90);};
t[#t+1] = LoadActor("PAKKA")..{OnCommand=cmd(x,80;y,-188.5;zoom,3;rotationz,-30;rotationx,90);};

t[#t+1] = Def.ActorFrame{
		OnCommand=cmd(y,-188.5;z,20;zoom,0.08/0.2;rotationz,8;rotationx,-90);
	LoadActor("RNote")..{OnCommand=cmd(zoom,0.2;diffusealpha,1);};
	LoadFont("Common Normal")..{OnCommand=cmd(y,-167;zoom,0.6;settext,title;diffuse,{0,0,0,1});};
	LoadFont("Common Normal")..{OnCommand=cmd(y,-157;zoom,0.3;settext,SubTitle ~= "" and "-"..SubTitle.."-" or "";diffuse,{0,0,0,1});};
	LoadFont("Common Normal")..{OnCommand=cmd(x,-123;y,-153;horizalign,left;zoom,0.3;settext,Artist~= nil and "By "..Artist or "";diffuse,{0,0,0,1});};
	LoadFont("Common Normal")..{OnCommand=cmd(x,131;y,-153;horizalign,right;zoom,0.3;settext,#charter==0 and "Unknown Composer" or (#charter==2 and charter[1].." & "..charter[2] or charter[1]);diffuse,{0,0,0,1});};
	LoadFont("Common Normal")..{OnCommand=cmd(x,-114;y,-143;horizalign,left;zoom,0.3;settext,#BPM==2 and tostring(BPM[1]).."-"..tostring(BPM[2]) or tostring(BPM[1]);diffuse,{0,0,0,1});};
};


if GAMESTATE:IsCourseMode() then
t[#t+1] = Def.ActorFrame{
		OnCommand=cmd(x,-80;y,-188.5;z,20;zoom,0.08/0.2;rotationz,-50;rotationx,-90);
		LoadActor("Paper")..{OnCommand=cmd(zoom,0.2);};
LoadFont("Common Normal")..{OnCommand=cmd(y,-167;settext,"Content";diffuse,color("#000000"))}}
for na = 1,math.min(#CEN,21) do
t[#t+1] = Def.ActorFrame{
		OnCommand=cmd(x,-80;y,-188.5;z,20;zoom,0.08/0.2;rotationz,-50;rotationx,-90);LoadFont("Common Normal")..{
		OnCommand=cmd(x,-110;y,-160+15*na;horizalign,left;
		settextf,"No.%2d : %s (%s)",na,
		CEN[na]:IsSecret() and "?????????" or CEN[na]:GetSong():GetDisplayMainTitle(),
		CEN[na]:IsSecret() and "??:??" or SecondsToMMSS(CEN[na]:GetSong():MusicLengthSeconds());
		zoom,.5;diffuse,color("#000000"));};
		Def.Quad{
			OnCommand=cmd(y,-160+15*na;zoomy,1;zoomx,115*2;diffuse,color("#000000"));
			CurrentSongChangedMessageCommand=cmd(visible,GAMESTATE:GetCourseSongIndex()+2 > na);
		};	
		};
end
end

t[#t+1] = Def.ActorFrame{
		OnCommand=cmd(x,60;y,-188.5;z,50;zoom,0.08/0.2;rotationz,30;rotationx,-90);
		LoadActor("TimeP")..{OnCommand=cmd(zoom,0.2);};
LoadFont("Common Normal")..{OnCommand=cmd(x,-30;zoom,1.2;horizalign,left;settext,SecondsToMMSS(Time);diffuse,color("#000000FF"));};};



for i = 1,string.len(Text1) do
	t[#t+1] = Def.ActorFrame{OnCommand=cmd(x,-40;y,-188.5;z,-60;rotationz,-10;rotationx,-90);LoadFont("_special elite 108px")..{OnCommand=cmd(x,(13)*(i-((string.len(Text1)+1)/2))+math.random(-4,4);y,math.random(-4,4);rotationz,math.random(-10,10);zoom,0.2;settext,string.sub(Text1,i,i);diffuse,ColorLightTone(See1);diffusebottomedge,See1);};};
end

for i = 1,string.len(Text2) do
	t[#t+1] = Def.ActorFrame{OnCommand=cmd(x,40;y,-188.5;z,60;rotationz,-10;rotationx,-90);LoadFont("_special elite 108px")..{OnCommand=cmd(x,(13)*(i-((string.len(Text2)+1)/2))+math.random(-4,4);y,math.random(-4,4);rotationz,math.random(-10,10);zoom,0.15;settext,string.sub(Text2,i,i);diffuse,See2;diffusebottomedge,ColorDarkTone(See2));};};
end


t[#t+1] = LoadActor("Light")..{OnCommand=cmd(y,-188.5;zoom,SCREEN_RIGHT/1899.7361/1.03;zoomx,SCREEN_RIGHT/1899.7361/1.03+.0135;rotationx,-90);};
t[#t+1] = LoadActor("Zight")..{OnCommand=cmd(z,113;y,-188.5;vertalign,top;zoom,SCREEN_RIGHT/1900;zoomy,3);};
t[#t+1] = LoadActor("Yight")..{OnCommand=cmd(x,-224.7;y,-188.5;vertalign,top;zoom,SCREEN_RIGHT/1900;zoomy,6;zoomx,1/3+0.1;rotationy,-90);};
t[#t+1] = LoadActor("LAMP")..{OnCommand=cmd(x,100;y,-188.5;z,-55;zoom,0.15;rotationx,-90);};


return t;