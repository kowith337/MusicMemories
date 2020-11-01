local LP2=0;
local ERR2 = {false,"RROR",129};
local t = Def.ActorFrame{
Def.Quad {
InitCommand=cmd(x,SCREEN_CENTER_X+(SCREEN_CENTER_X-(SCREEN_CENTER_X*0.5-126))-246.5;y,SCREEN_CENTER_Y-210.25;diffuse,color("#55FF55");horizalign,left;zoomy,23.75;zoomx,246.5/2);
OnCommand=cmd(playcommand,"Meow");
MeowCommand=function(self)
LP2 = SCREENMAN:GetTopScreen():GetLifeMeter(PLAYER_2):GetLife()
if LP2 == 1 or (TP.Battle.IsBattle and TP.Battle.Mode == "Dr" and TP.Battle.Hidden) then
					self:effectclock("beat");
					self:diffuseramp();
					self:effectcolor1(0.1,1,0.1,1);
					self:effectcolor2(0.3,1,0.3,1);
					self:effectperiod(0.5);
					self:effecttiming(0.25,0.50,0,0.25);
					self:effectoffset(-0.25);
		self:zoomx(246.5)
else
self:stopeffect()
OMG = math.max(math.min(math.log(math.mod(math.max(GAMESTATE:GetSongBeat(),0),1)*(-10)+10),1),0)/3+0.6714
self:zoomx(246.5/2*LP2*OMG*2)
end
self:sleep(1/60)
self:queuecommand("Meow");
end;
};
LoadFont(NumF)..{
OnCommand=cmd(x,SCREEN_CENTER_X+(SCREEN_CENTER_X-(SCREEN_CENTER_X*0.5));y,SCREEN_CENTER_Y-210.25;blend,"BlendMode_InvertDest";playcommand,'loop');
		loopCommand=function(self)
		if not GAMESTATE:IsHumanPlayer(PLAYER_2) then
			self:settext("")
		elseif TP.Battle.IsBattle and TP.Battle.Mode == "Dr" and TP.Battle.Hidden then
		if math.mod(GAMESTATE:GetSongBeat(),1) < 0.5 and not ERR2[1] then
		ERR2[3] = math.random(100,999)
		ERR2[1] = true;
		elseif math.mod(GAMESTATE:GetSongBeat(),1) > 0.5 then
		ERR2[1] = false;
		end
		self:settext("-Error("..ERR2[3]..")-")
		else
		self:settext(FormatPercentScore(LP2))
		end
		self:sleep(0.02)
		self:queuecommand('loop')
		end;

};
};
return t;