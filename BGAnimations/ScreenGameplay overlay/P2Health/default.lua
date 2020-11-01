local NumF="_computer pixel-7 30px";
local NOWB = 0;

local PN=PLAYER_2;
local PX=SCREEN_CENTER_X*1.5-246.5*0.5+2.5;
local clmain = GameColor.PlayerDarkColors.PLAYER_2 or {0,0,0,1};
local clsub = GameColor.PlayerColors.PLAYER_2 or {1,1,1,1};



local t = Def.ActorFrame{

	Def.Quad{
		InitCommand=function(self)
			if TP.Battle.IsBattle and TP.Battle.Mode == "Dr" and TP.Battle.Hidden then
				self:visible(true);
			else
				self:visible(false);
			end
		end;
		OnCommand=cmd(zoomy,23.75*0.64;zoomx,246.5;y,SCREEN_CENTER_Y-210.25+22;horizalign,left;x,PX
			effectclock,"beat";diffuseramp;effectcolor1,clmain;effectcolor2,clsub;effectperiod,0.5;effecttiming,0.25,0.50,0,0.25;effectoffset,-0.25);
		GETOUTOFGAMESMMessageCommand=cmd(stoptweening;sleep,0.7;accelerate,0.5;zoomy,0);
	};
};
return t;