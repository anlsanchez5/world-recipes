class WorldRecipes::Cuisine
  attr_accessor :name, :url, :food_categories
  @@all = []


  def self.new_from_index_page
  #  self.new()
    cuisine_1 = self.new("Mexican","http://allrecipes.com/mexican", WorldRecipes::FoodCategory.all )
    #cuisine_1.food_categories = WorldRecipes::FoodCategory.all # this will be an array of FoodCagegory instances
    cuisine_2 = self.new("Indian", "http://allrecipes.com/indian",  )
    
    [cuisine_1, cuisine_2]
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
    WorldRecipes::FoodCategory.new(name,url, recipes, self)
  end

  def list_category
    @food_categories = WorldRecipes::FoodCategory.all
    @food_categories.each.with_index(1) do |category, i|
      puts "#{i}. #{category.name}"
    end
  end


end
