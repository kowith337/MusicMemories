
local function DOKIDOKI(self)
	local ACTO = self:GetChildren();

	ACTO.ERA:zoomx(35*math.min(-math.log(math.mod(GAMESTATE:GetSongBeat(),1)),1));

end;

local Isla = Def.ActorFrame{
	InitCommand=cmd(SetUpdateFunction,DOKIDOKI);
	Def.Quad{
		Name = "ERA";
		OnCommand=cmd(horizalign,left;zoomy,23.75);
	};
};
return Isla;