detters2 = Def.ActorFrame{}

for i=1,72 do
	detters2[#detters2+1] = Def.ActorFrame{
	Def.ActorFrame{
		OnCommand=function(self)
		_G['AA'..i]=self
		end;
			Def.ActorFrame{
		OnCommand=function(self)
		_G['Dis'..i]=self
		end;
	LoadActor("testfont 8x16")..{
		OnCommand=function(self)
		self:SetTextureFiltering(false);
		_G['det'..i]=self
		self:sleep(0)
		self:visible(false)
		self:x(999)
		self:y(999)
		self:animate(0)
		self:setstate(0)
		end
	}
	}
	}
	}
end

return Def.ActorFrame{

Def.Quad{
InitCommand=function(self)
			self:visible(false)
			
			
			-- Here lies Puuro's wacky sprite text system
			 -- You should be able to just copy tDis xml and
			  -- slap it to your simfile and the functions will work
			  
			  -- makeTextCommand controls which detter will be spat out.
			 -- TDis system uses bitmap fonts which are output with 
			-- a program called Codehead's Bitmap Font Generator
			 -- Here's instructions for using these functions
			
			--[[
				First, set a speech bubble2 with setbubble2(dir,width,height)
				The parameters are:
				speech bubble2 arrow direction (0 or 1)
				width of the detters2 (optional, defaults to 10)
				height of the rows (optional, defaults to 10)
				
				example: 
				setbubble2(0,9,12)
				
				Then, use sayTDis('string',speed,'filename.ogg')
				Parameters:
				String, aka the thing you want to say
				speed of an individual detter
				character speech sound
				
				example:
				setbubble2(0,9,12) <-tDis is needed
				sayTDis('Hello',0.06,'sans.ogg',1)
				
				remember to ALWAYS run setbubble2 before running sayTDis or the
				previous text won't be cleared.
				
				Extra functions
					colourText(s,e,r,g,b,a)
						TDis function colours a part of the text
						Parameters:
						 start
						 end
						 red
						 green
						 blue
						 alpha transparency
						 
						 example:
						  setbubble2(0,9,12) <-tDis always comes first
						  colourText(11,15,0,0,1,1) --the word 'blue' is in blue now
						  sayTDis('Imagine a blue stop sign',0.06,'sans.ogg',1)
						  
					setTalkSpeeds(start,end,speed)
						TDis works similarly to colourText, except it changes the
						speed of the detters2 between the start and end values
						run tDis function AFTER sayTDis or otherwise the speeds
						will be overridden
						
						example:
						 setbubble2(0,9,12)
						 colourText(11,15,0,0,1,1) 
						 sayTDis('Imagine a blue stop sign',0.06,'sans.ogg',1)
						 setTalkSpeeds(11,15,0.4) --the word 'blue' appears slowly
						 
			]]
			
			
			txtOffset2=9
			spawnAmount2=0;
			textSetter2=1
			letterNumber2=1
			talk_textSpeed2=0.1
			talk_active2=0
			talk_audio2='sound.ogg'
			talk_speeds2={}
			
			for i=1,80 do --det's make tDis table just a bit too large as a failsafe
			
				table.insert(talk_speeds2,0.06)
			
			end
			
			talk_widths2={}
			
			--fiskars function fucking founs fo kung dräckelll... skinAA skäkl
			
			function setdetterWidth(ltr,wd)
			
				talk_widths2[ltr] = wd
				
				
			
			end
			
			function spaceletters2()
				--tDis shit is kinda dumb
				for i=2,72 do
					for j=i,72 do
						if talk_widths2[sanat2[i]] ~= nil then
							_G['det'..j]:addx((talk_widths2[sanat2[i]]))
							
						else
							--_G['det'..i]:rotationz(20)
							
						end
					end
				end
			end
			
			function spawnletters2(num)
			
			--spawnAmount2=num
			--letterNumber2=1
			--textSetter2:queuecommand('makeText')
			
			
			end
			
			function clearthis2()
				
				talk_active2=0
				textSetter2:stoptweening()
				for i=1,72 do
				_G['det'..i]:visible(false)
				end
			
			end
			
			function colourText2(s,e,r,g,b,a)
			
				for i=s,e do
					_G['det'..i]:diffuse(r,g,b,a)
				end
			
			end
			
			function setTalkSpeeds2(s,e,spd)
			
				for i=s,e do
					talk_speeds2[i] = spd
				end
			
			end
			
			function effect2(s,e,n,x,y,z,p)
			
				for i=s,e do
				if n ~= 'rainbow' then
				_G['det'..i]:stopeffect()
				_G['Dis'..i]:stopeffect()
				end
				if n == 'awesome' then
				_G['det'..i]:stopeffect()
				end
				_G['AA'..i]:stopeffect()
					if n == 'vibrate' or n == 'vib' then
					_G['det'..i]:vibrate()
					_G['det'..i]:effectmagnitude(x,y,z)
					_G['det'..i]:effectperiod(p)
					end
					if n == 'bob' then
					_G['det'..i]:bob()
					_G['det'..i]:effectmagnitude(x,y,z)
					_G['det'..i]:effectperiod(p)
					end
					if n == 'rainbow' then
					_G['AA'..i]:rainbow()
					end
					if n == 'awesome' then
					_G['det'..i]:bob()
					_G['det'..i]:effectmagnitude(x,y,z)
					_G['det'..i]:effectperiod(p)
					_G['Dis'..i]:bob()
					_G['Dis'..i]:effectmagnitude(y,x,z)
					_G['Dis'..i]:effectperiod(p)
					_G['Dis'..i]:effectoffset((math.abs(p/4.5-(i/4.5))))
					
					end
				_G['det'..i]:effectoffset(i/4.5)
				_G['AA'..i]:effectoffset(i/4.5)
				end
			
			end
			
			
		
			
			
			
			function saythis2(stringi,spd,soundfile)
				
				textSetter2:stoptweening()
					sanat2 = {} --tDis table has been set in detters2.xml
					for i = 1,string.len(stringi) do
						--t[i] = string.byte(stringi,i)
						sanat2[i] = string.sub(stringi,i, i)
						
						if sanat2[i] == ' ' then
							sanat2[i] = 'space'
						end
						
						
					end
					
				
				
				
				
				spawnAmount2=string.len(stringi)
				letterNumber2=1
				talk_textSpeed2=spd
				talk_active2=1
				talk_audio2=soundfile
				
				for i=1,table.getn(talk_speeds2) do
					talk_speeds2[i] = spd
				end
				
				if spawnAmount2<=72 then
					textSetter2:queuecommand('makeText2')
				elseif spawnAmount2>72 then
					SCREENMAN:SystemMessage('String is too long')
				end
				
				
				
			end --string thingy ends here
			
			
			function setbubble22(dir,pxx,pxy)
				
				if not pxx then
					pxx=10
				end
				
				if not pxy then
					pxy=12
				end
				
					--set the y positions
					for i=1,72 do
					
							_G['det'..i]:y(-21)
						
						_G['det'..i]:visible(false)
						_G['det'..i]:setstate(0)
						_G['det'..i]:diffuse(0,0,0,1)
						_G['det'..i]:x(-55+(i*9)+(i*1.5))					
						_G['det'..i]:addy(-4);
					
					end
					
					--set the x positions
					
					
					bubble2:x(0)
					bubble2:y(0)
					bubble2:setstate(dir)
					bubble2:visible(true)
				
					
				
				end --bubble2 thingy ends here
				
				function hidebubble2()
					bubble2:visible(false)
				end

end,

},



LoadActor("origbubble 1x2.png")..{
OnCommand=function(self)
self:SetTextureFiltering(false);
bubble2=self
self:sleep(0)
self:visible(false) 
 self:animate(0) 
 self:setstate(0)
self:x(999)
self:y(999)
end,

},

	letters2,

	Def.Quad{
		OnCommand=function(self)
		textSetter2=self
		self:visible(false)
		sanat2={}
		end,
		
		makeText2Command=function(self)
		
				
		--self:sleep(talk_textSpeed2)
		self:sleep(talk_speeds2[letterNumber2])
		
		if spawnAmount2>0 then
			spawnAmount2=spawnAmount2-1
			
			if sanat2[letterNumber2] == 'A' then
				_G['det'..letterNumber2]:setstate(33)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == 'B' then
				_G['det'..letterNumber2]:setstate(34)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == 'C' then
				_G['det'..letterNumber2]:setstate(35)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == 'D' then
				_G['det'..letterNumber2]:setstate(36)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == 'E' then
				_G['det'..letterNumber2]:setstate(37)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == 'F' then
				_G['det'..letterNumber2]:setstate(38)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == 'G' then
				_G['det'..letterNumber2]:setstate(39)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == 'H' then
				_G['det'..letterNumber2]:setstate(40)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == 'I' then
				_G['det'..letterNumber2]:setstate(41)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == 'J' then
				_G['det'..letterNumber2]:setstate(42)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == 'K' then
				_G['det'..letterNumber2]:setstate(43)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == 'L' then
				_G['det'..letterNumber2]:setstate(44)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == 'M' then
				_G['det'..letterNumber2]:setstate(45)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == 'N' then
				_G['det'..letterNumber2]:setstate(46)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == 'O' then
				_G['det'..letterNumber2]:setstate(47)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == 'P' then
				_G['det'..letterNumber2]:setstate(48)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == 'Q' then
				_G['det'..letterNumber2]:setstate(49)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == 'R' then
				_G['det'..letterNumber2]:setstate(50)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == 'S' then
				_G['det'..letterNumber2]:setstate(51)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == 'T' then
				_G['det'..letterNumber2]:setstate(52)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == 'U' then
				_G['det'..letterNumber2]:setstate(53)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == 'V' then
				_G['det'..letterNumber2]:setstate(54)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == 'W' then
				_G['det'..letterNumber2]:setstate(55)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == 'X' then
				_G['det'..letterNumber2]:setstate(56)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == 'Y' then
				_G['det'..letterNumber2]:setstate(57)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == 'Z' then
				_G['det'..letterNumber2]:setstate(58)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == 'a' then
				_G['det'..letterNumber2]:setstate(65)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == 'b' then
				_G['det'..letterNumber2]:setstate(66)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == 'c' then
				_G['det'..letterNumber2]:setstate(67)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == 'd' then
				_G['det'..letterNumber2]:setstate(68)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == 'e' then
				_G['det'..letterNumber2]:setstate(69)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == 'f' then
				_G['det'..letterNumber2]:setstate(70)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == 'g' then
				_G['det'..letterNumber2]:setstate(71)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == 'h' then
				_G['det'..letterNumber2]:setstate(72)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == 'i' then
				_G['det'..letterNumber2]:setstate(73)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == 'j' then
				_G['det'..letterNumber2]:setstate(74)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == 'k' then
				_G['det'..letterNumber2]:setstate(75)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == 'l' then
				_G['det'..letterNumber2]:setstate(76)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == 'm' then
				_G['det'..letterNumber2]:setstate(77)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == 'n' then
				_G['det'..letterNumber2]:setstate(78)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == 'o' then
				_G['det'..letterNumber2]:setstate(79)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == 'p' then
				_G['det'..letterNumber2]:setstate(80)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == 'q' then
				_G['det'..letterNumber2]:setstate(81)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == 'r' then
				_G['det'..letterNumber2]:setstate(82)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == 's' then
				_G['det'..letterNumber2]:setstate(83)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == 't' then
				_G['det'..letterNumber2]:setstate(84)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == 'u' then
				_G['det'..letterNumber2]:setstate(85)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == 'v' then
				_G['det'..letterNumber2]:setstate(86)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == 'w' then
				_G['det'..letterNumber2]:setstate(87)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == 'x' then
				_G['det'..letterNumber2]:setstate(88)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == 'y' then
				_G['det'..letterNumber2]:setstate(89)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == 'z' then
				_G['det'..letterNumber2]:setstate(90)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == '0' then
				_G['det'..letterNumber2]:setstate(16)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == '1' then
				_G['det'..letterNumber2]:setstate(17)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == '2' then
				_G['det'..letterNumber2]:setstate(18)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == '3' then
				_G['det'..letterNumber2]:setstate(19)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == '4' then
				_G['det'..letterNumber2]:setstate(20)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == '5' then
				_G['det'..letterNumber2]:setstate(21)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == '6' then
				_G['det'..letterNumber2]:setstate(22)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == '7' then
				_G['det'..letterNumber2]:setstate(23)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == '8' then
				_G['det'..letterNumber2]:setstate(24)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == '9' then
				_G['det'..letterNumber2]:setstate(25)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == '?' then
				_G['det'..letterNumber2]:setstate(31)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == '!' then
				_G['det'..letterNumber2]:setstate(1)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == '.' then
				_G['det'..letterNumber2]:setstate(14)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == ',' then
				_G['det'..letterNumber2]:setstate(12)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == ':' then
				_G['det'..letterNumber2]:setstate(26)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == ';' then
				_G['det'..letterNumber2]:setstate(27)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
				
			
			elseif sanat2[letterNumber2] == '&quot;' then
				_G['det'..letterNumber2]:setstate(2)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == '\'' then
				_G['det'..letterNumber2]:setstate(7)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == '(' then
				_G['det'..letterNumber2]:setstate(8)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == ')' then
				_G['det'..letterNumber2]:setstate(9)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == '\[' then
				_G['det'..letterNumber2]:setstate(59)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == '\]' then
				_G['det'..letterNumber2]:setstate(61)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == '{' then
				_G['det'..letterNumber2]:setstate(91)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == '}' then
				_G['det'..letterNumber2]:setstate(93)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == '<' then
				_G['det'..letterNumber2]:setstate(28)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == '>' then
				_G['det'..letterNumber2]:setstate(30)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == '+' then
				_G['det'..letterNumber2]:setstate(11)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == '~' then
				_G['det'..letterNumber2]:setstate(94)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == '=' then
				_G['det'..letterNumber2]:setstate(29)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == '-' then
				_G['det'..letterNumber2]:setstate(13)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == '@' then
				_G['det'..letterNumber2]:setstate(32) 
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == '%' then
				_G['det'..letterNumber2]:setstate(5)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == '#' then
				_G['det'..letterNumber2]:setstate(3)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == '&' then
				_G['det'..letterNumber2]:setstate(6)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == '$' then
				_G['det'..letterNumber2]:setstate(4)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == '*' then
				_G['det'..letterNumber2]:setstate(10)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == '/' then
				_G['det'..letterNumber2]:setstate(15)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == '\\' then
				_G['det'..letterNumber2]:setstate(60)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == '^' then
				_G['det'..letterNumber2]:setstate(62)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == '_' then
				_G['det'..letterNumber2]:setstate(63)
				_G['det'..letterNumber2]:basezoomx(1) 
				if talk_audio2 ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio2); end
			elseif sanat2[letterNumber2] == 'space' then
				_G['det'..letterNumber2]:setstate(1)
				_G['det'..letterNumber2]:basezoomx(0) --]]
			end
			
			--...REALLY BRO??????????????
			
			_G['det'..letterNumber2]:visible(true)
			
			letterNumber2=letterNumber2+1
			
			if talk_active2==1 then
			self:queuecommand('makeText2')
			end
			
		end
	
	end,
	
	},

}