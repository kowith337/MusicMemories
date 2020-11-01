local t = Def.ActorFrame{};
local Title;
local Sub;
local Time;
local playMode = GAMESTATE:GetPlayMode()
if GAMESTATE:IsCourseMode() then
Title = GAMESTATE:GetCurrentCourse():GetDisplayFullTitle();
else
Title = GAMESTATE:GetCurrentSong():GetDisplayMainTitle();
end

Sub = GAMESTATE:IsCourseMode() and ToEnumShortString( GAMESTATE:GetCurrentCourse():GetCourseType() ) or GAMESTATE:GetCurrentSong():GetDisplaySubTitle();

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

See = color("#FF8800")
local SE;
SE = "";
if Title == "" then
SE = SE.."No Title\n"
else
SE = SE..Title.."\n"
end
if Sub ~= "" then
SE = SE..Sub.."\n"
end
if Time then
SE = SE..SecondsToMSSMsMs(Time)
else
SE = SE.."??:??.??"
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

local Picdir = THEME:GetPathG("","_blank");

if IsNetConnected() then
	Picdir = THEME:GetPathG("ScreenStageInformation stage","online")
	Text1 = THEME:GetString("sStageInfo","Online")
	See1 = GameColor.Stage["Stage_Event"]
	See2 = NumStageColor(NS)
	Text2 = string.format(THEME:GetString("sStageInfo","ssStage"),NumtoST(NS));
	Fasst = 0.5;
elseif TP.Battle.IsBattle then--BattleTor
	Picdir = THEME:GetPathG("ScreenStageInformation stage","battle")
	Text1 = THEME:GetString("sStageInfo","Battle");
	See1 = ModeIconColors["Rave"]
	See2 = NumStageColor(NS)
	Text2 = string.format(THEME:GetString("sStageInfo","ssRound"),NumtoST(NS));
	Fasst = 0.5;
elseif ToEnumShortString(GAMESTATE:GetCurrentStage()) == "Event" then--if EventMode
	Picdir = THEME:GetPathG("ScreenStageInformation stage","event")
	Text1 = THEME:GetString("sStageInfo","Event");
	See1 = GameColor.Stage["Stage_Event"]
		if GAMESTATE:IsCourseMode() then -- Course
			if GAMESTATE:GetCurrentCourse():IsNonstop()  then
				See2 = ModeIconColors["Nonstop"]
				Text2 = THEME:GetString("sStageInfo","NonStop");
			elseif GAMESTATE:GetCurrentCourse():IsOni()  then
				See2 = ModeIconColors["Oni"]
				Text2 = THEME:GetString("sStageInfo","SurVIVE");
			elseif GAMESTATE:GetCurrentCourse():IsEndless() then
				See2 = ModeIconColors["Endless"]
				Text2 = THEME:GetString("sStageInfo","Endless");
			end
		elseif playMode == 'PlayMode_Rave' or playMode == 'PlayMode_Battle' then--Rave
			See2 = ModeIconColors["Rave"]
			Text2 = THEME:GetString("sStageInfo","Magic");
		else
			See2 = NumStageColor(NS)
			Text2 = string.format(THEME:GetString("sStageInfo","ssStage"),NumtoST(NS));
		end
	Fasst = 0.5;
else
	if GAMESTATE:IsCourseMode() then -- Course
		if GAMESTATE:GetCurrentCourse():IsNonstop() then
			See1 = ModeIconColors["Nonstop"]
			Text1 = THEME:GetString("sStageInfo","NonStop");
		elseif GAMESTATE:GetCurrentCourse():IsOni() then
			See1 = ModeIconColors["Oni"]
			Text1 = THEME:GetString("sStageInfo","SurVIVE");
		elseif GAMESTATE:GetCurrentCourse():IsEndless() then
			See1 = ModeIconColors["Endless"]
			Text1 = THEME:GetString("sStageInfo","Endless");
		end
	elseif playMode == 'PlayMode_Rave' or playMode == 'PlayMode_Battle' then--Rave
		See1 = ModeIconColors["Rave"]
		Text1 = THEME:GetString("sStageInfo","Magic");
	else

local sStage = ""
sStage = GAMESTATE:GetCurrentStage()

		if playMode ~= 'PlayMode_Regular' and playMode ~= 'PlayMode_Rave' and playMode ~= 'PlayMode_Battle' then
		  sStage = playMode;
		end
		See1 = NumStageColor(NS)
		Text1 = THEME:GetString("sStageInfo",sStage)
	end
end


t[#t+1] =Def.ActorFrame{
	InitCommand=cmd(diffusealpha,0);
	OnCommand=cmd(sleep,1.773;decelerate,2;diffusealpha,1;sleep,1.259;linear,0.5;diffusealpha,0);
	Def.Quad{
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y*1.5;zoomx,SCREEN_RIGHT;zoomy,SCREEN_CENTER_Y,0.7;diffuse,{0,0,0,0};fadetop,0.2);
		OnCommand=cmd(diffusealpha,0.8);
	};
	LoadActor(Picdir)..{
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y*1.15-50;diffusealpha,0;zoom,0.5);
		OnCommand=cmd(decelerate,5;y,SCREEN_CENTER_Y*1.15;diffusealpha,1);
	};
	LoadFont("Common Normal")..{
		Text = "-"..Text1.."-";
		InitCommand=cmd(x,SCREEN_CENTER_X-50;y,SCREEN_CENTER_Y*1.3;diffuse,See1;zoom,0.6);
		OnCommand=cmd(decelerate,5;x,SCREEN_CENTER_X;);
	};
	LoadFont("Common Normal")..{
		Text = Text2;
		InitCommand=cmd(x,SCREEN_CENTER_X+50;y,SCREEN_CENTER_Y*1.45;diffuse,See2;zoom,1.2);
		OnCommand=cmd(decelerate,5;x,SCREEN_CENTER_X;);
	};

	LoadFont("Common Normal") .. {
	InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y*1.65;settext,SE;zoom,1;);
	OnCommand=function(self)
	if Time then
		if Time < 3*60 then
		self:stopeffect():diffuse({1,1,1,1})
		elseif Time < 5*60 then
		self:stopeffect():diffuse({1,1,1,1}):diffusebottomedge(Color("Red"))
		else
		self:stopeffect():rainbow():diffusealpha(1);
		end
	else 
		self:stopeffect():rainbow():diffusealpha(1);
	end
	self:zoom(1.1):sleep(1.773):decelerate(1):zoom(1)
	end;
	};
	LoadFont("Common Normal")..{
		Condition = GAMESTATE:IsHumanPlayer(PLAYER_1) and (not GAMESTATE:IsCourseMode()) ;
		Text = "";
		InitCommand=cmd(horizalign,left;x,30;y,SCREEN_CENTER_Y*1.7;diffuse,Color.Orange);
		OnCommand=cmd(settext,"Step by\n"..GAMESTATE:GetCurrentSteps(PLAYER_1):GetAuthorCredit() or "???");
	};
	LoadFont("Common Normal")..{
		Condition = GAMESTATE:IsHumanPlayer(PLAYER_2) and (not GAMESTATE:IsCourseMode()) ;
		Text = "";
		InitCommand=cmd(horizalign,right;x,SCREEN_RIGHT-30;y,SCREEN_CENTER_Y*1.7;diffuse,Color.Orange);
		OnCommand=cmd(settext,"Step by\n"..GAMESTATE:GetCurrentSteps(PLAYER_2):GetAuthorCredit() or "???");
	};
};


return t;