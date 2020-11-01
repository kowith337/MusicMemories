local yao2 = 0;
local Lim2 = 400;
local profile2 = PROFILEMAN:GetProfile(PLAYER_2);
local name2 = profile2:GetDisplayName();
local Realname2;
local Samname2;
if not GAMESTATE:IsHumanPlayer(PLAYER_2) then
Realname2="Bad Guy!";
Samname2="Bad Guy!";
elseif name2 == "" then
Realname2="P1 Guy";
Samname2="P1 Guy";
else
Realname2=name2;
Samname2=name2;
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
				InitCommand=cmd(x,SCREEN_CENTER_X+(SCREEN_CENTER_X-(SCREEN_CENTER_X+2.5-175));y,56.75;zoom,0.6*(24/72);horizalign,right;visible,GAMESTATE:IsPlayerEnabled(PLAYER_2);diffusealpha,0);
				OnCommand=cmd(playcommand,"Loop");
				LoopCommand=function(self)
					self:settext(Samname2);
					yao2 = self:GetWidth();
					if yao2 > 400 then
					Samname2 = string.sub(Realname2,1,string.len(Realname2)-1).."...";
					Realname2 = string.sub(Realname2,1,string.len(Realname2)-1);
					end
				self:sleep(0.02)
				self:queuecommand("Loop")
				end;
};
LoadFont("_rockwell 72px")..{
				InitCommand=cmd(x,SCREEN_CENTER_X+(SCREEN_CENTER_X-(SCREEN_CENTER_X+2.5-175));y,56.75;zoom,0.6*(24/72);horizalign,right;visible,GAMESTATE:IsPlayerEnabled(PLAYER_2);diffuse,PlayerColor(PLAYER_2));
				OnCommand=cmd(playcommand,"Loop");
				LoopCommand=function(self)
					
					if GAMESTATE:IsHumanPlayer(PLAYER_2) == true then
							self:settext( Samname2 );
					end
				if yao2 > 400 then
				self:sleep(0.02)
				self:queuecommand("Loop")
				end
				end;
};
LoadFont("_rockwell 72px")..{
	InitCommand=cmd(x,SCREEN_CENTER_X+(SCREEN_CENTER_X-(SCREEN_CENTER_X+2.5-175*1.25));y,56.75;zoom,0.8*(24/72);visible,GAMESTATE:IsPlayerEnabled(PLAYER_2);diffuse,PlayerColor(PLAYER_2));
				OnCommand=cmd(playcommand,"Loop");
				LoopCommand=function(self)
				if TP.Battle.IsBattle and TP.Battle.Mode == "Ac" then
				if TP.Battle.Hidden then
				self:settext("??.??%");
				else
				self:settext(KodPercent(STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_2):GetPercentDancePoints()*100))
				if STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetPercentDancePoints() <= STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_2):GetPercentDancePoints() then
		self:pulse()
		self:effecttiming(0.25,0.25,0.25,0.25);
		self:effectmagnitude(1,1.15,1)
		self:effectclock("beat")
		else
		self:stopeffect()
				end
				end
				else
				self:settext(KodPercent(STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_2):GetPercentDancePoints()*100))
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