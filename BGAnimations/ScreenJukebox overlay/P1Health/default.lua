local LP1=0;
local ERR1 = {false,"RROR",129};
local t = Def.ActorFrame{
Def.Quad {
InitCommand=cmd(x,SCREEN_CENTER_X*0.5-126;y,SCREEN_CENTER_Y-210.25;diffuse,color("#FF5555");horizalign,left;zoomy,23.75;zoomx,246.5/2);
OnCommand=cmd(playcommand,"Meow");
MeowCommand=function(self)
LP1 = SCREENMAN:GetTopScreen():GetLifeMeter(PLAYER_1):GetLife()
if LP1 == 1 or (TP.Battle.IsBattle and TP.Battle.Mode == "Dr" and TP.Battle.Hidden) then
					self:effectclock("beat");
					self:diffuseramp();
					self:effectcolor1(1,0.7,0.1,1);
					self:effectcolor2(1,0.9,0.5,1);
					self:effectperiod(0.5);
					self:effecttiming(0.25,0.50,0,0.25);
					self:effectoffset(-0.25);
		self:zoomx(246.5)
else
self:stopeffect()
OMG = math.max(math.min(math.log(math.mod(math.max(GAMESTATE:GetSongBeat(),0),1)*(-10)+10),1),0)/3+0.6714
self:zoomx(246.5/2*LP1*OMG*2)
end
self:sleep(1/60)
self:queuecommand("Meow");
end;
};
LoadFont(NumF)..{
OnCommand=cmd(x,SCREEN_CENTER_X*0.5;y,SCREEN_CENTER_Y-210.25;blend,"BlendMode_InvertDest";playcommand,'loop');
		loopCommand=function(self)
		if not GAMESTATE:IsHumanPlayer(PLAYER_1) then
			self:settext("")
		elseif TP.Battle.IsBattle and TP.Battle.Mode == "Dr" and TP.Battle.Hidden then
		if math.mod(GAMESTATE:GetSongBeat(),1) < 0.5 and not ERR1[1] then
		ERR1[3] = math.random(100,999)
		ERR1[1] = true;
		elseif math.mod(GAMESTATE:GetSongBeat(),1) > 0.5 then
		ERR1[1] = false;
		end
		self:settext("-Error("..ERR1[3]..")-")
		else
		self:settext(FormatPercentScore(LP1))
		end
		self:sleep(0.02)
		self:queuecommand('loop')
		end;

};
};
return t;