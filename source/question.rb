class Question
	@@operators = ['plus', 'minus']
	def initialize() 
		first_number = 1 + Random.rand(20)
		second_number = 1 + Random.rand(20)
		operator = @@operators[Random.rand(2)]
		@sentence = "What is #{first_number} #{operator} #{second_number}?"
		@answer = operator == 'plus' ? first_number + second_number : first_number - second_number
	end

	def ask(player)
		print "#{player.name}: #{@sentence}\n> "
		answer = gets.chomp.to_i
		if answer == @answer
			puts 'YES! You are correct.'
			return true
		end
		puts 'Seriously? NO!'
		return false
	end
end