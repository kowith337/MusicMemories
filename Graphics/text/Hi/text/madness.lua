Letters = Def.ActorFrame{}

for i=1,72 do
	Letters[#Letters+1] = Def.ActorFrame{
	Def.ActorFrame{
		OnCommand=function(self)
		_G['GG'..i]=self
		end;
			Def.ActorFrame{
		OnCommand=function(self)
		_G['His'..i]=self
		end;
	LoadActor("testfont 8x16")..{
		OnCommand=function(self)
		self:SetTextureFiltering(false);
		_G['let'..i]=self
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
			 -- You should be able to just copy this xml and
			  -- slap it to your simfile and the functions will work
			  
			  -- makeTextCommand controls which letter will be spat out.
			 -- This system uses bitmap fonts which are output with 
			-- a program called Codehead's Bitmap Font Generator
			 -- Here's instructions for using these functions
			
			--[[
				First, set a speech bubble with setBubble(dir,width,height)
				The parameters are:
				speech bubble arrow direction (0 or 1)
				width of the letters (optional, defaults to 10)
				height of the rows (optional, defaults to 10)
				
				example: 
				setBubble(0,9,12)
				
				Then, use sayThis('string',speed,'filename.ogg')
				Parameters:
				String, aka the thing you want to say
				speed of an individual letter
				character speech sound
				
				example:
				setBubble(0,9,12) <-this is needed
				sayThis('Hello',0.06,'sans.ogg',1)
				
				remember to ALWAYS run setBubble before running sayThis or the
				previous text won't be cleared.
				
				Extra functions
					colourText(s,e,r,g,b,a)
						This function colours a part of the text
						Parameters:
						 start
						 end
						 red
						 green
						 blue
						 alpha transparency
						 
						 example:
						  setBubble(0,9,12) <-this always comes first
						  colourText(11,15,0,0,1,1) --the word 'blue' is in blue now
						  sayThis('Imagine a blue stop sign',0.06,'sans.ogg',1)
						  
					setTalkSpeeds(start,end,speed)
						This works similarly to colourText, except it changes the
						speed of the letters between the start and end values
						run this function AFTER sayThis or otherwise the speeds
						will be overridden
						
						example:
						 setBubble(0,9,12)
						 colourText(11,15,0,0,1,1) 
						 sayThis('Imagine a blue stop sign',0.06,'sans.ogg',1)
						 setTalkSpeeds(11,15,0.4) --the word 'blue' appears slowly
						 
			]]
			
			
			txtOffset=9
			spawnAmount=0;
			textSetter=1
			letterNumber=1
			talk_textSpeed=0.1
			talk_active=0
			talk_audio='sound.ogg'
			talk_speeds={}
			
			for i=1,80 do --let's make this table just a bit too large as a failsafe
			
				table.insert(talk_speeds,0.06)
			
			end
			
			talk_widths={}
			
			--fiskars function fucking founs fo kung dräckelll... skingg skäkl
			
			function setLetterWidth(ltr,wd)
			
				talk_widths[ltr] = wd
				
				
			
			end
			
			function spaceLetters()
				--this shit is kinda dumb
				for i=2,72 do
					for j=i,72 do
						if talk_widths[sanat[i]] ~= nil then
							_G['let'..j]:addx((talk_widths[sanat[i]]))
							
						else
							--_G['let'..i]:rotationz(20)
							
						end
					end
				end
			end
			
			function spawnLetters(num)
			
			--spawnAmount=num
			--letterNumber=1
			--textSetter:queuecommand('makeText')
			
			
			end
			
			function clearThis()
				
				talk_active=0
				textSetter:stoptweening()
				for i=1,72 do
				_G['let'..i]:visible(false)
				end
			
			end
			
			function colourText(s,e,r,g,b,a)
			
				for i=s,e do
					_G['let'..i]:diffuse(r,g,b,a)
				end
			
			end
			
			function setTalkSpeeds(s,e,spd)
			
				for i=s,e do
					talk_speeds[i] = spd
				end
			
			end
			
			function effect(s,e,n,x,y,z,p)
			
				for i=s,e do
				if n ~= 'rainbow' then
				_G['let'..i]:stopeffect()
				_G['His'..i]:stopeffect()
				end
				if n == 'awesome' then
				_G['let'..i]:stopeffect()
				end
				_G['GG'..i]:stopeffect()
					if n == 'vibrate' or n == 'vib' then
					_G['let'..i]:vibrate()
					_G['let'..i]:effectmagnitude(x,y,z)
					_G['let'..i]:effectperiod(p)
					end
					if n == 'bob' then
					_G['let'..i]:bob()
					_G['let'..i]:effectmagnitude(x,y,z)
					_G['let'..i]:effectperiod(p)
					end
					if n == 'rainbow' then
					_G['GG'..i]:rainbow()
					end
					if n == 'awesome' then
					_G['let'..i]:bob()
					_G['let'..i]:effectmagnitude(x,y,z)
					_G['let'..i]:effectperiod(p)
					_G['His'..i]:bob()
					_G['His'..i]:effectmagnitude(y,x,z)
					_G['His'..i]:effectperiod(p)
					_G['His'..i]:effectoffset((math.abs(p/4.5-(i/4.5))))
					
					end
				_G['let'..i]:effectoffset(i/4.5)
				_G['GG'..i]:effectoffset(i/4.5)
				end
			
			end
			
			
		
			
			
			
			function sayThis(stringi,spd,soundfile)
				
				textSetter:stoptweening()
					sanat = {} --this table has been set in letters.xml
					for i = 1,string.len(stringi) do
						--t[i] = string.byte(stringi,i)
						sanat[i] = string.sub(stringi,i, i)
						
						if sanat[i] == ' ' then
							sanat[i] = 'space'
						end
						
						
					end
					
				
				
				
				
				spawnAmount=string.len(stringi)
				letterNumber=1
				talk_textSpeed=spd
				talk_active=1
				talk_audio=soundfile
				
				for i=1,table.getn(talk_speeds) do
					talk_speeds[i] = spd
				end
				
				if spawnAmount<=72 then
					textSetter:queuecommand('makeText')
				elseif spawnAmount>72 then
					SCREENMAN:SystemMessage('String is too long')
				end
				
				
				
			end --string thingy ends here
			
			function newline(x)
				for i=x,72 do
					_G['let'..i]:addy(12)
					_G['let'..i]:addx((x*10.5)*-1)
						if i>=18+1 and i<=36+1 then
							_G['let'..i]:addy(-25+12)
							_G['let'..i]:addx(18*9+18*1.5)
							elseif i>=36+1 and i<=36+18+1 then
							_G['let'..i]:y(-21-(12+2))
							_G['let'..i]:addx(18*9*2)
							elseif i>=36+18+1 and i<=36+36+1 then
							_G['let'..i]:y(-21-(12*2+4))
							_G['let'..i]:addx(18*9*2)
						end
				end
			end
			
			function setBubble(dir,pxx,pxy)
				
				if not pxx then
					pxx=10
				end
				
				if not pxy then
					pxy=12
				end
				
					--set the y positions
					for i=1,72 do
					
						if i>=1 and i<=pxx+9 then
							_G['let'..i]:y(-21)
							elseif i>=pxx+10 and i<=pxx+27 then
							_G['let'..i]:y(-21+(pxy+2))
							elseif i>=pxx+28 and i<=pxx+45 then
							_G['let'..i]:y(-21+(pxy*2+4))
							elseif i>=pxx+29 then
							_G['let'..i]:y(-21+(pxy*3+6))
						end
						
						_G['let'..i]:visible(false)
						_G['let'..i]:setstate(0)
						_G['let'..i]:diffuse(0,0,0,1)
						
						_G['let'..i]:addy(-4);
					
					end
					
					--set the x positions
					for i=0,17 do
					
						_G['let'..pxx-8+i]:x(-55+(i*9)+(i*1.5))
						_G['let'..10+pxx+i]:x(-55+(i*9)+(i*1.5))
						_G['let'..28+pxx+i]:x(-55+(i*9)+(i*1.5))
						_G['let'..46+pxx+i]:x(-55+(i*9)+(i*1.5))
					end
					
					
					bubble:x(0)
					bubble:y(0)
					bubble:setstate(dir)
					bubble:visible(true)
				
					
				
				end --bubble thingy ends here
				
				function hideBubble()
					bubble:visible(false)
				end

end,

},



LoadActor("origbubble 1x2.png")..{
OnCommand=function(self)
self:SetTextureFiltering(false);
bubble=self
self:sleep(0)
self:visible(false) 
 self:animate(0) 
 self:setstate(0)
self:x(999)
self:y(999)
end,

},

	Letters,

	Def.Quad{
		OnCommand=function(self)
		textSetter=self
		self:visible(false)
		sanat={}
		end,
		
		makeTextCommand=function(self)
		
				
		--self:sleep(talk_textSpeed)
		self:sleep(talk_speeds[letterNumber])
		
		if spawnAmount>0 then
			spawnAmount=spawnAmount-1
			
			if sanat[letterNumber] == 'A' then
				_G['let'..letterNumber]:setstate(33)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == 'B' then
				_G['let'..letterNumber]:setstate(34)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == 'C' then
				_G['let'..letterNumber]:setstate(35)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == 'D' then
				_G['let'..letterNumber]:setstate(36)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == 'E' then
				_G['let'..letterNumber]:setstate(37)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == 'F' then
				_G['let'..letterNumber]:setstate(38)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == 'G' then
				_G['let'..letterNumber]:setstate(39)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == 'H' then
				_G['let'..letterNumber]:setstate(40)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == 'I' then
				_G['let'..letterNumber]:setstate(41)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == 'J' then
				_G['let'..letterNumber]:setstate(42)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == 'K' then
				_G['let'..letterNumber]:setstate(43)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == 'L' then
				_G['let'..letterNumber]:setstate(44)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == 'M' then
				_G['let'..letterNumber]:setstate(45)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == 'N' then
				_G['let'..letterNumber]:setstate(46)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == 'O' then
				_G['let'..letterNumber]:setstate(47)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == 'P' then
				_G['let'..letterNumber]:setstate(48)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == 'Q' then
				_G['let'..letterNumber]:setstate(49)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == 'R' then
				_G['let'..letterNumber]:setstate(50)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == 'S' then
				_G['let'..letterNumber]:setstate(51)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == 'T' then
				_G['let'..letterNumber]:setstate(52)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == 'U' then
				_G['let'..letterNumber]:setstate(53)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == 'V' then
				_G['let'..letterNumber]:setstate(54)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == 'W' then
				_G['let'..letterNumber]:setstate(55)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == 'X' then
				_G['let'..letterNumber]:setstate(56)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == 'Y' then
				_G['let'..letterNumber]:setstate(57)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == 'Z' then
				_G['let'..letterNumber]:setstate(58)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == 'a' then
				_G['let'..letterNumber]:setstate(65)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == 'b' then
				_G['let'..letterNumber]:setstate(66)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == 'c' then
				_G['let'..letterNumber]:setstate(67)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == 'd' then
				_G['let'..letterNumber]:setstate(68)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == 'e' then
				_G['let'..letterNumber]:setstate(69)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == 'f' then
				_G['let'..letterNumber]:setstate(70)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == 'g' then
				_G['let'..letterNumber]:setstate(71)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == 'h' then
				_G['let'..letterNumber]:setstate(72)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == 'i' then
				_G['let'..letterNumber]:setstate(73)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == 'j' then
				_G['let'..letterNumber]:setstate(74)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == 'k' then
				_G['let'..letterNumber]:setstate(75)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == 'l' then
				_G['let'..letterNumber]:setstate(76)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == 'm' then
				_G['let'..letterNumber]:setstate(77)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == 'n' then
				_G['let'..letterNumber]:setstate(78)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == 'o' then
				_G['let'..letterNumber]:setstate(79)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == 'p' then
				_G['let'..letterNumber]:setstate(80)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == 'q' then
				_G['let'..letterNumber]:setstate(81)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == 'r' then
				_G['let'..letterNumber]:setstate(82)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == 's' then
				_G['let'..letterNumber]:setstate(83)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == 't' then
				_G['let'..letterNumber]:setstate(84)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == 'u' then
				_G['let'..letterNumber]:setstate(85)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == 'v' then
				_G['let'..letterNumber]:setstate(86)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == 'w' then
				_G['let'..letterNumber]:setstate(87)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == 'x' then
				_G['let'..letterNumber]:setstate(88)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == 'y' then
				_G['let'..letterNumber]:setstate(89)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == 'z' then
				_G['let'..letterNumber]:setstate(90)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == '0' then
				_G['let'..letterNumber]:setstate(16)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == '1' then
				_G['let'..letterNumber]:setstate(17)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == '2' then
				_G['let'..letterNumber]:setstate(18)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == '3' then
				_G['let'..letterNumber]:setstate(19)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == '4' then
				_G['let'..letterNumber]:setstate(20)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == '5' then
				_G['let'..letterNumber]:setstate(21)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == '6' then
				_G['let'..letterNumber]:setstate(22)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == '7' then
				_G['let'..letterNumber]:setstate(23)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == '8' then
				_G['let'..letterNumber]:setstate(24)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == '9' then
				_G['let'..letterNumber]:setstate(25)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == '?' then
				_G['let'..letterNumber]:setstate(31)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == '!' then
				_G['let'..letterNumber]:setstate(1)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == '.' then
				_G['let'..letterNumber]:setstate(14)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == ',' then
				_G['let'..letterNumber]:setstate(12)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == ':' then
				_G['let'..letterNumber]:setstate(26)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == ';' then
				_G['let'..letterNumber]:setstate(27)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
				
			
			elseif sanat[letterNumber] == '&quot;' then
				_G['let'..letterNumber]:setstate(2)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == '\'' then
				_G['let'..letterNumber]:setstate(7)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == '(' then
				_G['let'..letterNumber]:setstate(8)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == ')' then
				_G['let'..letterNumber]:setstate(9)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == '\[' then
				_G['let'..letterNumber]:setstate(59)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == '\]' then
				_G['let'..letterNumber]:setstate(61)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == '{' then
				_G['let'..letterNumber]:setstate(91)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == '}' then
				_G['let'..letterNumber]:setstate(93)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == '<' then
				_G['let'..letterNumber]:setstate(28)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == '>' then
				_G['let'..letterNumber]:setstate(30)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == '+' then
				_G['let'..letterNumber]:setstate(11)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == '~' then
				_G['let'..letterNumber]:setstate(94)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == '=' then
				_G['let'..letterNumber]:setstate(29)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == '-' then
				_G['let'..letterNumber]:setstate(13)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == '@' then
				_G['let'..letterNumber]:setstate(32) 
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == '%' then
				_G['let'..letterNumber]:setstate(5)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == '#' then
				_G['let'..letterNumber]:setstate(3)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == '&' then
				_G['let'..letterNumber]:setstate(6)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == '$' then
				_G['let'..letterNumber]:setstate(4)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == '*' then
				_G['let'..letterNumber]:setstate(10)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == '/' then
				_G['let'..letterNumber]:setstate(15)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == '\\' then
				_G['let'..letterNumber]:setstate(60)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == '^' then
				_G['let'..letterNumber]:setstate(62)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == '_' then
				_G['let'..letterNumber]:setstate(63)
				_G['let'..letterNumber]:basezoomx(1) 
				if talk_audio ~= '' then SOUND:PlayOnce('/Themes/News/BGAnimations/text/lua/'..talk_audio); end
			elseif sanat[letterNumber] == 'space' then
				_G['let'..letterNumber]:setstate(1)
				_G['let'..letterNumber]:basezoomx(0) --]]
			end
			
			--...REALLY BRO??????????????
			
			_G['let'..letterNumber]:visible(true)
			
			letterNumber=letterNumber+1
			
			if talk_active==1 then
			self:queuecommand('makeText')
			end
			
		end
	
	end,
	
	},

}