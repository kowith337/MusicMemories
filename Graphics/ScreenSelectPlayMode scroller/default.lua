local gc = Var "GameCommand";
local colors = {
	Easy		= color("#00ff00"),
	Normal		= color("#00ff00"),
	Hard		= color("#ff0000"),
	Rave		= color("#ff1111"),
	Nonstop		= color("#00aaff"),
	Oni			= color("#aa00bb"),
	Endless		= color("#b4c3d2"),
};
local Lew = 1;
local Wario = {0,0,0,0};
local t = Def.ActorFrame {};
-- Background!
t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(x,SCREEN_CENTER_X/4;y,70;rotationz,90;zoomx,0.7;zoomy,3);
-- 	GainFocusCommand=cmd(visible,true);
-- 	LoseFocusCommand=cmd(visible,false);
	LoadActor(THEME:GetPathG("ScreenSelectPlayMode","BackgroundFrame")) .. {
		InitCommand=cmd(diffuse,Color("Black");diffusealpha,0.45);
		GainFocusCommand=cmd(visible,true);
		LoseFocusCommand=cmd(visible,false);
	};
 	LoadActor("_HighlightFrame") .. {
		InitCommand=cmd(diffuse,ModeIconColors[gc:GetName()];diffusealpha,0);
		GainFocusCommand=cmd(finishtweening;diffuse,ColorLightTone(ModeIconColors[gc:GetName()]);linear,1;diffuse,ModeIconColors[gc:GetName()]);
		LoseFocusCommand=cmd(finishtweening;diffusealpha,0);
		OffFocusedCommand=cmd(finishtweening;glow,Color("White");decelerate,2;glow,Color("Invisible");linear,1;diffusealpha,0;);
	};
};
t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(y,70;rotationz,90;zoomx,5;zoomy,5);
-- 	GainFocusCommand=cmd(visible,true);
-- 	LoseFocusCommand=cmd(visible,false);
 	LoadActor("_HighlightFrame") .. {
		InitCommand=cmd(diffuse,ModeIconColors[gc:GetName()];diffusealpha,0);
		GainFocusCommand=cmd(finishtweening;diffuse,ColorLightTone(ModeIconColors[gc:GetName()]);linear,1;diffuse,ModeIconColors[gc:GetName()]);
		LoseFocusCommand=cmd(finishtweening;diffusealpha,0);
		OffFocusedCommand=cmd(finishtweening;glow,Color("White");decelerate,2;glow,Color("Invisible"));
	};
};
-- Emblem Frame
t[#t+1] = Def.ActorFrame {
	FOV=90;
	InitCommand=cmd(zoom,0.9;y,SCREEN_TOP-35);
	-- Main Emblem
	LoadActor( gc:GetName() ) .. {
		InitCommand=cmd(diffusealpha,0;zoom,0.75);
		GainFocusCommand=cmd(finishtweening;stopeffect;diffusealpha,1;zoom,1;glow,Color("White");decelerate,0.5;glow,Color("Invisible");wag;effectmagnitude,0,5,0;effectperiod,2;);
		LoseFocusCommand=cmd(finishtweening;stopeffect;smooth,0.4;diffusealpha,0;zoom,0.75;glow,Color("Invisible"));
		OffFocusedCommand=cmd(finishtweening;stopeffect;glow,ModeIconColors[gc:GetName()];decelerate,0.5;rotationz,360;glow,Color("Invisible");decelerate,0.25;zoomx,0;y,-300);
	};
};
-- Text Frame
t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(x,90-SCREEN_CENTER_X+SCREEN_CENTER_X/4;y,50);
	Def.Quad {
		InitCommand=cmd(horizalign,left;y,-20;zoomto,320,2;diffuse,ModeIconColors[gc:GetName()];diffusealpha,0;fadeleft,0.35;faderight,0.35);
		GainFocusCommand=cmd(stoptweening;linear,0.5;diffusealpha,0);
		LoseFocusCommand=cmd(stoptweening;linear,0.1;diffusealpha,0);
	};
	LoadFont("Common Large") .. {
		Text=gc:GetText();
		InitCommand=cmd(horizalign,center;diffuse,ModeIconColors[gc:GetName()];shadowcolor,ColorDarkTone(ModeIconColors[gc:GetName()]);shadowlength,2;diffusealpha,0;skewx,-0.125;zoom,0.5);
		GainFocusCommand=cmd(finishtweening;x,0+335;y,30+10;cropright,1;diffuse,ColorLightTone(ModeIconColors[gc:GetName()]);decelerate,0.45;y,0+10;diffusealpha,1;cropright,0;diffuse,ModeIconColors[gc:GetName()]);
		LoseFocusCommand=cmd(finishtweening;x,0+335;y,30+10;accelerate,0.4;diffusealpha,0;y,30+10;x,32+335;diffusealpha,0);
		OffFocusedCommand=cmd(finishtweening;accelerate,0.75;cropleft,1);
	};
	LoadFont("Common Normal") .. {
		Text=THEME:GetString(Var "LoadingScreen", gc:GetName() .. "Explanation");
		InitCommand=cmd(horizalign,center;x,0+335;shadowlength,1;diffusealpha,0;skewx,-0.125;zoom,0.5);
		GainFocusCommand=cmd(finishtweening;x,0+335;y,120;decelerate,0.45;diffusealpha,1;y,120-45);
		LoseFocusCommand=cmd(finishtweening;x,0+335;accelerate,0.4;diffusealpha,0;x,0+335;diffusealpha,0);
		OffFocusedCommand=cmd(finishtweening;accelerate,0.75;cropleft,1);
	};
};
t.GainFocusCommand=cmd(finishtweening;visible,true;zoom,1;addy,-20;decelerate,0.5;addy,20);
t.LoseFocusCommand=cmd(finishtweening;visible,false;zoom,1;rotationx,180);
t.OffFocusedCommand=cmd(finishtweening;decelerate,3;rotationz,720);
t[#t+1] = Def.ActorFrame {
Def.ActorFrame {
		OffFocusedCommand=cmd(decelerate,1;x,-322;y,125;zoom,2);
	Def.ActorFrame {
		OnCommand=cmd(queuecommand,"Check");
		GainFocusCommand=cmd(queuecommand,"Check");
		CheckCommand=function(self)
		if gc:GetText() == "Extended" or gc:GetText() == "Oni" then
		self:bob()
		self:effectmagnitude(0,30,0)
		end
		end;
	Def.ActorFrame {
		OnCommand=cmd(queuecommand,"Check");
		GainFocusCommand=cmd(queuecommand,"Check");
		CheckCommand=function(self)
		if gc:GetText() == "Extended" or gc:GetText() == "Oni" then
		self:bob()
		self:effectmagnitude(15,0,0)
		self:effecttiming(0.2,0.3,0.2,0.3)
		end
		end;
	LoadActor("_Down Tap Receptor") .. {
		InitCommand=cmd(x,(SCREEN_CENTER_X/2)*0.65;y,-80;diffusealpha,1;rotationz,90;zoom,0.8);
	};
	LoadActor("_Down Tap Receptor") .. {
		InitCommand=cmd(x,(SCREEN_CENTER_X/2)*0.90;y,-80;diffusealpha,1;zoom,0.8);
	};
	LoadActor("_Down Tap Receptor") .. {
		InitCommand=cmd(x,(SCREEN_CENTER_X/2)*1.15;y,-80;diffusealpha,1;rotationz,180;zoom,0.8);
	};
	LoadActor("_Down Tap Receptor") .. {
		InitCommand=cmd(x,(SCREEN_CENTER_X/2)*1.40;y,-80;diffusealpha,1;rotationz,-90;zoom,0.8);
	};
	};
	Def.ActorFrame {
	LoadActor("Down Tap Note") .. {
		InitCommand=cmd(x,(SCREEN_CENTER_X/2)*0.65;y,-80;diffusealpha,1;rotationz,90;zoom,0.8);
		OnCommand=cmd(queuecommand,"Teston");
		GainFocusCommand=cmd(queuecommand,"Teston");
		OffFocusedCommand=cmd(queuecommand,"Teston");
		TestonCommand=cmd(finishtweening;playcommand,"LoopA");
		LoopACommand=function(self) self:y(20) self:linear(1/Lew) self:y(-80) self:sleep(0.00001) self:queuecommand("LoopA") end;
	};
	LoadActor("Down Tap Note") .. {
		InitCommand=cmd(x,(SCREEN_CENTER_X/2)*0.90;y,-80;diffusealpha,1;rotationz,0;zoom,0.8;setstate,4);
		OnCommand=cmd(queuecommand,"Teston");
		GainFocusCommand=cmd(queuecommand,"Teston");
		OffFocusedCommand=cmd(queuecommand,"Teston");
		TestonCommand=cmd(sleep,0.0001;addy,25;linear,0.25/Lew;addy,-25;playcommand,"LoopB");
		LoopBCommand=function(self) self:y(20) self:linear(1/Lew) self:y(-80) self:sleep(0.00001) self:queuecommand("LoopB") end;
	};
	LoadActor("Down Tap Note") .. {
		InitCommand=cmd(x,(SCREEN_CENTER_X/2)*1.15;y,-80;diffusealpha,1;rotationz,180;zoom,0.8;setstate,8);
		OnCommand=cmd(queuecommand,"Teston");
		GainFocusCommand=cmd(queuecommand,"Teston");
		OffFocusedCommand=cmd(queuecommand,"Teston");
		TestonCommand=cmd(sleep,0.0001;addy,50;linear,0.5/Lew;addy,-50;playcommand,"LoopC");
		LoopCCommand=function(self) self:y(20) self:linear(1/Lew) self:y(-80) self:sleep(0.00001) self:queuecommand("LoopC") end;
	};
	LoadActor("Down Tap Note") .. {
		InitCommand=cmd(x,(SCREEN_CENTER_X/2)*1.40;y,-80;diffusealpha,1;rotationz,-90;zoom,0.8;setstate,12);
		OnCommand=cmd(queuecommand,"Teston");
		GainFocusCommand=cmd(queuecommand,"Teston");
		OffFocusedCommand=cmd(queuecommand,"Teston");
		TestonCommand=cmd(sleep,0.0001;addy,75;linear,0.75/Lew;addy,-75;playcommand,"LoopD");
		LoopDCommand=function(self) self:y(20) self:linear(1/Lew) self:y(-80) self:sleep(0.00001) self:queuecommand("LoopD") end;
	};
	};
	};
LoadFont("Common Large") .. {
	Text="VS";
	InitCommand=cmd(x,SCREEN_CENTER_X/2;diffuse,color("#FF9900");zoom,0.8);
		OnCommand=cmd(queuecommand,"Check");
		GainFocusCommand=cmd(queuecommand,"Check");
		CheckCommand=function(self)
		if gc:GetText() == "Rave" then
		self:vibrate()
		self:diffusealpha(1)
		else
		self:stopeffect()
		self:diffusealpha(0)
		end
		if gc:GetText() == "Endless" then
		Lew = 5
		else
		Lew = 1
		end
		end;
};
Def.ActorFrame{
	InitCommand=cmd(x,SCREEN_CENTER_X/2;y,SCREEN_CENTER_Y-175;zoom,1;diffusealpha,0;playcommand,"Neppp");
	NepppCommand=function(self)
	if gc:GetText() == "Oni" then
	self:diffusealpha(1)
	Wario[1] = 60*9+59+0.5;
		Wario[2] = math.floor(Wario[1]/60)
		Wario[3] = math.floor((Wario[1] - Wario[2]*60)/10)
		Wario[4] = math.floor(Wario[1] - (Wario[2]*60 + Wario[3]*10))
	else
	self:diffusealpha(0)
	end
	self:sleep(0.1)
	self:queuecommand("Neppp")
	end;
	LoadActor("WarioTime")..{
		OnCommand=cmd(x,50;zoom,0.25;playcommand,"Wa");
		WaCommand=function(self)
		self:animate(false)
		self:setstate(Wario[4])
		self:sleep(0.1)
		self:queuecommand("Wa")
		end;
	};
	LoadActor("WarioTime")..{
		OnCommand=cmd(x,25;zoom,0.25;playcommand,"ri");
		riCommand=function(self)
		self:animate(false)
		self:setstate(Wario[3])
		self:sleep(0.1)
		self:queuecommand("ri")
		end;
	};
	LoadActor("WarioTime")..{
		OnCommand=cmd(x,-25;zoom,0.25;playcommand,"OO");
		OOCommand=function(self)
		self:animate(false)
		self:setstate(Wario[2])
		self:sleep(0.1)
		self:queuecommand("OO")
		end;
	};
	LoadActor("Ticktock")..{
		OnCommand=cmd(zoom,0.25;playcommand,"OO");
		OOCommand=function(self)
		self:animate(false)
		if ( Wario[1] - math.floor(Wario[1]) >= 0.5) then
			self:setstate(1)
		else
			self:setstate(0)
		end
		self:sleep(0.1)
		self:queuecommand("OO")
		end;
	};
};
	};
};
return t