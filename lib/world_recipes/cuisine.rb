require 'pry'
class WorldRecipes::Cuisine
  attr_accessor :name, :url, :food_categories
  @@all = []

  def self.new_from_index_page(c)
    self.new(c.css("span.category-title").text,c.attribute("href").text)
  end

  def initialize(name, url)
    @name = name
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end

  def create_categories
    self.food_categories = WorldRecipes::Scraper.new.make_food_categories(self.url) unless self.food_categories != nil
    self.food_categories
  end

  def list_categories
    create_categories
    self.food_categories.each.with_index(1) do |category, i|
      puts "#{i}. #{category.name}"
    end
  end
end
