local t = Def.ActorFrame{
    LoadActor("MEMEDirected (loop)")..{
        StartTransitioningCommand=cmd(play);
    };
    Def.Quad{
        OnCommand=cmd(zoom,99999;diffuse,color("#000000FF"););
    };
    LoadFont("Common Normal")..{
        InitCommand=cmd(diffusealpha,0;Center;zoom,1.2;);
        OnCommand=function(self)
            
    
            self:sleep(1.234)
            self:diffusealpha(1)
            self:settext("Directed by\nROBERT B.WEIDE")
            self:sleep(4.526-1.234)
            self:queuecommand("Ex")
        end;
        ExCommand=cmd(settext,"Executive Producer\nLARRY DAVID";sleep,7.794-4.526;queuecommand,"me");
        meCommand=function(self)
            local lt = "Failed Player\n";
            for player in ivalues(GAMESTATE:GetHumanPlayers()) do
                lt=lt..string.upper( PN_Name(player) ).." ";
            end
            self:settext(lt)
        end
    };
    
};



return t;