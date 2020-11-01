return Def.HelpDisplay {
	File = THEME:GetPathF("HelpDisplay", "text");
	InitCommand=function(self)
		local s = THEME:GetString(Var "LoadingScreen","HelpText");
		


		self:SetTipsColonSeparated(s);
	end;
};