# Avery Buehler
# CS320 Concepts Programming Languages (Spring 2018)
# Dr. Carolyn Rosiene
# Language Research Project

# Fun Math Game
# Question Class

class Question
    attr_accessor :number1, :number2, :real_answer, :operator
    def initialize()
        @number1 = 0.0
        @number2 = 0.0
        @real_answer = 0.0
    end
		
	# Method which generates an operator & two operands
    def makeNumber()
	
		# This "samples" from an array
		# AKA it selects a random element from it!
		# Simply another way of "randomizing" things
		self.operator = ["+", "-", "*", "/"].sample 
        self.number2 = rand(1..20) 
        self.number1 = rand(1..20) 
		case operator
			when "+"
				self.real_answer = (number1 + number2.to_f).round(3)
			when "-"
				self.real_answer = (number1 - number2.to_f).round(3)
			when "*"
				self.real_answer = (number1 * number2.to_f).round(3)
			when "/"
				self.real_answer = (number1 / number2.to_f).round(3)
			else
				0.0
			end
    end
end