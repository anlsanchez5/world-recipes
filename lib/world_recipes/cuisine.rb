class WorldRecipes::Cuisine
  attr_accessor :name, :url, :food_categories

  def initialize
    @food_categories = []
  end

  def self.all
    # I should return a list of instances of Cuisine
  #  puts <<-DOC.gsub /^\s*/, ''
  #    1. Mexican
  #    2. Indian
  #    3. Korean
  #    4. American
  #    5. Japanese
  #  DOC

    cuisine_1 = self.new
    cuisine_1.food_categories = "list of mexican food categories" # this will be an array of FoodCagegory instances
    cuisine_1.name = "Mexican"
    cuisine_1.url = "http://allrecipes.com/mexican"

    cuisine_2 = self.new
    cuisine_2.name = "Indian"
    cuisine_2.food_categories = "list of indian food categories" # this will be an array of FoodCagegory instances
    cuisine_2.url = "http://allrecipes.com/indian"

    [cuisine_1, cuisine_2]
  end
end
