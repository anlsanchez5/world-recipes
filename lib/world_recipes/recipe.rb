class WorldRecipes::Recipe
  attr_accessor :name, :picture_url, :url, :number_servings, :cooking_time, :ingredients, :instructions, :food_category


  def self.new_from_index_page(r)
    self.new(r.css("h3 span").text,
    r.css("img").attribute("src").text,
    r.css("h3 a").attribute("href").text)
  end

  def initialize(name, picture_url, url)
    @name = name
    @picture_url = picture_url
    @url = url
  end

  def food_category
    self.food_category = @food_category
  end

 def get_recipe_data
    doc = WorldRecipes::Scraper.new.scrape_recipe_data(self.url)
    self.number_servings = doc.css("meta#metaRecipeServings").attribute("content").text + " Servings"
    self.cooking_time = doc.css("span.ready-in-time").text
    self.ingredients = []
    ingredients = doc.css("li span.recipe-ingred_txt")
    ingredients.each do |i|
      self.ingredients << i.text
    end
    self.ingredients.delete_if{|x| x >= "Add all ingredients to list"}
    self.instructions = doc.css("span.recipe-directions__list--item").text
  end

  def display_ingredients
    @ingredients.each do |i|
      puts "#{
      i}"
    end
  end

  def display_instructions
    @instructions = @instructions.split("\n")
  #  binding.pry
    @instructions.each do |i|
      puts "#{i}"
    end
  end

  def display_recipe
    get_recipe_data
  #  binding.pry
    puts <<-DOC.gsub /^\s*/, ''

      #{@name}
      Link for Picture: #{@picture_url}
      _____________________
      #{@number_servings} | #{@cooking_time}
      ---------------------
    DOC

    puts "Ingredients"
    display_ingredients
    puts "Instructions"
    display_instructions
  end
end
