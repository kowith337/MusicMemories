local ratemod = string.match(GAMESTATE:GetSongOptionsString(), "%d.%d");
if ratemod then
	ratemod = tonumber(ratemod);
else
	ratemod = 1.0
end

local Bpm1 = 0;
local Bpm2 = 0;
local Bpm = 0;


local t = Def.ActorFrame{
LoadFont("_differentiator 60px")..{
OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-210.25-8;diffuse,color("#FFFFFF");zoom,0.3;playcommand,'loop');
		loopCommand=function(self)
		if GAMESTATE:IsPlayerEnabled(PLAYER_1) then
		Bpm1 = GAMESTATE:GetPlayerState(PLAYER_1):GetSongPosition():GetCurBPS() * 60;
		end
		if GAMESTATE:IsPlayerEnabled(PLAYER_2) then
		Bpm2 = GAMESTATE:GetPlayerState(PLAYER_2):GetSongPosition():GetCurBPS() * 60;
		end
		
		if GAMESTATE:IsPlayerEnabled(PLAYER_1) and GAMESTATE:IsPlayerEnabled(PLAYER_2) then
		Bpm=(Bpm1+Bpm2)/2;
		elseif GAMESTATE:IsPlayerEnabled(PLAYER_2) then
		Bpm=Bpm2
		elseif GAMESTATE:IsPlayerEnabled(PLAYER_1) then
		Bpm=Bpm1
		end

		if Bpm > 600 then
		self:rainbowscroll(true)
		else
		self:rainbowscroll(false)
		end
		
		if ratemod == 1 then
		self:settext(round(Bpm))
		end
		self:diffuse(BPMColor(Bpm))
		
		
		self:sleep(1/30)
		self:queuecommand('loop')
		end;

};
LoadFont("_differentiator 60px")..{
Condition=(ratemod == 1);
OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-210.25-8;diffuse,color("#FFFFFF");zoom,0.3;playcommand,'loop');
		loopCommand=function(self)
		self:diffusealpha(math.abs(math.sin(GAMESTATE:GetSongBeat()*3.14))*0.5)
		self:settext(round(Bpm))
		self:sleep(1/60)
		self:queuecommand('loop')
		end;

};




LoadFont("_differentiator 60px")..{
Condition=(ratemod ~= 1);
OnCommand=cmd(x,SCREEN_CENTER_X-27.5;y,SCREEN_CENTER_Y-210.25;diffuse,color("#FFFFFF");zoom,0.2;playcommand,'loop');
		loopCommand=function(self)
		self:settextf("%d x %.1f =",round(Bpm),ratemod)
		self:diffuse(BPMColor(Bpm))
		self:sleep(1/30)
		self:queuecommand('loop')
		end;
};
LoadFont("_differentiator 60px")..{
Condition=(ratemod ~= 1);
OnCommand=cmd(x,SCREEN_CENTER_X+50;y,SCREEN_CENTER_Y-210.25-6;diffuse,color("#FFFFFF");zoom,0.27;playcommand,'loop');
		loopCommand=function(self)

		if Bpm*ratemod > 600 then
		self:rainbowscroll(true)
		else
		self:rainbowscroll(false)
		end
		if round(Bpm)*ratemod >= 1000 then
		self:settextf("%.d",round(Bpm)*ratemod)
		else
		self:settextf("%.1f",round(Bpm)*ratemod)
		end
		self:diffuse(BPMColor(Bpm*ratemod))
		self:sleep(1/30)
		self:queuecommand('loop')
		end;
};
LoadFont("_differentiator 60px")..{
Condition=(ratemod ~= 1);
OnCommand=cmd(x,SCREEN_CENTER_X-27.5;y,SCREEN_CENTER_Y-210.25;diffuse,color("#FFFFFF");zoom,0.2;playcommand,'loop');
		loopCommand=function(self)
		self:settextf("%d x %.1f =",round(Bpm),ratemod)
		self:diffusealpha(math.abs(math.sin(GAMESTATE:GetSongBeat()*3.14))*0.5)
		self:sleep(1/60)
		self:queuecommand('loop')
		end;
};
LoadFont("_differentiator 60px")..{
Condition=(ratemod ~= 1);
OnCommand=cmd(x,SCREEN_CENTER_X+50;y,SCREEN_CENTER_Y-210.25-6;diffuse,color("#FFFFFF");zoom,0.27;playcommand,'loop');
		loopCommand=function(self)
		if round(Bpm)*ratemod >= 1000 then
		self:settextf("%.d",round(Bpm)*ratemod)
		else
		self:settextf("%.1f",round(Bpm)*ratemod)
		end
		self:diffusealpha(math.abs(math.sin(GAMESTATE:GetSongBeat()*3.14))*0.5)
		self:sleep(1/60)
		self:queuecommand('loop')
		end;
};
};
return t;