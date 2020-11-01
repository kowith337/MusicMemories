local t = Def.ActorFrame{};
t[#t+1] = Def.ActorFrame{
		OnCommand=cmd(z,20);
Def.Quad {
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;diffusealpha,1;diffuse,color("#000000");zoomtoheight,SCREEN_HEIGHT;zoomtowidth,SCREEN_WIDTH;sleep,14.602;diffusealpha,0.999999999;);
};
	LoadActor("gameover") .. {
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;diffusealpha,0;zoomtoheight,SCREEN_HEIGHT;zoomtowidth,SCREEN_WIDTH;);
		OnCommand=cmd(sleep,3;linear,1;diffusealpha,1);
	};--2.582
	LoadActor("Heart") .. {
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;zoom,0.3;sleep,1.310;diffusealpha,0;);
	};
			Def.ActorFrame{ 
				InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;);--decelerate accelerate SCREEN_BOTTOM
				OnCommand=cmd(diffusealpha,0;sleep,1.310;diffusealpha,1;decelerate,0.75*2;addy,-200;accelerate,1.25*2;addy,SCREEN_BOTTOM+300);
				Def.ActorFrame{
				InitCommand=cmd(x,math.random(0,20)-10;y,math.random(0,20)-10;);
				OnCommand=cmd(sleep,1.310;linear,4;addx,math.random(-1200,1200);addy,math.random(-200,200)-100;); 
				Def.Quad{
				InitCommand=cmd(zoomto,10,6;diffuse,1.0,0.11,0.11,1;);
				OnCommand=cmd(spin;effectmagnitude,360,360,360;); 
				};
				};
				Def.ActorFrame{
				InitCommand=cmd(x,math.random(0,20)-10;y,math.random(0,20)-10;);
				OnCommand=cmd(sleep,1.310;linear,4;addx,math.random(-1200,1200);addy,math.random(-200,200)-100;); 
				Def.Quad{
				InitCommand=cmd(zoomto,10,6;diffuse,1.0,0.11,0.11,1;);
				OnCommand=cmd(spin;effectmagnitude,360,360,360;); 
				};
				};
				Def.ActorFrame{
				InitCommand=cmd(x,math.random(0,20)-10;y,math.random(0,20)-10;);
				OnCommand=cmd(sleep,1.310;linear,4;addx,math.random(-1200,1200);addy,math.random(-200,200)-100;); 
				Def.Quad{
				InitCommand=cmd(zoomto,10,6;diffuse,1.0,0.11,0.11,1;);
				OnCommand=cmd(spin;effectmagnitude,360,360,360;); 
				};
				};
				Def.ActorFrame{
				InitCommand=cmd(x,math.random(0,20)-10;y,math.random(0,20)-10;);
				OnCommand=cmd(sleep,1.310;linear,4;addx,math.random(-1200,1200);addy,math.random(-200,200)-100;); 
				Def.Quad{
				InitCommand=cmd(zoomto,10,6;diffuse,1.0,0.11,0.11,1;);
				OnCommand=cmd(spin;effectmagnitude,360,360,360;); 
				};
				};
				Def.ActorFrame{
				InitCommand=cmd(x,math.random(0,20)-10;y,math.random(0,20)-10;);
				OnCommand=cmd(sleep,1.310;linear,4;addx,math.random(-1200,1200);addy,math.random(-200,200)-100;); 
				Def.Quad{
				InitCommand=cmd(zoomto,10,6;diffuse,1.0,0.11,0.11,1;);
				OnCommand=cmd(spin;effectmagnitude,360,360,360;); 
				};
				};
				Def.ActorFrame{
				InitCommand=cmd(x,math.random(0,20)-10;y,math.random(0,20)-10;);
				OnCommand=cmd(sleep,1.310;linear,4;addx,math.random(-1200,1200);addy,math.random(-200,200)-100;); 
				Def.Quad{
				InitCommand=cmd(zoomto,10,6;diffuse,1.0,0.11,0.11,1;);
				OnCommand=cmd(spin;effectmagnitude,360,360,360;); 
				};
				};
			};
};
if not GAMESTATE:IsCourseMode() then
if GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == 'Your best nightmare & Finale' then
t[#t+1] = Def.ActorFrame{
OnCommand=cmd(z,20);
LoadActor( "text/madness.lua" )..{ InitCommand=function(self) Neptune_textbox = self end; };
		LoadFont("_determination sans 26px")..{
			InitCommand=cmd(horizalign,left;x,SCREEN_CENTER_X-200;y,SCREEN_CENTER_Y+80;diffuse,color("#FFFFFF");zoom,1;cropright,1;);
			OnCommand=cmd(sleep,5.582;playcommand,'Nep');
			NepCommand=function(self)
		clearThis()
		hideBubble()
	Neptune_textbox:x(SCREEN_CENTER_X-100)
	Neptune_textbox:y(SCREEN_CENTER_Y+125)
		Neptune_textbox:zoom(3)
						 setBubble(0,9,12)
						 hideBubble()
						 colourText(1,45,1,1,1,1)
			sayThis("This is all just abad dream...",0.15,'Asgore.mp3',2)
			end;
		};
		LoadFont("_determination sans 26px")..{
			InitCommand=cmd(horizalign,left;x,SCREEN_CENTER_X-200;y,SCREEN_CENTER_Y+80;diffuse,color("#FFFFFF");zoom,1;cropright,1;);
			OnCommand=cmd(sleep,8.833;playcommand,'Nep');
			NepCommand=function(self)
		clearThis()
		hideBubble()
	Neptune_textbox:x(SCREEN_CENTER_X-100)
	Neptune_textbox:y(SCREEN_CENTER_Y+125)
		Neptune_textbox:zoom(3)
						 setBubble(0,9,12)
						 hideBubble()
						 colourText(1,45,1,1,1,1)
			effect(1,45,'vib',1,1,0,2)
			colourText(11,16,1,0,0,1)
			sayThis("And you're NEVER  waking up!",0.15,'flowey.ogg',2)
			end;
		};--			troll = string.len(you suck);
	LoadActor("flowey") .. {
		OnCommand=cmd();
	};
	LoadActor("Kill Stepmania") .. {
		StartTransitioningCommand=cmd(play);
	};
};
else
t[#t+1] = Def.ActorFrame{
OnCommand=cmd(z,20);
LoadActor( "text/madness.lua" )..{ InitCommand=function(self) Neptune_textbox = self end; };
		LoadFont("_determination sans 26px")..{
			InitCommand=cmd(horizalign,left;x,SCREEN_CENTER_X-200;y,SCREEN_CENTER_Y+80;diffuse,color("#FFFFFF");zoom,1;cropright,1;);
			OnCommand=cmd(sleep,5.582;playcommand,'Nep';sleep,8.704-5.582;playcommand,'Tor');
			NepCommand=function(self)
			NepNep = math.random(1,5);
		clearThis()
		hideBubble()
	Neptune_textbox:x(SCREEN_CENTER_X-100)
	Neptune_textbox:y(SCREEN_CENTER_Y+125)
		Neptune_textbox:zoom(3)
						 setBubble(0,9,12)
						 hideBubble()
						 colourText(1,45,1,1,1,1)
						 effect(1,45,'awesome',0,1,0,2)
			if GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == 'Your best nightmare & Finale' then
			elseif NepNep == 1 then
			effect(1,45,'awesome',0,1,0,2)
			sayThis("You cannot give   up just yet...",0.05,'Asgore.mp3',2)
						 setTalkSpeeds(4,20,0.1)
						 setTalkSpeeds(15,17,0.0001)
			elseif NepNep == 2 then
			effect(1,45,'awesome',0,1,0,2)
			sayThis("Don't lose hope!",0.05,'Asgore.mp3',2)
						 setTalkSpeeds(5,6,0.25)
						 setTalkSpeeds(10,11,0.25)
			elseif NepNep == 3 then
			effect(1,45,'awesome',0,1,0,2)
			sayThis("Our fate rests    upon you...",0.05,'Asgore.mp3',2)
						 setTalkSpeeds(14,18,0.00001)
						 setTalkSpeeds(26,29,0.25)
			elseif NepNep == 4 then
			effect(1,45,'awesome',0,1,0,2)
			sayThis("This is too hard  for you...",0.05,'Asgore.mp3',2)
						 effect(8,16,'rainbow',0,1,0,2)
						 setTalkSpeeds(25,28,0.25)
			elseif NepNep == 5 then
			effect(1,45,'awesome',0,1,0,2)
			sayThis("It cannot end     now!",0.05,'Asgore.mp3',2)
						 effect(3,13,'rainbow',0,1,0,2)
						 setTalkSpeeds(13,22,0.15)
			end
			end;
			TorCommand=function(self)
		clearThis()
		hideBubble()
	Neptune_textbox:x(SCREEN_CENTER_X-100)
	Neptune_textbox:y(SCREEN_CENTER_Y+125)
		Neptune_textbox:zoom(3)
						 setBubble(0,9,12)
						 hideBubble()
						 colourText(1,45,1,1,1,1)
						 effect(1,45,'awesome',0,1,0,2)
			if GAMESTATE:IsPlayerEnabled(PLAYER_1) and GAMESTATE:IsPlayerEnabled(PLAYER_2) then
			profile1 = PROFILEMAN:GetProfile(PLAYER_1);
			name1 = profile1:GetDisplayName();
			profile2 = PROFILEMAN:GetProfile(PLAYER_2);
			name2 = profile2:GetDisplayName();
				Histy = string.len('All you two!')		
			setBubble(0,9,12)
			hideBubble()
						 colourText(1,45,1,1,1,1)
						 effect(1,45,'awesome',0,1,0,2)
						 newline(Histy+1)
			sayThis('All you two! Stay Determined...',0.05,'Asgore.mp3',2)
						 setTalkSpeeds(Histy,Histy+1,Histy*0.063)
						 setTalkSpeeds(Histy+16,Histy+19,0.15)
			elseif GAMESTATE:IsPlayerEnabled(PLAYER_1) and not GAMESTATE:IsPlayerEnabled(PLAYER_2) then
			profile = PROFILEMAN:GetProfile(PLAYER_1);
			name = profile:GetDisplayName();
			if name=="" then
				Nep = 'Player';
			else
				Nep = name;
			end
			Histy = string.len(Nep..'!')
			setBubble(0,9,12)
			hideBubble()
						 colourText(1,45,1,1,1,1)
						 effect(1,45,'awesome',0,1,0,2)
						 newline(Histy+1)
			sayThis(Nep..'! Stay Determined...',0.05,'Asgore.mp3',2)
						 setTalkSpeeds(Histy,Histy+1,Histy*0.063)
						 setTalkSpeeds(Histy+16,Histy+19,0.15)
			elseif GAMESTATE:IsPlayerEnabled(PLAYER_2) and not GAMESTATE:IsPlayerEnabled(PLAYER_1) then
			profile = PROFILEMAN:GetProfile(PLAYER_2);
			name = profile:GetDisplayName();
			if name=="" then
				Nep = 'Player';
			else
				Nep = name;
			end
			Histy = string.len(Nep..'!')
			setBubble(0,Histy-9,12)
						hideBubble()
						 colourText(1,45,1,1,1,1)
						 effect(1,45,'awesome',0,1,0,2)
			sayThis(Nep..'! Stay Determined...',0.05,'Asgore.mp3',2)
						 setTalkSpeeds(Histy,Histy+1,Histy*0.063)
						 setTalkSpeeds(Histy+16,Histy+19,0.15)
			end
			end;
		};--			troll = string.len(you suck);
	LoadActor("Died") .. {
		StartTransitioningCommand=cmd(play);
	};
};
end
else
t[#t+1] = Def.ActorFrame{
OnCommand=cmd(z,20);
LoadActor( "text/madness.lua" )..{ InitCommand=function(self) Neptune_textbox = self end; };
		LoadFont("_determination sans 26px")..{
			InitCommand=cmd(horizalign,left;x,SCREEN_CENTER_X-200;y,SCREEN_CENTER_Y+80;diffuse,color("#FFFFFF");zoom,1;cropright,1;);
			OnCommand=cmd(sleep,5.582;playcommand,'Nep';sleep,8.704-5.582;playcommand,'Tor');
			NepCommand=function(self)
			NepNep = math.random(1,5);
		clearThis()
		hideBubble()
	Neptune_textbox:x(SCREEN_CENTER_X-100)
	Neptune_textbox:y(SCREEN_CENTER_Y+125)
		Neptune_textbox:zoom(3)
						 setBubble(0,9,12)
						 hideBubble()
						 colourText(1,45,1,1,1,1)
						 effect(1,45,'awesome',0,1,0,2)
			if GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == 'Your best nightmare & Finale' then
			elseif NepNep == 1 then
			effect(1,45,'awesome',0,1,0,2)
			sayThis("You cannot give   up just yet...",0.05,'Asgore.mp3',2)
						 setTalkSpeeds(4,20,0.1)
						 setTalkSpeeds(15,17,0.0001)
			elseif NepNep == 2 then
			effect(1,45,'awesome',0,1,0,2)
			sayThis("Don't lose hope!",0.05,'Asgore.mp3',2)
						 setTalkSpeeds(5,6,0.25)
						 setTalkSpeeds(10,11,0.25)
			elseif NepNep == 3 then
			effect(1,45,'awesome',0,1,0,2)
			sayThis("Our fate rests    upon you...",0.05,'Asgore.mp3',2)
						 setTalkSpeeds(14,18,0.00001)
						 setTalkSpeeds(26,29,0.25)
			elseif NepNep == 4 then
			effect(1,45,'awesome',0,1,0,2)
			sayThis("This is too hard  for you...",0.05,'Asgore.mp3',2)
						 effect(8,16,'rainbow',0,1,0,2)
						 setTalkSpeeds(25,28,0.25)
			elseif NepNep == 5 then
			effect(1,45,'awesome',0,1,0,2)
			sayThis("It cannot end     now!",0.05,'Asgore.mp3',2)
						 effect(3,13,'rainbow',0,1,0,2)
						 setTalkSpeeds(13,22,0.15)
			end
			end;
			TorCommand=function(self)
		clearThis()
		hideBubble()
	Neptune_textbox:x(SCREEN_CENTER_X-100)
	Neptune_textbox:y(SCREEN_CENTER_Y+125)
		Neptune_textbox:zoom(3)
						 setBubble(0,9,12)
						 hideBubble()
						 colourText(1,45,1,1,1,1)
						 effect(1,45,'awesome',0,1,0,2)
			if GAMESTATE:IsPlayerEnabled(PLAYER_1) and GAMESTATE:IsPlayerEnabled(PLAYER_2) then
			profile1 = PROFILEMAN:GetProfile(PLAYER_1);
			name1 = profile1:GetDisplayName();
			profile2 = PROFILEMAN:GetProfile(PLAYER_2);
			name2 = profile2:GetDisplayName();
				Histy = string.len('All you two!')		
			setBubble(0,9,12)
			hideBubble()
						 colourText(1,45,1,1,1,1)
						 effect(1,45,'awesome',0,1,0,2)
						 newline(Histy+1)
			sayThis('All you two! Stay Determined...',0.05,'Asgore.mp3',2)
						 setTalkSpeeds(Histy,Histy+1,Histy*0.063)
						 setTalkSpeeds(Histy+16,Histy+19,0.15)
			elseif GAMESTATE:IsPlayerEnabled(PLAYER_1) and not GAMESTATE:IsPlayerEnabled(PLAYER_2) then
			profile = PROFILEMAN:GetProfile(PLAYER_1);
			name = profile:GetDisplayName();
			if name=="" then
				Nep = 'Player';
			else
				Nep = name;
			end
			Histy = string.len(Nep..'!')
			setBubble(0,9,12)
			hideBubble()
						 colourText(1,45,1,1,1,1)
						 effect(1,45,'awesome',0,1,0,2)
						 newline(Histy+1)
			sayThis(Nep..'! Stay Determined...',0.05,'Asgore.mp3',2)
						 setTalkSpeeds(Histy,Histy+1,Histy*0.063)
						 setTalkSpeeds(Histy+16,Histy+19,0.15)
			elseif GAMESTATE:IsPlayerEnabled(PLAYER_2) and not GAMESTATE:IsPlayerEnabled(PLAYER_1) then
			profile = PROFILEMAN:GetProfile(PLAYER_2);
			name = profile:GetDisplayName();
			if name=="" then
				Nep = 'Player';
			else
				Nep = name;
			end
			Histy = string.len(Nep..'!')
			setBubble(0,Histy-9,12)
						hideBubble()
						 colourText(1,45,1,1,1,1)
						 effect(1,45,'awesome',0,1,0,2)
			sayThis(Nep..'! Stay Determined...',0.05,'Asgore.mp3',2)
						 setTalkSpeeds(Histy,Histy+1,Histy*0.063)
						 setTalkSpeeds(Histy+16,Histy+19,0.15)
			end
			end;
		};
	LoadActor("Died") .. {
		StartTransitioningCommand=cmd(play);
	};--			troll = string.len(you suck);
};
end
return t;