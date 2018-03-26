class Player
	attr_reader :name
	def initialize(player_name)
		@name = player_name
		@lives = 3
	end

	def lose_a_life()
		@lives -= 1
	end

	def alive?()
		return true if @lives > 0
		return false
	end

	def current_score()
		return "#{@lives}/3"
	end	

	def to_s()
		return "#{name}: #{self.current_score}"
	end
end