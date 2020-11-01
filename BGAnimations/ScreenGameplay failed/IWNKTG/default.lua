
local function Blood(amo)
    local x = Def.ActorFrame{};

    for i = 1,amo do
        local Ang = math.random(0,180)
        local velo = math.random(100,300)*2
        local g = 400
        x[#x+1] = Def.ActorFrame{
            OnCommand=cmd(decelerate,velo*math.sin(Ang/180*math.pi)/g;addy,-velo*math.sin(Ang/180*math.pi)/2/g*velo*math.sin(Ang/180*math.pi);accelerate,3-velo*math.sin(Ang/180*math.pi)/g;addy,0.5*g*math.pow(3-velo*math.sin(Ang/180*math.pi)/g,2);diffusealpha,0);
            Def.Quad{
                InitCommand=cmd(x,math.random(-64*2.5,64*2.5);y,math.random(-SCREEN_CENTER_Y,SCREEN_CENTER_Y);zoom,math.random(3,15)/2;rotationx,math.random(0,360);rotationy,math.random(0,360);diffuse,{1,0,0,1});
                OnCommand=cmd(diffusealpha,1;linear,3;addx,velo*math.cos(Ang/180*math.pi)*3;rotationx,math.random(0,360);rotationy,math.random(0,360));
            };
        };
    end

    return x;
end

local t = Def.ActorFrame{

    Def.Quad{
        InitCommand=cmd(FullScreen;diffuse,{0,0,0,0});
        OnCommand=cmd(decelerate,1;diffusealpha,0.7);
    };
    LoadActor("Sudden.png")..{
        InitCommand=cmd(Center;diffusealpha,0);
        OnCommand=cmd(sleep,1;diffusealpha,1);
    };
    LoadActor("SuddenDeath.mp3")..{
        StartTransitioningCommand=cmd(play);
    };

    Def.ActorFrame{
        OnCommand=cmd(Center);
        Blood(100);
    };

};



return t;