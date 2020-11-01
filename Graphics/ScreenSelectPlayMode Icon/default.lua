local gc = Var("GameCommand");
local t = Def.ActorFrame {};
t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(x,60);
	GainFocusCommand=cmd(stoptweening;wag;effectmagnitude,0,0,5;decelerate,0.05;zoom,0.4);
	LoseFocusCommand=cmd(stoptweening;stopeffect;decelerate,0.1;zoom,0.4*0.6);
	MCBT(0,0,ColorLightTone(ModeIconColors[gc:GetName()]),ColorDarkTone(ModeIconColors[gc:GetName()]),ColorMidTone(ModeIconColors[gc:GetName()]),color("#000000"),color("#FFFFFF"),gc:GetText(),"")																		
	--[[
	LoadActor(THEME:GetPathG("_SelectIcon",gc:GetName() )) .. {
		DisabledCommand=cmd(diffuse,color("0.5,0.5,0.5,1"));
		EnabledCommand=cmd(diffuse,color("1,1,1,1"));
	};
	--]]
};
return t