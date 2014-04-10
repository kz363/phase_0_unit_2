# U2.W5: Die Class 2: Arbitrary Symbols


# I worked on this challenge by myself.

# 2. Pseudocode

# Input: Array of strings
# Output: ArgumentError if input is empty array
          # Returns number of sides for sides method
          # Returns a random element of input array for roll method
# Steps:
# Define class Die
# Define initialize that takes labels as a parameter
#   - If labels.empty?, raise ArgumentError
#   - Else, @labels = labels
# Define sides that returns @labels.length
# Define roll that returns @labels.sample


# 3. Initial Solution

class Die
  def initialize(labels)
    if labels.empty?; raise ArgumentError.new("Labels must not be empty") else @labels = labels end
  end

  def sides
    return @labels.length
  end

  def roll
    return @labels.sample
  end
end

# 4. Refactored Solution
# I believe my initial solution is fine as is. This was a simple challenge so there's not a lot to 
# improve on.




# 1. DRIVER TESTS GO BELOW THIS LINE
# Raises an ArgumentError if list of labels is smpety
# Die.new([])

# Returns the number of sides given on initialization
length = 1 + rand(100)
sides = Array.new(length) { 'A' }
die = Die.new(sides)
p die.sides == length

# Returns a single letter if one label is passed in
random_letter = ('A'..'Z').to_a[rand(26)]
die = Die.new([random_letter])
p Array.new(100) { die.roll } == Array.new(100) { random_letter }

# Returns every possible letter for a sufficiently large number of rolls
possible_values = ('A'..'Z').to_a.shuffle.first(15)
die = Die.new(possible_values)
output = Array.new(10000) { die.roll }.uniq
p output.sort == possible_values.sort




# 5. Reflection 
# This challenge was very similar to the last challenge so I don't have much to say as my thoughts 
# are similar to my last reflection. I'm learning a lot from reading the rspec tests, however. I didn't 
# know you could pass a block after Array.new() or to_a.