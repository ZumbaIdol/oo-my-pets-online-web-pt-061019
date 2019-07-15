require 'pry'

class Owner
  attr_reader :name, :species
  attr_accessor :cats, :dogs, :pets
  
  @@all = []
  @@count = 0

  def initialize(name)
    @name = name
    @@all << self
    @@count += 1
    @cats = []
    @dogs = []
    @pets = []

  end
  
  def species
    @species = "human"
  end
  
  def say_species
    "I am a human."
  end
  
  def self.all
    @@all
  end
  
  def self.count
    @@all.length
  end
  
  def self.reset_all
    @@all.clear
  end
 
  def buy_cat(cat_name)
    @@all << Cat.new(cat_name, self)
  end
  
  def buy_dog(dog_name)
    @@all << Dog.new(dog_name, self)
  end
  
  def walk_dogs
    @dogs.each {|dog| dog.mood = "happy"}
  end
  
  def feed_cats
    @cats.each {|cat| cat.mood = "happy"}
  end
  
  def sell_pets
    @cats.each {|cat| cat.mood = "nervous"}
    @dogs.each {|dog| dog.mood = "nervous"}
    # @cats.each {|cat| cat.owner = nil}
    # @dogs.each {|dog| dog.owner = nil}
    @owner.cats.count = nil
    @owner.dogs.count = nil
  end
end