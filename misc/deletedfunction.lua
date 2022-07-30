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
