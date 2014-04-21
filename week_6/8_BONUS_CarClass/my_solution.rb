# U2.W6: Create a Car Class from User Stories


# I worked on this challenge Judy Jow, David Kerr.

# As a video game player, I want to be able to create a new car and set it's model and color so I can customize it in the video game.
# As a video game player, I need to be able to define a distance to drive so I can follow directions appropriately.
# As a video game player, I'd like to be able to see the speed I am traveling, so I can properly accelerate or decelerate.
# As a video game player, I want to be able to turn left or right so I can navigate a city and follow directions.
# As a video game player, I want to be able to accelerate and decelerate the car to a defined speed so I can drive following the rules of the road.
# As a video game player, I want to keep track of the total distance I have travelled, so I can get paid for mileage.
# As a video game player, I want to be able to stop the car so I can follow traffic signs and signals.
# As a video game player, I would like to see output reflecting the latest action of my car so I can see a play-by-play of the pizza delivery.

# 2. Pseudocode
# Create a car class and 
    # make these instance variables accessible outside of class: speed
    # make these instance variables readable outside of class: distance, 
    # initialize method takes in two inputs: the model and color
        # create instance variables distance and speed, and set to 0  
        # create instance variable last_action, and set to empty string
        # create instance variable pizzas, and set it to an empty array
    # drive method that takes one parameter, mileage
        # increase instance variable distance by mileage 
        # set last_action to "Driving XX miles at YY speed"
        # puts last_action
    # turn method that takes in a direction (left,right) and outputs what direction you're turning
        # sets last_action to "Turning XX" and puts last_action
    # stop method that sets speed to 0
        # sets last_action to "Stopped" and puts last_action
    # deliver_pizza method
        # removes first pizza in pizzas array

# Pizza class
    # initialize method takes in one input: topping


# 3. Initial Solution

# class Car
#     attr_accessor :speed, :distance, :last_action, :pizzas
    
#   def initialize(model, color)
#       @model = model
#       @color = color
#       @distance = 0
#       @speed = 0
#       @last_action = ""
#       @pizzas = []
#   end
   
#   def drive(mileage)
#       @distance += mileage
#       puts @last_action = "Driving #{mileage} miles at #{speed} mph."
#   end
   
#   def turn(direction)
#       puts @last_action = "Turning #{direction}."
#   end
   
#   def stop
#       @speed = 0
#       puts @last_action = "Stopped."
#   end
   
#   def deliver_pizza
#       puts @last_action = "Delivered #{pizzas.shift.topping} pizza."
#   end
   
# end

# class Pizza
#     attr_reader :topping
#     def initialize(topping)
#         @topping = topping
#     end
# end

# 4. Refactored Solution

class Car
  attr_accessor :speed, :distance, :pizzas
    
  def initialize(model, color)
    @model = model
    @color = color
    @distance = 0
    @speed = 0
    @last_action = ""
    @pizzas = []
  end
   
  def drive(mileage)
    @distance += mileage
    puts @last_action = "Driving #{mileage} miles at #{speed} mph."
  end
   
  def turn(direction)
    puts @last_action = "Turning #{direction}."
  end
   
  def stop
    @speed = 0
    puts @last_action = "Stopped."
  end
   
  def deliver_pizza
    puts @last_action = "Delivered #{@pizzas.shift.topping} pizza."
  end
   
end

class Pizza
  attr_reader :topping

  def initialize(topping)
    @topping = topping
  end
end




# 1. DRIVER TESTS GO BELOW THIS LINE

# Create a new car of your desired model and type
# Drive .25 miles (speed limit is 25 mph)
# At the stop sign, turn right
# Drive 1.5 miles (speed limit is 35 mph)
# At the school zone, check your speed
# Slow down to speed limit 15 mph
# Drive .25 miles more miles
# At the stop sign, turn left
# Drive 1.4 miles (speed limit is 35 mph)
# Stop at your destination
# Log your total distance travelled

my_car = Car.new("Mustang","black")
my_car.speed = 25
my_car.drive(0.25)
my_car.stop
my_car.turn("right")
my_car.speed = 35
my_car.drive(1.5)
puts "#{my_car.speed} mph"
my_car.speed = 15
my_car.drive(0.25)
my_car.stop
my_car.turn("left")
my_car.speed = 35
my_car.drive(1.4)
my_car.stop
puts "#{my_car.distance} miles traveled."

my_pizza = Pizza.new("Pepperoni")
my_car.pizzas << my_pizza
my_car.deliver_pizza

# 5. Reflection
# This was a pretty simple challenge. The hardest part was how open-ended the stories were, because they weren't
# very specific about what they wanted the output to be. There also weren't specific driver tests in actual code 
# that we had to pass, so we took some liberties when it came to how the class was organized. Overall I'm confident 
# in object-oriented design.