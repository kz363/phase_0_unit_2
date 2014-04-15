# U2.W6: Drawer Debugger


# I worked on this challenge Jessica Tatham.

    #Kevin and Jessica

# 2. Original Code

class Drawer

    attr_reader :contents

    # Are there any more methods needed in this class?
        #No

    def initialize
        @contents = []
        @open = true
    end

    def open
        @open = true
    end

    def close
        @open = false
    end
    
    def add_item(item)
        @contents << item
    end
    
    def remove_item(item = @contents.pop) #what is `#pop` doing? Taking the item out of the contents variable
        @contents.delete(item)
    end
    
    def dump  # what should this method return? This method now returns an empty drawer.
        puts "Your drawer is empty."
        @contents = []
    end
    
    def view_contents
        puts "The drawer contains:"
        @contents.each {|silverware| puts "- " + silverware.type }
    end
    
end

class Silverware
    attr_reader :type, :clean

    # Are there any more methods needed in this class?
        #Yes, we added a clean_silverware method

    def initialize(type, clean = true)
        @type = type
        @clean = clean
    end

    def eat
        puts "eating with the #{type}"
        @clean = false
    end
    
    def clean_silverware
        @clean = true
    end

end

knife1 = Silverware.new("knife")

silverware_drawer = Drawer.new
silverware_drawer.add_item(knife1) 
silverware_drawer.add_item(Silverware.new("spoon"))
silverware_drawer.add_item(Silverware.new("fork")) 
silverware_drawer.view_contents

silverware_drawer.remove_item
silverware_drawer.view_contents
sharp_knife = Silverware.new("sharp_knife")


silverware_drawer.add_item(sharp_knife)

silverware_drawer.view_contents

removed_knife = silverware_drawer.remove_item(sharp_knife)
removed_knife.eat
removed_knife.clean_silverware

silverware_drawer.view_contents
silverware_drawer.dump
silverware_drawer.view_contents # What should this return? # This should return an empty Drawer


fork = Silverware.new("fork")
silverware_drawer.add_item(fork)
silverware_drawer.view_contents
fork = silverware_drawer.remove_item(fork)
fork.eat

#BONUS SECTION
puts fork.clean

# DRIVER TESTS GO BELOW THIS LINE

puts "\nDriver Tests Below:"
drawer = Drawer.new
fork = Silverware.new("fork")
drawer.add_item(fork)
p drawer.remove_item(fork) == fork
p drawer.dump == []
p drawer.open == true
p drawer.close == false
p fork.clean == true
p fork.eat == false

# 5. Reflection 
# I personally found the instructions in this challenge a bit vague, but I think we did what we were supposed to
# by adjusting the given method calls and creating/editing methods. We decided to not create assert statements 
# because it's simpler to do these driver tests with printing a comparison. Maybe when we learn about more complicated 
# assert statements in the future, then we can apply them more efficiently. One thing that bothered me about this 
# code is that some of the methods have a puts in the code, so our driver tests have these statements in between 
# all the trues. Not a big deal, but I hope we can dive into Rspec soon to make better, streamlined tests.