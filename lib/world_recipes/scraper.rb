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
end
