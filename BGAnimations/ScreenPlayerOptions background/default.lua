local num_players = GAMESTATE:GetHumanPlayers();
local t = Def.ActorFrame {};
t[#t+1] = Def.ActorFrame {
	Def.Sprite {
		Condition=not GAMESTATE:IsCourseMode();
		InitCommand=cmd(Center);
		OnCommand=function(self)
			if GAMESTATE:GetCurrentSong() then
				local song = GAMESTATE:GetCurrentSong();
				if song:HasBackground() then
					self:LoadBackground(song:GetBackgroundPath());
				end;
				self:scale_or_crop_background();
				(cmd(fadebottom,0.25;fadetop,0.25;croptop,48/480;cropbottom,48/480))(self);
			else
				self:visible(false);
			end
		end;
	};
	Def.Quad {
		InitCommand=cmd(Center;scaletoclipped,SCREEN_WIDTH+1,SCREEN_HEIGHT);
		OnCommand=function(self)
			self:diffuse(Alpha(color("#CCCCCC"),0.45)):diffusealpha(0.45)
			if #num_players==2 then
				self:diffuseleftedge(Alpha(Color[TP[ToEnumShortString(num_players[1])].ActiveModifiers.ComboColorstring or "Red"],0.45))
				self:diffusebottomedge(Alpha(Color[TP[ToEnumShortString(num_players[1])].ActiveModifiers.ComboColorstring or "Red"],0.45))
				self:playcommand("ColorComChanged",{Player=num_players[2],Jud=TP[ToEnumShortString(num_players[2])].ActiveModifiers.ComboColorstring or "Blue"})
			else
				self:playcommand("ColorComChanged",{Player=num_players[1],Jud=TP[ToEnumShortString(num_players[1])].ActiveModifiers.ComboColorstring or "Blue"})
			end
		end;
		ColorComChangedMessageCommand=function(self,param)
				self:stoptweening():decelerate(0.2)
				if #num_players==2 then
				SM(param.Player)
					if param.Player == num_players[1] then
					
						self:diffuseleftedge(Alpha(Color[param.Jud],0.45))
						self:diffusebottomedge(Alpha(Color[param.Jud],0.45))
					else
						self:diffuserightedge(Alpha(Color[param.Jud],0.45))
						self:diffusetopedge(Alpha(Color[param.Jud],0.45))
					end
				else
					self:diffuse(Alpha(Color[param.Jud],0.45))
				end
		end;
		
	};
};



return t
