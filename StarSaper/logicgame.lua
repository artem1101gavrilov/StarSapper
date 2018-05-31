function GenerationPole( tablePole, chooseX, chooseY, slozhnost )
	if slozhnost == 1 then
		countMin = 10
		while countMin > 0 do
			local x = math.random(1,8)
			local y = math.random(1,8)
			--if x ~= chooseX or y ~= chooseY then
			if (x < (chooseX - 1) or x > (chooseX + 1)) or (y < (chooseY - 1) or y > (chooseY + 1)) then
				if tablePole[x][y] == 0 then
					tablePole[x][y] = -1
					countMin = countMin - 1
				end
			end
		end

		for i=1,8 do
			for j=1,8 do
				countMinfor = 0
				if tablePole[i][j] == 0 then
					if (i-1) > 0 then 
						if tablePole[i-1][j] == -1 then
							countMinfor = countMinfor + 1
						end
					end
					if (i+1) < 9 then 
						if tablePole[i+1][j] == -1 then
							countMinfor = countMinfor + 1
						end
					end
					if (j-1) > 0 then 
						if tablePole[i][j-1] == -1 then
							countMinfor = countMinfor + 1
						end
					end
					if (j+1) < 9 then 
						if tablePole[i][j+1] == -1 then
							countMinfor = countMinfor + 1
						end
					end

					if (i-1) > 0 and (j-1) > 0 then 
						if tablePole[i-1][j-1] == -1 then
							countMinfor = countMinfor + 1
						end
					end
					if (i+1) < 9 and (j-1) > 0 then 
						if tablePole[i+1][j-1] == -1 then
							countMinfor = countMinfor + 1
						end
					end
					if (i-1) > 0 and (j+1) < 9 then 
						if tablePole[i-1][j+1] == -1 then
							countMinfor = countMinfor + 1
						end
					end
					if (i+1) < 9 and (j+1) < 9 then 
						if tablePole[i+1][j+1] == -1 then
							countMinfor = countMinfor + 1
						end
					end

					tablePole[i][j] = countMinfor
				end
			end
		end

		local boolstar = false
		--а вдруг получится так, что звезды не поставить
		for i=1,8 do
			for j=1,8 do
				if tablePole[i][j] == 0 then
					boolstar = true
				end
			end
		end

		while boolstar do
			local xStar = math.random(1,8)
			local yStar = math.random(1,8)
			if tablePole[xStar][yStar] == 0 and xStar ~= chooseX and yStar ~= chooseY then
				boolstar = false
				tablePole[xStar][yStar] = -3
			end
		end

		return true
	end

	if slozhnost == 2 then
		countMin = 40
		while countMin > 0 do
			local x = math.random(1,16)
			local y = math.random(1,16)
			--if x ~= chooseX or y ~= chooseY then
			if (x < (chooseX - 1) or x > (chooseX + 1)) or (y < (chooseY - 1) or y > (chooseY + 1)) then
				if tablePole[x][y] == 0 then
					tablePole[x][y] = -1
					countMin = countMin - 1
				end
			end
		end

		for i=1,16 do
			for j=1,16 do
				countMinfor = 0
				if tablePole[i][j] == 0 then
					if (i-1) > 0 then 
						if tablePole[i-1][j] == -1 then
							countMinfor = countMinfor + 1
						end
					end
					if (i+1) < 17 then 
						if tablePole[i+1][j] == -1 then
							countMinfor = countMinfor + 1
						end
					end
					if (j-1) > 0 then 
						if tablePole[i][j-1] == -1 then
							countMinfor = countMinfor + 1
						end
					end
					if (j+1) < 17 then 
						if tablePole[i][j+1] == -1 then
							countMinfor = countMinfor + 1
						end
					end

					if (i-1) > 0 and (j-1) > 0 then 
						if tablePole[i-1][j-1] == -1 then
							countMinfor = countMinfor + 1
						end
					end
					if (i+1) < 17 and (j-1) > 0 then 
						if tablePole[i+1][j-1] == -1 then
							countMinfor = countMinfor + 1
						end
					end
					if (i-1) > 0 and (j+1) < 17 then 
						if tablePole[i-1][j+1] == -1 then
							countMinfor = countMinfor + 1
						end
					end
					if (i+1) < 17 and (j+1) < 17 then 
						if tablePole[i+1][j+1] == -1 then
							countMinfor = countMinfor + 1
						end
					end

					tablePole[i][j] = countMinfor
				end
			end
		end

		local boolstar = false
		local countStars = 2
		--а вдруг получится так, что звезды не поставить
		for i=1,16 do
			for j=1,16 do
				if tablePole[i][j] == 0 then
					boolstar = true
				end
			end
		end

		while boolstar and countStars > 0 do
			local xStar = math.random(1,16)
			local yStar = math.random(1,16)
			if tablePole[xStar][yStar] == 0 and xStar ~= chooseX and yStar ~= chooseY then
				countStars = countStars - 1
				tablePole[xStar][yStar] = -3
			end
		end

		return true
	end
end

function ClickGame( tablePole, tableGame, chooseX, chooseY )
	--if tablePole[chooseX][chooseY] == 0 then
	--	tableGame[chooseX][chooseY] = -1
	--elseif tablePole[chooseX][chooseY] == -1 then
	--	tableGame[chooseX][chooseY] = -3
	--else
		tableGame[chooseX][chooseY] = tablePole[chooseX][chooseY]
	--end
end

function IsGameOver( tableGame, slozhnost  )
	if slozhnost == 1 then 
		for i=1,8 do
			for j=1,8 do
				if tableGame[i][j] == -1 then
					return true
				end
			end
		end
		return false
	end
	if slozhnost == 2 then 
		for i=1,16 do
			for j=1,16 do
				if tableGame[i][j] == -1 then
					return true
				end
			end
		end
		return false
	end
end

function IsYouWinner( tableGame, slozhnost )
	if slozhnost == 1 then 
		countpolei = 0
		for i=1,8 do
			for j=1,8 do
				if tableGame[i][j] > 0 or tableGame[i][j] == 0 or tableGame[i][j] == -3 then
					countpolei = countpolei + 1
				end
			end
		end
		if countpolei == (64-10) then 
			return true
		else 
			return false
		end
	end
	if slozhnost == 2 then 
		countpolei = 0
		for i=1,16 do
			for j=1,16 do
				if tableGame[i][j] > 0 or tableGame[i][j] == 0 or tableGame[i][j] == -3 then
					countpolei = countpolei + 1
				end
			end
		end
		if countpolei == (256-40) then 
			return true
		else 
			return false
		end
	end
end

function MnogoPustot( tableGame, slozhnost )
	circle = true
	tableProverki = {}
    for i=1,16 do
    	tableProverki[i] = {}
    	for j=1,16 do
    		tableProverki[i][j] = 0
    	end
    end

    if slozhnost == 1 then 
		while circle == true do
			circle = false
			for i=1,8 do
				for j=1,8 do
					if (tableGame[i][j] == 0 or tableGame[i][j] == -3) and tableProverki[i][j] == 0 then
						if (i-1) > 0 then 
							tableGame[i-1][j] = tablePole[i-1][j]
						end
						if (i+1) < 9 then 
							tableGame[i+1][j] = tablePole[i+1][j]
						end
						if (j-1) > 0 then 
							tableGame[i][j-1] = tablePole[i][j-1]
						end
						if (j+1) < 9 then 
							tableGame[i][j+1] = tablePole[i][j+1]
						end

						if (i-1) > 0 and (j-1) > 0 then 
							tableGame[i-1][j-1] = tablePole[i-1][j-1]
						end
						if (i+1) < 9 and (j-1) > 0 then 
							tableGame[i+1][j-1] = tablePole[i+1][j-1]
						end
						if (i-1) > 0 and (j+1) < 9 then 
							tableGame[i-1][j+1] = tablePole[i-1][j+1]
						end
						if (i+1) < 9 and (j+1) < 9 then 
							tableGame[i+1][j+1] = tablePole[i+1][j+1]
						end
						tableProverki[i][j] = 1
						circle = true
					end
				end
			end
		end
	end
	if slozhnost == 2 then 
		while circle == true do
			circle = false
			for i=1,16 do
				for j=1,16 do
					if (tableGame[i][j] == 0 or tableGame[i][j] == -3) and tableProverki[i][j] == 0 then
						if (i-1) > 0 then 
							tableGame[i-1][j] = tablePole[i-1][j]
						end
						if (i+1) < 17 then 
							tableGame[i+1][j] = tablePole[i+1][j]
						end
						if (j-1) > 0 then 
							tableGame[i][j-1] = tablePole[i][j-1]
						end
						if (j+1) < 17 then 
							tableGame[i][j+1] = tablePole[i][j+1]
						end

						if (i-1) > 0 and (j-1) > 0 then 
							tableGame[i-1][j-1] = tablePole[i-1][j-1]
						end
						if (i+1) < 17 and (j-1) > 0 then 
							tableGame[i+1][j-1] = tablePole[i+1][j-1]
						end
						if (i-1) > 0 and (j+1) < 17 then 
							tableGame[i-1][j+1] = tablePole[i-1][j+1]
						end
						if (i+1) < 17 and (j+1) < 17 then 
							tableGame[i+1][j+1] = tablePole[i+1][j+1]
						end
						tableProverki[i][j] = 1
						circle = true
					end
				end
			end
		end
	end
end

function PrintGamePole( tableGame, slozhnost )
	number1 = love.graphics.newImage("1.png")
	number2 = love.graphics.newImage("2.png")
	number3 = love.graphics.newImage("3.png")
	number4 = love.graphics.newImage("4.png")
	number5 = love.graphics.newImage("5.png")
	number6 = love.graphics.newImage("6.png")
	number7 = love.graphics.newImage("7.png")
	number8 = love.graphics.newImage("8.png")
	number9 = love.graphics.newImage("9.png")
	pustota = love.graphics.newImage("0.png")
	mina = love.graphics.newImage("mina.png")
	flag = love.graphics.newImage("flag.png")
	stars = love.graphics.newImage("stars.png")

	if slozhnost == 1 then
		for i=1,8 do
			for j=1,8 do
				if tableGame[i][j] == 1 then
					love.graphics.setColor(250, 250, 250)
					love.graphics.draw(number1, 50*(i-1)+51, 50*(j-1)+81)
				elseif tableGame[i][j] == 2 then
					love.graphics.setColor(250, 250, 250)
					love.graphics.draw(number2, 50*(i-1)+51, 50*(j-1)+81)
				elseif tableGame[i][j] == 3 then
					love.graphics.setColor(250, 250, 250)
					love.graphics.draw(number3, 50*(i-1)+51, 50*(j-1)+81)
				elseif tableGame[i][j] == 4 then
					love.graphics.setColor(250, 250, 250)
					love.graphics.draw(number4, 50*(i-1)+51, 50*(j-1)+81)
				elseif tableGame[i][j] == 5 then
					love.graphics.setColor(250, 250, 250)
					love.graphics.draw(number5, 50*(i-1)+51, 50*(j-1)+81)
				elseif tableGame[i][j] == 6 then
					love.graphics.setColor(250, 250, 250)
					love.graphics.draw(number6, 50*(i-1)+51, 50*(j-1)+81)
				elseif tableGame[i][j] == 7 then
					love.graphics.setColor(250, 250, 250)
					love.graphics.draw(number7, 50*(i-1)+51, 50*(j-1)+81)
				elseif tableGame[i][j] == 8 then
					love.graphics.setColor(250, 250, 250)
					love.graphics.draw(number8, 50*(i-1)+51, 50*(j-1)+81)
				elseif tableGame[i][j] == 9 then
					love.graphics.setColor(250, 250, 250)
					love.graphics.draw(number9, 50*(i-1)+51, 50*(j-1)+81)
				elseif tableGame[i][j] == 0 then
					love.graphics.setColor(250, 250, 250)
					love.graphics.draw(pustota, 50*(i-1)+51, 50*(j-1)+81)
				elseif tableGame[i][j] == -2 then
					love.graphics.setColor(250, 250, 250)
					love.graphics.draw(flag, 50*(i-1)+51, 50*(j-1)+81)
				elseif tableGame[i][j] == -1 then
					love.graphics.setColor(250, 250, 250)
					love.graphics.draw(mina, 50*(i-1)+51, 50*(j-1)+81)
				elseif tableGame[i][j] == -3 then
					love.graphics.setColor(250, 250, 250)
					love.graphics.draw(stars, 50*(i-1)+51, 50*(j-1)+81)
				end
			end
		end
	elseif slozhnost == 2 then
		for i=1,16 do
			for j=1,16 do
				if tableGame[i][j] == 1 then
					love.graphics.setColor(250, 250, 250)
					love.graphics.draw(number1, 25*(i-1)+51, 25*(j-1)+81, 0, 1/2, 1/2)
				elseif tableGame[i][j] == 2 then
					love.graphics.setColor(250, 250, 250)
					love.graphics.draw(number2, 25*(i-1)+51, 25*(j-1)+81, 0, 1/2, 1/2)
				elseif tableGame[i][j] == 3 then
					love.graphics.setColor(250, 250, 250)
					love.graphics.draw(number3, 25*(i-1)+51, 25*(j-1)+81, 0, 1/2, 1/2)
				elseif tableGame[i][j] == 4 then
					love.graphics.setColor(250, 250, 250)
					love.graphics.draw(number4, 25*(i-1)+51, 25*(j-1)+81, 0, 1/2, 1/2)
				elseif tableGame[i][j] == 5 then
					love.graphics.setColor(250, 250, 250)
					love.graphics.draw(number5, 25*(i-1)+51, 25*(j-1)+81, 0, 1/2, 1/2)
				elseif tableGame[i][j] == 6 then
					love.graphics.setColor(250, 250, 250)
					love.graphics.draw(number6, 25*(i-1)+51, 25*(j-1)+81, 0, 1/2, 1/2)
				elseif tableGame[i][j] == 7 then
					love.graphics.setColor(250, 250, 250)
					love.graphics.draw(number7, 25*(i-1)+51, 25*(j-1)+81, 0, 1/2, 1/2)
				elseif tableGame[i][j] == 8 then
					love.graphics.setColor(250, 250, 250)
					love.graphics.draw(number8, 25*(i-1)+51, 25*(j-1)+81, 0, 1/2, 1/2)
				elseif tableGame[i][j] == 9 then
					love.graphics.setColor(250, 250, 250)
					love.graphics.draw(number9, 25*(i-1)+51, 25*(j-1)+81, 0, 1/2, 1/2)
				elseif tableGame[i][j] == 0 then
					love.graphics.setColor(250, 250, 250)
					love.graphics.draw(pustota, 25*(i-1)+51, 25*(j-1)+81, 0, 1/2, 1/2)
				elseif tableGame[i][j] == -2 then
					love.graphics.setColor(250, 250, 250)
					love.graphics.draw(flag, 25*(i-1)+51, 25*(j-1)+81, 0, 1/2, 1/2)
				elseif tableGame[i][j] == -1 then
					love.graphics.setColor(250, 250, 250)
					love.graphics.draw(mina, 25*(i-1)+51, 25*(j-1)+81, 0, 1/2, 1/2)
				elseif tableGame[i][j] == -3 then
					love.graphics.setColor(250, 250, 250)
					love.graphics.draw(stars, 25*(i-1)+51, 25*(j-1)+81, 0, 1/2, 1/2)
				end
			end
		end
	elseif slozhnost == 3 then
		for i=1,40 do
			for j=1,40 do
				if tableGame[i][j] == 1 then
					love.graphics.setColor(250, 250, 250)
					love.graphics.draw(number1, 10*(i-1)+51, 10*(j-1)+81, 0, 1/5, 1/5)
				elseif tableGame[i][j] == 2 then
					love.graphics.setColor(250, 250, 250)
					love.graphics.draw(number2, 10*(i-1)+51, 10*(j-1)+81, 0, 1/5, 1/5)
				elseif tableGame[i][j] == 3 then
					love.graphics.setColor(250, 250, 250)
					love.graphics.draw(number3, 10*(i-1)+51, 10*(j-1)+81, 0, 1/5, 1/5)
				elseif tableGame[i][j] == 4 then
					love.graphics.setColor(250, 250, 250)
					love.graphics.draw(number4, 10*(i-1)+51, 10*(j-1)+81, 0, 1/5, 1/5)
				elseif tableGame[i][j] == 5 then
					love.graphics.setColor(250, 250, 250)
					love.graphics.draw(number5, 10*(i-1)+51, 10*(j-1)+81, 0, 1/5, 1/5)
				elseif tableGame[i][j] == 6 then
					love.graphics.setColor(250, 250, 250)
					love.graphics.draw(number6, 10*(i-1)+51, 10*(j-1)+81, 0, 1/5, 1/5)
				elseif tableGame[i][j] == 7 then
					love.graphics.setColor(250, 250, 250)
					love.graphics.draw(number7, 10*(i-1)+51, 10*(j-1)+81, 0, 1/5, 1/5)
				elseif tableGame[i][j] == 8 then
					love.graphics.setColor(250, 250, 250)
					love.graphics.draw(number8, 10*(i-1)+51, 10*(j-1)+81, 0, 1/5, 1/5)
				elseif tableGame[i][j] == 9 then
					love.graphics.setColor(250, 250, 250)
					love.graphics.draw(number9, 10*(i-1)+51, 10*(j-1)+81, 0, 1/5, 1/5)
				elseif tableGame[i][j] == 0 then
					love.graphics.setColor(250, 250, 250)
					love.graphics.draw(pustota, 10*(i-1)+51, 10*(j-1)+81, 0, 1/5, 1/5)
				elseif tableGame[i][j] == -2 then
					love.graphics.setColor(250, 250, 250)
					love.graphics.draw(flag, 10*(i-1)+51, 10*(j-1)+81, 0, 1/5, 1/5)
				elseif tableGame[i][j] == -1 then
					love.graphics.setColor(250, 250, 250)
					love.graphics.draw(mina, 10*(i-1)+51, 10*(j-1)+81, 0, 1/5, 1/5)
				elseif tableGame[i][j] == -3 then
					love.graphics.setColor(250, 250, 250)
					love.graphics.draw(stars, 10*(i-1)+51, 10*(j-1)+81, 0, 1/5, 1/5)
				end
			end
		end
	end
end

function NewCountPustot ( tableGame, slozhnost )
	if slozhnost == 1 then
		local chislo = 0
		for i=1,8 do
			for j=1,8 do
				if tableGame[i][j] > -1 or tableGame[i][j] == -3 then
					chislo = chislo + 1 
				end
			end
		end
		return chislo
	end
	if slozhnost == 2 then
		local chislo = 0
		for i=1,16 do
			for j=1,16 do
				if tableGame[i][j] > -1 or tableGame[i][j] == -3 then
					chislo = chislo + 1 
				end
			end
		end
		return chislo
	end
end

function NewCountFlag( tableGame, slozhnost )
	if slozhnost == 1 then
		local chislo = 0
		for i=1,8 do
			for j=1,8 do
				if tableGame[i][j] == -2 then
					chislo = chislo + 1 
				end
			end
		end
		return chislo
	end
	if slozhnost == 2 then
		local chislo = 0
		for i=1,16 do
			for j=1,16 do
				if tableGame[i][j] == -2 then
					chislo = chislo + 1 
				end
			end
		end
		return chislo
	end
end

