local t = Def.ActorFrame{};
	t[#t+1] = Def.ActorProxy{
		OnCommand=function(self)
		if SCREENMAN:GetTopScreen():GetChild('PlayerP1') then
		self:x(10)
		self:y(10)
		self:diffuse(color("#FF0000"))
self:SetTarget(SCREENMAN:GetTopScreen():GetChild('PlayerP1'))
		end
		end;
	};



return t;