# Avery Buehler
# CS320 Concepts Programming Languages (Spring 2018)
# Dr. Carolyn Rosiene
# Language Research Project

# Fibonacci Sequence

# Recursive 
def fibonacci(n)
	return n if n <= 1
	fibonacci(n-1) + fibonacci(n-2)
end
puts fibonacci(10)

# Done with a do loop
def fibonacci(n)
	a = 1
	b = 1
	
	# Computes Fibonacci number in the desired position
	n.times do
		temp = a
		a = b
		
		# Add up the previous two numbers in sequence
		b = temp + b
	end
	return a
end

# Write the first 10 Fibonacci numbers in sequence
10.times do |n|
	result = fibonacci(n)
	puts result
end