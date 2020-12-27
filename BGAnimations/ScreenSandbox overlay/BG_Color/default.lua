local t = Def.ActorFrame{

    Def.ActorFrame{
        InitCommand=cmd(Center);
        LoadActor("50352933_p0-512.png")..{
            InitCommand=cmd(polygonmode,"PolygonMode_Line");
        };
    };

};

return t;