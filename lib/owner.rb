require 'pry'

class Owner
  attr_reader :name, :species
  attr_accessor :cats, :dogs
  
  @@all = []
  @@count = 0

  def initialize(name)
    @name = name
    @@all << self
    @@count += 1
    @cats = []
    @dogs = []

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
    @cats.each {|cat| cat.mood = "nervous"
      cat.owner = nil}
    @dogs.each {|dog| dog.mood = "nervous"
      dog.owner = nil}
    @cats = []
    @dogs = []
  end
  
  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end