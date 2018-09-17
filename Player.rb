# Avery Buehler
# CS320 Concepts Programming Languages (Spring 2018)
# Dr. Carolyn Rosiene
# Language Research Project

# Fun Math Game
# Player Class

class Player

	# We "need" this because "class" is NOT a definition in Ruby like it is in C++/Java
	# class is simply an expression that evaluates
	# During this evaluation, the attr_accessor method is invoked which in turn modified the 
	# current class
	# It is short-hand for:
	# 
	# def player1
	#	@player1
	# end
	# def player1 = (new_value)
	# 	@player1 = new_value
	# end
	# ...
	# ...
	# As you can see it saves A LOT of space
    attr_accessor :player1, :player2, :player1_score, :player2_score 
    
	# Here we set the player's name and score
    def initialize()
        @player1 = 'Avery'
        @player2 = 'Class'
        @player1_score = 3
        @player2_score = 3
    end

	# Here we refuce the score if they answer incorrectly
	# We take the player object as a parameter
    def reduce_score(player)
		case player
			when player1
				self.player1_score -= 1
			else
				self.player2_score -= 1
			end
    end
end