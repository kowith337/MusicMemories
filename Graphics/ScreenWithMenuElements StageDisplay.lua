local curScreen = Var "LoadingScreen";
local curStage = GAMESTATE:GetCurrentStage();
local curStageIndex = GAMESTATE:GetCurrentStageIndex();
local t = Def.ActorFrame {};
t[#t+1] = Def.ActorFrame {
	LoadFont("Common Normal") .. {
		InitCommand=cmd(y,5;zoom,0.8;shadowlength,1;skewx,0.125;bob;effectclock,'beat';effectmagnitude,2,0,0;effectperiod,4;);
		BeginCommand=function(self)
			local top = SCREENMAN:GetTopScreen()
			if top then
				if not string.find(top:GetName(),"ScreenEvaluation") then
					curStageIndex = curStageIndex + 1
				end
			end
			self:playcommand("Set")
		end;
		SetCommand=function(self)
			if GAMESTATE:GetCurrentCourse() then
				self:settext( curStageIndex+1 .. " / " .. GAMESTATE:GetCurrentCourse():GetEstimatedNumStages() );
			elseif GAMESTATE:IsEventMode() then
				self:settextf("Stage %s", curStageIndex);
			else


				-- hack: ScreenEvaluation shows the current stage, but it needs to
				-- show the last stage instead. PlayedStageStats has the right one.
				if string.find(curScreen,"Evaluation") then
					local stageStats = STATSMAN:GetPlayedStageStats(1)
					curStage = stageStats:GetStage()
				end

				if THEME:GetMetric(curScreen,"StageDisplayUseShortString") then
					self:settextf("%s", ToEnumShortString(curStage));
					self:zoom(0.75);
				else
					self:settextf("%s Stage", ToEnumShortString(curStage));
					self:zoom(1);
				end;
			end;
			-- StepMania is being stupid so we have to do this here;
		self:diffuse(NumStageColor(curStageIndex+1))
		end;
	};
};
return t
