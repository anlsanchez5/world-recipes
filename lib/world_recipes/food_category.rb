class WorldRecipes::FoodCategory
    attr_accessor :name, :url, :recipes
    @@all = []

#    def self.new_from_index_page(fc)
#      link = fc.attribute("href").text
#      self.new(fc.css("span.category-title").text,link)
#    end

#    def initialize(name, url)
#      @name = name
#      @url = url
#    end
  def self.all
    @@all
  end

  def initialize(food_category_hash)
    food_category_hash.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end

  def self.new_from_collection(food_category_array)
    food_category_array.each {|food_category_hash| self.new(food_category_hash)}
  end

  def add_recipes(recipes_hash)
    WorldRecipes::Recipe.new_from_collection(recipes_hash)
  end

#  def recipes
#    if @recipes == nil
#      @recipes = []
#      url_doc.each do |r|
#        @recipes << WorldRecipes::Recipe.new_from_index_page(r)
#      end
#    end
#    @recipes
#  end

  def list_recipes
    recipes
    self.recipes.each.with_index(1) do |recipe, i|
      puts "#{i}. #{recipe.name}"
    end
  end

  #def url_doc
  #  recipe_page = Nokogiri::HTML(open("#{self.url}"))
  #  recipe_index = recipe_page.css("article.fixed-recipe-card")
  #end
end
