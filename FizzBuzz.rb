# Avery Buehler
# CS320 Concepts Programming Languages (Spring 2018)
# Dr. Carolyn Rosiene
# Language Research Project

# FizzBuzz

def fizzbuzz?(number)
  return 'Fizzbuzz' if number % 15 == 0
  return 'Buzz' if number % 5 == 0
  return 'Fizz' if number % 3 == 0
  number
end

(1..100).each { |i| p fizzbuzz?(i) }

