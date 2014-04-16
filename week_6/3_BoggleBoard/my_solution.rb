# U2.W6: Create a BoggleBoard Class


# I worked on this challenge by myself.


# 2. Pseudocode
# #check_diagonal takes 2 coordinates as parameters. Returns true if the coordinates are actually a diagonal, false otherwise.
# #get_diagonal takes 2 coordinates as parameters. Calls #check_diagonal first. Returns an array of the elements in that diagonal.


# 3. Initial Solution
class BoggleBoard
  def initialize(board)
    @board = board
    @length = board.length
    @forward_diagonal = []
    @backward_diagonal = []
  end

  def create_word(*coords)
    coords.map { |coord| @board[coord.first][coord.last]}.join("")
  end

  def get_row(row)
    @board[row]
  end

  def get_col(col)
    @board.map {|row| row[col]}
  end
 
  def get_diagonal(coord_1, coord_2)
    @forward_diagonal = [] # Resets values for search
    @backward_diagonal = []
    return @forward_diagonal if check_forward_diagonal(coord_1.clone, coord_2.clone) == true
    return @backward_diagonal if check_backward_diagonal(coord_1.clone,coord_2.clone) == true
  end

  def check_forward_diagonal(coord_1, coord_2) # Checks top-left to bottom-right diagonal
    found_diagonal = false

    coord_1.map!{|i| i -= 1} until coord_1[0] == 0 || coord_1[1] == 0 # Resets first coordinate to the top-left edge
    
    until coord_1[0] == @length || coord_1[1] == @length # Keeps going until it reaches the bottom-right edge
      found_diagonal = true if coord_1 == coord_2
      @forward_diagonal << create_word(coord_1)
      coord_1.map!{|i| i += 1}
    end
    
    return found_diagonal
  end

  def check_backward_diagonal(coord_1, coord_2) # Checks top-right to bottom-left diagonal
    found_diagonal = false
    until coord_1[0] == 0 || coord_1[1] == @length-1 # Resets first coordinate to the top-right edge
      coord_1[0] -= 1
      coord_1[1] += 1
    end
    
    until coord_1[0] == @length || coord_1[1] == -1 # Keeps going until it reaches the bottom-left edge
      found_diagonal = true if coord_1 == coord_2
      @backward_diagonal << create_word(coord_1)
      coord_1[0] += 1
      coord_1[1] -= 1
    end

    return found_diagonal
  end

end


dice_grid = [["b", "r", "a", "e"],
             ["i", "o", "d", "t"],
             ["e", "c", "l", "r"],
             ["t", "a", "k", "e"]]
 
boggle_board = BoggleBoard.new(dice_grid)


# 4. Refactored Solution
# I'm not sure how to refactor this without rewriting the logic.




# 1. DRIVER TESTS GO BELOW THIS LINE
p boggle_board.create_word([2,1], [1,1], [1,2], [0,3]) == "code"
p boggle_board.create_word([0,1], [0,2], [1,2]) == "rad"
p boggle_board.create_word([3,0], [3,1], [3,2], [3,3]) == "take"
p boggle_board.create_word([1,2], [1,1], [2,1], [3,2]) == "dock"

# create driver test code to retrieve a value at a coordinate here:
# I wasn't sure if we were supposed to use attr_reader or not so I kept it simple.
p boggle_board.create_word([0,3]) # => "e"
p boggle_board.create_word([3,2]) # => "k"

# implement tests for each of the methods here:
# Print each row as a string
# => "brae"
#    "iodt"
#    "eclr"
#    "take"
(0..3).each {|i| p boggle_board.get_row(i).join}

# Print each column as a string
# => "biet"
#    "roca"
#    "adlk"
#    "etre"
(0..3).each {|i| p boggle_board.get_col(i).join}

# Diagonals
p boggle_board.check_forward_diagonal([1,1],[2,2]) == true
p boggle_board.check_forward_diagonal([2,1],[1,2]) == false
p boggle_board.check_backward_diagonal([0,3],[3,0]) == true
p boggle_board.check_backward_diagonal([1,2],[2,3]) == false
p boggle_board.get_diagonal([0,0],[3,3]) == ["b","o","l","e"]
p boggle_board.get_diagonal([2,0],[3,1]) == ["e","a"]
p boggle_board.get_diagonal([1,2],[2,3]) == ["r","d","r"]
p boggle_board.get_diagonal([3,0],[0,3]) == ["e","d","c","t"]
p boggle_board.get_diagonal([3,2],[2,3]) == ["r","k"]
p boggle_board.get_diagonal([2,0],[1,1]) == ["a","o","e"]

# 5. Reflection 
# The original challenge was pretty simple. It was the bonus challenge with #get_diagonal that I spent most 
# of my time on. I wasn't sure if #get_diagonal was supposed to let you get the diagonal if it didn't start 
# at the corners of the grid i.e. [0,2] to [2,0], but I tried to do it anyway. I think my solution is terrible 
# because I kept coding without an exact idea of what I wanted to do, and as I ran into errors, I kept doing 
# "small" fixes to make the rest of the code work. It kept snowballing and now I have a solution that works, but 
# I don't think is very efficient. It was also interesting to find test cases for this because I kept finding 
# certain coordinates that didn't work properly, even though most of the other ones did.