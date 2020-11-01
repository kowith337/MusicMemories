
local Timu = 0
local Dayy = 0

local function DayNight(self)
	local this = self:GetChildren()

	Timu = Hour()*60+Minute()+Second()/60



	if Timu <= 5*60 then
		--Night
		Dayy = 0
	elseif Timu <= 6*60 then
		--Night -> Day
		Dayy = scale(Timu,5*60,6*60,0,1)
	elseif Timu <= 19*60 then
		--Day
		Dayy = 1
	elseif Timu <= 20*60 then
		--Day -> Night
		Dayy = scale(Timu,19*60,20*60,1,0)
	else
		--Night
		Dayy = 0
	end

	this.DayBG:diffusealpha(Dayy)
	this.Stars:diffusealpha(scale(Dayy,0,1,1,0.25))
	this.Cloud:diffuse(ScaleColor(Dayy,0,1,{0.2,0.2,0.2,1},{1,1,1,1}))

end

local t = Def.ActorFrame{
	InitCommand=function(self) self:SetUpdateFunction(DayNight) end;



	Def.Quad{
		Name ="VeryBG";
		OnCommand=cmd(FullScreen;diffuse,color("#000000FF"));
	};

	LoadActor("Night.png")..{
		Name ="NightBG";
		InitCommand=cmd(FullScreen;diffuse,{1,1,1,0.7});
	};
	LoadActor("Day.png")..{
		Name ="DayBG";
		InitCommand=cmd(FullScreen;diffuse,{1,1,1,1});
	};
	Def.ActorFrame{
		OnCommand=cmd(effectclock,"beat";diffuseramp;effectcolor1,color("1,1,1,0.9");effectcolor2,color("1,1,1,0.7");effecttiming,.5,.5,0,0);
		Def.Sprite {
		InitCommand=cmd(diffusealpha,1;pulse;effectclock,'beat';effectmagnitude,1.025,1,1;effecttiming,1,0,1,0);
		CurrentSongChangedMessageCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;finishtweening;sleep,0.32;queuecommand,"ModifySongBackground");
		ModifySongBackgroundCommand=function(self)
			if GAMESTATE:GetCurrentSong() then
				if GAMESTATE:GetCurrentSong():GetBackgroundPath() then
					self:visible(true);
					self:LoadBackground(GAMESTATE:GetCurrentSong():GetBackgroundPath());
					self:stretchto(0,0,SCREEN_WIDTH,SCREEN_HEIGHT);
				else
					self:visible(false);
				end;
				self:diffusealpha(scale(Dayy,0,1,0.75,1))
			else
				self:visible(false);
			end;
		end;	
	};};

	Def.Sprite {
		InitCommand=cmd(x,0;y,0;diffusealpha,0.8);
		CurrentSongChangedMessageCommand=cmd(finishtweening;sleep,0.32;queuecommand,"ModifySongBackground");
		ModifySongBackgroundCommand=function(self)
			if GAMESTATE:GetCurrentSong() then
				if GAMESTATE:GetCurrentSong():GetBackgroundPath() then
					self:diffusealpha(0);
					self:visible(true);
					self:Load(GAMESTATE:GetCurrentSong():GetPreviewVidPath());
					self:stretchto(0,0,SCREEN_WIDTH,SCREEN_HEIGHT);

					self:accelerate(1):diffusealpha(scale(Dayy,0,1,0.55,0.8))
				else
					self:visible(false);
				end;
			else
				self:visible(false);
			end;
		end;	
	};

	LoadActor("cloud.png")..{
		Name ="Cloud";
		InitCommand=cmd(Center;zoom,1;diffuse,{1,1,1,1};texcoordvelocity,0.0003,0;);
	};



	
};


local function PicDlcRand()

	local path = THEMEDIR().."/BGAnimations/ScreenWithMenuElements background/DLC/"
	local files = FILEMAN:GetDirListing(path)

	local LL = {}

	for k,filename in ipairs(files) do
		LL[#LL+1] = filename;
	end


	return "DLC/"..LL[math.random(1,#LL)]
end

local Stars = Def.ActorFrame{
	Name = "Stars";
};


for i = 1,100 do

	if math.random(1,10) == 1 then
		Stars[#Stars+1] = LoadActor("../ScreenWithMenuElements background/"..PicDlcRand())..{
			InitCommand=cmd(zoom,math.random(1,10)/10*0.5;x,math.random(0,SCREEN_RIGHT);y,math.random(0,SCREEN_BOTTOM);diffusealpha,math.random(0,30)/30;rotationz,math.random(-60,60));
			OnCommand=cmd(effectclock,"beat";diffuseshift;effectcolor1,{1,1,1,1};effectcolor2,{1,1,1,0.2};effectperiod,16;effectoffset,math.random(1,8));
		};
	else
		Stars[#Stars+1] = LoadActor("Aura.png")..{
			InitCommand=cmd(zoom,math.random(1,10)/10*0.01;x,math.random(0,SCREEN_RIGHT);y,math.random(0,SCREEN_BOTTOM);diffusealpha,math.random(0,30)/30);
			OnCommand=cmd(effectclock,"beat";diffuseshift;effectcolor1,{1,1,1,1};effectcolor2,{1,1,1,0.2};effectperiod,16;effectoffset,math.random(1,8));
		};
	end
end


t[#t+1] = Stars;

local function GameTypePic()
	local path = THEMEDIR().."/BGAnimations/ScreenWithMenuElements background/Star_"

	if FILEMAN:DoesFileExist(path..GAMESTATE:GetCurrentGame():GetName()..".png") then
		return "Star_"..GAMESTATE:GetCurrentGame():GetName()..".png"
	else
		return "DLC/OutFox.png"
	end


end


--GAMESTATE:GetCurrentSong()

t[#t+1]=LoadActor("../ScreenWithMenuElements background/"..GameTypePic())..{
	InitCommand=cmd(x,math.random(100,200);y,math.random(250,300);zoom,0.75;diffusealpha,0.75;rotationz,math.random(0,35));
	OnCommand=cmd(wag;effectmagnitude,0,0,5;effectclock,"beat";effectperiod,32);
};


--GAMESTATE:GetCurrentSong()


return t;
