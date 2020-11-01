local t = Def.ActorFrame{};
local ScaleBack = {math.random(5,10),math.random(4,8)};
for i = 0,ScaleBack[1] do
for j = 0,ScaleBack[2] do
t[#t+1] = Def.Quad{
	InitCommand=function(self)
	self:x((SCREEN_RIGHT/ScaleBack[1])*(i+0.5))
	self:y((SCREEN_BOTTOM/ScaleBack[2])*(j+0.5))
	self:zoomtowidth(SCREEN_RIGHT/ScaleBack[1]):zoomtoheight(SCREEN_BOTTOM/ScaleBack[2])
	self:diffuse(color("#ffffff00")):rotationy(90)
	end;
	GETOUTOFGAMESMMessageCommand=function(self)
	self:diffusealpha(1):sleep((i+j)/5+0.3):accelerate(0.5):rotationy(0):sleep(0.05):accelerate(0.25):diffuse({0,0,0,1})
	end;
};
end
end

return t;