# U2.W4: Homework Cheater


# I worked on this challenge by myself.

# 2. Pseudocode

# Input: Title, topic, date, thesis statement, pronoun
# Output: One long essay string
# Steps: 

# Define a Person class that takes name and pronoun variables
#   -@lastname variable to store the last name of the name
#   -Define @heshe and @himher depending on the pronoun given

# Define essay_writer which takes title, topic, date, thesis_statement, pronoun
#   -Create a variable, person, which is a new Person with topic and pronoun
#   -Set the title, date, thesis_statement variables

# 3. Initial Solution

# class Person
#   def initialize(name, pronoun)
#     @lastName = name.split[-1]
#     case pronoun
#       when "male"
#         @heshe = "he"
#         @himher = "him"
#       when "female"
#         @heshe = "she"
#         @himher = "her"
#     end
#   end

#   def lastName
#     @lastName
#   end

#   def heshe
#     @heshe
#   end

#   def himher
#     @himher
#   end
# end

# def essay_writer(title, topic, date, thesis_statement, pronoun)
#   person = Person.new(topic, pronoun)
#   template = "#{title}\n\n#{topic} was an important person during #{date}. #{person.heshe.capitalize} did a lot. I want to learn more about #{person.himher}. #{thesis_statement} #{person.lastName}'s contribution is important."
# end


# 4. Refactored Solution

class Person
  def initialize(name, pronoun)
    @lastName = name.split[-1]
    case pronoun
      when "male"
        @heshe = "he"
        @himher = "him"
      when "female"
        @heshe = "she"
        @himher = "her"
    end
  end

  def lastName() @lastName end
  def heshe() @heshe end
  def himher() @himher end
end

def essay_writer(title, topic, date, thesis_statement, pronoun)
  person = Person.new(topic, pronoun)
  "#{title}\n\n#{topic} was an important person during #{date}. #{person.heshe.capitalize} did a lot. I want to learn more about #{person.himher}. #{thesis_statement} #{person.lastName}'s contributions were important.\n\n"
end


# 1. DRIVER TESTS GO BELOW THIS LINE
puts essay_writer("The First Lady of Civil Rights", "Rosa Parks", 1955, "Her most outstanding contribution was her act of defiance in 1955 when she refused to give up her seat on a bus.", "female")
puts essay_writer("The Inventor", "Thomas Edison", "the early 1900's", "He developed many devices that greatly influenced life around the world, including the phonograph, the motion picture camera, and a long-lasting, practical electric light bulb.", "male")
puts essay_writer("The Genius", "Albert Einstein", "the early 1900's", 'His great intellectual achievements and originality have made the word "Einstein" synonymous with genius.', "male")

# 5. Reflection
# This time I actually followed the steps of driver code, pseudocode, then actually code, as opposed 
# to last time when I did driver code last. The essay_writer method was the easy part. I tried to make 
# my code gender-sensitive, but I ran into problems. I learned about making classes and instance variables 
# in Ruby. I couldn't figure out how to access instance variables of a class from outside of it without 
# using methods to return them. In Javascript you could just do person.lastName but that doesn't work in 
# Ruby. I hope to one day look back at this code when I'm more experienced and optimize it better.