# U2.W6: Create a Playlist from Driver Code


# I worked on this challenge by myself.


# Pseudocode
# Define a Song class where #initialize takes 2 parameters, title and artist, and creates instance variables for each
#  -#play prints out the Song's title and artist
# Define a Playlist class where #initialize takes any number of Song arguments and adds them to an instance array
#  -#add takes any number of Song arguments and adds them to the instance array
#  -#num_of_tracks returns the number of Songs in the playlist
#  -remove takes a Song parameter and deletes it from the playlist
#  -#includes? takes a Song parameter and checks if the Song is in the playlist
#  -#play_all calls Song#play on every Song in the playlist
#  -#display prints every song's title and artist in the playlist

# Initial Solution

class Song

  attr_reader :title, :artist

  def initialize(title, artist)
    @title = title
    @artist = artist
  end

  def play
    puts "Playing: #{@title} by #{@artist}."
  end
end

class Playlist
  def initialize(*songs)
    @playlist = []
    songs.each {|song| @playlist<<song}
  end

  def add(*songs)
    songs.each {|song| @playlist<<song}
  end

  def num_of_tracks
    @playlist.length
  end

  def remove(song)
    @playlist.delete(song)
  end

  def includes?(song)
    @playlist.include?(song)
  end

  def play_all
    @playlist.each {|s| s.play}
  end

  def display
    puts "Current Playlist:"
    @playlist.each {|s| puts "#{s.title} by #{s.artist}"}
  end

end

# Refactored Solution
# There isn't anything logic-intensive that can be refactored in my code, and everything else seems simple enough 
# since the methods are doing one simple task.





# DRIVER TESTS GO BELOW THIS LINE
one_by_one = Song.new("One by One", "Sirenia")
world_so_cold = Song.new("World So Cold", "Three Days Grace") 
going_under = Song.new("Going Under", "Evanescence")
 
my_playlist = Playlist.new(one_by_one, world_so_cold, going_under)
 
lying_from_you = Song.new("Lying From You", "Linkin Park")
angels = Song.new("Angels", "Within Temptation")
 
my_playlist.add(lying_from_you, angels)
p my_playlist.num_of_tracks == 5
going_under.play
my_playlist.remove(angels)
p my_playlist.includes?(lying_from_you) == true
my_playlist.play_all
my_playlist.display

# Reflection
# I didn't change the driver code and just implemented the methods based on what I thought the driver code wanted 
# to do. I'm not sure how to write driver tests that compare puts statements, like on lines 90 and 91. Since those 
# methods puts something rather than return something, I can't use == to make the test compare the output. Aside 
# from that, I think the rest was pretty straightforward and I'm interested in learning more about EDD now.