require 'pry'
class WorldRecipes::Cuisine
  attr_accessor :name, :url, :food_categories
  @@all = []

  def self.new_from_index_page(c)
    link = c.attribute("href").text
    self.new(c.css("span.category-title").text,
    link,
    WorldRecipes::Scraper.new.make_food_categories(link))
  end

  def initialize(name, url, food_categories)
    @name = name
    @url = url
    @food_categories = food_categories
    @@all << self
  end

  def self.all
    @@all
  end

  def new_category(name, url, recipes)
    category = WorldRecipes::FoodCategory.new(name,url, recipes, self)
    @food_categories << category unless @food_categories.include?(category) == true
  end

  def list_categories
    categories = self.food_categories
    categories.each.with_index(1) do |category, i|
      puts "#{i}. #{category.name}"
    end
  end
end
