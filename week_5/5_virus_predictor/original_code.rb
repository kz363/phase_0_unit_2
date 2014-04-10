# U2.W5: Virus Predictor

# I worked on this challenge by myself.

# EXPLANATION OF require_relative
# This statement looks for a file named state_data.rb within the same directory as this file so that 
# it can use the STATE_DATA hash in this case.

require_relative 'state_data'

class VirusPredictor # Using the given state data, predicts the number of deaths in the outbreak and how long it'll take to spread across the state

  attr_accessor :population

  def initialize(state_of_origin, population_density, population, region, regional_spread) # Initializes instance variables for the class to use
    @state = state_of_origin
    @population = population
    @population_density = population_density
    @region = region
    @next_region = regional_spread
  end

  def virus_effects  # This method calls predicted_deaths and speed_of_spread and inputs the appropriate instance variables
    predicted_deaths
    speed_of_spread
  end

  private  # This makes all the following methods private. virus_effects and initialize up above aren't private.
           # Private methods can't be called except from within the class.
           # Moving it above virus_effects would make the driver code fail because it can't call a private method

  def predicted_deaths # Returns a string with the number of deaths based on the given data about a specific state
    if @population_density >= 200
      death_rate = 0.4
    elsif @population_density >= 150
      death_rate = 0.3
    elsif @population_density >= 100
      death_rate = 0.2
    elsif @population_density >= 50
      death_rate = 0.1
    else 
      death_rate = 0.05
    end

    print "#{@state} will lose #{(@population * death_rate).floor} people in this outbreak"

  end

  def speed_of_spread # Returns a string with the time in months that the virus will take to spread based on the state's population density.
    if @population_density >= 200
      speed = 0.5
    elsif @population_density >= 150
      speed = 1
    elsif @population_density >= 100
      speed = 1.5
    elsif @population_density >= 50
      speed = 2
    else 
      speed = 2.5
    end

    puts " and will spread across the state in #{speed} months.\n\n"

  end

end

#=======================================================================

# DRIVER CODE
# initialize VirusPredictor for each state

STATE_DATA.each_pair {|k,v| VirusPredictor.new(k,v[:population_density],v[:population],v[:region],v[:regional_spread]).virus_effects}

# Bonus
alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population], STATE_DATA["Alabama"][:region], STATE_DATA["Alabama"][:regional_spread]) 
p "Alabama's population is #{alabama.population}."

# alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population], STATE_DATA["Alabama"][:region], STATE_DATA["Alabama"][:regional_spread]) 
# alabama.virus_effects

# jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population], STATE_DATA["New Jersey"][:region], STATE_DATA["New Jersey"][:regional_spread]) 
# jersey.virus_effects

# california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population], STATE_DATA["California"][:region], STATE_DATA["California"][:regional_spread]) 
# california.virus_effects

# alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population], STATE_DATA["Alaska"][:region], STATE_DATA["Alaska"][:regional_spread]) 
# alaska.virus_effects

# Reflection
# We weren't told to write a reflection in the directions, but here's one anyway. The hardest part of this challenge 
# for me was refactoring the old methods, because it wasn't as blatantly bad as some of the previous challenges. I think 
# I did a decent job in the end, but I wonder if there's even further refactoring that can be done. I think this was a 
# good challenge to further build on our knowledge of classes. I have a better understanding of instance variables, private 
# methods, and attr_accessor now.