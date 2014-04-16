# U2.W6: Refactoring for Code Readability



# I worked on this challenge with Ken Sin.


# Original Solution

# URL: https://github.com/sebabelmar/phase_0_unit_2/blob/master/week_5/6_validate_credit_card/my_solution.rb

class CreditCard
    
  def initialize (number) # Initializes the @number and checks the length to make sure it's 16
    @number = number
    raise ArgumentError.new("Your Credit Card number it's incorrect.") if @number.to_s.length != 16
  end
  
  def check_card # should break check_card method into several methods so that it only has a single responsibility
    number_arr = @number.to_s.split(//).map(&:to_i) # Splits @number into an array of Fixnums
    step_1 = []
    i = number_arr.length - 1 # => 15
      
    while i >= 0 # iterate backwards in the array until you reach the first element
      if i % 2 == 0 # for even indices
        dbl_dgt = (number_arr[i] * 2) # double the value in number_arr
        if dbl_dgt >= 10 # if the doubled value is greater than 10
          dbl_dgt = dbl_dgt.to_s.split(//).map(&:to_i) # split the double digit into 2 digits
            step_1 << dbl_dgt.pop << dbl_dgt.pop # adds each digit as a new element to step_1
        else
          step_1 << dbl_dgt # if the doubled digit is a single digit, put into array
        end
      else
        step_1 << number_arr[i] # for non-even indices, just put the value into step_1
      end
      i -= 1 # reduce i counter by 1 to continue iteration
    end
      
    step_1.inject(:+) % 10 == 0 # returns true if the total is divisible by 10, else false
  end
    
end


# Refactored Solution

class CreditCard
    
  def initialize (number) 
    @number = number
    raise ArgumentError.new("Your Credit Card number it's incorrect.") if @number.to_s.length != 16
  end
  
  def check_card    
    sum(double_digits) % 10 == 0
  end
  
  def to_array(digits)
    digits.to_s.split(//).map(&:to_i)
  end
  
  def double_digits
    digits_of_number = to_array(@number)
    i = 0
    until i == digits_of_number.length
      digits_of_number[i] *= 2 if i % 2 == 0
      i += 1
    end
    digits_of_number
  end
  
  def sum(array_of_numbers)
    sum_array = []
    array_of_numbers.each do |num|
      if num >= 10
        sum_array << to_array(num).first << to_array(num).last
      else
        sum_array << num
      end
    end
    sum_array.inject(:+)
  end
  
end

# DRIVER TESTS GO BELOW THIS LINE

def assert
  raise "Assertion failed!" unless yield
end

card = CreditCard.new(4408041234567893) # Returns true for valid card
assert { card.check_card }

# card_2 = CreditCard.new(440804123) # Returns ArgumentError for a number less than 16 digits

card_3 = CreditCard.new(4408041234567892) # Returns false for bad card
assert { card_3.check_card }



# Reflection
# Our main goal for the refactoring was to divide the logic into methods that only focused on one task, instead 
# of having one method do everything like in the original code. We kept true to the original code's logic for the 
# most part and I think we did a good job of that. The only difference we made was changing the direction of iterating 
# through the digits, going forward instead of backwards since it doesn't make a difference in a 16 digit number.