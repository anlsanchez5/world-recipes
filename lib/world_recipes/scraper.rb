class WorldRecipes::Scraper

  def get_cuisine_page
    Nokogiri::HTML(open("https://www.allrecipes.com/recipes/86/world-cuisine/?internalSource=hub%20nav&referringContentType=Recipe%20Hub&linkName=hub%20nav%20daughter&clickId=hub%20nav%202"))
  end

  def scrape_cuisines_index
    self.get_cuisine_page.css("a.grid-col--subnav")
  end

  def make_cuisines
    # url = scrape_cuisines_index.css("a").map {|link| link['href']}
    # name = scrape_cuisines_index.css("")
     scrape_cuisines_index.each do |c|
     WorldRecipes::Cuisine.new_from_index_page(c)
     end
  end

  def get_food_category_page
    Nokogiri::HTML(open(""))
  end

  def scrape_food_categories_index
    self.get_category_page.css("")
  end

  def make_food_categories
#   scrape_food_categories_index.each do |fc|
    WorldRecipes::FoodCategory.new_from_index_page
  end

  def get_recipes_page
    Nokogiri::HTML(open(""))
  end

  def scrape_recipes_index
    self.get_recipes_page.css("")
  end

  def make_recipes
    # scrape_recipes_index.each do |r|
    WorldRecipes::Recipe.new_from_index_page
  end
end
