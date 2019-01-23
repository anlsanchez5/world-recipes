require 'pry'
class WorldRecipes::Scraper

  def self.get_cuisine_page
    Nokogiri::HTML(open("https://www.allrecipes.com/recipes/86/world-cuisine/?internalSource=hub%20nav&referringContentType=Recipe%20Hub&linkName=hub%20nav%20daughter&clickId=hub%20nav%202"))
  end

  def self.scrape_cuisines_index
    get_cuisine_page.css("a.grid-col--subnav")
  end

#  def make_cuisines
#    binding.pry
#     scrape_cuisines_index.each do |c|
#     WorldRecipes::Cuisine.new_from_index_page(c)
#     end
#  end

  def self.scrape_cuisines
    names = []
    scrape_cuisines_index.each do |c|
      names << c.css("span.category-title").text
    end
    urls = []
    scrape_cuisines_index.each do |c|
      urls << c.attribute("href").text
    end

    cuisines = []
    names.each { |name| cuisines << {:name => name}}
    u = 0
    urls.each {|url| cuisines[u][:url] = url; u += 1}
    cuisines
  end

  def self.get_food_category_page(link)
    foodcategory_page ||= Nokogiri::HTML(open("#{link}"))
    foodcategory_page
  end

  def self.scrape_food_categories_index(link)
    page_index ||= get_food_category_page(link).css("a.grid-col--subnav")
    page_index
  end

  def self.scrape_food_categories(link)
    names = []
    scrape_food_categories_index(link).each do |fc|
      names << fc.css("span.category-title").text
    end
    urls = []
    scrape_food_categories_index(link).each do |fc|
      urls << fc.attribute("href").text
    end

    food_categories = []
    names.each {|name| food_categories << {:name => name}}
    u = 0
    urls.each {|url| food_categories[u][:url] = url; u += 1}
    food_categories
  end

  def self.get_recipes_page(link)
    recipe_page ||= Nokogiri::HTML(open("#{link}"))
    recipe_page
  end


  def self.scrape_recipes_index(link)
    recipe_index ||= get_recipes_page(link).css("article.fixed-recipe-card")
    recipe_index
  end

  def self.scrape_recipes(link)
    names = []
    scrape_recipes_index(link).each do |r|
      names << r.css("h3 span").text
    end
    picture_urls = []
    scrape_recipes_index(link).each do |r|
      picture_urls << r.css("img.fixed-recipe-card__img").attribute("data-original-src").text
    end
    urls = []
    scrape_recipes_index(link).each do |r|
      urls << r.css("h3 a").attribute("href").text
    end

    recipes = []
    names.each {|name| recipes << {:name => name}}
    pu = 0
    picture_urls.each {|picture_url| recipes[pu][:picture_url] = picture_url; pu += 1}
    u = 0
    urls.each {|url| recipes[u][:url] = url; u += 1}
    recipes
  end

  def self.scrape_recipe_page(url)
    doc = Nokogiri::HTML(open(url))

    number_servings = doc.css("meta#metaRecipeServings").attribute("content").text + " Servings"

    cooking_time = doc.css("span.ready-in-time").text

    ingredients = []
    ing_index = doc.css("li span.recipe-ingred_txt")
    ing_index.each do |i|
      ingredients << i.text
    end
    ingredients.delete_if{|x| x >= "Add all ingredients to list"}

    instructions = []
    ins_index= doc.css("span.recipe-directions__list--item")
    ins_index.each do |s|
      instructions << s.text
    end
    instructions.delete_if{|x| x >= "Watch Now"}

    recipe_attributes = {
      :number_servings => number_servings,
      :cooking_time => cooking_time,
      :ingredients => ingredients,
      :instructions => instructions
    }
    recipe_attributes
  end
end
