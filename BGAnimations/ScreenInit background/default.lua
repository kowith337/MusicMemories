local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame {
  InitCommand=cmd(Center);
	Def.Quad {
		InitCommand=cmd(diffuse,{0,0,0,1};scaletoclipped,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(linear,0.5;diffuse,{1,1,1,1};sleep,13.15);
	};
};
t[#t+1] = Def.ActorFrame {
  InitCommand=cmd(Center);
	Def.ActorFrame {
		LoadActor("_arrow") .. {
			InitCommand=cmd(diffusealpha,0;y,-50);
			OnCommand=cmd(x,-200;sleep,0.75;decelerate,0.5;diffusealpha,1;addx,150;linear,2;addx,150;accelerate,0.5;diffusealpha,0;addx,150);
		};
		LoadFont("Common normal") .. {
			Text = ProductID();
			InitCommand=cmd(diffuse,{0,0,0,0};y,75;zoom,2.5);
			OnCommand=cmd(x,200;sleep,0.75;decelerate,0.5;diffusealpha,1;addx,-150;linear,2;addx,-150;accelerate,0.5;diffusealpha,0;addx,-150);
		};
		LoadActor("ssc") .. {
			InitCommand=cmd(diffusealpha,0;x,0;y,-85);
			OnCommand=cmd(x,-200;sleep,0.75+3.2;decelerate,0.5;diffusealpha,1;addx,150;linear,2;addx,150;accelerate,0.5;diffusealpha,0;addx,150);
		};
		LoadFont("Common normal") .. {
			Text = "Nepumi";
			InitCommand=cmd(diffuse,{0,0,0,0};y,0;zoom,2.5);
			OnCommand=cmd(x,200;sleep,0.75+3.2;decelerate,0.5;diffusealpha,1;addx,-150;linear,2;addx,-150;accelerate,0.5;diffusealpha,0;addx,-150);
		};
		LoadFont("Common normal") .. {
			Text = "TEAMRIZU";
			InitCommand=cmd(diffuse,{0,0,0,0};x,0;y,85;zoom,2.5);
			OnCommand=cmd(x,-200;sleep,0.75+3.2;decelerate,0.5;diffusealpha,1;addx,150;linear,2;addx,150;accelerate,0.5;diffusealpha,0;addx,150);
		};
		LoadFont("Common Normal") .. {
			Text=THEME:GetThemeDisplayName();
			InitCommand=cmd(diffuse,{0,0,0,0};y,100;zoom,1.5);
			OnCommand=cmd(y,100;sleep,0.75+3.2*2;decelerate,0.5;diffusealpha,1;addy,-100;linear,5;addy,-50;accelerate,0.5;diffusealpha,0;addy,-100);
		};
	};

};

return t
