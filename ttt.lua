-- frontend
function drawBoard(markers)
	print("| ", markers[1], " | ", markers[2], " | ", markers[3], " | \n")
	print("| ", markers[4], " | ", markers[5], " | ", markers[6], " | \n")
	print("| ", markers[7], " | ", markers[8], " | ", markers[9], " | \n")
end
function drawExample()
	m = {'1', '2', '3', '4', '5', '6', '7', '8', '9'}
	drawBoard(m)
end
-- backend
function charToInt(marker) 
	if (marker == 'X') then
		out = 1	
	end
	
	if (marker == 'O') then
		out = 2
	end
	return out
		
end
function intToChar(number)
	if (number == 1) then
		out = 'X'
	end	
	if (number == 2) then
		out = 'O'
	end

	return out
end
function check4win(markers, mark)
	-- horizontal line cases ( - - -)
	if (markers[1] == mark and markers[2] == mark and markers[3] == mark) then
		return true
	end
	if (markers[4] == mark and markers[5] == mark and markers[6] == mark) then
		return true
	end
	if (markers[7] == mark and markers[8] == mark and markers[9] == mark) then
		return true
	end
	
	-- vertical line cases
	if (markers[1] == mark and markers[4] == mark and markers[7] == mark) then
		return true
	end
	if (markers[2] == mark and markers[5] == mark and markers[8] == mark) then
		return true
	end
	if (markers[3] == mark and markers[6] == mark and markers[9] == mark) then
		return true
	end

	-- diagonal cases

	if (markers[1] == mark and markers[5] == mark and markers[9] == mark) then
		return true
	end
	if (markers[3] == mark and markers[5] == mark and markers[7] == mark) then
		return true
	end
end
-- uses a random number generator, checks if the number is unoccupied or not and marks it with its marker
function rngTurn(markers) 
	print("Not yet implemented")
end
function turn(markers, players, playersTurn)
	print("\nInput a grid slot (1-9): ")
	grid = io.read("*n")

	if (grid > 9 or grid < 1) then
		print("Your grid slot is not valid")
	end
	if (markers[grid] == 'X' or markers[grid] == 'O') then
		print"Your grid slot is not valid"
		print"Turn skipped"
	else
		markers[grid] = players
		drawBoard(markers)
	end
end
function main() 

	print("Do you want to be Xs or Os?: ")
	--	rawP = io.read()
	--	player = string.upper(rawP)
	
	player = 'X'
	player2 = 'O' 

	markers = {'1', '2', '3', '4', '5', '6', '7', '8', '9'}
	running = true
	playersTurn = 1
	drawExample()


	while (running) do
		if (playersTurn == 1) then
			turn(markers, player, playersTurn)
			if (check4win(markers, player) == true) then
				print ("\n\n Player 1 Wins")
				running = false
				break
			end
			playersTurn = 2
		end
		if (playersTurn == 2) then
			turn(markers, player2, playersTurn)
			if (check4win(markers, player2) == true) then
				print ("\n\n Player 2 Wins")
				running = false
				break
			end
			playersTurn = 1
		end
	end
end

main()
