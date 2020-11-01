local Bpms = {};
local t = Def.ActorFrame{};
local w = {};
function Sp2Cl(Sp)
if Sp < 300 then
return color("0.2,1,0.2,1")
elseif Sp >= 300 and Sp < 600 then
return color(0.2+(((Sp-300)/300)*0.8)..",1,0.2,1")
elseif Sp >= 600 and Sp < 900 then
return color("1,"..(1-(((Sp-600)/300)*0.8))..",0.2,1")
elseif Sp >= 900 then
return color("1,0.2,0.2,1")
end
end;

function Xbarrr(S)
local Re=0;
for i = 1,#S do
	Re = Re+S[i]
end
	return Re/#S
end;
local Op2 = GAMESTATE:GetPlayerState(PLAYER_2):GetCurrentPlayerOptions();

t[#t+1] = Def.ActorFrame{
LoadFont("_comic sans ms 24px")..{
	InitCommand=cmd(x,SCREEN_CENTER_X+(SCREEN_CENTER_X-(15));y,7;zoom,0.8*0.6;horizalign,right);
		OnCommand=function(self)
			self:queuecommand("NepuSong");
		end;
		CurrentSongChangedMessageCommand=cmd(queuecommand,"NepuSong");
				NepuSongCommand=function(self)
				for i = 1,math.floor(GAMESTATE:GetCurrentSong():GetLastBeat())*2 do
				Bpms[i] = GAMESTATE:GetCurrentSong():GetTimingData():GetBPMAtBeat(i/2)
				end
				if Op2:CMod() then
				self:settext("C"..string.format("%d",Op2:CMod()))
				self:diffuse(Sp2Cl(Op2:CMod()))
				elseif Op2:MMod() then
				self:settext("m"..string.format("%d",Op2:MMod()))
				self:diffuse(Sp2Cl(Op2:MMod()))
				elseif Op2:XMod() then
				self:settext(string.format("%.2f",Op2:XMod()).."x")
				self:diffuse(Sp2Cl(Xbarrr(Bpms)*Op2:XMod()))
				end
				w[1] = self:GetWidth()*0.8*0.6;
				end;
};
LoadFont("_comic sans ms 24px")..{
	InitCommand=cmd(x,15;y,7;zoom,0.8*0.6;horizalign,right;diffuse,PlayerColor(PLAYER_1);); OnCommand=function(self) self:queuecommand("NepuSong"); end; CurrentSongChangedMessageCommand=cmd(queuecommand,"NepuSong"); NepuSongCommand=function(self)
	self:x(SCREEN_CENTER_X+(SCREEN_CENTER_X-(15+w[1])))
	self:settext(","..Op2:NoteSkin())
	w[2] = self:GetWidth()*0.8*0.6;
				end;
};
LoadFont("_comic sans ms 24px")..{
	InitCommand=cmd(x,15;y,7;zoom,0.8*0.6;horizalign,right;diffuse,PlayerColor(PLAYER_1);); OnCommand=function(self) self:queuecommand("NepuSong"); end; CurrentSongChangedMessageCommand=cmd(queuecommand,"NepuSong"); NepuSongCommand=function(self)
	self:x(SCREEN_CENTER_X+(SCREEN_CENTER_X-(15+w[1]+w[2])))
	self:settext(","..TP[ToEnumShortString(PLAYER_2)].ActiveModifiers.JudgmentGraphic or "tor12315za")
	w[3] = self:GetWidth()*0.8*0.6;
				end;
};
LoadFont("_comic sans ms 24px")..{
	InitCommand=cmd(x,15;y,7;zoom,0.8*0.6;horizalign,right;diffuse,PlayerColor(PLAYER_1);); OnCommand=function(self) self:queuecommand("NepuSong"); end; CurrentSongChangedMessageCommand=cmd(queuecommand,"NepuSong"); NepuSongCommand=function(self)
	self:x(SCREEN_CENTER_X+(SCREEN_CENTER_X-(15+w[1]+w[2]+w[3])))
	if Op2:Cover()*100 == 0 then
	else
	self:settext(","..string.format("%.1f Cover",Op2:Cover()))
	end
	w[4] = self:GetWidth()*0.8*0.6;
	end;
};
LoadFont("_comic sans ms 24px")..{
	InitCommand=cmd(x,15;y,7;zoom,0.8*0.6;horizalign,right;diffuse,PlayerColor(PLAYER_1);); OnCommand=function(self) self:queuecommand("NepuSong"); end; CurrentSongChangedMessageCommand=cmd(queuecommand,"NepuSong"); NepuSongCommand=function(self)
	self:x(SCREEN_CENTER_X+(SCREEN_CENTER_X-(15+w[1]+w[2]+w[3]+w[4])))
	if Op2:Overhead() then
	self:settext(",OverHead")
	elseif Op2:Hallway() then
	self:settext(","..Op2:Hallway().."Hallway")
	end
	w[5] = self:GetWidth()*0.8*0.6;
				end;
};
};
return t;