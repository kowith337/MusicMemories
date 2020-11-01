local t = Def.ActorFrame {};
t[#t+1] = Def.ActorFrame {
--[[LoadActor( "AquaRays" )..{
InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;diffusealpha,1;blend,Blend.Add;zoomtoheight,SCREEN_HEIGHT;zoomtowidth,SCREEN_WIDTH;);
OnCommand=cmd(cropbottom,0.85;linear,0.5;cropbottom,0.90);
};
LoadActor( "AquaRays" )..{
InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;diffusealpha,1;blend,Blend.Add;zoomtoheight,SCREEN_HEIGHT;zoomtowidth,SCREEN_WIDTH;);
OnCommand=cmd(croptop,0.875;linear,0.5;croptop,0.925);
};]]
Def.Quad{
	InitCommand=cmd(diffuse,color("#333333");fadetop,0.5;x,SCREEN_CENTER_X;y,0;zoomx,SCREEN_RIGHT;zoomy,100);	
};
Def.Quad{
	InitCommand=cmd(diffuse,GameColor.PlayerColors.PLAYER_2 or {0,0,1,1};x,SCREEN_CENTER_X;y,100/2;zoomx,SCREEN_RIGHT;zoomy,2);	
};

Def.Quad{
	InitCommand=cmd(diffuse,color("#555555");x,SCREEN_CENTER_X;y,SCREEN_BOTTOM;zoomx,SCREEN_RIGHT;zoomy,60);	
};
Def.Quad{
	InitCommand=cmd(diffuse,GameColor.PlayerColors.PLAYER_1 or {1,0,0,1};x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-60/2;zoomx,SCREEN_RIGHT;zoomy,2.5);	
};
};
t[#t+1] = StandardDecorationFromFileOptional("Header","Header");
t[#t+1] = StandardDecorationFromFileOptional( "Help", "Help" );
return t