# U2.W4: Create Accountability Groups


# I worked on this challenge by myself.

# 2. Pseudocode

# Input: Array of strings
# Output: Strings for each each group, for 3 units
# Steps: 
# Create an array called people, which stores the names of every person in our cohort.
# Create function create_groups which takes an array
#   Initialize an array called output_array with 5 empty arrays in it.
#   Call shuffle! on the people array to randomize the array.
#   Until input array is empty:
#     -Call each on output_array
#       -Pop input array and concat the return into element of output_array if it isn't nil
#   Print output_array nicely.
# Call create_groups 3 times

# 3. Initial Solution
# people = ["Adeoye Jaiyeola", "Chantelle Turnbull", "Charu Sharma", "Danielle Adams", "David Kerr", "Dinesh Rai","Gregory Knudsen", "Ian Greenough", "Jake Huhn", "Jason Matney", "Jessica Tatham", "John P Quigley","Judy Jow", "Justin Lee", "Kai Prout", "Ken Sin", "Kennedy Bhagwandeen", "Kevin Zhou", "Lasse Sviland", "Natalie Baer", "Nick Giovacchini", "Samuel Arkless", "Timothy McClung"]

# def create_groups(people)
#   output_array = [[], [], [], [], []]
#   input = people.shuffle

#   until input.empty?
#     output_array.each {|a| a<<input.pop if input[-1] != nil}
#   end

#   output_array.each_with_index {|a, index| puts "Group #{index+1}: #{a.join(", ")}"}
# end

# 3.times do
#   create_groups(people) 
#   puts "\n"
# end

# 4. Refactored Solution
people = ["Adeoye Jaiyeola", "Chantelle Turnbull", "Charu Sharma", "Danielle Adams", "David Kerr", "Dinesh Rai","Gregory Knudsen", "Ian Greenough", "Jake Huhn", "Jason Matney", "Jessica Tatham", "John P Quigley","Judy Jow", "Justin Lee", "Kai Prout", "Ken Sin", "Kennedy Bhagwandeen", "Kevin Zhou", "Lasse Sviland", "Natalie Baer", "Nick Giovacchini", "Samuel Arkless", "Timothy McClung"]
people2 = ["Adeoye Jaiyeola", "Chantelle Turnbull", "Charu Sharma", "Danielle Adams", "David Kerr", "Dinesh Rai","Gregory Knudsen", "Ian Greenough"]

def create_groups(people, units)
  units.times do |i|
    puts "Unit #{i+1}: \n"
    input = people.shuffle
    output_array = []
    input.length/4.times {output_array<<[]}

    until input.empty?
      output_array.each {|a| a<<input.pop if input[-1] != nil}
    end

    output_array.each_with_index {|a, index| puts "Group #{index+1}: #{a.join(", ")}"}
    puts "\n"
  end
end

# 1. DRIVER TESTS GO BELOW THIS LINE
create_groups(people,3) # Creates groups for 3 units for a 23-person cohort
create_groups(people,1) # Creates groups for 1 unit for a 23-person cohort
create_groups(people2,3) # Creates groups for 3 units with a smaller 8-person cohort





# 5. Reflection 
# I had a general idea of what I wanted to do to make unique groups every time, which was to use some sort 
# of RNG to insert each name into a group so the output will be different every time. It went pretty smoothly.

# While researching what array methods I could use, I ran into many methods that I could use to help 
# me to add randomness in the groups like shuffle and sample. Using one of the methods was like going 
# down a branch of how my code would look like in the end, and it would be different if I used another 
# method, so I had to think about how I wanted my end result to look like before I decided what to use.
# I ended up using the shuffle method and it worked out like I expected it to. I couldn't think of an 
# efficient way to make it so that everyone was in a group with new people, so I leave that challenge for 
# a future day.

# My refactored code made everything more robust, so it can account for different unit numbers and amounts 
# of people in the cohort. I still wonder if there's a different method to remove an element of an array and 
# return it at the same time. If I use pop, I have to include the if input[-1] != nil or else it'll add a nil 
# to the arrays, which I wanted to avoid. I found out about the shift method afterwards, but it does pretty much 
# the same thing as pop. I also found out how to print it more neatly with the Unit # above the groups.

# I'm still unsure how to go about writing driver tests. I actually did my code before I made the driver tests 
# because I didn't know how or what to test, so it was an afterthought. Since I used RNG to make the groups, 
# it's not as simple as running the code and expecting it to give the same output every time to pass the test.
# I think I just have a wrong preconception of how driver code should look like from our challenges in the previous 
# weeks.