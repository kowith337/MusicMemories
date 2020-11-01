

function Battle_Mode()
local Choicu = {"Accuracy","Knock out"}
	local t = {
		Name = "Battle_Mode",
		LayoutType = "ShowAllInRow",
		SelectType = "SelectOne",
		OneChoiceForAllPlayers = true,
		ExportOnChange = false,
		Choices = Choicu,
		LoadSelections = function(self, list, pn)
			list[1] = true
		end,
		SaveSelections = function(self, list, pn)
			
			TP.Battle.IsBattle = true;
			
			for i, choice in ipairs(self.Choices) do
				if list[i] then
					if choice == "Accuracy" then
						TP.Battle.Mode = "Ac"
					else
						TP.Battle.Mode = "Dr"
					end
				end
			end
			
		end,
		}
	return t
end


function Battle_Count_by()
local Choicu = {"Round","Point"}
	local t = {
		Name = "Battle_Count_by",
		LayoutType = "ShowOneInRow",
		SelectType = "SelectOne",
		OneChoiceForAllPlayers = true,
		ExportOnChange = false,
		Choices = Choicu,
		LoadSelections = function(self, list, pn)
			list[1] = true
		end,
		SaveSelections = function(self, list, pn)
			
			for i, choice in ipairs(self.Choices) do
				if list[i] then
					TP.Battle.Limit.Mode = choice
				end
			end
			
		end,
		}
	return t
end

function Battle_Count()
local Choicu = {"1","2","3","4","5","6","7","8","9","10"}
	local t = {
		Name = "Battle_Count",
		LayoutType = "ShowOneInRow",
		SelectType = "SelectOne",
		OneChoiceForAllPlayers = true,
		ExportOnChange = false,
		Choices = Choicu,
		LoadSelections = function(self, list, pn)
			list[1] = true
		end,
		SaveSelections = function(self, list, pn)
			
			for i, choice in ipairs(self.Choices) do
				if list[i] then
					TP.Battle.Limit.Num = tonumber(choice)
				end
			end
			
		end,
		}
	return t
end

function Battle_FoD()
local Choicu = {THEME:GetString('OptionNames','Off'),THEME:GetString('OptionNames','On')}
	local t = {
		Name = "Battle_FoD",
		LayoutType = "ShowAllInRow",
		SelectType = "SelectOne",
		OneChoiceForAllPlayers = true,
		ExportOnChange = false,
		Choices = Choicu,
		LoadSelections = function(self, list, pn)
			list[1] = true
		end,
		SaveSelections = function(self, list, pn)
			
			for i, choice in ipairs(self.Choices) do
				if list[i] then
					TP.Battle.IsfailorIsDraw = (choice == THEME:GetString('OptionNames','On'))
				end
			end
			
		end,
		}
	return t
end

function Battle_Step()
local Choicu = {"No effect","Harder","Easier","Random"}
	local t = {
		Name = "Battle_Step",
		LayoutType = "ShowAllInRow",
		SelectType = "SelectOne",
		OneChoiceForAllPlayers = true,
		ExportOnChange = false,
		Choices = Choicu,
		LoadSelections = function(self, list, pn)
			list[1] = true
		end,
		SaveSelections = function(self, list, pn)
			
			for i, choice in ipairs(self.Choices) do
				if list[i] then
					TP.Battle.Level = choice
				end
			end
			
		end,
		}
	return t
end

function Battle_Hidden()
local Choicu = {THEME:GetString('OptionNames','Off'),THEME:GetString('OptionNames','On')}
	local t = {
		Name = "Battle_Hidden",
		LayoutType = "ShowAllInRow",
		SelectType = "SelectOne",
		OneChoiceForAllPlayers = true,
		ExportOnChange = false,
		Choices = Choicu,
		LoadSelections = function(self, list, pn)
			list[1] = true
		end,
		SaveSelections = function(self, list, pn)
			
			for i, choice in ipairs(self.Choices) do
				if list[i] then
					TP.Battle.Hidden = (choice == THEME:GetString('OptionNames','On'))
				end
			end
			
		end,
		}
	return t
end

