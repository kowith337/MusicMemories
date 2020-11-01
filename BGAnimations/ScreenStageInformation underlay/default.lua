local t = Def.ActorFrame{};

	t[#t+1]=Def.Quad{
		InitCommand=cmd(FullScreen;diffuse,{0,0,0,1});
		OnCommand=cmd(sleep,10.5);
	};



	t[#t+1]=Def.Quad{
		InitCommand=cmd(FullScreen;diffuse,{1,1,1,0});
		OnCommand=cmd(sleep,2+2.5;linear,0.7;diffusealpha,1);
	};
	t[#t+1] = Def.ActorFrame{
		InitCommand=cmd(Center;zoom,1;rotationz,0;);
		OnCommand=cmd(decelerate,4.3;zoom,1.1;rotationx,5);
		Def.Sprite {
			InitCommand=cmd(diffusealpha,0);
			BeginCommand=cmd(LoadFromCurrentSongBackground);
			OnCommand=function(self)
				if PREFSMAN:GetPreference("StretchBackgrounds") then
					self:SetSize(SCREEN_WIDTH,SCREEN_HEIGHT)
				else
					self:scale_or_crop_background()
				end
				self:x(0):y(0)
				self:linear(2):diffusealpha(1)
			end;
		};
	}
	 
for i = 1, 20 do
	t[#t+1]=Def.ActorFrame{
		InitCommand=cmd(diffusealpha,1;zoom,0.2;x,math.random( 0, SCREEN_RIGHT );y,math.random( 0, SCREEN_BOTTOM ));
		OnCommand=cmd(playcommand,"SPIN");
		SPINCommand=cmd(linear,0.4+math.random(0,3)/5;addx,math.random(-20,20);addy,math.random(-20,20);sleep,0.02;queuecommand,"SPIN");
		LoadActor("Aura")..{
			InitCommand=cmd(diffusealpha,0);
			OnCommand=cmd(sleep,math.random(0,5)/5;decelerate,1.5;diffusealpha,0.4;sleep,math.random(0,10)/4;decelerate,1.5;diffusealpha,0;zoom,0.5);
		};
	}
	
end
	t[#t+1]=LoadActor("Introduc2.wav")..{
		OnCommand=cmd(sleep,0.2;queuecommand,"YEP");
		YEPCommand=cmd(play);
	};

--Title Stuff HERE
	t[#t+1]=LoadActor("Title.lua");

	t[#t+1]=Def.Quad{
		InitCommand=cmd(FullScreen;diffuse,{0,0,0,0});
		OnCommand=cmd(sleep,5;linear,1;diffusealpha,1);
	};



return t;