class WorldRecipes::FoodCategory
    attr_accessor :name, :url, :recipes

    def initialize
    end

    def self.all
      category_1 = self.new
      category_1.name = "Desserts"
      category_1.recipes = "list of desserts " # this will be an array of Recipe instances
      category_1.url = "http://allrecipes.com/mexican"

      category_2 = self.new
      category_2.name = "Appetizers"
      category_2.recipes = "list of Appetizers" # this will be an array of Recipe instances
      category_2.url = "http://allrecipes.com/indian"

      [category_1, category_2]
    end

    def list_recipes
      @recipes = WorldRecipes::Recipe.all
      @recipes.each.with_index(1) do |recipe, i|
      puts "#{i}. #{recipe.name}"
      end
    end
end