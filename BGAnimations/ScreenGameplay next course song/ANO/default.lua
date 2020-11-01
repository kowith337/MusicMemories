local t = Def.ActorFrame{};
t[#t+1] = Def.ActorFrame{
	FOV = (0);
	StartCommand=cmd(Center;queuecommand,"INTA");
	INTACommand=function(self)
		self:decelerate(0.5)
		self:rotationx(75):rotationy(35):zoom(2.2)
		self:linear(3)
		self:rotationx(80):rotationy(45):zoom(2.7)
	end;
	Def.ActorFrame{
		StartCommand=cmd(queuecommand,"INTB");
	INTBCommand=function(self)
		self:x(80):y(0)
		self:linear(3)
		self:x(100):y(0)
	end;
	LoadActor("3DStuff")..{
		StartCommand=cmd(queuecommand,"INTC");
		INTCCommand=function(self)
		self:z(20)
		self:linear(3)
		self:z(10)
	end;
	};
	};
	};

t[#t+1] = Def.Quad{
StartCommand=cmd(zoom,99999;diffuse,color("#000000FF");linear,1;diffusealpha,0);
};
return t;