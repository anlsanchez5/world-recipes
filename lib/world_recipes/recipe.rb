class WorldRecipes::Recipe
  attr_accessor :name, :picture_url, :number_servings, :cooking_time, :ingredients, :instructions, :food_category


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
    self.number_servings = doc.css("")
    self.cooking_time = doc.css("span.ready-in-time").text
    self.ingredients = doc.css("")
    self.instructions = doc.css("")
  end

  def display_recipe
    get_recipe_data
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
