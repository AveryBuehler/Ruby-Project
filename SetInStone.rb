# Avery Buehler
# CS320 Concepts Programming Languages (Spring 2018)
# Dr. Carolyn Rosiene
# Language Research Project

# Metaprogramming Example

class SetInStone
 #empty class
end

# CNTL-SHFT-K
class SetInStone
 def everything_changes
   return "Wait, what? You just added a method to me!"
 end
end

print SetInStone.new.everything_changes