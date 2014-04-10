# U2.W5: Die Class 1: Numeric


# I worked on this challenge by myself.

# 2. Pseudocode

# Input: Integer for sides
# Output: ArgumentError if input is less than 1 for initialize
          # Returns @sides for sides method
          # Returns a random number between 1 and sides for roll method
# Steps:
# Define class Die
# Define initialize that takes sides as a parameter
#   - If sides > 1, set @sides = sides 
#   - Else, raise ArgumentError
# Define sides that returns @sides
# Define roll that returns rand(@sides) + 1


# 3. Initial Solution

class Die
  def initialize(sides)
    if sides > 1; @sides = sides else raise ArgumentError.new("Sides must be greater than 1") end
  end
  
  def sides
    return @sides
  end
  
  def roll
    return rand(@sides) + 1
  end
end

# 4. Refactored Solution
# I believe my initial solution is fine as is. This was a simple challenge so there's not a lot to 
# improve on.


# 1. DRIVER TESTS GO BELOW THIS LINE
# raises an ArgumentError if sides < 1
# p Die.new(-1)

# Returns the number of sides given on initialization
sides = rand(800)
die = Die.new(sides)
p die.sides == sides

# Returns a number between 1 and the number of sides
sides = 100 + rand(100)
die = Die.new(sides)
possible_values = (1..sides).to_a
unique_rolls = Array.new(20000) { die.roll }.uniq.sort
p unique_rolls == possible_values


# 5. Reflection
# This was the first time I made a class in Ruby with some guidance. Last week for the homework cheater 
# challenge, I made a class but I ran into some trouble understanding variables declared with @ as opposed 
# to @@. I think I have a better understanding of instance variables now.

# For the driver tests, I'm not sure if there's a way to check that there was an ArgumentError with ==, 
# since it seems that the code breaks when an ArgumentError was raised. I'm also not sure if I translated 
# the rspec properly. I feel like I may have been too literal but it works!