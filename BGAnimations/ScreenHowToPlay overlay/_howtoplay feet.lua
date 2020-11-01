return LoadFont("Common Normal") .. {
	Text="Your feet will be used to play!\nyou must know it";
	BeginCommand=function(self)
		self:AddAttribute(5, {Length= 4, Diffuse=Color.Red})
	end;
};
