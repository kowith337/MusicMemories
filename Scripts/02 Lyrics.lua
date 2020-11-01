function Actor:LyricCommand(side)
	self:draworder(DrawOrder.Screen+1);
	self:settext(Var "LyricText")

	self:finishtweening()
	self:shadowlengthx(0)
	self:shadowlengthy(0)
	self:strokecolor(Color("Outline"))
	self:zoomx(clamp(SCREEN_WIDTH/(self:GetZoomedWidth()+1), 0, 1))

	local Color = Var "LyricColor"
	local Factor = 1
	if side == "Back" then
		Factor = 0.5
	elseif side == "Front" then
		Factor = 0.9
	end
	self:diffuse({
		Color[1] * Factor,
		Color[2] * Factor,
		Color[3] * Factor,
		Color[4] * Factor
	})

	if side == "Front" then
		self:cropright(1)
		self:strokecolor(ColorTone(Color));
        self:textglowmode("TextGlowMode_Stroke");
	elseif side == "Back" then
		self:diffusealpha(0)
		if ColorCmp(ColorTone(Color),{1,1,1,0}) then
			self:strokecolor({0.8,0.8,0.8,1});
		else
			self:strokecolor({0.2,0.2,0.2,1});
		end
		
        self:textglowmode("TextGlowMode_Stroke");
	else
		self:strokecolor(ColorTone(Color));
		self:cropleft(0)
	end
	
	self:zoomy(1)
	
	if side == "Back" then
		self:decelerate( Var "LyricDuration" * 0.15)
		self:diffusealpha(1)
	else
	self:linear( Var "LyricDuration" * 0.1)
	end
	if side == "Back" then
	self:sleep( Var "LyricDuration" * 0.70)
	else
	self:linear( Var "LyricDuration" * 0.75)
	end
	if side == "Front" then
		self:cropright(0)
	end
	self:sleep(0.001)
	if side == "Back" then
	else
	self:accelerate( Var "LyricDuration" * 0.15 )
	end
	self:diffusealpha(0)
end

-- (c) 2006 Glenn Maynard
-- All rights reserved.
-- 
-- Permission is hereby granted, free of charge, to any person obtaining a
-- copy of this software and associated documentation files (the
-- "Software"), to deal in the Software without restriction, including
-- without limitation the rights to use, copy, modify, merge, publish,
-- distribute, and/or sell copies of the Software, and to permit persons to
-- whom the Software is furnished to do so, provided that the above
-- copyright notice(s) and this permission notice appear in all copies of
-- the Software and that both the above copyright notice(s) and this
-- permission notice appear in supporting documentation.
-- 
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
-- OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
-- MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT OF
-- THIRD PARTY RIGHTS. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR HOLDERS
-- INCLUDED IN THIS NOTICE BE LIABLE FOR ANY CLAIM, OR ANY SPECIAL INDIRECT
-- OR CONSEQUENTIAL DAMAGES, OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS
-- OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
-- OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
-- PERFORMANCE OF THIS SOFTWARE.

