local gc = Var("GameCommand");

return Def.ActorFrame {
	Def.Quad{
		InitCommand=cmd(zoomto,256,26;fadeleft,0.55;faderight,0.55);
		OnCommand=cmd(diffuseshift;effectcolor1,color("0.7,0.7,0,0.5");effectcolor2,color("0.7,0.7,0,0.3"));
		GainFocusCommand=cmd(stoptweening;decelerate,0.1;diffusealpha,1);
		LoseFocusCommand=cmd(stoptweening;accelerate,0.1;diffusealpha,0);
	};
	LoadFont("Common Normal") .. {
		Text=THEME:GetString("ScreenTitleMenu",gc:GetText());
		OnCommand=cmd(shadowlength,1);
		GainFocusCommand=cmd(stoptweening;linear,0.1;zoom,1;diffuse,color("0.75,1,0.75,1"));
		LoseFocusCommand=cmd(stoptweening;linear,0.1;zoom,0.75;diffuse,color("0.5,0.5,0.5,1"));
	};
};