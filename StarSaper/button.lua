rezhim0 = false
rezhim1 = false
rezhim2 = false
rezhim3 = false

----------------------------------------------------------------------------------------------------------
--								Главное меню															--
----------------------------------------------------------------------------------------------------------

function DrawAllButtons( rezhim0, rezhim1, rezhim2, rezhim3 )
	mainFont = love.graphics.newFont(30);
	love.graphics.setFont(mainFont);
	if rezhim0 == true then
		DrawButton88( true )
	else
		DrawButton88( false )
	end
	if rezhim1 == true then
		DrawButtonNewGame( true )
	else
		DrawButtonNewGame( false )
	end
	if rezhim2 == true then
		--DrawButtonLoadGame( true )
	else
		--DrawButtonLoadGame( false )
	end
	if rezhim3 == true then
		DrawButtonExitGame( true )
	else
		DrawButtonExitGame( false )
	end
end

function UpdateMenuButton( x, y )
	if x > 50 and x < 450 and y > 100 and y < 150 then
		rezhim0 = true
	else
		rezhim0 = false
	end

	--for startgame
	if x > 50 and x < 450 and y > 200 and y < 250 then
		rezhim1 = true
	else
		rezhim1 = false
	end

	if x > 50 and x < 450 and y > 300 and y < 350 then
		rezhim2 = true
	else
		rezhim2 = false
	end

	if x > 50 and x < 450 and y > 400 and y < 450 then
		rezhim3 = true
	else
		rezhim3 = false
	end
end

function DrawButton88( rezhim )
	if rezhim == true then 
		love.graphics.setColor(250, 250, 0)
	else
		love.graphics.setColor(250, 250, 250)
	end
	love.graphics.rectangle("fill", 50, 100, 400, 50)
	love.graphics.setColor(0, 0, 0)
	love.graphics.print("8 x 8", 225, 110) 
end

function DrawButtonNewGame( rezhim )
	if rezhim == true then 
		love.graphics.setColor(250, 250, 0)
	else
		love.graphics.setColor(250, 250, 250)
	end
	love.graphics.rectangle("fill", 50, 200, 400, 50)
	love.graphics.setColor(0, 0, 0)
	love.graphics.print("16 x 16", 215, 210) 
end

function DrawButtonLoadGame( rezhim )
	if rezhim == true then 
		love.graphics.setColor(250, 250, 0)
	else
		love.graphics.setColor(250, 250, 250)
	end
	love.graphics.rectangle("fill", 50, 300, 400, 50)
	love.graphics.setColor(0, 0, 0)
	love.graphics.print("LOAD GAME", 175, 310) 
end

function DrawButtonExitGame( rezhim )
	if rezhim == true then 
		love.graphics.setColor(250, 250, 0)
	else
		love.graphics.setColor(250, 250, 250)
	end
	love.graphics.rectangle("fill", 50, 400, 400, 50)
	love.graphics.setColor(0, 0, 0)
	love.graphics.print("EXIT", 225, 410) 
end