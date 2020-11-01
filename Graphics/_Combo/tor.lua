local c;
local cf;
local canAnimate = false;
local Troll = TP[ToEnumShortString(player)].ActiveModifiers.ComboColor or "PlayerColor(player)";
local player = Var "Player";
local ShowComboAt = THEME:GetMetric("Combo", "ShowComboAt");
local Pulse = THEME:GetMetric("Combo", "PulseCommand");
local PulseLabel = THEME:GetMetric("Combo", "PulseLabelCommand");

local NumberMinZoom = THEME:GetMetric("Combo", "NumberMinZoom");
local NumberMaxZoom = THEME:GetMetric("Combo", "NumberMaxZoom");
local NumberMaxZoomAt = THEME:GetMetric("Combo", "NumberMaxZoomAt");

local LabelMinZoom = THEME:GetMetric("Combo", "LabelMinZoom");
local LabelMaxZoom = THEME:GetMetric("Combo", "LabelMaxZoom");

local ShowFlashyCombo = ThemePrefs.Get("FlashyCombo")

local t = Def.ActorFrame {
	InitCommand=cmd(vertalign,bottom);
	-- flashy combo elements:
 	LoadActor(THEME:GetPathG("Combo","100Milestone")) .. {
		Name="OneHundredMilestone";
		InitCommand=cmd(visible,ShowFlashyCombo);
		FiftyMilestoneCommand=cmd(playcommand,"Milestone");
	};
	LoadActor(THEME:GetPathG("Combo","1000Milestone")) .. {
		Name="OneThousandMilestone";
		InitCommand=cmd(visible,ShowFlashyCombo);
		ToastyAchievedMessageCommand=cmd(playcommand,"Milestone");
	};
	-- normal combo elements:
	Def.ActorFrame {
		Name="ComboFrame";
		LoadFont( "_blocked 72px.ini") .. {
			Name="Number";
			OnCommand = THEME:GetMetric("Combo", "Numbertor12315OnCommand");
		};
		LoadFont( "_youmurderer bb 82px.ini") .. {
			Name="Misses";
			OnCommand = THEME:GetMetric("Combo", "Numbermisstor12315OnCommand");
		};
		LoadActor("tor_combo")..{
			Name="ComboLabel";
			InitCommand=cmd(Center;draworder,105;thump,1;effectmagnitude,1,1.1,1;effectclock,'beat');
			OnCommand = THEME:GetMetric("Combo", "ComboLabelOnCommand");
		};
		LoadActor("tor_misses")..{
			Name="MissLabel";
			OnCommand = THEME:GetMetric("Combo", "MissLabelOnCommand");
		};
	};
	InitCommand = function(self)
		c = self:GetChildren();
		cf = c.ComboFrame:GetChildren();
		cf.Number:visible(false);
		cf.Misses:visible(false);
		cf.ComboLabel:visible(false)
		cf.MissLabel:visible(false)
	end;
 	TwentyFiveMilestoneCommand=function(self,parent)
		if ShowFlashyCombo then
			(cmd(finishtweening;addy,-4;bounceend,0.125;addy,4))(self);
		end;
	end;
	ComboCommand=function(self, param)
		local iCombo = param.Misses or param.Combo;
		if not iCombo or iCombo < ShowComboAt then
			cf.Number:visible(false);
			cf.Misses:visible(false);
			cf.ComboLabel:visible(false)
			cf.MissLabel:visible(false)
			return;
		end

		cf.ComboLabel:visible(false)
		cf.MissLabel:visible(false)

		param.Zoom = scale( iCombo, 0, NumberMaxZoomAt, NumberMinZoom, NumberMaxZoom );
		param.Zoom = clamp( param.Zoom, NumberMinZoom, NumberMaxZoom );

		param.LabelZoom = scale( iCombo, 0, NumberMaxZoomAt, LabelMinZoom, LabelMaxZoom );
		param.LabelZoom = clamp( param.LabelZoom, LabelMinZoom, LabelMaxZoom );
		if MonthOfYear() == 4-1 and DayOfMonth() == 1 then
		if param.Combo then
			cf.ComboLabel:visible(false)
			cf.MissLabel:visible(true)
		else
			cf.ComboLabel:visible(true)
			cf.MissLabel:visible(false)
		end
		else
		if param.Combo then
			cf.ComboLabel:visible(true)
			cf.MissLabel:visible(false)
		else
			cf.ComboLabel:visible(false)
			cf.MissLabel:visible(true)
		end
		end
		cf.Number:settext( string.format("%i", iCombo) );
		cf.Misses:settext( string.format("%i", iCombo) );
        cf.Number:textglowmode("TextGlowMode_Stroke");
		-- For April FOOL day!
		if MonthOfYear() == 4-1 and DayOfMonth() == 1 then
		if param.FullComboW1 then
			cf.Misses:diffuse(color("#ff0000"));
			cf.Misses:stopeffect();
			cf.Number:stopeffect();
			cf.Misses:visible(true);
			cf.Number:visible(false);
		elseif param.FullComboW2 then
			cf.Misses:diffuse(color("#ff0000"));
			cf.Misses:stopeffect();
			cf.Number:stopeffect();
			cf.Misses:visible(true);
			cf.Number:visible(false);
		elseif param.FullComboW3 then
			cf.Misses:diffuse(color("#ff0000"));
			cf.Misses:stopeffect();
			cf.Number:stopeffect();
			cf.Misses:visible(true);
			cf.Number:visible(false);
		elseif param.Combo then
			cf.Misses:diffuse(color("#ff0000"));
			cf.Misses:stopeffect();
			cf.Number:stopeffect();
			cf.Misses:visible(true);
			cf.Number:visible(false);
		else
			cf.Misses:visible(false);
			cf.Number:visible(true);
			cf.Number:diffuse(Troll);
			cf.Number:strokecolor(Color("Stealth"));
			cf.Number:stopeffect();
		end
		else
		if param.FullComboW1 then
			cf.Number:rainbow();
			cf.Number:strokecolor( GameColor.Judgment["JudgmentLine_W1"] );
            cf.Number:textglowmode("TextGlowMode_Stroke");
			cf.Misses:visible(false);
			cf.Number:visible(true);
		elseif param.FullComboW2 then
			cf.Number:diffuse( GameColor.Judgment["JudgmentLine_W2"] );
			cf.Number:diffusebottomedge(Troll);
			cf.Number:strokecolor( GameColor.Judgment["JudgmentLine_W2"] );
            cf.Number:textglowmode("TextGlowMode_Stroke");
			cf.Number:glowshift();
			cf.Misses:visible(false);
			cf.Number:visible(true);
		elseif param.FullComboW3 then
			cf.Number:diffuse( GameColor.Judgment["JudgmentLine_W3"] );
			cf.Number:diffusebottomedge(Troll);
			cf.Number:strokecolor( GameColor.Judgment["JudgmentLine_W3"] );
            cf.Number:textglowmode("TextGlowMode_Stroke");
			cf.Number:glowshift();
			cf.Misses:visible(false);
			cf.Number:visible(true);
		elseif param.Combo then
			-- instead, just diffuse to white for now. -aj
			cf.Number:diffuse(Troll);
			cf.Number:strokecolor(Color("Stealth"));
			cf.Number:stopeffect();
			cf.Misses:visible(false);
			cf.Number:visible(true);
		else
			cf.Misses:diffuse(color("#ff0000"));
			cf.Misses:stopeffect();
			cf.Number:stopeffect();
			cf.Misses:visible(true);
			cf.Number:visible(false);
		end
		end
		-- Pulse
		Pulse( cf.Number, param );
		Pulse( cf.Misses, param );
		if MonthOfYear() == 4-1 and DayOfMonth() == 1 then
		if param.Combo then
			PulseLabelMisses( cf.MissLabel, param );
		else
			PulseLabel( cf.ComboLabel, param );
		end
		else
		if param.Combo then
			PulseLabel( cf.ComboLabel, param );
		else
			PulseLabelMisses( cf.MissLabel, param );
		end
		end
		-- Milestone Logic
	end;
--[[ 	ScoreChangedMessageCommand=function(self,param)
		local iToastyCombo = param.ToastyCombo;
		if iToastyCombo and (iToastyCombo > 0) then
-- 			(cmd(thump;effectmagnitude,1,1.2,1;effectclock,'beat'))(c.Number)
-- 			(cmd(thump;effectmagnitude,1,1.2,1;effectclock,'beat'))(c.Number)
		else
-- 			c.Number:stopeffect();
		end;
	end; --]]
};

return t;
