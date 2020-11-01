return Def.ActorFrame {
	LoadActor(THEME:GetPathB("_frame","3x3"),"rounded black",380,120);
	Def.Quad {
		Name="Underline";
		InitCommand=cmd(y,-12);
		OnCommand=cmd(diffuse,color("#ffd400");shadowlength,1;zoomtowidth,192;fadeleft,0.25;faderight,0.25);
	};
	LoadFont("Common Bold") .. {
		Text=ScreenString("Information");
		InitCommand=cmd(y,-26);
		OnCommand=cmd(skewx,-0.125;diffuse,color("#ffd400");shadowlength,2;shadowcolor,BoostColor(color("#ffd40077"),0.25))
	};
	LoadFont("Common Normal") .. {
		Text="If you misstep repeatedly, your dance\ngauge will decrease until the game\nis DEAD";
		InitCommand=cmd(y,18;wrapwidthpixels,480;vertspacing,-12;shadowlength,1);
		BeginCommand=function(self)
			self:AddAttribute(75, {Length=7, Diffuse=Color.Red});
		end;
		OnCommand=cmd(zoom,0.75);
	};
	LoadFont("Common Normal") .. {
		Text="TIP:if you first miss\nyou will here 'WOOOPP'";
		InitCommand=cmd(y,48;wrapwidthpixels,480;vertspacing,-12;shadowlength,1);
		BeginCommand=function(self)
			self:AddAttribute(75, {Length=7, Diffuse=Color.Red});
		end;
		OnCommand=cmd(zoom,0.5);
	};
};
