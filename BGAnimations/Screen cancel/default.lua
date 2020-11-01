local speed = 5;
return Def.ActorFrame {
	Def.Quad{
		InitCommand=cmd(diffuse,{0,0,0,0.5};FullScreen;cropright,1);
		OnCommand=cmd(decelerate,2.5/60*speed;cropright,0);
	};
	Def.Quad{
		InitCommand=cmd(diffuse,{0,0,0,1};FullScreen;cropright,1);
		OnCommand=cmd(sleep,2.5/60*speed;decelerate,2.5/60*speed;cropright,0);
	};
};