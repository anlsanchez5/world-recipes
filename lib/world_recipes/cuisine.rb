class WorldRecipes::Cuisine
  attr_accessor :name, :url, :food_category 

  def self.all
    # I should return a list of instances of Cuisine
    puts <<-DOC.gsub /^\s*/, ''
      1. Mexican
      2. Indian
      3. Korean
      4. American
      5. Japanese
    DOC
    cuisine_1 = Cuisine.new
    cuisine_1.name = "Mexican"
    cuisine_1.food_category.all = "list of mexican food categories"
    cuisine_1.url = "http://allrecipes.com/mexican"

    cuisine_2 = Cuisine.new
    cuisine_2.name = "Indian"
    cuisine_2.food_category.all = "list of indian food categories"
    cuisine_2.url = "http://allrecipes.com/indian
  end
end
