class WorldRecipes::FoodCategory
    attr_accessor :name, :url, :recipes, :cuisine

    def self.new_from_index_page
      category_1 = self.new("Desserts","http://allrecipes.com/mexican", WorldRecipes::Scraper.new.make_recipes )
      category_2 = self.new("Appetizers", "http://allrecipes.com/indian", WorldRecipes::Scraper.new.make_recipes)
      [category_1, category_2]
    end

    def initialize(name, url, recipes)
      @name = name
      @url = url
      @recipes = recipes
    end

    def new_recipe(name, picture_url=nil, number_servings=nil, cooking_time=nil, ingredients, instructions)
      recipe = WorldRecipes::Recipe.new(name, picture_url=nil, number_servings=nil, cooking_time=nil, ingredients, instructions)
      @recipes << recipe unless @recipes.include?(recipe) == true
    end

    def list_recipes
      @recipes.each.with_index(1) do |recipe, i|
      puts "#{i}. #{recipe.name}"
      end
    end
end
