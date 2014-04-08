# U2.W5: Bakery Challenge GPS

# I worked on this challenge with: Jacob Persing

# Our Refactored Solution

my_list = {"pie" => 8, "cake" => 6, "cookie" => 1}
 
def food_qty(num_of_people, food, my_list)
    return num_of_people / my_list[food]
end
 
def bakery_num(num_of_people, fav_food, my_list)
  pie_qty = 0
  cake_qty = 0
  cookie_qty = 0
  has_fave = false

  my_list.each_key {|k| has_fave = true if k == fav_food}
  
  if has_fave == false
      raise ArgumentError.new("You can't make that food")
  else
    fav_food_qty = my_list[fav_food]
    if num_of_people % fav_food_qty == 0
        num_of_food = num_of_people / fav_food_qty
        return "You need to make #{num_of_food} #{fav_food}(s)."
    else
        while num_of_people > 0
            if num_of_people / my_list["pie"] > 0 && fav_food == "pie"
                pie_qty = food_qty(num_of_people, "pie", my_list)
                num_of_people = num_of_people % my_list["pie"]
            elsif num_of_people / my_list["cake"] > 0 && fav_food == "cake"
                cake_qty = food_qty(num_of_people, "cake", my_list)
                num_of_people = num_of_people % my_list["cake"]
            else
                cookie_qty = num_of_people
                num_of_people = 0
            end
        end
        return "You need to make #{pie_qty} pie(s), #{cake_qty} cake(s), and #{cookie_qty} cookie(s)."
    end
  end
end

#-----------------------------------------------------------------------------------------------------
#DRIVER CODE-- DO NOT MODIFY ANYTHING BELOW THIS LINE (except in the section at the bottom)
# These are the tests to ensure it's working. 
# These should all print true if the method is working properly.
p bakery_num(24, "cake", my_list) == "You need to make 4 cake(s)."
p bakery_num(41, "pie", my_list) == "You need to make 5 pie(s), 0 cake(s), and 1 cookie(s)."
p bakery_num(24, "cookie", my_list) == "You need to make 24 cookie(s)."
p bakery_num(4, "pie", my_list) == "You need to make 0 pie(s), 0 cake(s), and 4 cookie(s)."
p bakery_num(130, "pie", my_list) == "You need to make 16 pie(s), 0 cake(s), and 2 cookie(s)."
# p bakery_num(3, "apples") # this will raise an ArgumentError

# You SHOULD change this driver code. Why? Because it doesn't make sense.
p bakery_num(41, "cake", my_list) == "You need to make 0 pie(s), 6 cake(s), and 5 cookie(s)." # WHAAAAAT? I thought I said I wanted cake!



#  Reflection 
# We refactored the code pretty easily and then Emily challenged us with taking some of the redundant 
# logic inside the while loop and moving it into a helper method. This was actually quite challenging 
# because we didn't know how much of the logic to move, nor did we want to edit the driver code. I think 
# that in the end it made the code look ugly again, but it was a good exercise in accessing variables 
# from different methods. Overall I think this was good practice in reading bad code and refactoring it.