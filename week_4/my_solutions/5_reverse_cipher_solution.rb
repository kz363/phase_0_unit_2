# U2.W4: Refactor Cipher Solution


# I worked on this challenge by myself.


# 1. Solution
# Write your comments on what each thing is doing. 
# If you have difficulty, go into IRB and play with the methods.
# Also make sure each step is necessary. If you don't think it's necessary
# Try implementing the code without it. 

def translate_to_cipher(sentence)
    alphabet = ('a'..'z').to_a # Creates an array where each element is a letter of the alphabet
    cipher = Hash[alphabet.zip(alphabet.rotate(4))] # Creates a hash where the keys are the alphabet, but the values are the alphabet shifted by 4
    spaces = ["@", "#", "$", "%", "^", "&", "*"] # Creates an array of the symbols to replace with spaces
    
    original_sentence = sentence.downcase # Downcases the sentence parameter and stores it in original_sentence
    encoded_sentence = [] # Initializes an empty array to store the encoded sentence
    original_sentence.each_char do |element| # Iterates through each character of the original sentence
      if cipher.include?(element) # If the character is a key in the cipher hash:
        encoded_sentence << cipher[element] # Push the value of the key into the encoded_sentence array
      elsif element == ' ' # Else, if the character is a space:
        encoded_sentence << spaces.sample # Push a random element of the spaces array into the encoded_sentence array
      else 
        encoded_sentence << element # Otherwise, push the element into the encoded_sentence
      end
     end
    
    return encoded_sentence.join # Return the string representation of encoded_sentence
end


# Questions:
# 1. What is the .to_a method doing?
# Makes an array from the ('a'..'z') range.

# 2. How does the rotate method work? What does it work on?
# Rotate shifts the elements of the array by the given integer, so that the element at that integer 
# becomes the first element of the array.

# 3. What is `each_char` doing?
# It iterates through each character of the string and applies the given block of code.

# 4. What does `sample` do?
# #sample returns a random element of an array, or more if given a parameter.

# 5. Are there any other methods you want to understand better?
# I'm more interested in the method of Hash creation that was used to make cipher. I didn't know 
# that was possible.

# 6. Does this code look better or worse than your refactored solution
#    of the original cipher code? What's better? What's worse?
# It definitely looks better than our refactored code because we decided to make a helper method to 
# account for different shifts since we didn't know about #rotate. I like the logic behind our refactored 
# method better, but I also like the creativity of this original cipher code.

# 7. Is this good code? What makes it good? What makes it bad?
# I think it's good because it's easy to read from top to bottom, the code is organized, and the variable 
# names are also easy to understand. I can't think of anything bad about it.

# 1. DRIVER TESTS GO BELOW THIS LINE

# Does this return the same thing every time?
# No, because #sample uses RNG to decide what to replace the spaces with.

p translate_to_cipher("I want cookies")
p translate_to_cipher("I want cookies")
p translate_to_cipher("I want cookies")
p translate_to_cipher("I want cookies")





# 5. Reflection 
# I'm really intrigued by how the cipher hash was made. I didn't know about #rotate and #zip, and that 
# hashes could be created with a multidimensional array like that. I'm glad we got to look at this code 
# because I wanted to see how the original code dealt with the shift. I think that was one of the biggest 
# challenges when refactoring the code in the last challenge, because a major part of it seemed to be deciding 
# how to replace the long hash that was given. Everything else was kind of trivial so that didn't matter as 
# much in my opinion. I'm confident in the learning objectives and I'm excited to learn more about manipulating 
# arrays and hashes in the future.