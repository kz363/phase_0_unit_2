# U2.W5: The Bakery Challenge (GPS 2.1)

# Your Names
# 1) Kevin Zhou
# 2) Jacob Persing

 # This is the file you should end up editing. 
 
def bakery_num(num_of_people, fav_food)
  my_list = {"pie" => 8, "cake" => 6, "cookie" => 1}
  pie_qty = 0
  cake_qty = 0
  cookie_qty = 0
  has_fave = false # Sets has_fave flag to false

  my_list.each_key {|k| has_fave = true if k == fav_food}
  
  
  if has_fave == false # If it doesn't find fav_food in the hash, it raises an error
      raise ArgumentError.new("You can't make that food")
  else
    fav_food_qty = my_list[fav_food] # Sets fav_food_qty to the value at my_list[fav_food]
    if num_of_people % fav_food_qty == 0 # If num_of_people is a multiple of fav_food_qty, 
        num_of_food = num_of_people / fav_food_qty # Sets num_of_food to the quotient of num_of_people / fav_food_qty
        return "You need to make #{num_of_food} #{fav_food}(s)." # Returns a string with the fav_food and the num_of_food to make
    else
        while num_of_people > 0 # Sets the quantity of each food to make by dividing the num_of_people by the quantity. Find the remaining num_of_people by using %
            if num_of_people / my_list["pie"] > 0 && fav_food == "pie"
                pie_qty = num_of_people / my_list["pie"]
                num_of_people = num_of_people % my_list["pie"]
            elsif num_of_people / my_list["cake"] > 0 && fav_food == "cake"
                cake_qty = num_of_people / my_list["cake"]
                num_of_people = num_of_people % my_list["cake"]
            else
                cookie_qty = num_of_people
                num_of_people = 0
            end
        end
        return "You need to make #{pie_qty} pie(s), #{cake_qty} cake(s), and #{cookie_qty} cookie(s)." # Returns the string with the quantity of each food to make
    end
  end
end
 

#-----------------------------------------------------------------------------------------------------
#DRIVER CODE-- DO NOT MODIFY ANYTHING BELOW THIS LINE (except in the section at the bottom)
# These are the tests to ensure it's working. 
# These should all print true if the method is working properly.
p bakery_num(24, "cake") == "You need to make 4 cake(s)."
p bakery_num(41, "pie") == "You need to make 5 pie(s), 0 cake(s), and 1 cookie(s)."
p bakery_num(24, "cookie") == "You need to make 24 cookie(s)."
p bakery_num(4, "pie") == "You need to make 0 pie(s), 0 cake(s), and 4 cookie(s)."
p bakery_num(130, "pie") == "You need to make 16 pie(s), 0 cake(s), and 2 cookie(s)."
# p bakery_num(3, "apples") # this will raise an ArgumentError

# You SHOULD change this driver code. Why? Because it doesn't make sense.
p bakery_num(41, "cake") == "You need to make 0 pie(s), 6 cake(s), and 5 cookie(s)." # WHAAAAAT? I thought I said I wanted cake!