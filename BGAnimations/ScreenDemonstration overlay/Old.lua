local t = Def.ActorFrame{--Mc is awesome!--Under lay life
	LoadActor("Easter Egg.lua")..{
		OnCommand=cmd(y,SCREEN_BOTTOM-40);
	};
	LoadActor("Stage!.lua")..{
		OnCommand=cmd();
	};
	LoadActor("Hardddddd.lua")..{
		OnCommand=cmd();
	};
};
return t;