def valid?(input, low, high)
	return input if (low..high) === input
	return false
end

def prompt(message)
	puts message
	print "> "
end

def guess(low, high, message)
	until (input = valid?(gets.chomp.to_i, low, high))
		prompt(message)
	end
	input
end

def reset?
	input = gets.chomp
	if ['y', 'yes'].include?(input)
		return true
	elsif ['n', 'no', 'exit', 'q', 'quit'].include?(input)
		return false
	end
	return nil
end

def play
	low = 1
	high = 10
	number = rand(low..high)
	misses = 0
	guesses = 3

	message = "Please guess a number between #{low.to_s} and #{high.to_s}"
	prompt(message)

	while misses < guesses
		if (g = guess(low, high, message)) == number
			puts "You win!"
			break
		elsif misses < guesses - 1
			puts "Nope."
			proximity = g < number ? 'higher' : 'lower'
			puts "The number is #{proximity} than #{g}"
		else
			puts "You lose."
		end
		misses += 1
	end

	puts " The number was #{number.to_s}"

	message = "Would you like to play again? y/n"
	prompt(message)

	r = reset?
	while r == nil
		prompt(message)
		r = reset?
	end

	play if r
end