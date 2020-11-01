local OldVer = false;

local TexttoDeBUG = "";

local Funny=true;




local t = Def.ActorFrame{};

if not OldVer then
t[#t+1] = LoadActor("Border");
if TP.Battle.IsBattle then
t[#t+1] = LoadActor("Battle");
end
t[#t+1] = LoadActor("Ready");
t[#t+1] = LoadActor("321Go");
--t[#t+1] = LoadActor("Hat");
t[#t+1] = LoadActor("SoundReady");
t[#t+1] = LoadActor("Time.lua");
t[#t+1] = LoadActor("BPM");
--t[#t+1] = LoadActor("Song Title");
if ((GAMESTATE:GetPlayerState(PLAYER_1):GetCurrentPlayerOptions():DrainSetting() == "DrainType_SuddenDeath" and GAMESTATE:IsPlayerEnabled(PLAYER_1)) or 
(GAMESTATE:GetPlayerState(PLAYER_2):GetCurrentPlayerOptions():DrainSetting() == "DrainType_SuddenDeath" and GAMESTATE:IsPlayerEnabled(PLAYER_2))) and not ((GAMESTATE:IsCourseMode()) and not GAMESTATE:GetCurrentCourse():IsNonstop()) then
t[#t+1] = LoadActor("Wario's Time");
end

if (GAMESTATE:IsCourseMode()) and not GAMESTATE:GetCurrentCourse():IsNonstop() then
t[#t+1] = LoadActor("Wario's TimP1");
end
if GAMESTATE:IsPlayerEnabled(PLAYER_1) then
t[#t+1] = LoadActor("P1Health");
t[#t+1] = LoadActor("P1State");
--t[#t+1] = LoadActor("P1TapIndicator");
end
if GAMESTATE:IsPlayerEnabled(PLAYER_2) then
t[#t+1] = LoadActor("P2Health");
t[#t+1] = LoadActor("P2State");
--t[#t+1] = LoadActor("P2TapIndicator");
end
t[#t+1] = LoadActor("DancingLine");
--if tostring(SCREENMAN:GetTopScreen():GetScreenType()) ~== "ScreenType_SystemMenu" then
t[#t+1] = LoadActor("Pause");
--end

t[#t+1] = LoadActor("BetterG");














t[#t+1] = LoadFont( "_special elite 108px.ini") .. {
InitCommand=cmd(CenterX;y,300;zoom,0.2);
OnCommand=cmd(playcommand,"Ne");
NeCommand=function(self)
if TexttoDeBUG ~= "" then -- U can Make it 'False' if u Dont wan Them
if math.mod(GAMESTATE:GetSongBeat(),1)< 0.5 and not Funny then
Funny = true
self:diffuse(color((math.random(1,10)/10)..","..(math.random(1,10)/10)..","..(math.random(1,10)/10)..","..1))
elseif math.mod(GAMESTATE:GetSongBeat(),1)>= 0.5 then
Funny = false
end
self:settext("DeBug\n"..TexttoDeBUG.."\n")
self:sleep(1/30)
self:queuecommand("Ne")
end
end;
};
else
t[#t+1] = LoadActor("_Backup");
end;
return t;