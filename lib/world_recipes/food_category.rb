class WorldRecipes::FoodCategory
    attr_accessor :name, :url, :recipes, :cuisine

    def self.new_from_index_page
      category_1 = WorldRecipes::Cuisine.new_category("Desserts","http://allrecipes.com/mexican", "Abuelita Chocolate" )
      category_2 = WorldRecipes::Cuisine.new_category("Appetizers", "http://allrecipes.com/indian", "Arroz con Leche")
      [category_1, category_2]
    end

    def initialize(name, url, recipes, cuisine)
      @name = name
      @url = url
      @recipes = recipes
      @cuisine = cuisine
    end

    def add_recipe(recipe)
      @recipes << recipe
      recipe.food_category = self unless recipe.food_category == self
    end

    def list_recipes
      @recipes = WorldRecipes::Recipe.all
      @recipes.each.with_index(1) do |recipe, i|
      puts "#{i}. #{recipe.name}"
      end
    end
end
