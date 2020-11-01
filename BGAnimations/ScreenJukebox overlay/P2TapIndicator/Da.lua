local Dan2Press = {0,0,0,0,0,0};
--Thatmean{L,D,U R,LU,RU}
local InputDanP2 = function( event )

	if not event then return end

	if event.type == "InputEventType_FirstPress" then
		
		if event.button == "Left" and event.PlayerNumber == PLAYER_2 then
			Dan2Press[1] = 1
		end
		if event.button == "UpLeft" and event.PlayerNumber == PLAYER_2 then
			Dan2Press[5] = 1
		end
		if event.button == "Down" and event.PlayerNumber == PLAYER_2 then
			Dan2Press[2] = 1
		end
		if event.button == "Up" and event.PlayerNumber == PLAYER_2 then
			Dan2Press[3] = 1
		end
		if event.button == "Right" and event.PlayerNumber == PLAYER_2 then
			Dan2Press[4] = 1
		end
		if event.button == "UpRight" and event.PlayerNumber == PLAYER_2 then
			Dan2Press[6] = 1
		end
		
	end
	
	if event.type == "InputEventType_Release" then
		
		if event.button == "UpLeft" and event.PlayerNumber == PLAYER_2 then
			Dan2Press[5] = 0
		end
		if event.button == "UpRight" and event.PlayerNumber == PLAYER_2 then
			Dan2Press[6] = 0
		end
		if event.button == "Left" and event.PlayerNumber == PLAYER_2 then
			Dan2Press[1] = 0
		end
		if event.button == "Down" and event.PlayerNumber == PLAYER_2 then
			Dan2Press[2] = 0
		end
		if event.button == "Up" and event.PlayerNumber == PLAYER_2 then
			Dan2Press[3] = 0
		end
		if event.button == "Right" and event.PlayerNumber == PLAYER_2 then
			Dan2Press[4] = 0
		end
		
	end

end
local Dan1Run = {false,false,false,false,false,false}
local Sped = 27;
local Kayay = 0.55;
local Rew = {0.07,0.15} ;
local Dan2Cl = BoostColor((Color[TP[ToEnumShortString(PLAYER_1)].ActiveModifiers.ComboColorstring] or Color.White),1.4);
local Dan2ClF = BoostColor((Color[TP[ToEnumShortString(PLAYER_1)].ActiveModifiers.ComboColorstring] or Color.White),0.2);
local Dan2TF = {true,false}--{D,(LU,RU)}
local t = Def.ActorFrame{};
local CodePor;

if GAMESTATE:IsCourseMode() then
CodePor = GAMESTATE:GetCurrentTrail(PLAYER_2);
else
CodePor = GAMESTATE:GetCurrentSteps(PLAYER_2);
end

if CodePor:GetStepsType() == "StepsType_Dance_Threepanel" then
Dan2TF = {false,false};
elseif CodePor:GetStepsType() == "StepsType_Dance_Solo" then
Dan2TF = {true,true};
else
Dan2TF = {true,false}
end

t[#t+1] = Def.ActorFrame{
OnCommand=function(self)
SCREENMAN:GetTopScreen():AddInputCallback(InputDanP2)
self:x(SCREEN_CENTER_X+(SCREEN_CENTER_X-(42)))
self:y(400)
end;
Def.Quad{--control panel
OnCommand=cmd(zoom,0;playcommand,"Nep");
NepCommand=function(self)
	if Dan2Press[1] == 1 then MESSAGEMAN:Broadcast("L2") else MESSAGEMAN:Broadcast("L2re") end
	if Dan2Press[2] == 1 then MESSAGEMAN:Broadcast("D2") else MESSAGEMAN:Broadcast("D2re") end
	if Dan2Press[3] == 1 then MESSAGEMAN:Broadcast("U2") else MESSAGEMAN:Broadcast("U2re") end
	if Dan2Press[4] == 1 then MESSAGEMAN:Broadcast("R2") else MESSAGEMAN:Broadcast("R2re") end
	if Dan2Press[5] == 1 then MESSAGEMAN:Broadcast("LU2") else MESSAGEMAN:Broadcast("LU2re") end
	if Dan2Press[6] == 1 then MESSAGEMAN:Broadcast("RU2") else MESSAGEMAN:Broadcast("RU2re") end
self:sleep(1/30)
self:queuecommand("Nep")
end;
};
LoadActor("inputoverlay-key")..{--LEFT
InitCommand=cmd(x,-Sped;zoom,Kayay);
L2MessageCommand=cmd(stoptweening;decelerate,Rew[1];diffuse,Dan2Cl;zoom,Kayay*0.75); 
L2reMessageCommand=cmd(stoptweening;bounceend,Rew[2];diffuse,Dan2ClF;zoom,Kayay); 
};
LoadActor("inputoverlay-key")..{--DOWN
InitCommand=cmd(y,Sped;zoom,Kayay);
D2MessageCommand=cmd(stoptweening;decelerate,Rew[1];diffuse,Dan2Cl;zoom,Kayay*0.75); 
D2reMessageCommand=cmd(stoptweening;bounceend,Rew[2];diffuse,Dan2ClF;zoom,Kayay); 
};
LoadActor("inputoverlay-key")..{--Up
Condition=(Dan2TF[1]);
InitCommand=cmd(y,-Sped;zoom,Kayay);
U2MessageCommand=cmd(stoptweening;decelerate,Rew[1];diffuse,Dan2Cl;zoom,Kayay*0.75); 
U2reMessageCommand=cmd(stoptweening;bounceend,Rew[2];diffuse,Dan2ClF;zoom,Kayay); 
};
LoadActor("inputoverlay-key")..{--RIGHT
InitCommand=cmd(x,Sped;zoom,Kayay);
R2MessageCommand=cmd(stoptweening;decelerate,Rew[1];diffuse,Dan2Cl;zoom,Kayay*0.75); 
R2reMessageCommand=cmd(stoptweening;bounceend,Rew[2];diffuse,Dan2ClF;zoom,Kayay); 
};
LoadActor("inputoverlay-key")..{--UL
Condition=(Dan2TF[2]);
InitCommand=cmd(x,-Sped;y,-Sped;zoom,Kayay);
LU2MessageCommand=cmd(stoptweening;decelerate,Rew[1];diffuse,Dan2Cl;zoom,Kayay*0.75); 
LU2reMessageCommand=cmd(stoptweening;bounceend,Rew[2];diffuse,Dan2ClF;zoom,Kayay); 
};
LoadActor("inputoverlay-key")..{--UR
Condition=(Dan2TF[2]);
InitCommand=cmd(x,Sped;y,-Sped;zoom,Kayay);
RU2MessageCommand=cmd(stoptweening;decelerate,Rew[1];diffuse,Dan2Cl;zoom,Kayay*0.75); 
RU2reMessageCommand=cmd(stoptweening;bounceend,Rew[2];diffuse,Dan2ClF;zoom,Kayay); 
};
};

return t;