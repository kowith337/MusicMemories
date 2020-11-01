local t = Def.ActorFrame {};
if not GAMESTATE: IsCourseMode() then
return t;
end;
if GAMESTATE: IsCourseMode() then

local
function NumtoST(n)
if math.mod(n, 100) <= 10 then
if math.mod(n, 10) == 1 then
return n..
"st"
elseif math.mod(n, 10) == 2 then
return n..
"nd"
elseif math.mod(n, 10) == 3 then
return n..
"rd"
else
	return n..
"th"
end
elseif math.mod(n, 100) <= 20 then
return n..
"th"
else
if math.mod(n, 10) == 1 then
return n..
"st"
elseif math.mod(n, 10) == 2 then
return n..
"nd"
elseif math.mod(n, 10) == 3 then
return n..
"rd"
else
	return n..
"th"
end
end
end;

local HOLD = 1;

t[#t + 1] = Def.Quad {
	InitCommand = cmd(FullScreen; diffuse, {
		0,
		0,
		0,
		0
	});
	StartCommand = cmd(decelerate, 0.5; diffusealpha, 1);
	FinishCommand = cmd(decelerate, 0.5; diffusealpha, 0);
}

t[#t + 1] = Def.Quad {
	InitCommand = cmd(CenterX; y, SCREEN_CENTER_Y * 1.6; zoomx, SCREEN_RIGHT; zoomy, 200; diffuse, {
		0,
		0,
		0,
		0.3
	};);
	FinishCommand = cmd(decelerate, 0.5; zoomy, 200; sleep, math.max(0.001, HOLD - 1); decelerate, 0.5; zoomy, 0);
};

t[#t + 1] = LoadFont("Common Large").. {
	Text = "Isla : ERROR";
	InitCommand = cmd(CenterX; y, SCREEN_CENTER_Y * 1.3; diffuse, Color.Orange; zoom, 0.75; diffusealpha, 0);
	BeforeLoadingNextCourseSongMessageCommand = function (self)
	self: settext(NumtoST(GAMESTATE: GetCourseSongIndex() + 2)..
		" Memories");
	end;
	FinishCommand = cmd(decelerate, 0.5; diffusealpha, 1; sleep, math.max(0.001, HOLD - 1); decelerate, 0.5; diffusealpha, 0);
};

t[#t + 1] = LoadFont("Common Normal").. {
	InitCommand = cmd(CenterX; y, SCREEN_CENTER_Y + 150; zoom, 1; cropright, 1; diffusealpha, 0;);
	BeforeLoadingNextCourseSongMessageCommand = function (self)
	local ppeng = SCREENMAN: GetTopScreen(): GetNextCourseSong();

	Title = ppeng: GetDisplayMainTitle();

	Sub = ppeng: GetDisplaySubTitle();

	Time = ppeng: MusicLengthSeconds();

	HOLD = ppeng: GetFirstSecond();

	See = color("#FF8800")
	local SE;
	SE = "";
	if Title == ""
	then
	SE = SE..
	"No Title\n"
	else
		SE = SE..Title..
	"\n"
	end
	if Sub ~= ""
	then
	SE = SE..Sub..
	"\n"
	end
	SE = SE..SecondsToMSSMsMs(Time)

	self: settext(SE);


	if Time < 3 * 60 then
	self: stopeffect(): diffuse(Color("White"))
	elseif Time < 5 * 60 then
	self: stopeffect(): diffuse(Color("White")): diffusebottomedge(Color("Red"))
	else
		self: stopeffect(): rainbow()
	end
	self: linear(0.5): cropright(0)
	end;
	FinishCommand = cmd(decelerate, 0.5; diffusealpha, 1; sleep, math.max(0.001, HOLD - 1); decelerate, 0.5; diffusealpha, 0);
};


end
return t;