require 'pry'
class WorldRecipes::FoodCategory
    attr_accessor :name, :url, :recipes

    def self.new_from_index_page(fc)
      link = fc.attribute("href").text
      self.new(fc.css("span.category-title").text,link)
    end

    def initialize(name, url)
      @name = name
      @url = url
    end

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
