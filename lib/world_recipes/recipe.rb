class WorldRecipes::Recipe
  attr_accessor :name, :picture_url, :number_servings, :cooking_time, :ingredients, :instructions, :food_category


  def self.new_from_index_page(r)
    self.new(r.css("h3 span").text,
    r.css("img").attribute("src").text)
  end

  def initialize(name, picture_url=nil, number_servings=nil, cooking_time=nil, ingredients=nil, instructions=nil)
    @name = name
    @picture_url = picture_url
    @number_servings = number_servings
    @cooking_time = cooking_time
    @ingredients = ingredients
    @instructions = instructions
  end

  def food_category
    self.food_category = @food_category
  end

  def display_recipe
    puts <<-DOC.gsub /^\s*/, ''
      #{@name}
      Link for Picture: #{@picture_url}
      _____________________
      #{@number_servings}|#{@cooking_time}
      _____________________

      #{@ingredients}

      Instructions
       #{@instructions}
     DOC
  end
end
