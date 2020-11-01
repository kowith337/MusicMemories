local Dan1Press = {0,0,0,0,0,0};
--Thatmean{L,D,U R,LU,RU}
local InputDanP1 = function( event )

	if not event then return end

	if event.type == "InputEventType_FirstPress" then
		
		if event.button == "Left" and event.PlayerNumber == PLAYER_1 then
			Dan1Press[1] = 1
		end
		if event.button == "UpLeft" and event.PlayerNumber == PLAYER_1 then
			Dan1Press[5] = 1
		end
		if event.button == "Down" and event.PlayerNumber == PLAYER_1 then
			Dan1Press[2] = 1
		end
		if event.button == "Up" and event.PlayerNumber == PLAYER_1 then
			Dan1Press[3] = 1
		end
		if event.button == "Right" and event.PlayerNumber == PLAYER_1 then
			Dan1Press[4] = 1
		end
		if event.button == "UpRight" and event.PlayerNumber == PLAYER_1 then
			Dan1Press[6] = 1
		end
		
	end
	
	if event.type == "InputEventType_Release" then
		
		if event.button == "UpLeft" and event.PlayerNumber == PLAYER_1 then
			Dan1Press[5] = 0
		end
		if event.button == "UpRight" and event.PlayerNumber == PLAYER_1 then
			Dan1Press[6] = 0
		end
		if event.button == "Left" and event.PlayerNumber == PLAYER_1 then
			Dan1Press[1] = 0
		end
		if event.button == "Down" and event.PlayerNumber == PLAYER_1 then
			Dan1Press[2] = 0
		end
		if event.button == "Up" and event.PlayerNumber == PLAYER_1 then
			Dan1Press[3] = 0
		end
		if event.button == "Right" and event.PlayerNumber == PLAYER_1 then
			Dan1Press[4] = 0
		end
		
	end

end
local Dan1Run = {false,false,false,false,false,false}
local Sped = 27;
local Kayay = 3;
local Rew = {0.04,0.08} ;
local Dan1Cl = BoostColor((Color[TP[ToEnumShortString(PLAYER_1)].ActiveModifiers.ComboColorstring] or Color.White),1.4);
local Dan1ClF = BoostColor((Color[TP[ToEnumShortString(PLAYER_1)].ActiveModifiers.ComboColorstring] or Color.White),0.2);
local Dan1TF = {true,false}--{D,(LU,RU)}
local t = Def.ActorFrame{};
local CodePor;

if GAMESTATE:IsCourseMode() then
CodePor = GAMESTATE:GetCurrentTrail(PLAYER_1);
else
CodePor = GAMESTATE:GetCurrentSteps(PLAYER_1);
end

if CodePor:GetStepsType() == "StepsType_Dance_Threepanel" then
Dan1TF = {false,false};
elseif CodePor:GetStepsType() == "StepsType_Dance_Solo" then
Dan1TF = {true,true};
else
Dan1TF = {true,false}
end

t[#t+1] = Def.ActorFrame{
OnCommand=function(self)
SCREENMAN:GetTopScreen():AddInputCallback(InputDanP1)
self:x(42)
self:y(400)
end;
Def.Quad{--control panel
OnCommand=cmd(zoom,0;playcommand,"Nep");
NepCommand=function(self)
	if Dan1Press[1] == 1 then MESSAGEMAN:Broadcast("L1") else MESSAGEMAN:Broadcast("L1re") end
	if Dan1Press[2] == 1 then MESSAGEMAN:Broadcast("D1") else MESSAGEMAN:Broadcast("D1re") end
	if Dan1Press[3] == 1 then MESSAGEMAN:Broadcast("U1") else MESSAGEMAN:Broadcast("U1re") end
	if Dan1Press[4] == 1 then MESSAGEMAN:Broadcast("R1") else MESSAGEMAN:Broadcast("R1re") end
	if Dan1Press[5] == 1 then MESSAGEMAN:Broadcast("LU1") else MESSAGEMAN:Broadcast("LU1re") end
	if Dan1Press[6] == 1 then MESSAGEMAN:Broadcast("RU1") else MESSAGEMAN:Broadcast("RU1re") end
self:sleep(1/30)
self:queuecommand("Nep")
end;
};
LoadActor("Arrow")..{--LEFT
InitCommand=cmd(rotationz,-90;SetTextureFiltering,false;x,-Sped;zoom,Kayay);
L1MessageCommand=cmd(stoptweening;decelerate,Rew[1];diffuse,Dan1Cl;x,-Sped*1.3); 
L1reMessageCommand=cmd(stoptweening;bounceend,Rew[2];diffuse,Dan1ClF;x,-Sped); 
};
LoadActor("Arrow")..{--DOWN
InitCommand=cmd(rotationz,180;SetTextureFiltering,false;y,Sped;zoom,Kayay);
D1MessageCommand=cmd(stoptweening;decelerate,Rew[1];diffuse,Dan1Cl;y,Sped*1.3); 
D1reMessageCommand=cmd(stoptweening;bounceend,Rew[2];diffuse,Dan1ClF;y,Sped); 
};
LoadActor("Arrow")..{--Up
Condition=(Dan1TF[1]);
InitCommand=cmd(y,-Sped;SetTextureFiltering,false;zoom,Kayay);
U1MessageCommand=cmd(stoptweening;decelerate,Rew[1];diffuse,Dan1Cl;y,-Sped*1.3); 
U1reMessageCommand=cmd(stoptweening;bounceend,Rew[2];diffuse,Dan1ClF;y,-Sped);  
};
LoadActor("Arrow")..{--RIGHT
InitCommand=cmd(rotationz,90;SetTextureFiltering,false;x,Sped;zoom,Kayay);
R1MessageCommand=cmd(stoptweening;decelerate,Rew[1];diffuse,Dan1Cl;x,Sped*1.3); 
R1reMessageCommand=cmd(stoptweening;bounceend,Rew[2];diffuse,Dan1ClF;x,Sped); 
};
LoadActor("Arrow")..{--UL
Condition=(Dan1TF[2]);
InitCommand=cmd(rotationz,-45;SetTextureFiltering,false;x,-Sped;y,-Sped;zoom,Kayay);
UL1MessageCommand=cmd(stoptweening;decelerate,Rew[1];diffuse,Dan1Cl;x,-Sped*1.3;y,-Sped*1.3); 
UL1reMessageCommand=cmd(stoptweening;bounceend,Rew[2];diffuse,Dan1ClF;x,-Sped;y,-Sped); 
};
LoadActor("Arrow")..{--UR
Condition=(Dan1TF[2]);
InitCommand=cmd(rotationz,45;SetTextureFiltering,false;x,Sped;y,-Sped;zoom,Kayay);
UR1MessageCommand=cmd(stoptweening;decelerate,Rew[1];diffuse,Dan1Cl;x,Sped*1.3;y,-Sped*1.3); 
UR1reMessageCommand=cmd(stoptweening;bounceend,Rew[2];diffuse,Dan1ClF;x,Sped;y,-Sped); 
};
};

return t;