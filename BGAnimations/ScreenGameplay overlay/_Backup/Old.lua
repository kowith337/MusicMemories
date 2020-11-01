local t = Def.ActorFrame{};
	--Mc is awesome!--Under lay life
	t[#t+1] =
	LoadActor("Stage!.lua")..{
		OnCommand=cmd();
	};
if MonthOfYear() == 10-1 and DayOfMonth() == 31 then
	t[#t+1] = LoadActor("Easter Horror.lua")..{
		OnCommand=cmd(y,SCREEN_BOTTOM-40);
	};
else
	t[#t+1] = LoadActor("Easter Egg.lua")..{
		OnCommand=cmd(y,SCREEN_BOTTOM-40);
	};
end
return t;