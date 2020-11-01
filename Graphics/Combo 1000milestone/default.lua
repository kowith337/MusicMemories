return Def.ActorFrame {
	LoadActor("arrowsplode") .. {
		InitCommand=cmd(diffusealpha,0;blend,'BlendMode_Add';hide_if,not ShowFlashyCombo);
		MilestoneCommand=cmd(rotationz,-10;zoom,.25;diffusealpha,1;decelerate,0.4;rotationz,0;zoom,1.3;diffusealpha,0);
	};
	LoadActor("minisplode") .. {
		InitCommand=cmd(diffusealpha,0;blend,'BlendMode_Add';hide_if,not ShowFlashyCombo);
		MilestoneCommand=cmd(rotationz,-10;zoom,.25;diffusealpha,1;linear,0.3;rotationz,0;zoom,1.8;diffusealpha,0);
	};
	LoadActor(THEME:GetPathG("Combo","100Milestone"));
};
