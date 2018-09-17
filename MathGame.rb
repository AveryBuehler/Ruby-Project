# Avery Buehler
# CS320 Concepts Programming Languages (Spring 2018)
# Dr. Carolyn Rosiene
# Language Research Project

# Fun Math Game
# Main Class

# Linking the question & player class
require_relative 'question'
require_relative 'player'

# Creating my main class
class Main

	# Creating a new question & player object
	# The @ denotes these are "instance objects"
	# This means that their instance variables will change from object to object
    @questions = Question.new
    @players = Player.new 
	
	# Creating a global variable (queue data-type)
	# The $ denotes it is a global variable
	$queue = Queue.new
	
	# Welcoming people to my game!
	puts "======================================"
	puts "Welcome to Avery's Math Game!\nPlease follow the prompt to play!\nDecimals should be rounded to 3 places!"
	puts "======================================"
	
	# Defining a new method called turn
	# The keyword self gives access to the current object
	# This method takes a player object to determine whos turn it is
    def self.turn player 
	
		# This makes a number as an instance variable to this turn
        @questions.makeNumber
		
		# This is a BIG part of Ruby - String Interpolation
		# String interpolation lets you embed expressions in a string enclosed in double quotes
        puts "#{player}: What does #{@questions.number1} #{@questions.operator} #{@questions.number2} equal?"
		print "Answer: "
		
		# This gets the user's answer and "chomps" it - meaning it removes any excess "stuff"
        user_answer = gets.chomp
		
		# Compares the user's answer to the actual instance answer
		# to_f converts an integer to a floating number
        if user_answer.to_f == @questions.real_answer
            puts 'Correct!'
            puts "#{@players.player1}: #{@players.player1_score}/3 #{@players.player2}: #{@players.player2_score}/3"
			
			# This records the numbers and the players answer into a queue
			# << is the same as "pushing" or "adding" something to a queue - similar to C++ syntax
			$queue << "#{player} answered #{@questions.number1} #{@questions.operator} #{@questions.number2} correctly! (#{user_answer})"
        else
            puts 'Wrong.'
            @players.reduce_score(player)
            puts "#{@players.player1}: #{@players.player1_score}/3 #{@players.player2}: #{@players.player2_score}/3"
			$queue << "#{player} answered #{@questions.number1} #{@questions.operator} #{@questions.number2} incorrectly... they answered #{user_answer}!" 
        end

		# If one of the players loses
        if @players.player1_score <= 0 || @players.player2_score <= 0
		puts "\a\r\n========================================"  
			
			# Nothing special here
			# upcase transforms a string to all uppercase letters
			if @players.player1_score <= 0
				puts "\tCONGRATULATIONS #{@players.player2.upcase}"
			else
				puts "\tCONGRATULATIONS #{@players.player1.upcase}"
			end
            
			puts "\t\tYOU WON!"
			puts "===============SCOREBOARD===============" 
			
			# This is an "until" loop in Ruby
			# It will run until it is false
			# As stated earlier, EVERYTHING in Ruby is false unless it is "false" or "nil"
			# This will pop all elements out of the queue
			# I used a queue instead of a stack due to it being FIFO and not LIFO
			until $queue.empty?()
				puts $queue.pop
			end
			
		# If no one has lost yet...	
        else
            puts "\n----------NEXT TURN-----------"
            if player == @players.player1 
                turn @players.player2
            else
                turn @players.player1
            end
        end
    end
	
	# This decides who starts the game
	# This assigns a random value between 1-2 to ran
	ran = rand(1..2)
	
	# This is a case which evaluates the ran variable
	case ran
	
		# When ran is 1
		# player1 will begin
		# otherwise
		# player2 will begin
		when 1
			turn(@players.player1) 
		else
			turn(@players.player2)
		end
end