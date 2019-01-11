require 'pry'
class WorldRecipes::FoodCategory
    attr_accessor :name, :url, :recipes, :cuisine

    def self.new_from_index_page(fc)
      link = fc.attribute("href").text
      self.new(fc.css("span.category-title").text,
      link, WorldRecipes::Scraper.new.make_recipes)
    end

    def initialize(name, url, recipes)
      @name = name
      @url = url
      @recipes = recipes
    end

#    def new_recipe(name, picture_url=nil, number_servings=nil, cooking_time=nil, ingredients, instructions)
#      recipe = WorldRecipes::Recipe.new(name, picture_url=nil, number_servings=nil, cooking_time=nil, ingredients, instructions)
#      @recipes << recipe unless @recipes.include?(recipe) == true
#    end

    def create_recipes
      self.recipes = WorldRecipes::Scraper.new.make_recipes(self.url) unless self.recipes != nil
      self.recipes
    end

    def list_recipes
      create_recipes
      self.recipes.each.with_index(1) do |recipe, i|
      puts "#{i}. #{recipe.name}"
      end
    end
end
