local t = Def.ActorFrame{

    StartTransitioningCommand=function(self)
        local Factor= 0.6
        SCREENMAN:GetTopScreen():zoom(Factor):x((1-Factor)*SCREEN_CENTER_X):y((1-Factor)*SCREEN_CENTER_Y-50)
    end;

    Def.Quad{
        OnCommand=cmd(CenterX;zoomx,SCREEN_RIGHT;y,SCREEN_BOTTOM-100;zoomy,200;diffuse,{0,0,0,1};fadetop,1);
    };
    LoadActor("WHAT.png")..{
        OnCommand=cmd(Center;y,SCREEN_CENTER_Y+185;zoom,1);
    };
    LoadActor("Whatttt.mp3")..{
        StartTransitioningCommand=cmd(play);
    };

    

};

return t;