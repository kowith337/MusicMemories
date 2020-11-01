local t = Def.ActorFrame{

LoadActor("Ready")..{
	InitCommand=cmd(draworder,500;diffusealpha,0);
	OnCommand=cmd(sleep,1;linear,0.5;diffusealpha,1);	
	};
LoadActor("321Go")..{
	InitCommand=cmd(draworder,500;diffusealpha,0);
	OnCommand=cmd(sleep,1;linear,0.5;diffusealpha,1);	
	};

};

return t;