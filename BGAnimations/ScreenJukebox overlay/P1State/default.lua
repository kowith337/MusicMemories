local yao1 = 0;
local Lim1 = 400;
local profile1 = PROFILEMAN:GetProfile(PLAYER_1);
local name1 = profile1:GetDisplayName();
local RealName1;
local SamName1;
if not GAMESTATE:IsHumanPlayer(PLAYER_1) then
RealName1="Bad Guy!";
SamName1="Bad Guy!";
elseif name1 == "" then
RealName1="P1 Guy";
SamName1="P1 Guy";
else
RealName1=name1;
SamName1=name1;
end--THESE for some (crazy) player has long name (Eg.IAmTheBesttttttttttt --> IAmTheBestt... )
function KodPercent(p)
if p < 10 then
return string.format("0%.2f",p).."%";
elseif p >= 10 and p < 100 then
return string.format("%.2f",p).."%";
elseif p == 100 then
return "100%!!";
end
end

local t = Def.ActorFrame{};
t[#t+1] = Def.ActorFrame{
LoadFont("_rockwell 72px")..{--Dummy
				InitCommand=cmd(x,SCREEN_CENTER_X+2.5-175;y,56.75;zoom,0.6*(24/72);horizalign,left;visible,GAMESTATE:IsPlayerEnabled(PLAYER_1);diffusealpha,0);
				OnCommand=cmd(playcommand,"Loop");
				LoopCommand=function(self)
					self:settext(SamName1);
					yao1 = self:GetWidth();
					if yao1 > 400 then
					SamName1 = string.sub(RealName1,1,string.len(RealName1)-1).."...";
					RealName1 = string.sub(RealName1,1,string.len(RealName1)-1);
					end
				self:sleep(0.02)
				self:queuecommand("Loop")
				end;
};
LoadFont("_rockwell 72px")..{
				InitCommand=cmd(x,SCREEN_CENTER_X+2.5-175;y,56.75;zoom,0.6*(24/72);horizalign,left;visible,GAMESTATE:IsPlayerEnabled(PLAYER_1);diffuse,PlayerColor(PLAYER_1));
				OnCommand=cmd(playcommand,"Loop");
				LoopCommand=function(self)
					local profile = PROFILEMAN:GetProfile(PLAYER_1);
					local name = profile:GetDisplayName();
					
					if GAMESTATE:IsHumanPlayer(PLAYER_1) == true then
							self:settext( SamName1 );
					end
				if yao1 > 400 then
				self:sleep(0.02)
				self:queuecommand("Loop")
				end
				end;
};
LoadFont("_rockwell 72px")..{
	InitCommand=cmd(x,SCREEN_CENTER_X+2.5-175*1.25;y,56.75;zoom,0.8*(24/72);visible,GAMESTATE:IsPlayerEnabled(PLAYER_1);diffuse,PlayerColor(PLAYER_1));
				OnCommand=cmd(playcommand,"Loop");
				LoopCommand=function(self)
				if TP.Battle.IsBattle and TP.Battle.Mode == "Ac" then
				if TP.Battle.Hidden then
				self:settext("??.??%");
				else
				self:settext(KodPercent(STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetPercentDancePoints()*100))
				if STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_2):GetPercentDancePoints() <= STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetPercentDancePoints() then
		self:pulse()
		self:effecttiming(0.25,0.25,0.25,0.25);
		self:effectmagnitude(1,1.15,1)
		self:effectclock("beat")
		else
		self:stopeffect()
				end
				end
				else
				self:settext(KodPercent(STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetPercentDancePoints()*100))
				end
				self:sleep(0.02)
				self:queuecommand("Loop")
				end;
};
};
--t[#t+1] = LoadActor("Option.lua");
if GAMESTATE:IsCourseMode() then
t[#t+1] = LoadActor("Cr");
else
t[#t+1] = LoadActor("St");
end
return t;