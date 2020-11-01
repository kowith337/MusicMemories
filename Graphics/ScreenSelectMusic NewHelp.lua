return Def.HelpDisplay {
	File = THEME:GetPathF("HelpDisplay", "text");
	InitCommand=function(self)
		
		local helper = "";

		if THEME:HasString(Var "LoadingScreen","HelpText"..GAMESTATE:GetCurrentGame():GetName()) then
			helper = THEME:GetString(Var "LoadingScreen","HelpText"..GAMESTATE:GetCurrentGame():GetName()) 
		else
			helper = THEME:GetString(Var "LoadingScreen","HelpText")
		end

		self:SetTipsColonSeparated(helper);
	end;
};