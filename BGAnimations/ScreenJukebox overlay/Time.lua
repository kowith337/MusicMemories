local plused = false;
local dat = 1;
local Change = math.random(10,25)
local hang = 12;
local NumF = TFO(todayis(31,10),"_terror pro 20px","_determination mono 24px");--NumF;
LoadActor("../_save/SampleText.lua")
local Os = 0;
if DayOfMonth() ~= day or MonthOfYear()-1 ~= mon or Year() ~= year then
Os = 0
Od = DayOfMonth()
Om = MonthOfYear()-1
Oy = Year()
else
Os = sec
Od = day
Om = mon
Oy = year
end
local TiTe = {
{0,0,0,0,0,0,":"},--Dance
{0,0,0,0,0,0,":"},--Now
{0,0,0,0,0,0,":"}--PlayTime
};
local t = Def.ActorFrame{};
	t[#t+1] = Def.ActorFrame{
		Def.ActorFrame{
			OnCommand=cmd(y,60;x,SCREEN_CENTER_X-hang*3.5;zoom,0.8);
			RealMessageCommand=cmd(sleep,0.1*0;decelerate,0.5;rotationx,-120);
			PlayedMessageCommand=cmd(sleep,0.1*0;decelerate,0.5;rotationx,-240);
			RemainMessageCommand=cmd(sleep,0.1*0;decelerate,0.5;rotationx,-360;sleep,0.00001;rotationx,0);
		LoadFont(NumF) .. {
		InitCommand=cmd(diffuse,color("#0011FF");cullmode,'back'); OnCommand=cmd(playcommand,"Row"); RowCommand=function(self)
		self:settext(TiTe[1][1]):sleep(0.02):queuecommand("Row") end; };
		LoadFont(NumF) .. {
		InitCommand=cmd(diffuse,color("#FF8800");cullmode,'back';rotationx,120); OnCommand=cmd(playcommand,"Rowi"); RowiCommand=function(self)
		self:settext(TiTe[2][1]):sleep(0.1):queuecommand("Rowi") end; };
		LoadFont(NumF) .. {
		InitCommand=cmd(diffuse,color("#33EE33");cullmode,'back';rotationx,240); OnCommand=cmd(playcommand,"Rowi"); RowiCommand=function(self)
		self:settext(TiTe[3][1]):sleep(0.1):queuecommand("Rowi") end; };
		};

		Def.ActorFrame{
			OnCommand=cmd(y,60;x,SCREEN_CENTER_X-hang*2.5;zoom,0.8);
			RealMessageCommand=cmd(sleep,0.1*1;decelerate,0.5;rotationx,-120);
			PlayedMessageCommand=cmd(sleep,0.1*1;decelerate,0.5;rotationx,-240);
			RemainMessageCommand=cmd(sleep,0.1*1;decelerate,0.5;rotationx,-360;sleep,0.00001;rotationx,0);
		LoadFont(NumF) .. {
		InitCommand=cmd(diffuse,color("#0011FF");cullmode,'back'); OnCommand=cmd(playcommand,"Row"); RowCommand=function(self)
		self:settext(TiTe[1][2]):sleep(0.02):queuecommand("Row") end; };
		LoadFont(NumF) .. {
		InitCommand=cmd(diffuse,color("#FF8800");cullmode,'back';rotationx,120); OnCommand=cmd(playcommand,"Rowi"); RowiCommand=function(self)
		self:settext(TiTe[2][2]):sleep(0.1):queuecommand("Rowi") end; };
		LoadFont(NumF) .. {
		InitCommand=cmd(diffuse,color("#33EE33");cullmode,'back';rotationx,240); OnCommand=cmd(playcommand,"Rowi"); RowiCommand=function(self)
		self:settext(TiTe[3][2]):sleep(0.1):queuecommand("Rowi") end; };
		};
		
		Def.ActorFrame{
			OnCommand=cmd(y,60;x,SCREEN_CENTER_X-hang*1.5;zoom,0.8);
			RealMessageCommand=cmd(sleep,0.1*2;decelerate,0.5;rotationx,-120);
			PlayedMessageCommand=cmd(sleep,0.1*2;decelerate,0.5;rotationx,-240);
			RemainMessageCommand=cmd(sleep,0.1*2;decelerate,0.5;rotationx,-360;sleep,0.00001;rotationx,0);
		LoadFont(NumF) .. {
		InitCommand=cmd(diffuse,color("#0011FF");cullmode,'back'); OnCommand=cmd(playcommand,"Row"); RowCommand=function(self)
		self:settext(TiTe[1][7]):sleep(0.02):queuecommand("Row") end; };
		LoadFont(NumF) .. {
		InitCommand=cmd(diffuse,color("#FF8800");cullmode,'back';rotationx,120); OnCommand=cmd(playcommand,"Rowi"); RowiCommand=function(self)
		self:settext(TiTe[2][7]):sleep(0.1):queuecommand("Rowi") end; };
		LoadFont(NumF) .. {
		InitCommand=cmd(diffuse,color("#33EE33");cullmode,'back';rotationx,240); OnCommand=cmd(playcommand,"Rowi"); RowiCommand=function(self)
		self:settext(TiTe[3][7]):sleep(0.1):queuecommand("Rowi") end; };
		};
		
		Def.ActorFrame{
			OnCommand=cmd(y,60;x,SCREEN_CENTER_X-hang*0.5;zoom,0.8);
			RealMessageCommand=cmd(sleep,0.1*3;decelerate,0.5;rotationx,-120);
			PlayedMessageCommand=cmd(sleep,0.1*3;decelerate,0.5;rotationx,-240);
			RemainMessageCommand=cmd(sleep,0.1*3;decelerate,0.5;rotationx,-360;sleep,0.00001;rotationx,0);
		LoadFont(NumF) .. {
		InitCommand=cmd(diffuse,color("#0011FF");cullmode,'back'); OnCommand=cmd(playcommand,"Row"); RowCommand=function(self)
		self:settext(TiTe[1][3]):sleep(0.02):queuecommand("Row") end; };
		LoadFont(NumF) .. {
		InitCommand=cmd(diffuse,color("#FF8800");cullmode,'back';rotationx,120); OnCommand=cmd(playcommand,"Rowi"); RowiCommand=function(self)
		self:settext(TiTe[2][3]):sleep(0.1):queuecommand("Rowi") end; };
		LoadFont(NumF) .. {
		InitCommand=cmd(diffuse,color("#33EE33");cullmode,'back';rotationx,240); OnCommand=cmd(playcommand,"Rowi"); RowiCommand=function(self)
		self:settext(TiTe[3][3]):sleep(0.1):queuecommand("Rowi") end; };
		};
		
		Def.ActorFrame{
			OnCommand=cmd(y,60;x,SCREEN_CENTER_X+hang*0.5;zoom,0.8);
			RealMessageCommand=cmd(sleep,0.1*4;decelerate,0.5;rotationx,-120);
			PlayedMessageCommand=cmd(sleep,0.1*4;decelerate,0.5;rotationx,-240);
			RemainMessageCommand=cmd(sleep,0.1*4;decelerate,0.5;rotationx,-360;sleep,0.00001;rotationx,0);
		LoadFont(NumF) .. {
		InitCommand=cmd(diffuse,color("#0011FF");cullmode,'back'); OnCommand=cmd(playcommand,"Row"); RowCommand=function(self)
		self:settext(TiTe[1][4]):sleep(0.02):queuecommand("Row") end; };
		LoadFont(NumF) .. {
		InitCommand=cmd(diffuse,color("#FF8800");cullmode,'back';rotationx,120); OnCommand=cmd(playcommand,"Rowi"); RowiCommand=function(self)
		self:settext(TiTe[2][4]):sleep(0.1):queuecommand("Rowi") end; };
		LoadFont(NumF) .. {
		InitCommand=cmd(diffuse,color("#33EE33");cullmode,'back';rotationx,240); OnCommand=cmd(playcommand,"Rowi"); RowiCommand=function(self)
		self:settext(TiTe[3][4]):sleep(0.1):queuecommand("Rowi") end; };
		};
		
		Def.ActorFrame{
			OnCommand=cmd(y,60;x,SCREEN_CENTER_X+hang*1.5;zoom,0.8);
			RealMessageCommand=cmd(sleep,0.1*5;decelerate,0.5;rotationx,-120);
			PlayedMessageCommand=cmd(sleep,0.1*5;decelerate,0.5;rotationx,-240);
			RemainMessageCommand=cmd(sleep,0.1*5;decelerate,0.5;rotationx,-360;sleep,0.00001;rotationx,0);
		LoadFont(NumF) .. {
		InitCommand=cmd(diffuse,color("#0011FF");cullmode,'back'); OnCommand=cmd(playcommand,"Row"); RowCommand=function(self)
		self:settext(TiTe[1][7]):sleep(0.02):queuecommand("Row") end; };
		LoadFont(NumF) .. {
		InitCommand=cmd(diffuse,color("#FF8800");cullmode,'back';rotationx,120); OnCommand=cmd(playcommand,"Rowi"); RowiCommand=function(self)
		self:settext(TiTe[2][7]):sleep(0.1):queuecommand("Rowi") end; };
		LoadFont(NumF) .. {
		InitCommand=cmd(diffuse,color("#33EE33");cullmode,'back';rotationx,240); OnCommand=cmd(playcommand,"Rowi"); RowiCommand=function(self)
		self:settext(TiTe[3][7]):sleep(0.1):queuecommand("Rowi") end; };
		};
		
		Def.ActorFrame{
			OnCommand=cmd(y,60;x,SCREEN_CENTER_X+hang*2.5;zoom,0.8);
			RealMessageCommand=cmd(sleep,0.1*6;decelerate,0.5;rotationx,-120);
			PlayedMessageCommand=cmd(sleep,0.1*6;decelerate,0.5;rotationx,-240);
			RemainMessageCommand=cmd(sleep,0.1*6;decelerate,0.5;rotationx,-360;sleep,0.00001;rotationx,0);
		LoadFont(NumF) .. {
		InitCommand=cmd(diffuse,color("#0011FF");cullmode,'back'); OnCommand=cmd(playcommand,"Row"); RowCommand=function(self)
		self:settext(TiTe[1][5]):sleep(0.02):queuecommand("Row") end; };
		LoadFont(NumF) .. {
		InitCommand=cmd(diffuse,color("#FF8800");cullmode,'back';rotationx,120); OnCommand=cmd(playcommand,"Rowi"); RowiCommand=function(self)
		self:settext(TiTe[2][5]):sleep(0.1):queuecommand("Rowi") end; };
		LoadFont(NumF) .. {
		InitCommand=cmd(diffuse,color("#33EE33");cullmode,'back';rotationx,240); OnCommand=cmd(playcommand,"Rowi"); RowiCommand=function(self)
		self:settext(TiTe[3][5]):sleep(0.1):queuecommand("Rowi") end; };
		};

		Def.ActorFrame{
			OnCommand=cmd(y,60;x,SCREEN_CENTER_X+hang*3.5;zoom,0.8);
			RealMessageCommand=cmd(sleep,0.1*7;decelerate,0.5;rotationx,-120);
			PlayedMessageCommand=cmd(sleep,0.1*7;decelerate,0.5;rotationx,-240);
			RemainMessageCommand=cmd(sleep,0.1*7;decelerate,0.5;rotationx,-360;sleep,0.00001;rotationx,0);
		LoadFont(NumF) .. {
		InitCommand=cmd(diffuse,color("#0011FF");cullmode,'back'); OnCommand=cmd(playcommand,"Row"); RowCommand=function(self)
		self:settext(TiTe[1][6]):sleep(0.02):queuecommand("Row") end; };
		LoadFont(NumF) .. {
		InitCommand=cmd(diffuse,color("#FF8800");cullmode,'back';rotationx,120); OnCommand=cmd(playcommand,"Rowi"); RowiCommand=function(self)
		self:settext(TiTe[2][6]):sleep(0.1):queuecommand("Rowi") end; };
		LoadFont(NumF) .. {
		InitCommand=cmd(diffuse,color("#33EE33");cullmode,'back';rotationx,240); OnCommand=cmd(playcommand,"Rowi"); RowiCommand=function(self)
		self:settext(TiTe[3][6]):sleep(0.1):queuecommand("Rowi") end; };
		};
	};
	t[#t+1] = LoadFont(NumF) .. {
		InitCommand=cmd(Center);
		OnCommand=cmd(playcommand,"Neptune");
		NeptuneCommand=function(self)
		Remind = math.max(GAMESTATE:GetCurrentSong():GetLastSecond() - GAMESTATE:GetCurMusicSeconds(),0)
		Clockmin = math.floor((Remind)/60)
		Clocksec = math.floor((Remind)-Clockmin*60)
		ClockWTF = (string.format('%.2f',((Remind)-Clockmin*60) - Clocksec))*100
		if ClockWTF >= 50 then
			TiTe[1][7] = ":"
		else
			TiTe[1][7] = ""
		end
		if ClockWTF == 100 then
			OutCW = 99
		elseif ClockWTF < 100 then
			OutCW = ClockWTF
		end
		TiTe[1][1] = math.floor(Clockmin/10)
		TiTe[1][2] = Clockmin-(math.floor(Clockmin/10))*10
		TiTe[1][3] = math.floor(Clocksec/10)
		TiTe[1][4] = Clocksec-(math.floor(Clocksec/10))*10
		TiTe[1][5] = math.floor(OutCW/10)
		TiTe[1][6] = OutCW-(math.floor(OutCW/10))*10
		if GAMESTATE:GetCurMusicSeconds() >= GAMESTATE:GetCurrentSong():GetLastSecond() and not plused then
			plused = true
			Os = Os + GAMESTATE:GetCurrentSong():GetLastSecond()
	local file = RageFileUtil.CreateRageFile()
	file:Open("/Themes/"..ThemeNamae().."/BGAnimations/_save/SampleText.lua", 2 ) --2 = write
	file:PutLine("--Time all SET")
	file:PutLine("sec = "..Os)
	file:PutLine("day = "..Od)
	file:PutLine("mon = "..Om)
	file:PutLine("year = "..Oy)
	file:PutLine("--End of SampleText")
	file:Close();
		elseif GAMESTATE:GetCurMusicSeconds() < GAMESTATE:GetCurrentSong():GetLastSecond() and plused then
			plused = false
		end
		outsec = Os + math.min(math.max(GAMESTATE:GetCurMusicSeconds(),0),GAMESTATE:GetCurrentSong():GetLastSecond()) - TFO( GAMESTATE:GetCurMusicSeconds() > GAMESTATE:GetCurrentSong():GetLastSecond(), GAMESTATE:GetCurrentSong():GetLastSecond(),0)
		outsech = math.floor(outsec/3600)
		outsecm = (math.floor(outsec/60))-outsech*60
		outsecs = math.floor(outsec)-(outsech*60*60+outsecm*60)
		outsecw = (outsec - math.floor(outsec))*100
		if outsecw == 100 then
			RW = 99
		elseif outsecw < 100 then
			RW = outsecw
		end
		if outsecw > 50 then
			TiTe[3][7] = ""
		else
			TiTe[3][7] = ":"
		end
		TiTe[3][1] = math.floor(outsech/10)
		TiTe[3][2] = outsech-(math.floor(outsech/10))*10
		TiTe[3][3] = math.floor(outsecm/10)
		TiTe[3][4] = outsecm-(math.floor(outsecm/10))*10
		TiTe[3][5] = math.floor(outsecs/10)
		TiTe[3][6] = outsecs-(math.floor(outsecs/10))*10
		
		

		if math.mod(Second(),2) == 1 then
			TiTe[2][7] = ":"
		else
			TiTe[2][7] = ""
		end
		TiTe[2][1] = math.floor(Hour()/10)
		TiTe[2][2] = Hour()-(math.floor(Hour()/10))*10
		TiTe[2][3] = math.floor(Minute()/10)
		TiTe[2][4] = Minute()-(math.floor(Minute()/10))*10
		TiTe[2][5] = math.floor(Second()/10)
		TiTe[2][6] = Second()-(math.floor(Second()/10))*10
		if GAMESTATE:GetCurMusicSeconds() >= Change then
			Change = Change + math.random(8,20)
			if dat == 0 then
				MESSAGEMAN:Broadcast("Remain")
				dat = 1
			elseif dat == 1 then
				MESSAGEMAN:Broadcast("Real")
				dat = 2
			elseif dat == 2 then
				MESSAGEMAN:Broadcast("Played")
				dat = 0
			end
		elseif GAMESTATE:GetCurMusicSeconds() < 10 and Change > 25 then
			Change = 0
			dat = 1;
			MESSAGEMAN:Broadcast("Remain")
		end
		--self:settext(outsec)
		self:sleep(0.02)
		self:queuecommand("Neptune")
		end;
	};
return t;