local t = Def.ActorFrame {};


-- Fade
t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(Center);	
	Def.Quad {
		InitCommand=cmd(scaletoclipped,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(diffuse,Color.Black;diffusealpha,0.8);
	};
};
-- Emblem
t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y);
	OnCommand=cmd(diffusealpha,0.5);
	LoadActor("_warning bg") .. {
	};
};

-- Text
t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-120);
	OnCommand=cmd(diffusealpha,0;linear,0.2;diffusealpha,1);
	LoadFont("Common Large") .. {
		Text=Screen.String("Caution");
		InitCommand=cmd(zoom,48/108);
		OnCommand=cmd(skewx,-0.1;diffuse,color("#E6BF7C");diffusebottomedge,color("#FFB682");strokecolor,color("#594420"););
	};
	LoadFont("Common Normal") .. {
		Text=Screen.String("CautionText");
		InitCommand=cmd(y,128);
		OnCommand=cmd(strokecolor,color("0,0,0,0.5");shadowlength,1;wrapwidthpixels,SCREEN_WIDTH/0.5);
	};
};
--
return t
