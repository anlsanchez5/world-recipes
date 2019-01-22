class WorldRecipes::Recipe
  attr_accessor :name, :picture_url, :url, :number_servings, :cooking_time, :ingredients, :instructions


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


 def get_recipe_data
    self.number_servings = doc.css("meta#metaRecipeServings").attribute("content").text + " Servings"
    self.cooking_time = doc.css("span.ready-in-time").text
    self.ingredients = []
    ingredients = doc.css("li span.recipe-ingred_txt")
    ingredients.each do |i|
      self.ingredients << i.text
    end
    self.ingredients.delete_if{|x| x >= "Add all ingredients to list"}
    self.instructions = []
    instructions= doc.css("span.recipe-directions__list--item")
    instructions.each do |s|
      self.instructions << s.text
    end
    self.instructions.delete_if{|x| x >= "Watch Now"}
  end

  def display_ingredients
    puts ""
    @ingredients.each do |i|
      puts "#{
      i}"
    end
    puts "__________________________________________________"
    puts ""
  end

  def display_instructions
    puts ""
    @instructions.each do |i|
      puts "#{i}"
    end
  end

  def display_recipe
    get_recipe_data
    puts ""
    puts <<-DOC.gsub /^\s*/, ''

      #{@name}
      Link for Picture: #{@picture_url}
      ---------------------
      #{@number_servings} | #{@cooking_time}
      ---------------------
    DOC
    puts ""
    puts "Ingredients"
    display_ingredients
    puts "Instructions"
    display_instructions
  end

  def doc
    Nokogiri::HTML(open("#{self.url}"))
  end
end
