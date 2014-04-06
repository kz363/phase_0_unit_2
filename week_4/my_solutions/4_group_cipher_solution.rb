# U2.W4: Cipher Challenge


# I worked on this challenge with Kennedy Bhagwandeen.



# 1. Solution
# Write your comments on what each thing is doing. 
# If you have difficulty, go into IRB and play with the methods.



# def north_korean_cipher(coded_message)
#   input = coded_message.downcase.split("") # Splits each character into an element of an array
#   decoded_sentence = []
#   cipher = {"e" => "a",   # Pros: Easy and simple when you only need to account for one shift.
#             "f" => "b",   # Cons: Static, so you'd have to make a new hash for different shifts.
#             "g" => "c", 
#             "h" => "d", 
#             "i" => "e", 
#             "j" => "f",
#             "k" => "g",
#             "l" => "h",
#             "m" => "i",
#             "n" => "j",
#             "o" => "k",
#             "p" => "l",
#             "q" => "m",
#             "r" => "n",
#             "s" => "o",
#             "t" => "p",
#             "u" => "q",
#             "v" => "r",
#             "w" => "s",
#             "x" => "t",
#             "y" => "u",
#             "z" => "v",
#             "a" => "w",
#             "b" => "x",
#             "c" => "y",
#             "d" => "z"}
            
#   input.each do |x| # Iterating through the input array
#     found_match = false  # When found_match is true, that means that x was translated and the next character can be processed.
#     cipher.each_key do |y| # Iterating through each key of the hash, cipher.
#       if x == y  # x is coming from the input array, y is coming from the cipher hash. This is comparing the characters.
#         puts "I am comparing x and y. X is #{x} and Y is #{y}."
#         decoded_sentence << cipher[y]
#         found_match = true
#         break  # found_match is set to true, so there's essentially nothing else to do in the rest of the elsifs.
#       elsif x == "@" || x == "#" || x == "$" || x == "%"|| x == "^" || x == "&"|| x =="*" # This is looking for any non-alphabetical characters.
#         decoded_sentence << " "
#         found_match = true
#         break
#       elsif (0..9).to_a.include?(x) # Creates an array from 0 to 9.
#         decoded_sentence << x
#         found_match = true
#         break
#       end 
#     end
#     if not found_match  # If x hasn't been found in the code above, it puts x in decoded_sentence anyway.
#       decoded_sentence << x
#     end
#   end
#   decoded_sentence = decoded_sentence.join("")
 
#   if decoded_sentence.match(/\d+/) # Looking for any number of digits
#     decoded_sentence.gsub!(/\d+/) { |num| num.to_i / 100 } # Replaces any number with that number divided by 100
#   end  
#   return decoded_sentence # Returning the string, decoded_sentence
# end

# Your Refactored Solution

def decrypt(shift, input_string)
    alphabet = ("a".."z").to_a.join("")
    shifted_alphabet = alphabet[shift..-1] + alphabet[0..shift-1]
    input_string.tr!(shifted_alphabet, alphabet)
    input_string.gsub!(/\d+/) { |num| num.to_i / 100 } if input_string.match(/\d+/)
    input_string.gsub!(/[@#$%^&*]/, " ")
end

def north_korean_cipher(coded_message)
  decrypt(4, coded_message.downcase)
end



# Driver Code:
p north_korean_cipher("m^aerx%e&gsoi!") == "i want a coke!" #This is driver code and should print true
# Find out what Kim Jong Un is saying below and turn it into driver code as well. Driver Code statements should always return "true"
p north_korean_cipher("syv@tistpi$iex#xli*qswx*hipmgmsyw*erh*ryxvmxmsyw%jsshw^jvsq^syv#1000000#tvsjmxefpi$jevqw.") == "our people eat the most delicious and nutritious foods from our 10000 profitable farms."
p north_korean_cipher("syv%ryoiw#evi#liph^xskixliv@fc^kveti-jpezsvih@xsjjii.*hsr'x%xipp&xli#yw!") == "our nukes are held together by grape-flavored toffee. don't tell the us!"
p north_korean_cipher("mj^csy&qeoi^sri*qmwxeoi,%kir.*vm@csrk-kmp,&csy^ampp*fi&vitpegih*fc@hirrmw&vshqer.") == "if you make one mistake, gen. ri yong-gil, you will be replaced by dennis rodman."
p north_korean_cipher("ribx^wxst:$wsyxl%osvie,$xlir$neter,#xlir%xli%asvph!") == "next stop: south korea, then japan, then the world!"
p north_korean_cipher("ger^wsqifshc*nywx^kix^qi&10000*fekw@sj$gssp%vergl@hsvmxsw?") == "can somebody just get me 100 bags of cool ranch doritos?"

# Reflection
# The initial solution was hard to take in at first, but breaking it down line by line really helped to understand 
# what it was really doing under the hood. When it first came to refactoring, my partner and I had some trouble 
# deciding how we wanted to approach it. We knew what we wanted to do, but not where to put what part of the code. 
# We decided on using a helper method, decrypt, to shift the letters at first and then have the rest of the code in 
# north_korean_cipher deal with the special characters and numbers. Then we just decided to put all the string 
# modifications in the decrypt method, and now the north_korean_cipher looks useless. It's only there because we 
# had pre-determined driver code and we couldn't modify the input parameters to account for different shifts.
# Although I did find it nice that we were given an actual solution for once, and were just tasked with refactoring 
# it. I definitely learned a lot about manipulating strings from this challenge, everything from the tr! method that we 
# used and the gsub! stuff with regular expressions.