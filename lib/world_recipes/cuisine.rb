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

  def food_categories
    if @food_categories == nil
      @food_categories = []
      url_doc.each do |fc|
        @food_categories << WorldRecipes::FoodCategory.new_from_index_page(fc)
      end
    end
    @food_categories
  end

  def list_categories
    food_categories
    self.food_categories.each.with_index(1) do |category, i|
      puts "#{i}. #{category.name}"
    end
  end

  def url_doc
    foodcategory_page ||= Nokogiri::HTML(open("#{self.url}"))
    page_index ||= foodcategory_page.css("a.grid-col--subnav")
    page_index
  end
end
