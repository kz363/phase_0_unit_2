# U2.W5: Build a simple guessing game SOLO CHALLENGE


# I worked on this challenge by myself.

# 2. Pseudocode

# Define a GuessingGame class that is initialized by an integer called answer. 
# Initialize @answer to answer and @solved to false
# Define a method, guess, which takes an integer called guess.
#   -Initialize @guess to guess
#   -If the guess is greater than the answer, set @solved to false and return :high
#   -If the guess is equal to the answer, @solved to true and return :correct
#   -If the guess is lower than the answer, @solved to false and return :low
# Define a method, solved?, which returns @solved

# 3. Initial Solution

# class GuessingGame
#   def initialize(answer)
#     @answer = answer
#     @solved = false
#   end
  
#   def guess(guess)
#     @guess = guess
#     if @guess > @answer
#       @solved = false
#       return :high
#     elsif @guess == @answer
#       @solved = true
#       return :correct
#     elsif @guess < @answer
#       @solved = false
#       return :low
#     end
#   end

#   def solved?
#     return @solved
#   end
# end


# 4. Refactored Solution

class GuessingGame
  def initialize(answer)
    @answer = answer
    @solved = false
  end
  
  def guess(guess)
    if guess > @answer
      @solved = false
      :high
    elsif guess == @answer
      @solved = true
      :correct
    else
      @solved = false
      :low
    end
  end

  def solved?
    @solved
  end
end


# 1. DRIVER TESTS GO BELOW THIS LINE
# game = GuessingGame.new(10)

# game.solved?   # => false

# game.guess(5)  # => :low
# game.guess(20) # => :high
# game.solved?   # => false

# game.guess(10) # => :correct
# game.solved?   # => true

# game = GuessingGame.new rand(100)
# last_guess  = nil
# last_result = nil

# until game.solved?
#   unless last_guess.nil?
#     puts "Oops!  Your last guess (#{last_guess}) was #{last_result}."
#     puts ""
#   end

#   print "Enter your guess: "
#   last_guess  = gets.chomp.to_i
#   last_result = game.guess(last_guess)
# end

# puts "#{last_guess} was correct!"

# Rspec Translations
game = GuessingGame.new(10)
p game.solved? == false
p game.guess(100) == :high
p game.guess(0) == :low
p game.guess(10) == :correct
p game.solved? == true



# 5. Reflection 
# I read the example driver code in the challenge description and thought out my initial solution based on that. 
# Turns out that the Rspec tests didn't like it, specifically the switching solved? between true and false at the 
# moment that the guesses are made. I calculated the value of solved? within the method itself so it didn't pass 
# the tests. I introduced an @solved variable and used it to pass the rest of the tests by initializing it in the 
# initialize method and changing it after every guess. I couldn't think of a way to refactor the code any further 
# since there wasn't much logic in it, just a lof of returns.