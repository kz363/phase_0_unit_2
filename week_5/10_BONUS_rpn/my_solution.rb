# U2.W5: Implement a Reverse Polish Notation Calculator


# I worked on this challenge by myself.

# 2. Pseudocode

# Input: A valid RPN expression in the form of a string
# Output: An integer based on the string's evaluation
# Steps:
# Define RPNCalculator#Evaluate that takes RPNExpression as a parameter
# -Iterate through string to find the first occurrence of 2 digits and an operator
# -Evaluate it, then replace that portion of the string with the evaluation
# -Repeat until there aren't any more patterns to evaluate

# 3. Initial Solution

class RPNCalculator
  def evaluate(rpn_expression)
    rpn_array = rpn_expression.split(" ").map!{|i| i =~ /\d/ ? i.to_i : i} # Converts the string to an array where each element is either an integer or a string with an operator
    until rpn_array.length == 1 # Keeps looping until it evaluates everything in the expression.
      temp_array = []
      found_operator = false
      rpn_array.each_with_index do |i, index|
        if rpn_array[index+2] =~ /[-+*]/ && !found_operator # Looks 2 elements ahead for an operator
          temp_array << rpn_array[index..index+1].inject(:"#{rpn_array[index+2]}")
          rpn_array[index..index+1] = []
          found_operator = true
        else
          temp_array << i
        end
      end
      rpn_array = temp_array
    end
    rpn_array[0] # By the end of the until loop, rpn_array should only have the answer as an element.
  end
end


# 4. Refactored Solution
# I have no idea how to refactor this. I've realized that it's hard to refactor code with methods/syntax that 
# I just learned because the reason I learned them to begin with was to write the best code that I could with 
# that knowledge. It's also hard because they're really specific to the logic, so I'd have to rewrite the whole 
# thing if I were to refactor.


# 1. DRIVER TESTS GO BELOW THIS LINE
rpn = RPNCalculator.new
p rpn.evaluate('0') == 0
p rpn.evaluate('-1') == -1
p rpn.evaluate('1 1 +') == (1 + 1)
p rpn.evaluate('1 -1 +') == 0
p rpn.evaluate('2 2 *') == (2 * 2)
p rpn.evaluate('5 10 -') == (5 - 10)
p rpn.evaluate('1 2 3 4 + + +') == (1 + 2 + 3 + 4)
p rpn.evaluate('1 2 + 3 4 + *') == ((2 + 1) * (4 + 3))
p rpn.evaluate('20 10 5 4 + * -') == (20 - 10*(5 + 4))

a, b, c = Array.new(3) { rand(100) }
p rpn.evaluate("#{a} #{b} - #{c} *") == (a-b)*c

# 5. Reflection 
# Holy moley, I'm writing this just as I finished the initial solution, and it was quite a challenge. I wasn't sure
# how to write the actual logic when coming up with my pseudocode, which is why it turned out so vague. I ended up not 
# adhering to it in the end, but followed the same logic. I thought of the logic in my head to solve this problem, but 
# the hardest part of the challenge was actually translating that logic into code. Because there's so much Ruby that I 
# don't know yet, I ran into a lot of debugging that I had to do when some new things that I looked up didn't work the 
# way I thought they would. In particular, on lines 25-28, which ran into errors when the tests had more than one operator 
# in the expression. There were so many things about array manipulation that I didn't know about either and had to look up 
# as a result. For example, in line 27, it replaces that range in the array with nil, so essentially deletes that part and 
# shifts the rest over. I don't think there is any method that both deletes and shifts elements of an array so I used that.
# I've realized that the harder the challenges become, the more I'm falling in love with IRB because it's the only tool that 
# I have to debug. I used to think it was useless when I first started learning Ruby.