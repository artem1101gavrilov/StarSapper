
function love.load()
	math.randomseed( os.time() )
	love.window.setMode(500, 500)
	love.graphics.setBackgroundColor( 43, 77, 168 )

	--love.mouse.setVisible(false) -- make default mouse invisible
    imgMouse = love.graphics.newImage("mouse2.png") -- load in a custom mouse image
    GameOver = love.graphics.newImage("gameover.png")
    GameWin = love.graphics.newImage("Star.png")

	require "logicgame"
	require "button"

	tablePole = { }
--        {0, 0, 0, 0, 0, 0, 0, 0},
--        {0, 0, 0, 0, 0, 0, 0, 0},
--        {0, 0, 0, 0, 0, 0, 0, 0},
--        {0, 0, 0, 0, 0, 0, 0, 0},
--        {0, 0, 0, 0, 0, 0, 0, 0},
--        {0, 0, 0, 0, 0, 0, 0, 0},
--        {0, 0, 0, 0, 0, 0, 0, 0},
--        {0, 0, 0, 0, 0, 0, 0, 0}
--    }
    for i=1,16 do
    	tablePole[i] = {}
    	for j=1,16 do
    		tablePole[i][j] = 0
    	end
    end

    tableGame = { }
    for i=1,16 do
    	tableGame[i] = {}
    	for j=1,16 do
    		tableGame[i][j] = -5
    	end
    end

    chooseX = 0
	chooseY = 0

	chooseXStar = 0
	chooseYStar = 0
	actionXstar = 0
	actionYstar = 0


	isgenerationpole = false
	isfinish = false
	iswinner = false
	isclickstar = false
	isclickstarTimer = false

	timeGame = 0
	timestar = 0

	countPustotPoleGame = 0
	countFlagPoleGame = 0

	slozhnost = 0

	ismenu = true
	isgame = false
end
 
function love.update(dt)
	if ismenu == true then 
		local x, y = love.mouse.getPosition() -- get the position of the mouse
		UpdateMenuButton( x, y )
	end
	if isgame == true then
		if isfinish == false and iswinner == false and isgenerationpole == true then 
			timeGame = timeGame + dt
		end
		if isclickstarTimer == true then
			timestar = timestar + dt
		end
		if timestar > 2 then 
			isclickstarTimer = false
			timestar = 0
		end
	end
end
 

function love.keypressed(key, unicode)
end

function love.keyreleased(key, unicode)
	if key == "escape" then
		love.event.quit()
	end
	if key == "r" then
		love.load()
	end
end 

function love.mousepressed(x, y, button, istouch)
	
end

function love.mousereleased(x, y, button, istouch)
   if button == 1 then
   	if ismenu == true then
		if x > 50 and x < 450 and y > 100 and y < 150 then
			ismenu = false
			isgame = true
			slozhnost = 1
		end

		if x > 50 and x < 450 and y > 200 and y < 250 then
			ismenu = false
			isgame = true
			slozhnost = 2
		end

		--[[if x > 50 and x < 450 and y > 300 and y < 350 then
			ismenu = false
			isgame = true
			slozhnost = 3
		end]]

		if x > 50 and x < 450 and y > 400 and y < 450 then
			love.event.quit()
		end
   	elseif isgame == true then
	   	if isfinish == false and iswinner == false then
	   		if x > 50 and x < 450 and y > 80 and y < 480 then
		   		imgx = x - 50 
		      	imgy = y - 80
		      
		      	if slozhnost == 1 then
				    chooseX = math.ceil(imgx/50)
				    chooseY = math.ceil(imgy/50)
				elseif slozhnost == 2 then
					chooseX = math.ceil(imgx/25)
				    chooseY = math.ceil(imgy/25)
				end
			    if isgenerationpole == false then
			    	isgenerationpole = GenerationPole( tablePole, chooseX, chooseY, slozhnost )
			    end
			    if tableGame[chooseX][chooseY] == -5 and isclickstar == false then
			    	ClickGame( tablePole, tableGame, chooseX, chooseY )
			    	if tableGame[chooseX][chooseY] == 0 or tableGame[chooseX][chooseY] == -3 then 
			    		MnogoPustot( tableGame, slozhnost )
			    	end
			    	isfinish = IsGameOver( tableGame, slozhnost )
			    	iswinner = IsYouWinner( tableGame, slozhnost )
			    	countPustotPoleGame = NewCountPustot ( tableGame, slozhnost )
			    end
			    if tableGame[chooseX][chooseY] == -3 then
			    	chooseXStar = chooseX
			    	chooseYStar = chooseY
			    	tableGame[chooseXStar][chooseYStar] = 0
			    	tablePole[chooseXStar][chooseYStar] = 0
			    	isclickstar = true
			    	love.mouse.setVisible(false) -- make default mouse invisible
			    end
			    if tableGame[chooseX][chooseY] == -5 and isclickstar == true then
			    	isclickstar = false
			    	isclickstarTimer = true
			    	actionXstar = chooseX 
			    	actionYstar = chooseY
			    end
			end
		end
	   end
	   
   end
   if button == 2 then
   		if isfinish == false and iswinner == false then
   			if x > 50 and x < 450 and y > 80 and y < 480 then
   				imgx = x - 50 
		      	imgy = y - 80
		      
			    if slozhnost == 1 then
				    chooseX = math.ceil(imgx/50)
				    chooseY = math.ceil(imgy/50)
				elseif slozhnost == 2 then
					chooseX = math.ceil(imgx/25)
				    chooseY = math.ceil(imgy/25)
				end
			    if tableGame[chooseX][chooseY] == -5 then
			    	tableGame[chooseX][chooseY] = -2 
			    elseif tableGame[chooseX][chooseY] == -2 then
			    	tableGame[chooseX][chooseY] = -5 
			    end
			    countFlagPoleGame = NewCountFlag( tableGame, slozhnost )
   			end
   		end
    end
end

function love.draw()
	if ismenu == true then
		DrawAllButtons( rezhim0, rezhim1, rezhim2, rezhim3 )
	end
	if isgame == true then
		mainFont2 = love.graphics.newFont(20);
		love.graphics.setFont(mainFont2);

		--Игровое поле
		love.graphics.setColor(130, 130, 130)
		love.graphics.rectangle("fill", 50, 80, 400, 400)
		love.graphics.setColor(0, 0, 0)
		
		if slozhnost == 1 then
			for j=1,9 do
				love.graphics.line(50*(j-1)+50, 80, 50*(j-1)+50, 480)
			end
			for j=1,9 do
				love.graphics.line(50, 50*(j-1)+80, 450, 50*(j-1)+80)
			end
		elseif slozhnost == 2 then
			for j=1,17 do
				love.graphics.line(25*(j-1)+50, 80, 25*(j-1)+50, 480)
			end
			for j=1,17 do
				love.graphics.line(50, 25*(j-1)+80, 450, 25*(j-1)+80)
			end
		end


		PrintGamePole( tableGame, slozhnost )
		
		-- У всех без изменения 
		if isfinish == true then
			
			love.graphics.setColor(250, 250, 250)
			love.graphics.draw(GameOver, 50, 80)
		end

		--у всех без изменения
		if iswinner == true then
			love.graphics.setColor(250, 250, 250)
			love.graphics.draw(GameWin, 50, 80)
		end

		if isgenerationpole == true then 
			love.graphics.setColor(250, 250, 250)
			love.graphics.draw(pustota, 50, 10, 0, 1/2, 1/2)
			if slozhnost == 1 then
				love.graphics.print( countPustotPoleGame .. " / 54", 90, 12)
			elseif slozhnost == 2 then
				love.graphics.print( countPustotPoleGame .. " / 216", 90, 12)
			end
			love.graphics.draw(flag, 50, 40, 0 , 1/2, 1/2)
			if slozhnost == 1 then
				love.graphics.print( countFlagPoleGame .. " / 10", 90, 42)
			elseif slozhnost == 2 then
				love.graphics.print( countFlagPoleGame .. " / 40", 90, 42)
			end
		end


		--звезда у всех одинаковую роль исполняет
		if slozhnost == 1 then
			if isclickstarTimer == true and timestar < 2 then 
				love.mouse.setVisible(true)
				love.graphics.setColor(125, 125, 125)
				if tablePole[actionXstar][actionYstar] == 1 then
					love.graphics.draw(number1, 50*(actionXstar-1)+51, 50*(actionYstar-1)+81)
				elseif tablePole[actionXstar][actionYstar] == 2 then
					love.graphics.draw(number2, 50*(actionXstar-1)+51, 50*(actionYstar-1)+81)
				elseif tablePole[actionXstar][actionYstar] == 3 then
					love.graphics.draw(number3, 50*(actionXstar-1)+51, 50*(actionYstar-1)+81)
				elseif tablePole[actionXstar][actionYstar] == 4 then
					love.graphics.draw(number4, 50*(actionXstar-1)+51, 50*(actionYstar-1)+81)
				elseif tablePole[actionXstar][actionYstar] == 5 then
					love.graphics.draw(number5, 50*(actionXstar-1)+51, 50*(actionYstar-1)+81)
				elseif tablePole[actionXstar][actionYstar] == 6 then
					love.graphics.draw(number6, 50*(actionXstar-1)+51, 50*(actionYstar-1)+81)
				elseif tablePole[actionXstar][actionYstar] == 7 then
					love.graphics.draw(number7, 50*(actionXstar-1)+51, 50*(actionYstar-1)+81)
				elseif tablePole[actionXstar][actionYstar] == 8 then
					love.graphics.draw(number8, 50*(actionXstar-1)+51, 50*(actionYstar-1)+81)
				elseif tablePole[actionXstar][actionYstar] == 9 then
					love.graphics.draw(number9, 50*(actionXstar-1)+51, 50*(actionYstar-1)+81)
				elseif tablePole[actionXstar][actionYstar] == 0 then
					love.graphics.draw(pustota, 50*(actionXstar-1)+51, 50*(actionYstar-1)+81)
				elseif tablePole[actionXstar][actionYstar] == -2 then
					love.graphics.draw(flag, 50*(actionXstar-1)+51, 50*(actionYstar-1)+81)
				elseif tablePole[actionXstar][actionYstar] == -1 then
					love.graphics.draw(mina, 50*(actionXstar-1)+51, 50*(actionYstar-1)+81)
				elseif tablePole[actionXstar][actionYstar] == -3 then
					love.graphics.draw(stars, 50*(actionXstar-1)+51, 50*(actionYstar-1)+81)
				end
			end
		elseif slozhnost == 2 then
			if isclickstarTimer == true and timestar < 2 then 
				love.mouse.setVisible(true)
				love.graphics.setColor(125, 125, 125)
				if tablePole[actionXstar][actionYstar] == 1 then
					love.graphics.draw(number1, 25*(actionXstar-1)+51, 25*(actionYstar-1)+81, 0, 1/2, 1/2)
				elseif tablePole[actionXstar][actionYstar] == 2 then
					love.graphics.draw(number2, 25*(actionXstar-1)+51, 25*(actionYstar-1)+81, 0, 1/2, 1/2)
				elseif tablePole[actionXstar][actionYstar] == 3 then
					love.graphics.draw(number3, 25*(actionXstar-1)+51, 25*(actionYstar-1)+81, 0, 1/2, 1/2)
				elseif tablePole[actionXstar][actionYstar] == 4 then
					love.graphics.draw(number4, 25*(actionXstar-1)+51, 25*(actionYstar-1)+81, 0, 1/2, 1/2)
				elseif tablePole[actionXstar][actionYstar] == 5 then
					love.graphics.draw(number5, 25*(actionXstar-1)+51, 25*(actionYstar-1)+81, 0, 1/2, 1/2)
				elseif tablePole[actionXstar][actionYstar] == 6 then
					love.graphics.draw(number6, 25*(actionXstar-1)+51, 25*(actionYstar-1)+81, 0, 1/2, 1/2)
				elseif tablePole[actionXstar][actionYstar] == 7 then
					love.graphics.draw(number7, 25*(actionXstar-1)+51, 25*(actionYstar-1)+81, 0, 1/2, 1/2)
				elseif tablePole[actionXstar][actionYstar] == 8 then
					love.graphics.draw(number8, 25*(actionXstar-1)+51, 25*(actionYstar-1)+81, 0, 1/2, 1/2)
				elseif tablePole[actionXstar][actionYstar] == 9 then
					love.graphics.draw(number9, 25*(actionXstar-1)+51, 25*(actionYstar-1)+81, 0, 1/2, 1/2)
				elseif tablePole[actionXstar][actionYstar] == 0 then
					love.graphics.draw(pustota, 25*(actionXstar-1)+51, 25*(actionYstar-1)+81, 0, 1/2, 1/2)
				elseif tablePole[actionXstar][actionYstar] == -2 then
					love.graphics.draw(flag, 25*(actionXstar-1)+51, 25*(actionYstar-1)+81, 0, 1/2, 1/2)
				elseif tablePole[actionXstar][actionYstar] == -1 then
					love.graphics.draw(mina, 25*(actionXstar-1)+51, 25*(actionYstar-1)+81, 0, 1/2, 1/2)
				elseif tablePole[actionXstar][actionYstar] == -3 then
					love.graphics.draw(stars, 25*(actionXstar-1)+51, 25*(actionYstar-1)+81, 0, 1/2, 1/2)
				end
			end
		end

		love.graphics.setColor(250, 250, 250)
		love.graphics.print("Time : " .. string.format("%10.3f", timeGame), 270, 20)

		if isclickstar == true then 
			local x, y = love.mouse.getPosition() -- get the position of the mouse
	    	love.graphics.draw(imgMouse, x, y) -- draw the custom mouse image
		end
		--local x, y = love.mouse.getPosition() -- get the position of the mouse
	    --love.graphics.draw(imgMouse, x, y) -- draw the custom mouse image
	end
end