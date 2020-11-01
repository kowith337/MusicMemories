

local Color_SA = {}
local TitleText = {}
local SubText = {}
local function Parti(am)
    local P = Def.ActorFrame{}

    for i = 1,math.random(am,am*1.3) do

        local ang = math.random(0,360)/180*math.pi
        local sp = math.random(60,120)
        SM("\n\n\n\n\n"..ang)
        P[#P+1] = LoadActor("Aura.png")..{
            InitCommand=cmd(x,64*2.1*(math.random(0,1)==1 and -1 or 1);y,math.random(0,SCREEN_BOTTOM)-SCREEN_CENTER_Y;zoom,0.03;diffusealpha,0);
            FcStageMessageCommand=cmd(sleep,0.5;diffuse,Color_SA[PLAYER_1];decelerate,1.5;addx,math.cos(ang)*sp;addy,math.sin(ang)*sp;diffusealpha,0);
        }
    end

    return P;


end






local t = Def.ActorFrame{
    InitCommand=cmd(Center);
    OnCommand=cmd(sleep,2;queuecommand,"FcStage");
    FcStageMessageCommand=function(self)
        if true then--Stage
            
            Color_SA[PLAYER_1] = GameColor.Judgment.JudgmentLine_W1
            TitleText[PLAYER_1] = "FC"
            SubText[PLAYER_1] = "Almost all perfect but 1 great..."


        else
            self:visible(false)
        end
    end;

    Def.Quad{
        InitCommand=cmd(zoomx,64*5;zoomy,SCREEN_BOTTOM*1.2;fadeleft,0.1;faderight,0.1;croptop,1;diffuse,{1,1,1,0.4};);
        FcStageMessageCommand=cmd(decelerate,0.4;croptop,0;sleep,0.1;decelerate,0.4;cropbottom,1);
    };
    Def.Quad{
        InitCommand=cmd(zoomx,64*5;zoomy,SCREEN_BOTTOM*1.2;fadeleft,0.1;faderight,0.1;croptop,1;diffusealpha,0.7);
        FcStageMessageCommand=cmd(diffuse,Color_SA[PLAYER_1];sleep,0.5;decelerate,0.1;croptop,0;decelerate,0.4;zoomx,64*5.5;diffusealpha,0.4;fadeleft,0.12;faderight,0.12;sleep,0+2;decelerate,0.3;cropbottom,1);
    };
    LoadFont("Common Large")..{
        InitCommand=cmd(y,-150;diffusealpha,0;shadowlength,2;skewx,-0.2);
        FcStageMessageCommand=cmd(settext,TitleText[PLAYER_1];diffuse,Color_SA[PLAYER_1];diffusealpha,0;sleep,0.5;decelerate,0.2;y,-60;diffusealpha,1;sleep,0.3+2;decelerate,0.3;diffusealpha,0);
    };
    LoadFont("Common Normal")..{
        InitCommand=cmd(y,70;diffusealpha,0;shadowlength,1;);
        FcStageMessageCommand=cmd(settext,SubText[PLAYER_1];diffuse,Color_SA[PLAYER_1];diffusealpha,0;sleep,0.5;decelerate,0.25;y,30;diffusealpha,1;sleep,0.25+2;decelerate,0.3;diffusealpha,0);
    };

    Parti(30);

};

return t;