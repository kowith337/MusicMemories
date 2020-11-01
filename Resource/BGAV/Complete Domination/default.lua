local bInterval=0
local A = 0;
return Def.ActorFrame{
    Name= "actor_B",
    OnCommand= function(self)
	
	buildingsContainer=self;
	self:sleep(0);
	
	end,
	Def.Quad{
		OnCommand=cmd(FullScreen;diffuse,{0,0,0,1}),
	},
    Def.Sprite{
      Name= "actor_C",
      OnCommand= function(self)
		
		blur0=self;
		
		self:x(SCREEN_CENTER_X-290);
		self:y(SCREEN_CENTER_Y+155);
		self:diffuse(197/255,0/255,232/255,1);
		self:sleep(200)
		
		end,
      Texture= "buildings/blur/0.png",
    },
    Def.Sprite{
      Name= "actor_D",
      OnCommand= function(self)
		
		blur1=self;
		
		self:x(SCREEN_CENTER_X-246);
		self:y(SCREEN_CENTER_Y+125);
		self:diffuse(197/255,0/255,232/255,1);
		self:sleep(200);
		
		end,
      Texture= "buildings/blur/1.png",
    },
    Def.Sprite{
      Name= "actor_E",
      OnCommand= function(self)
		
		blur2=self;
		
		self:x(SCREEN_CENTER_X-195);
		self:y(SCREEN_CENTER_Y+175);
		self:diffuse(197/255,0/255,232/255,1);
		self:sleep(200)
		
		end,
      Texture= "buildings/blur/2.png",
    },
    Def.Sprite{
      Name= "actor_F",
      OnCommand= function(self)
		
		self:x(SCREEN_CENTER_X-166);
		self:y(SCREEN_CENTER_Y+150);
		self:diffuse(197/255,0/255,232/255,1);
		self:sleep(200);
		
		blur3=self;
		
		end,
      Texture= "buildings/blur/3.png",
    },
    Def.Sprite{
      Name= "actor_ab",
      OnCommand= function(self)
		
		self:x(SCREEN_CENTER_X-145);
		self:y(SCREEN_CENTER_Y+95);
		self:diffuse(197/255,0/255,232/255,1);
		self:sleep(200)
		
		blur4=self;
		
		end,
      Texture= "buildings/blur/4.png",
    },
    Def.Sprite{
      Name= "actor_bb",
      OnCommand= function(self)
		
		self:x(SCREEN_CENTER_X-90);
		self:y(SCREEN_CENTER_Y+115);
		self:diffuse(197/255,0/255,232/255,1);
		self:sleep(200);
		
		blur5=self;
		
		end,
      Texture= "buildings/blur/5.png",
    },
    Def.Sprite{
      Name= "actor_cb",
      OnCommand= function(self)
		
		blur6=self;
		
		self:x(SCREEN_CENTER_X-55);
		self:y(SCREEN_CENTER_Y+49);
		self:diffuse(197/255,0/255,232/255,1);
		self:sleep(200)
		
		end,
      Texture= "buildings/blur/6.png",
    },
    Def.Sprite{
      Name= "actor_db",
      OnCommand= function(self)
		
		blur7=self;
		
		self:x(SCREEN_CENTER_X+15);
		self:y(SCREEN_CENTER_Y+190);
		self:diffuse(197/255,0/255,232/255,1);
		self:sleep(200)
		
		end,
      Texture= "buildings/blur/7.png",
    },
    Def.Sprite{
      Name= "actor_eb",
      OnCommand= function(self)
		
		blur8=self;
		
		self:x(SCREEN_CENTER_X+30);
		self:y(SCREEN_CENTER_Y+69);
		self:diffuse(197/255,0/255,232/255,1);
		self:sleep(200)
		
		end,
      Texture= "buildings/blur/8.png",
    },
    Def.Sprite{
      Name= "actor_fb",
      OnCommand= function(self)
		
		blur9=self;
		
		self:x(SCREEN_CENTER_X+90);
		self:y(SCREEN_CENTER_Y+202);
		self:diffuse(197/255,0/255,232/255,1);
		self:sleep(200)
		
		end,
      Texture= "buildings/blur/9.png",
    },
    Def.Sprite{
      Name= "actor_gb",
      OnCommand= function(self)
		
		
		blur10=self;
		
		self:x(SCREEN_CENTER_X+117);
		self:y(SCREEN_CENTER_Y+50);
		self:diffuse(197/255,0/255,232/255,1);
		self:sleep(200)
		
		end,
      Texture= "buildings/blur/10.png",
    },
    Def.Sprite{
      Name= "actor_hb",
      OnCommand= function(self)
		
		blur11=self;
		
		self:x(SCREEN_CENTER_X+160);
		self:y(SCREEN_CENTER_Y+165);
		self:diffuse(197/255,0/255,232/255,1);
		self:sleep(200)
		
		end,
      Texture= "buildings/blur/11.png",
    },
    Def.Sprite{
      Name= "actor_ib",
      OnCommand= function(self)
		
		blur12=self;
		
		self:x(SCREEN_CENTER_X+216);
		self:y(SCREEN_CENTER_Y+140);
		self:diffuse(197/255,0/255,232/255,1);
		self:sleep(200)
		
		end,
      Texture= "buildings/blur/12.png",
    },
    Def.Sprite{
      Name= "actor_jb",
      OnCommand= function(self)
		
		blur13=self;
		
		self:x(SCREEN_CENTER_X+257);
		self:y(SCREEN_CENTER_Y+153);
		self:diffuse(197/255,0/255,232/255,1);
		self:sleep(200)
		
		end,
      Texture= "buildings/blur/13.png",
    },
    Def.Sprite{
      Name= "actor_kb",
      OnCommand= function(self)
		
		blur14=self;
		
		self:x(SCREEN_CENTER_X+295);
		self:y(SCREEN_CENTER_Y+190);
		self:diffuse(197/255,0/255,232/255,1);
		self:sleep(200)
		
		end,
      Texture= "buildings/blur/14.png",
    },
    Def.Sprite{
      Name= "actor_lb",
      OnCommand= function(self)
		
		bld0=self;
		
		self:x(SCREEN_CENTER_X-290);
		self:y(SCREEN_CENTER_Y+155);
		self:diffuse(0,0,0,1);
		self:sleep(200)
		
		end,
      Texture= "buildings/0.png",
    },
    Def.Sprite{
      Name= "actor_mb",
      OnCommand= function(self)
		
		bld1=self;
		
		self:x(SCREEN_CENTER_X-246);
		self:y(SCREEN_CENTER_Y+125);
		self:diffuse(0,0,0,1);
		self:sleep(200);
		
		end,
      Texture= "buildings/1.png",
    },
    Def.Sprite{
      Name= "actor_nb",
      OnCommand= function(self)
		
		bld2=self;
		
		self:x(SCREEN_CENTER_X-195);
		self:y(SCREEN_CENTER_Y+175);
		self:diffuse(0,0,0,1);
		self:sleep(200)
		
		end,
      Texture= "buildings/2.png",
    },
    Def.Sprite{
      Name= "actor_ob",
      OnCommand= function(self)
		
		self:x(SCREEN_CENTER_X-166);
		self:y(SCREEN_CENTER_Y+150);
		self:diffuse(0,0,0,1);
		self:sleep(200);
		
		bld3=self;
		
		end,
      Texture= "buildings/3.png",
    },
    Def.Sprite{
      Name= "actor_pb",
      OnCommand= function(self)
		
		self:x(SCREEN_CENTER_X-145);
		self:y(SCREEN_CENTER_Y+95);
		self:diffuse(0,0,0,1);
		self:sleep(200)
		
		bld4=self;
		
		end,
      Texture= "buildings/4.png",
    },
    Def.Sprite{
      Name= "actor_qb",
      OnCommand= function(self)
		
		self:x(SCREEN_CENTER_X-90);
		self:y(SCREEN_CENTER_Y+115);
		self:diffuse(0,0,0,1);
		self:sleep(200);
		
		bld5=self;
		
		end,
      Texture= "buildings/5.png",
    },
    Def.Sprite{
      Name= "actor_rb",
      OnCommand= function(self)
		
		bld6=self;
		
		self:x(SCREEN_CENTER_X-55);
		self:y(SCREEN_CENTER_Y+49);
		self:diffuse(0,0,0,1);
		self:sleep(200)
		
		end,
      Texture= "buildings/6.png",
    },
    Def.Sprite{
      Name= "actor_sb",
      OnCommand= function(self)
		
		bld7=self;
		
		self:x(SCREEN_CENTER_X+15);
		self:y(SCREEN_CENTER_Y+190);
		self:diffuse(0,0,0,1);
		self:sleep(200)
		
		end,
      Texture= "buildings/7.png",
    },
    Def.Sprite{
      Name= "actor_tb",
      OnCommand= function(self)
		
		bld8=self;
		
		self:x(SCREEN_CENTER_X+30);
		self:y(SCREEN_CENTER_Y+69);
		self:diffuse(0,0,0,1);
		self:sleep(200)
		
		end,
      Texture= "buildings/8.png",
    },
    Def.Sprite{
      Name= "actor_ub",
      OnCommand= function(self)
		
		bld9=self;
		
		self:x(SCREEN_CENTER_X+90);
		self:y(SCREEN_CENTER_Y+202);
		self:diffuse(0,0,0,1);
		self:sleep(200)
		
		end,
      Texture= "buildings/9.png",
    },
    Def.Sprite{
      Name= "actor_vb",
      OnCommand= function(self)
		
		
		bld10=self;
		
		self:x(SCREEN_CENTER_X+117);
		self:y(SCREEN_CENTER_Y+50);
		self:diffuse(0,0,0,1);
		self:sleep(200)
		
		end,
      Texture= "buildings/10.png",
    },
    Def.Sprite{
      Name= "actor_wb",
      OnCommand= function(self)
		
		bld11=self;
		
		self:x(SCREEN_CENTER_X+160);
		self:y(SCREEN_CENTER_Y+165);
		self:diffuse(0,0,0,1);
		self:sleep(200)
		
		end,
      Texture= "buildings/11.png",
    },
    Def.Sprite{
      Name= "actor_xb",
      OnCommand= function(self)
		
		bld12=self;
		
		self:x(SCREEN_CENTER_X+216);
		self:y(SCREEN_CENTER_Y+140);
		self:diffuse(0,0,0,1);
		self:sleep(200)
		
		end,
      Texture= "buildings/12.png",
    },
    Def.Sprite{
      Name= "actor_yb",
      OnCommand= function(self)
		
		bld13=self;
		
		self:x(SCREEN_CENTER_X+257);
		self:y(SCREEN_CENTER_Y+153);
		self:diffuse(0,0,0,1);
		self:sleep(200)
		
		end,
      Texture= "buildings/13.png",
    },
    Def.Sprite{
      Name= "actor_zb",
      OnCommand= function(self)
		
		bld14=self;
		
		self:x(SCREEN_CENTER_X+295);
		self:y(SCREEN_CENTER_Y+190);
		self:diffuse(0,0,0,1);
		self:sleep(200)
		
		end,
      Texture= "buildings/14.png",
    },
	Def.Quad{
		OnCommand=cmd(effectclock,"beat";playcommand,"LOOP"),
		LOOPCommand=function(self)
				if math.mod(GAMESTATE:GetSongBeat(),1) < 0.5 and A == 0 then
					A= 1;
				 b0num=math.random(155,200)
				 b1num=math.random(125,150)
				 b2num=math.random(175,200)
				 b3num=math.random(155,200)
				 b4num=math.random(95,200)
				 b5num=math.random(155,200)
				 b6num=math.random(49,70)
				 b7num=math.random(190,250)
				 b8num=math.random(69,80)
				 b9num=math.random(202,250)
				 
				 b10num=math.random(50,80)
				 b11num=math.random(165,200)
				 b12num=math.random(140,180)
				 b13num=math.random(153,200)
				 b14num=math.random(190,250)
				 
				huetable1={197,0,232}
				huetable0={0,151,232}
				 
				 if bInterval==0 then
				 bInterval=1
				 bDivide=1.2
				 elseif bInterval==1 then
				 bInterval=0
				 bDivide=1
				 end
				 
				 --huetable1
				
					for i=0,14 do
					
					bDieTime=math.random(10,15)*0.1
     
					 _G['blur'..i]:stoptweening();
					 _G['blur'..i]:diffuse(_G['huetable'..bInterval][1]/255,_G['huetable'..bInterval][2]/255,_G['huetable'..bInterval][3]/255,1)
					 _G['blur'..i]:linear(0.05);
					 _G['blur'..i]:y(SCREEN_CENTER_Y+(_G['b'..i..'num']*bDivide));
					 _G['blur'..i]:decelerate(bDieTime)
					 _G['blur'..i]:diffusealpha(0)
					 _G['blur'..i]:y(SCREEN_CENTER_Y+300);
					 
					 _G['bld'..i]:stoptweening();
					 _G['bld'..i]:linear(0.05);
					 _G['bld'..i]:y(SCREEN_CENTER_Y+(_G['b'..i..'num']*bDivide));
					 _G['bld'..i]:decelerate(bDieTime)
					 _G['bld'..i]:y(SCREEN_CENTER_Y+300);
					 
					 end
				elseif math.mod(GAMESTATE:GetSongBeat(),1) > 0.5 then
				A = 0;
				end
				self:sleep(1/30):queuecommand("LOOP")
		end,
	}
  }