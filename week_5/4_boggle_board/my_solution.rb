# U2.W5: A Nested Array to Model a Boggle Board

# I worked on this challenge by myself.

boggle_board = [["b", "r", "a", "e"],
                ["i", "o", "d", "t"],
                ["e", "c", "l", "r"],
                ["t", "a", "k", "e"]]


# Part 1: Access multiple elements of a nested array

# Pseudocode
# Define create_word which takes the boggle_board array as an input, and any number of coords.
# Return a string formed by combining the letters at each of the coordinates of the boggle_board.

# Initial Solution

def create_word(board, *coords)
  coords.map { |coord| board[coord.first][coord.last]}.join("")
end

# Refactored Solution


# DRIVER TESTS GO BELOW THIS LINE

p create_word(boggle_board, [2,1], [1,1], [1,2], [0,3]) == "code"
p create_word(boggle_board, [0,1], [0,2], [1,2]) == "rad"
p create_word(boggle_board, [3,0], [3,1], [3,2], [3,3]) == "take"
p create_word(boggle_board, [0,1], [1,1], [2,1], [3,2]) == "rock"

# Reflection 
# There wasn't much to do in this part since the code was already given to us. I wrote some additional 
# driver tests to understand nested arrays better. I learned from the given code that you can group together 
# the splat arguments and call methods on them.
#-------------------------------------------------------------------------------

# Part 2: Write a method that takes a row number and returns all the elements in the row.  

# Pseudocode
# Define get_row that takes an integer, row, and returns all the elements of boggle_board at that row

# Initial Solution
# def get_row(row)
#     boggle_board = [["b", "r", "a", "e"],
#                     ["i", "o", "d", "t"],
#                     ["e", "c", "l", "r"],
#                     ["t", "a", "k", "e"]]
#     boggle_board[row]
# end

# Refactored Solution
def get_row(board, row)
    board[row]
end

# DRIVER TESTS GO BELOW THIS LINE
p get_row(boggle_board, 0) == ["b", "r", "a", "e"]
p get_row(boggle_board, 1) == ["i", "o", "d", "t"]
p get_row(boggle_board, 2) == ["e", "c", "l", "r"]
p get_row(boggle_board, 3) == ["t", "a", "k", "e"]

# Reflection 
# I'm curious why this method doesn't take the board as a parameter like the last one. boggle_board 
# isn't a global variable so you can't access it within the get_row method. I refactored it so that it 
# can take boggle_board as a variable.


#-------------------------------------------------------------------------------

# Part 3: Now write a method that takes a column number and returns all the elements in the column.

# Pseudocode
# Define get_col, which takes an integer, column, and returns all element of boggle_board at that column

# Initial Solution
def get_col(board, col)
    board.map {|row| row[col]}
end

# Refactored Solution


# DRIVER TESTS GO BELOW THIS LINE
p get_col(boggle_board, 0) == ["b", "i", "e", "t"]
p get_col(boggle_board, 1) == ["r", "o", "c", "a"]
p get_col(boggle_board, 2) == ["a", "d", "l", "k"]
p get_col(boggle_board, 3) == ["e", "t", "r", "e"]

# Reflection
# I decided to give this part the same treatment as get_row so that it takes boggle_board as an input. I 
# don't like having to re-declare a variable within a method like that. I'm wondering if this challenge should've 
# had boggle_board initialized as a global variable from the beginning.