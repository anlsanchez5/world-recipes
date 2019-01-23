require 'pry'
class WorldRecipes::Cuisine
  attr_accessor :name, :url, :food_categories
  @@all = []


  def initialize(cuisine_hash)
    cuisine_hash.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end

  def self.new_from_collection(cuisines_array)
    cuisines_array.each {|cuisine_hash| self.new(cuisine_hash)}
  end

#  def initialize(name, url)
#    @name = name
#    @url = url
#    @@all << self
#  end

#  def self.new_from_index_page(c)
#    self.new(c.css("span.category-title").text,c.attribute("href").text)
#  end

  def self.all
    @@all
  end

#  def food_categories
#    if @food_categories == nil
#      @food_categories = []
#      url_doc.each do |fc|
#        @food_categories << WorldRecipes::FoodCategory.new_from_index_page(fc)
#      end
#    end
#    @food_categories
#  end

def add_food_categories(food_categories_hash)
  WorldRecipes::FoodCategory.new_from_collection(food_categories_hash)
end

#  def list_categories
#    food_categories
#    self.food_categories.each.with_index(1) do |category, i|
#      puts "#{i}. #{category.name}"
#    end
#  end

  def list_categories
    @food_categories.each.with_index(1) do |category, i|
      puts "#{i}. #{category.name}"
    end
  end


#  def url_doc
#    foodcategory_page ||= Nokogiri::HTML(open("#{self.url}"))
#    page_index ||= foodcategory_page.css("a.grid-col--subnav")
#    page_index
#  end
end
