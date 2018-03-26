class Game
	def initialize()
		@players     = []
		@turn_index  = 0

		(1..2).each do |x|
			print "Enter a name for Player #{x}:\n> "
			@players.push(Player.new(gets.chomp))
		end

		response = ''
		responses = ['1', '2', 'r']
		while !responses.include? response
			print "Who goes first?\n"\
					 "1: #{@players[0].name}\n"\
					 "2: #{@players[1].name}\n"\
					 "r: random\n> "
			response = gets.chomp
		end

		if response == '2'
			@turn_index = 1
		elsif response == 'r'
			@turn_index = Random.rand(2)
		end
	end

	def get_current_player()
		return @players[@turn_index]
	end

	def toggle_turn_index()
		@turn_index += 1
		@turn_index %= 2
	end

	def announce(announcement) 
		return "----- #{announcement.upcase} -----"
	end

	def game_over_sequence()
		player = get_current_player
		puts "#{player.name} wins with a score of #{player.current_score}\n"\
				 "#{announce('game over')}\n"\
				 "Goodbye!"
	end

	def play()
		puts announce('new turn')
		question   = Question.new
		player     = get_current_player
		game_over  = false
		toggle_turn_index

		correct = question.ask(player)
		if !correct
			player.lose_a_life

			if !player.alive?
				game_over = true
				game_over_sequence
			end
		end

		if !game_over
			puts "#{@players[0]} vs #{@players[1]}"
			play
		end	
	end
end

