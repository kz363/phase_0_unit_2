# U2.W4: Separate Numbers with Commas


# I worked on this challenge [by myself, with: ].

# 2. Pseudocode

# Input: int
# Output: comma-separated int as a string
# Steps:
# Initialize variable string, as an empty string.
# Initialize variable num_string, which stores the reversed-string of the input integer.
# Initialize variable count, as 0.
# For each character in num_string:
#   -Add character to string
#   -Increment count by 1
#   -Add comma to string if count is divisible by 3 and count is less than num_string.length
# Return string.reverse

# 3. Initial Solution

# def separate_comma(number)
#   string = ""
#   num_string = number.to_s.reverse
#   count = 0
#   num_string.each_char do |c|
#     string << c
#     count += 1
#     string << "," if count % 3 == 0 && count < num_string.length
#   end
#   string.reverse
# end


# 4. Refactored Solution

def separate_comma(number)
  output_string = ""
  count = 0
  number.to_s.reverse.each_char do |c|
    output_string << c
    count += 1
    output_string << "," if count % 3 == 0 && count < number.to_s.length
  end
  output_string.reverse!
end

# 5. Reflection 
# The logic behind my solution went as planned. I did run into a problem with line 29 at first. Instead 
# of count < num_string.length, I did c != num_string[-1, 1] initially, to mean "put in a comma if count 
# is divisible by 3 and it's not the last character in the num_string". That way it wouldn't do something 
# like ,900,000,000. This randomly failed tests, until I realized that the code meant that c isn't EQUAL 
#to the last char in the string, not that it IS actually the last character in the string. I just replaced 
# it with count < num_string.length which is logically the same, and it worked perfectly.