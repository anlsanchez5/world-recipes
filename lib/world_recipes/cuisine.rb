class WorldRecipes::Cuisine
  attr_accessor :name, :url, :food_categories

  def initialize
  end

  def self.all
    cuisine_1 = self.new
    #cuisine_1.food_categories = WorldRecipes::FoodCategory.all # this will be an array of FoodCagegory instances
    cuisine_1.name = "Mexican"
    cuisine_1.url = "http://allrecipes.com/mexican"

    cuisine_2 = self.new
    cuisine_2.name = "Indian"
    #cuisine_2.food_categories = WorldRecipes::FoodCategory.all # this will be an array of FoodCagegory instances
    cuisine_2.url = "http://allrecipes.com/indian"

    [cuisine_1, cuisine_2]
  end

  def list_category
    @food_categories = WorldRecipes::FoodCategory.all
    @food_categories.each.with_index(1) do |category, i|
      puts "#{i}. #{category.name}"
    end
  end

end
