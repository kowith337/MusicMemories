return Def.ActorFrame {	
	LoadActor(THEME:GetPathG("MusicWheelItem","Song NormalPart")) .. {
		InitCommand=cmd(glow,color('1,1,1,0.25'));
	};
	LoadActor(THEME:GetPathG("MusicWheelItem","Song NormalPart")) .. {
		InitCommand=cmd(blend,Blend.Add;rainbow;diffusealpha,0.325);
	};
};