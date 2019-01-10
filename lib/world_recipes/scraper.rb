class WorldRecipes::Scraper

  def get_cuisine_page
    Nokogiri::HTML(open(""))
  end

  def scrape_cuisines_index
    self.get_page.css("")
  end

  def make_cuisines
  #  scrape_cuisines_index.each do |c|
     WorldRecipes::Cuisine.new_from_index_page
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
