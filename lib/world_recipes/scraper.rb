require 'open-uri'
require 'pry'
class WorldRecipes::Scraper

  def get_cuisine_page
    Nokogiri::HTML(open("https://www.allrecipes.com/recipes/86/world-cuisine/?internalSource=hub%20nav&referringContentType=Recipe%20Hub&linkName=hub%20nav%20daughter&clickId=hub%20nav%202"))
  end

  def scrape_cuisines_index
    self.get_cuisine_page.css("a.grid-col--subnav")
  end

  def make_cuisines
     scrape_cuisines_index.each do |c|
     WorldRecipes::Cuisine.new_from_index_page(c)
     end
  end

  def get_food_category_page(link)
    Nokogiri::HTML(open("#{link}"))
  end

  def scrape_food_categories_index(link)
    get_food_category_page(link).css("a.grid-col--subnav")
  end

  def make_food_categories(link)
    categories = []
    scrape_food_categories_index(link).each do |fc|
      categories << WorldRecipes::FoodCategory.new_from_index_page(fc)
    end
    categories
  end

  def get_recipes_page(link)
     Nokogiri::HTML(open("#{link}"))
  end

  def scrape_recipes_index(link)
    get_recipes_page(link).css("article.fixed-recipe-card")
  end

  def make_recipes(link)
    recipes = []
    scrape_recipes_index(link).each do |r|
      recipes << WorldRecipes::Recipe.new_from_index_page(r)
    end
    recipes
  end

#  def scrape_recipe_data(link)
#    Nokogiri::HTML(open("#{link}")
#  end
end
