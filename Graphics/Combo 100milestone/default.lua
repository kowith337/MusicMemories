local ShowFlashyCombo = ThemePrefs.Get("FlashyCombo")
return Def.ActorFrame {
	LoadActor("explosion") .. {
		InitCommand=cmd(diffusealpha,0;blend,'BlendMode_Add';hide_if,not ShowFlashyCombo);
		MilestoneCommand=cmd(rotationz,0;zoom,2;diffusealpha,0.5;linear,0.5;rotationz,90;zoom,1.75;diffusealpha,0);
	};
	LoadActor("explosion") .. {
		InitCommand=cmd(diffusealpha,0;blend,'BlendMode_Add';hide_if,not ShowFlashyCombo);
		MilestoneCommand=cmd(rotationz,0;zoom,2;diffusealpha,0.5;linear,0.5;rotationz,-90;zoom,2.5;diffusealpha,0);
	};
	LoadActor("arrowsplode") .. {
		InitCommand=cmd(diffusealpha,0;blend,'BlendMode_Add';hide_if,not ShowFlashyCombo);
		MilestoneCommand=cmd(rotationz,10;zoom,.25;diffusealpha,1;decelerate,0.6;rotationz,0;zoom,1.3;diffusealpha,0);
	};
	LoadActor("minisplode") .. {
		InitCommand=cmd(diffusealpha,0;blend,'BlendMode_Add';hide_if,not ShowFlashyCombo);
		MilestoneCommand=cmd(rotationz,10;zoom,.25;diffusealpha,1;linear,0.4;rotationz,0;zoom,1.8;diffusealpha,0);
	};
};