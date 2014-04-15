# U2.W6: Testing Assert Statements


# I worked on this challenge [by myself, with: ].


# 2. Review the simple assert statement

def assert
  raise "Assertion failed!" unless yield
end
 
name = "bettysue"
assert { name == "bettysue" }
assert { name == "billybob" }

# 2. Pseudocode what happens when the code above runs

# yield becomes true/false depending on what's inside the block after assert is called. In this case, the first 
# assert will run fine but the second one will raise Assertion Failed.

# 3. Copy your selected challenge here

class RPNCalculator

  def evaluate(rpn_expression)
    rpn_array = rpn_expression.split(" ").map!{|i| i =~ /\d/ ? i.to_i : i.to_sym} # Converts the string to an array where each element is either an integer or a symbol
    until rpn_array.length == 1 # Keeps looping until it evaluates everything in the expression.
      rpn_array.each_with_index do |i, index|
        if rpn_array[index+2] =~ /[-+*]/ # Looks 2 elements ahead for an operator
          rpn_array[index..index+2] = rpn_array[index..index+1].inject(rpn_array[index+2])
          break
        end
      end
    end
    rpn_array[0]
  end

end

# 4. Convert your driver test code from that challenge into Assert Statements

rpn = RPNCalculator.new
assert { rpn.evaluate('0') == 0 }
assert { rpn.evaluate('-1') == -1 }
assert { rpn.evaluate('1 1 +') == (1 + 1) }
assert { rpn.evaluate('1 -1 +') == 0 }
assert { rpn.evaluate('2 2 *') == (2 * 2) }
assert { rpn.evaluate('5 10 -') == (5 - 10) }
assert { rpn.evaluate('1 2 3 4 + + +') == (1 + 2 + 3 + 4) }
assert { rpn.evaluate('1 2 + 3 4 + *') == ((2 + 1) * (4 + 3)) }
assert { rpn.evaluate('20 10 5 4 + * -') == (20 - 10*(5 + 4)) }

a, b, c = Array.new(3) { rand(100) }
assert { rpn.evaluate("#{a} #{b} - #{c} *") == (a-b)*c }


# 5. Reflection 
# This challenge was relatively simple. I'm wondering what the advantages of using assert is over our old driver 
# tests with printing true/false. The one reason I don't like it right now is because the code stops running once 
# it does raise an error, but that could probably be fixed by changing the assert method.