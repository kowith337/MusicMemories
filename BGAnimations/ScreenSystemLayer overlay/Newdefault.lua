
local function CreditsText( pn )
	local text = Def.ActorFrame{
		InitCommand=function(self)
			self:name("Credits" .. PlayerNumberToString(pn))
		end;
		UpdateVisibleCommand=function(self)
				local screen = SCREENMAN:GetTopScreen();
				local bShow = true;
				if screen then
					local sClass = screen:GetName();
					bShow = THEME:GetMetric( sClass, "ShowCreditDisplay" );
				end

				self:visible( bShow );
			end;
		UpdateTextCommand=function(self)
			local str = ScreenSystemLayerHelpers.GetCreditsMessage(pn);
		end;
		LoadActor("Test_Isla.png")..{
			InitCommand=function(self)
				self:name("Credits_Icon" .. PlayerNumberToString(pn))
				self:maxwidth(50);
				if pn == PLAYER_1 then
					self:horizalign(left):vertalign(bottom)
					self:x(SCREEN_LEFT):y(SCREEN_BOTTOM);
				else
					self:horizalign(right):vertalign(bottom)
					self:x(SCREEN_RIGHT):y(SCREEN_BOTTOM);
				end
			end;
			UpdateTextCommand=function(self)
				local str = ScreenSystemLayerHelpers.GetCreditsMessage(pn);
				self:visible(str ~= "PRESS START" and str ~= "NOT PRESENT" and str ~= "INSERT CARD" and str ~= "")
			end;
		}
		LoadFont(Var "LoadingScreen","credits") .. {
			InitCommand=function(self)
				self:name("Credits_Text" .. PlayerNumberToString(pn))
			end;
			UpdateTextCommand=function(self)
				local str = ScreenSystemLayerHelpers.GetCreditsMessage(pn);
				self:settext(str);
				if str ~= "PRESS START" and str ~= "NOT PRESENT" and str ~= "INSERT CARD" and str ~= "" then
					if pn == PLAYER_1 then
						self:x(SCREEN_LEFT+55):y(SCREEN_BOTTOM-16);
					else
						self:x(SCREEN_RIGHT-55):y(SCREEN_BOTTOM-16);
					end
				else
					if pn == PLAYER_1 then
						self:x(SCREEN_LEFT+15):y(SCREEN_BOTTOM-16);
					else
						self:x(SCREEN_RIGHT-15):y(SCREEN_BOTTOM-16);
					end
				end
			end;
		};
	};
	
	return text;
end;

--[[ local function PlayerPane( PlayerNumber ) 
	local t = Def.ActorFrame {
		InitCommand=function(self)
			self:name("PlayerPane" .. PlayerNumberToString(PlayerNumber));
	-- 		ActorUtil.LoadAllCommandsAndSetXY(self,Var "LoadingScreen");
		end
	};
	t[#t+1] = Def.ActorFrame {
		Name = "Background";
		Def.Quad {
			InitCommand=cmd(zoomto,160,28;queuecommand,"On");
			OnCommand=cmd(diffuse,PlayerColor(PlayerNumber);fadebottom,1);
		};
	};
	t[#t+1] = Def.BitmapText{
		Font="Common Normal";
		Name = "PlayerText";
		InitCommand=cmd(x,-60;maxwidth,80/0.5;zoom,0.5;queuecommand,"On");
		OnCommand=cmd(playcommand,"Set");
		SetCommand=function(self)
			local profile = PROFILEMAN:GetProfile( PlayerNumber) or PROFILEMAN:GetMachineProfile()
			if profile then
				self:settext( profile:GetDisplayName() );
			else
				self:settext( "NoProf" );
			end
		end;
	};
	return t
end --]]
--
local t = Def.ActorFrame {}
	-- Aux
t[#t+1] = LoadActor(THEME:GetPathB("ScreenSystemLayer","aux"));
	-- Credits
t[#t+1] = Def.ActorFrame {
--[[  	PlayerPane( PLAYER_1 ) .. {
		InitCommand=cmd(x,scale(0.125,0,1,SCREEN_LEFT,SCREEN_WIDTH);y,SCREEN_BOTTOM-16)
	}; --]]
 	CreditsText( PLAYER_1 );
	CreditsText( PLAYER_2 ); 
};
	-- Text
t[#t+1] = Def.ActorFrame {
	OnCommand=cmd(finishtweening;addx,10;decelerate,0.2;addx,-10;);
	OffCommand=cmd(sleep,3;linear,0.5;addx,-10;sleep,0.01;addx,10;);
	Def.Quad {
		InitCommand=cmd(zoomtowidth,SCREEN_WIDTH;zoomtoheight,30;horizalign,left;vertalign,top;y,SCREEN_TOP;diffuse,color("0,0,0,0"));
		OnCommand=cmd(finishtweening;decelerate,0.2;diffusealpha,0.85;);
		OffCommand=cmd(sleep,3;linear,0.5;diffusealpha,0;);
	};
	Def.BitmapText{
		Font="Common Normal";
		Name="Text";
		InitCommand=cmd(maxwidth,750;horizalign,left;vertalign,top;y,SCREEN_TOP+10;x,SCREEN_LEFT+10;shadowlength,1;diffusealpha,0;);
		OnCommand=cmd(finishtweening;decelerate,0.2;diffusealpha,1;zoom,0.5);
		OffCommand=cmd(sleep,3;linear,0.5;diffusealpha,0;);
	};
	SystemMessageMessageCommand = function(self, params)
		self:GetChild("Text"):settext( params.Message );
		self:playcommand( "On" );
		if params.NoAnimate then
			self:finishtweening();
		end
		self:playcommand( "Off" );
	end;
	HideSystemMessageMessageCommand = cmd(finishtweening);
};

return t;
