TP.Battle.IsBattle = false;
local t = Def.ActorFrame{
	InitCommand=cmd(fov,70);
	LoadActor("_arrow")..{
		OnCommand=cmd(x,200;);
	};
	LoadFont("Common Normal")..{
		InitCommand=cmd(x,205;y,45;rotationz,-10;zoom,1.5;);
		OnCommand=cmd(diffuse,Color.Pink;playcommand,"Update");
			UpdateCommand=function(self)
			if (MonthOfYear() == 10-1 and DayOfMonth() == 8 ) or (MonthOfYear() == 8-1 and DayOfMonth() == 5) then
				self:settext("<3");
			elseif MonthOfYear() == 4-1 and DayOfMonth() == 1 then
				self:settext("Free MEME..");
			else
				self:settext("Music Memories...");
			end
			self:pulse():effectclock("beat"):effectmagnitude(1,1.2,0):effectperiod(120/124);
			end;
	};
	LoadActor("_text")..{
		Name="TextGlow";
		OnCommand=cmd(diffuse,Color.White;bob;effectclock,"beat";effectmagnitude,0,3,0;effectperiod,120/124*2;effectoffset,0.25);
	};
	LoadActor("_title")..{
		Name="TextGlow2";
		OnCommand=cmd(diffuse,{0.8,0.8,0.8,1};bob;effectclock,"beat";effectmagnitude,0,-3,0;effectperiod,120/124*2;effectoffset,0.25);
	};
};

return t;

