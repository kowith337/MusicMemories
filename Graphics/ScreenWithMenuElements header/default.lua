local t = Def.ActorFrame {};

local Sped = 20*1.2;


local RanCl = {"Red","Blue","Green","Yellow","Orange","Purple","Greener","Magenta","Pink"};
local HEAD = Screen.String("HeaderText");

for i = 1,string.len(Screen.String("HeaderText")) do
	t[#t+1] = Def.ActorFrame {
		OnCommand=function(self) self:bob():effectmagnitude(0,1,0):effectoffset((math.abs(1/4.5-(i/4.5)))) end;
	LoadFont("Common Normal")..{
		InitCommand=cmd(x,(Sped)*(i-(1+string.len(Screen.String("HeaderText")))/2);y,30;SetTextureFiltering,false;settext,string.sub(Screen.String("HeaderText"),i,i);zoom,1.2);
		OnCommand=function(self)
			
			self:diffuse(Color[RanCl[math.random(#RanCl)]])
			local See = Screen.String("HeaderText")
			if See == "Select Music" then
				self:zoom(0.9):y(18)
			end
		end;
		CurrentSongChangedMessageCommand=function(self)
			if GAMESTATE:GetCurrentSong()~=nil then
				self:effectclock('beat'):thump():effectoffset(-((i-1)/string.len(HEAD)/1.5))
			else
				self:stopeffect()
			end
		end;
	};
	};
end



return t
