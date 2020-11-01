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

function N2P(n)
if n == 1 then
return ""
else
return string.format("%d",n*100).."% "
end
end;


function Xbarrr(S)
local Re=0;
for i = 1,#S do
	Re = Re+S[i]
end
	return Re/#S
end;
local Op1 = GAMESTATE:GetPlayerState(PLAYER_1):GetCurrentPlayerOptions();

local n1 = 1;

local sec1 = {};
sec1[#sec1+1] = 1

local i1 = 1;

t[#t+1] =Def.ActorFrame{
	OnCommand=function(self)
	if Op1:Alternate() ~= 0 or
	Op1:Cross() ~= 0 or
	Op1:Split() ~= 0 or
	Op1:Reverse() ~= 0 or
	Op1:Mirror() or
	Op1:Left() or
	Op1:Right() or
	Op1:Shuffle() or
	Op1:Centered() ~= 0 then
	sec1[#sec1+1] = 2
	end
	
	if Op1:Boost() ~= 0 or
	Op1:Brake() ~= 0 or
	Op1:Expand() ~= 0 or
	Op1:Boomerang() ~= 0 or
	Op1:Wave() ~= 0 then
	sec1[#sec1+1] = 3
	end
	
	if Op1:Drunk() ~= 0 or
	Op1:Dizzy() ~= 0 or
	Op1:Confusion() ~= 0 or
	Op1:Mini() ~= 0 or
	Op1:Flip() ~= 0 or
	Op1:Invert() ~= 0 or
	Op1:Tornado() ~= 0 or
	Op1:Tipsy() ~= 0 or
	Op1:Bumpy() ~= 0 or
	Op1:Beat() ~= 0 or
	Op1:AttackMines() then
	sec1[#sec1+1] = 4
	end
	
	if Op1:Hidden() ~= 0 or
	Op1:Sudden() ~= 0 or
	Op1:Stealth() ~= 0 or
	Op1:Blink() ~= 0 or
	Op1:RandomVanish() ~= 0 or
	Op1:Blind() ~= 0 or
	Op1:Dark() ~= 0 then
	sec1[#sec1+1] = 5
	end
	
	if Op1:Wide() or
	Op1:Big() or
	Op1:Quick() or
	Op1:BMRize() or
	Op1:Skippy() or
	Op1:Echo() or
	Op1:Stomp() then
	sec1[#sec1+1] = 6
	end
	
	if Op1:NoFakes() or
	Op1:NoHands() or
	Op1:NoHolds() or
	Op1:NoJumps() or
	Op1:NoLifts() or
	Op1:NoQuads() or
	Op1:NoRolls() or
	Op1:NoStretch() or
	Op1:NoMines() then
	sec1[#sec1+1] = 7
	end
	i1 = #sec1;
	self:playcommand("Nepko1")
	end;
	Nepko1Command=function(self)
	if i1 == #sec1 then
		n1 = 1
		i1 = 1
	else
		i1 = i1 + 1;
		n1 = sec1[i1];
	end
	MESSAGEMAN:Broadcast("Nexto1")
	if i1 == 1 then
	self:sleep(math.random(120,150)/10):queuecommand("Nepko1");
	else
	self:sleep(math.random(90,120)/10):queuecommand("Nepko1");
	end
	end;
};


t[#t+1] = Def.ActorFrame{
	OnCommand=cmd(x,15;y,7;zoom,0.8*0.6);
Nexto1MessageCommand=function(self)
	if n1 == 1 then
	self:decelerate(0.5):rotationx(0)
	else
	self:decelerate(0.5):rotationx(-90)
	end
end;
LoadFont("_comic sans ms 24px")..{
	InitCommand=cmd(horizalign,left);
		OnCommand=function(self)
			self:queuecommand("NepuSong");
		end;
		CurrentSongChangedMessageCommand=cmd(queuecommand,"NepuSong");
				NepuSongCommand=function(self)
				for i = 1,math.floor(GAMESTATE:GetCurrentSong():GetLastBeat())*2 do
				Bpms[i] = GAMESTATE:GetCurrentSong():GetTimingData():GetBPMAtBeat(i/2)
				end
				if Op1:CMod() then
				self:settext("C"..string.format("%d",Op1:CMod()))
				self:diffuse(Sp2Cl(Op1:CMod()))
				elseif Op1:MMod() then
				self:settext("m"..string.format("%d",Op1:MMod()))
				self:diffuse(Sp2Cl(Op1:MMod()))
				elseif Op1:XMod() then
				self:settext(string.format("%.2f",Op1:XMod()).."x")
				self:diffuse(Sp2Cl(Xbarrr(Bpms)*Op1:XMod()))
				end
				w[1] = self:GetWidth();
				end;
};
LoadFont("_comic sans ms 24px")..{
	InitCommand=cmd(horizalign,left;diffuse,PlayerColor(PLAYER_1);); OnCommand=function(self) self:queuecommand("NepuSong"); end; CurrentSongChangedMessageCommand=cmd(queuecommand,"NepuSong"); NepuSongCommand=function(self)
	self:x(w[1])
	self:settext(","..Op1:NoteSkin())
	w[2] = self:GetWidth();
				end;
};
LoadFont("_comic sans ms 24px")..{
	InitCommand=cmd(horizalign,left;diffuse,PlayerColor(PLAYER_1);); OnCommand=function(self) self:queuecommand("NepuSong"); end; CurrentSongChangedMessageCommand=cmd(queuecommand,"NepuSong"); NepuSongCommand=function(self)
	self:x(w[1]+w[2])
	self:settext(","..TP[ToEnumShortString(PLAYER_1)].ActiveModifiers.JudgmentGraphic or "tor12315za")
	w[3] = self:GetWidth();
				end;
};
LoadFont("_comic sans ms 24px")..{
	InitCommand=cmd(horizalign,left;diffuse,PlayerColor(PLAYER_1);); OnCommand=function(self) self:queuecommand("NepuSong"); end; CurrentSongChangedMessageCommand=cmd(queuecommand,"NepuSong"); NepuSongCommand=function(self)
	self:x(w[1]+w[2]+w[3])
	if Op1:Cover()*100 == 0 then
	else
	self:settext(","..N2P(Op1:Cover()).."Hide Background")
	end
	w[4] = self:GetWidth();
	end;
};
LoadFont("_comic sans ms 24px")..{
	InitCommand=cmd(horizalign,left;diffuse,PlayerColor(PLAYER_1);); OnCommand=function(self) self:queuecommand("NepuSong"); end; CurrentSongChangedMessageCommand=cmd(queuecommand,"NepuSong"); NepuSongCommand=function(self)
	self:x(w[1]+w[2]+w[3]+w[4])
	if Op1:Overhead() then
	self:settext(",OverHead")
	elseif Op1:Hallway() then
	self:settext(","..N2P(Op1:Hallway()).."Hallway")
	elseif Op1:Distant() then
	self:settext(","..N2P(Op1:Distant()).."Distant")
	elseif Op1:Incoming() then
	self:settext(","..N2P(Op1:Incoming()).."Incoming")
	elseif Op1:Space() then
	self:settext(","..N2P(Op1:Space()).."Space")
	end
	w[5] = self:GetWidth();
				end;
};
LoadFont("_comic sans ms 24px")..{
	InitCommand=cmd(horizalign,left;diffuse,PlayerColor(PLAYER_1);); OnCommand=function(self) self:queuecommand("NepuSong"); end; CurrentSongChangedMessageCommand=cmd(queuecommand,"NepuSong"); NepuSongCommand=function(self)
	self:x(w[1]+w[2]+w[3]+w[4]+w[5])
	if 	Op1:Alternate() ~= 0 or
		Op1:Beat() ~= 0 or
		Op1:Big() or
		Op1:Blink() ~= 0 or
		Op1:Blind() ~= 0 or
		Op1:Boomerang() ~= 0 or
		Op1:Boost() ~= 0 or
		Op1:Brake() ~= 0 or
		Op1:Bumpy() ~= 0 or
		Op1:Centered() ~= 0 or
		Op1:Confusion() ~= 0 or
		Op1:Cross() ~= 0 or
		Op1:Dark() ~= 0 or
		Op1:Dizzy() ~= 0 or
		Op1:Drunk() ~= 0 or
		Op1:Echo() or
		Op1:Expand() ~= 0 or
		Op1:Flip() ~= 0 or
		Op1:Hidden() ~= 0 or
		Op1:HiddenOffset() ~= 0 or
		Op1:Invert() ~= 0 or
		Op1:Left() or
		Op1:Little() or
		Op1:Mini() ~= 0 or
		Op1:Mirror() or
		not Op1:NoAttack() or
		Op1:NoFakes() or
		Op1:NoHolds() or
		Op1:NoJumps() or
		Op1:NoHands() or
		Op1:NoLifts() or
		Op1:NoQuads() or
		Op1:NoStretch() or
		Op1:NoMines() or
		Op1:NoRolls() or
		Op1:Reverse() ~= 0 or
		Op1:RandomVanish() ~= 0 or
		Op1:Right() or
		Op1:Roll() ~= 0 or
		Op1:Shuffle() or
		Op1:Skippy() or
		Op1:SoftShuffle() or
		Op1:Split() ~= 0 or
		Op1:Stealth() ~= 0 or
		Op1:Stomp() or
		Op1:Sudden() ~= 0 or
		Op1:SuddenOffset() ~= 0 or
		Op1:SuperShuffle() or
		Op1:Tiny() ~= 0 or
		Op1:Tipsy() ~= 0 or
		Op1:Tornado() ~= 0 or
		Op1:Twirl() ~= 0 or
		Op1:Twister() or
		Op1:Quick() or
		Op1:BMRize() or
		Op1:Wave() ~= 0 or
		Op1:Xmode() ~= 0
	then
	self:settext(" And more...")
	end
	w[6] = self:GetWidth();
				end;
};
};
--[[
--------██████
--------     █
--------██████
--------█
--------██████
]]
t[#t+1] = Def.ActorFrame{
	OnCommand=cmd(x,15;y,7;zoom,0.8*0.6;diffuse,color("#00B500"));
Nexto1MessageCommand=function(self)
	if n1 == 2 then
	self:decelerate(0.5):rotationx(0)
	else
	self:decelerate(0.5):rotationx(-90)
	end
end;
LoadFont("_comic sans ms 24px")..{
	InitCommand=cmd(horizalign,left);
	OnCommand=function(self)
	dist = ""
	fc = true
	
	if Op1:Alternate() ~= 0 then if fc then fc = false; else dist = dist.."," end
	dist = dist..N2P(Op1:Alternate()).."Alternate" end
	
	if Op1:Cross() ~= 0 then if fc then fc = false; else dist = dist.."," end
	dist = dist..N2P(Op1:Cross()).."Cross" end
	
	if Op1:Split() ~= 0 then if fc then fc = false; else dist = dist.."," end
	dist = dist..N2P(Op1:Split()).."Split" end
	
	if Op1:Reverse() ~= 0 then if fc then fc = false; else dist = dist.."," end
	dist = dist..N2P(Op1:Reverse()).."Reverse" end
	
	if Op1:Centered() ~= 0 then if fc then fc = false; else dist = dist.."," end
	dist = dist..N2P(Op1:Centered()).."Centered" end
	
	
	if Op1:Mirror() then if fc then fc = false; else dist = dist.."," end
	dist = dist.."Mirror" end
	
	if Op1:Left() then if fc then fc = false; else dist = dist.."," end 
	dist = dist.."Step Left" end
	
	if Op1:Right() then if fc then fc = false; else dist = dist.."," end
	dist = dist.."Step Right" end
	
	if Op1:Shuffle() then if fc then fc = false; else dist = dist.."," end
	dist = dist.."Shuffle" end
	
	self:settext(dist)
	end;
};
};
--[[
--------██████
--------     █
--------██████
--------     █
--------██████
]]
t[#t+1] = Def.ActorFrame{
	OnCommand=cmd(x,15;y,7;zoom,0.8*0.6;diffuse,color("#BA4CFF"));
Nexto1MessageCommand=function(self)
	if n1 == 3 then
	self:decelerate(0.5):rotationx(0)
	else
	self:decelerate(0.5):rotationx(-90)
	end
end;
LoadFont("_comic sans ms 24px")..{
	InitCommand=cmd(horizalign,left);
	OnCommand=function(self)
	dist = ""
	fc = true
	if Op1:Boost() ~= 0 then if fc then fc = false; else dist = dist.."," end
	dist = dist..N2P(Op1:Boost()).."Boost" end
	
	if Op1:Brake() ~= 0 then if fc then fc = false; else dist = dist.."," end
	dist = dist..N2P(Op1:Brake()).."Brake" end
	
	if Op1:Expand() ~= 0 then if fc then fc = false; else dist = dist.."," end
	dist = dist..N2P(Op1:Expand()).."Expand" end
	
	if Op1:Boomerang() ~= 0 then if fc then fc = false; else dist = dist.."," end
	dist = dist..N2P(Op1:Boomerang()).."Boomerang" end
	
	if Op1:Wave() ~= 0 then if fc then fc = false; else dist = dist.."," end
	dist = dist..N2P(Op1:Wave()).."Wave" end
	
	self:settext(dist)
	end;
};
};

--[[
--------█    █
--------█    █
--------██████
--------     █
--------     █
]]
t[#t+1] = Def.ActorFrame{
	OnCommand=cmd(x,15;y,7;zoom,0.8*0.6;diffuse,color("#FF6868"));
Nexto1MessageCommand=function(self)
	if n1 == 4 then
	self:decelerate(0.5):rotationx(0)
	else
	self:decelerate(0.5):rotationx(-90)
	end
end;
LoadFont("_comic sans ms 24px")..{
	InitCommand=cmd(horizalign,left);
	OnCommand=function(self)
	dist = ""
	fc = true
	--[[]]
	if Op1:Drunk() ~= 0 then if fc then fc = false; else dist = dist.."," end
	dist = dist..N2P(Op1:Drunk()).."Drunk" end
	
	if Op1:Dizzy() ~= 0 then if fc then fc = false; else dist = dist.."," end
	dist = dist..N2P(Op1:Dizzy()).."Dizzy" end
	
	if Op1:Confusion() ~= 0 then if fc then fc = false; else dist = dist.."," end
	dist = dist..N2P(Op1:Confusion()).."Confusion" end
	
	if Op1:Mini() ~= 0 then if fc then fc = false; else dist = dist.."," end
	dist = dist..N2P(Op1:Mini()).."Mini" end
	
	if Op1:Flip() ~= 0 then if fc then fc = false; else dist = dist.."," end
	dist = dist..N2P(Op1:Flip()).."Flip" end
	
	if Op1:Invert() ~= 0 then if fc then fc = false; else dist = dist.."," end
	dist = dist..N2P(Op1:Invert()).."Invert" end
	
	if Op1:Tornado() ~= 0 then if fc then fc = false; else dist = dist.."," end
	dist = dist..N2P(Op1:Tornado()).."Tornado" end
	
	if Op1:Tipsy() ~= 0 then if fc then fc = false; else dist = dist.."," end
	dist = dist..N2P(Op1:Tipsy()).."Tipsy" end
	
	if Op1:Bumpy() ~= 0 then if fc then fc = false; else dist = dist.."," end
	dist = dist..N2P(Op1:Bumpy()).."Bumpy" end
	
	if Op1:Beat() ~= 0 then if fc then fc = false; else dist = dist.."," end
	dist = dist..N2P(Op1:Beat()).."Beat" end

	if Op1:AttackMines() then if fc then fc = false; else dist = dist.."," end
	dist = dist.."AttackMines" end
	
	self:settext(dist)
	end;
};
};

--[[
--------██████
--------█    
--------██████
--------     █
--------██████
]]
t[#t+1] = Def.ActorFrame{
	OnCommand=cmd(x,15;y,7;zoom,0.8*0.6;diffuse,color("#FF30FF"));
Nexto1MessageCommand=function(self)
	if n1 == 5 then
	self:decelerate(0.5):rotationx(0)
	else
	self:decelerate(0.5):rotationx(-90)
	end
end;
LoadFont("_comic sans ms 24px")..{
	InitCommand=cmd(horizalign,left);
	OnCommand=function(self)
	dist = ""
	fc = true
	--[[]]
	if Op1:Hidden() ~= 0 then if fc then fc = false; else dist = dist.."," end
	dist = dist..N2P(Op1:Hidden()).."Hidden" end
	
	if Op1:Sudden() ~= 0 then if fc then fc = false; else dist = dist.."," end
	dist = dist..N2P(Op1:Sudden()).."Sudden" end
	
	if Op1:Blink() ~= 0 then if fc then fc = false; else dist = dist.."," end
	dist = dist..N2P(Op1:Blink()).."Blink" end
	
	if Op1:RandomVanish() ~= 0 then if fc then fc = false; else dist = dist.."," end
	dist = dist..N2P(Op1:RandomVanish()).."R.Vanish" end
	
	if Op1:Blind() ~= 0 then if fc then fc = false; else dist = dist.."," end
	dist = dist..N2P(Op1:Blind()).."Hide Judgment" end
	
	if Op1:Invert() ~= 0 then if fc then fc = false; else dist = dist.."," end
	dist = dist..N2P(Op1:Dark()).."Dark" end
	
	self:settext(dist)
	end;
};
};

--[[
--------██████
--------█    
--------██████
--------█    █
--------██████
]]
t[#t+1] = Def.ActorFrame{
	OnCommand=cmd(x,15;y,7;zoom,0.8*0.6;diffuse,color("#916DFF"));
Nexto1MessageCommand=function(self)
	if n1 == 6 then
	self:decelerate(0.5):rotationx(0)
	else
	self:decelerate(0.5):rotationx(-90)
	end
end;
LoadFont("_comic sans ms 24px")..{
	InitCommand=cmd(horizalign,left);
	OnCommand=function(self)
	dist = ""
	fc = true
	--[[]]
	if Op1:Wide() then if fc then fc = false; else dist = dist.."," end
	dist = dist.."Wide" end
	
	if Op1:Big() then if fc then fc = false; else dist = dist.."," end
	dist = dist.."Big" end
	
	if Op1:Quick() then if fc then fc = false; else dist = dist.."," end
	dist = dist.."Quick" end
	
	if Op1:BMRize() then if fc then fc = false; else dist = dist.."," end
	dist = dist.."BMRize" end
	
	if Op1:Skippy() then if fc then fc = false; else dist = dist.."," end
	dist = dist.."Skippy" end
	
	if Op1:Echo() then if fc then fc = false; else dist = dist.."," end
	dist = dist.."Echo" end
	
	if Op1:Stomp() then if fc then fc = false; else dist = dist.."," end
	dist = dist.."Stomp" end
	
	self:settext(dist)
	end;
};
};

--[[
--------██████
--------     █    
--------     █
--------     █
--------     █
]]
t[#t+1] = Def.ActorFrame{
	OnCommand=cmd(x,15;y,7;zoom,0.8*0.6;diffuse,color("#FF4473"));
Nexto1MessageCommand=function(self)
	if n1 == 7 then
	self:decelerate(0.5):rotationx(0)
	else
	self:decelerate(0.5):rotationx(-90)
	end
end;
LoadFont("_comic sans ms 24px")..{
	InitCommand=cmd(horizalign,left);
	OnCommand=function(self)
	dist = ""
	fc = true
	if Op1:NoFakes() then if fc then fc = false; else dist = dist.."," end
	dist = dist.."No Fakes" end
	
	if Op1:NoHands() then if fc then fc = false; else dist = dist.."," end
	dist = dist.."No Hands" end
	
	if Op1:NoHolds() then if fc then fc = false; else dist = dist.."," end
	dist = dist.."No Holds" end
	
	if Op1:NoJumps() then if fc then fc = false; else dist = dist.."," end
	dist = dist.."No Jumps" end
	
	if Op1:NoLifts() then if fc then fc = false; else dist = dist.."," end
	dist = dist.."No Lifts" end
	
	if Op1:NoQuads() then if fc then fc = false; else dist = dist.."," end
	dist = dist.."No Quads" end
	
	if Op1:NoRolls() then if fc then fc = false; else dist = dist.."," end
	dist = dist.."No Rolls" end
	
	if Op1:NoStretch() then if fc then fc = false; else dist = dist.."," end
	dist = dist.."No Stretch" end
	
	if Op1:NoMines() then if fc then fc = false; else dist = dist.."," end
	dist = dist.."No Mines" end
	
	self:settext(dist)
	end;
};
};
return t;