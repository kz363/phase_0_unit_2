# U2.W5: Class Warfare, Validate a Credit Card Number


# I worked on this challenge by myself.

# 2. Pseudocode

# Input: initialize takes a card_number. If the number is exactly 16 digits, set it to @card_number
#        sum takes digits, an array, as an input.
# Output: check_card returns true or false depending on card_number
# Steps:
# Define CreditCard#initialize which takes card_number as an input.
#   -If card_number isn't exactly 16 digits, raise ArgumentError
#   -Else, set @card_number to card_number

# Define CreditCard#double_digits which doubles every other digit of @card_number

# Define CreditCard#sum which sums the single digits and the broken down double digits. Returns the sum.

# Define CreditCard#check_card which calls double_digits and sum, then checks if the sum is a multiple of 10.
# Return true or false.

# 3. Initial Solution

# Don't forget to check on intialization for a card length
# of exactly 16 digits
class CreditCard
  def initialize(card_number)
    if card_number.to_s.length != 16
      raise ArgumentError.new("Card number must be 16 digits")
    else
      @card_number = card_number.to_s.split("").map(&:to_i) # Makes an array where each element is an integer of card_number
    end
  end

  def check_card
    return true if sum(double_digits) % 10 == 0
    false
  end

  private

  def double_digits # Doubles every other digit of @card_number starting from the second to last, or every even index
    @card_number.map.with_index{|int, index|index.even? ? int*2:int}
  end

  def sum(digits) # Takes in an array and separates any double digits into an array, then sums the whole array
    digits.map{|int| int>9 ? int.divmod(10):int}.flatten.inject(:+)
  end
end



# 4. Refactored Solution
# I already did a lot of refactoring while I was doing my intial solution so I have nothing to add. I also 
# feel like refactoring this would completely change the logic I used since a lot of the method chains are 
# very specific.



# 1. DRIVER TESTS GO BELOW THIS LINE
# card = CreditCard.new(1234) # Prints ArgumentError

card = CreditCard.new(4408041234567893) # Returns true for valid card
p card.check_card

card = CreditCard.new(4408041234567892) # Returns false for bad card
p card.check_card



# 5. Reflection
# I really enjoyed this challenge. I think, for me, it's been the hardest one in all the 5 weeks we've had so far 
# because there was so much I had to look up and learn. Here's a list of stuff I learned from this challenge:
#   -Shortcut for map: map(&:to_i) is the same as map{|i| i.to_i}
#   -int.divmod(10) to separate a 2 digit FixNum into an array
#   -Ruby's ternary operator: condition ? if_true : if_false
# There's a bit more, but those were the big ones. Learning how to chain a bunch of methods together was also fun.
# My initial solution chained a ton of methods in the if statement of check_card to do all the logic on one line. 
# I realized that the instructions said that each check should be in its own method, and I decided to redo it because 
# that made a lot more sense.
# I made use of IRB a lot more than usual in this challenge because I had to understand how certain methods would chain 
# into each other.