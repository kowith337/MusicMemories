local fSleepTime = THEME:GetMetric( Var "LoadingScreen","ScreenOutDelay") or 0.2;

return Def.ActorFrame {
	Def.Quad{
		InitCommand=cmd(diffuse,{0.5,0.5,0.5,0.5};FullScreen;cropleft,1);
		OnCommand=cmd(decelerate,fSleepTime/2;cropleft,0);
	};
	Def.Quad{
		InitCommand=cmd(diffuse,{0.5,0.5,0.5,1};FullScreen;cropleft,1);
		OnCommand=cmd(sleep,fSleepTime/2;decelerate,fSleepTime/2;cropleft,0);
	};
};