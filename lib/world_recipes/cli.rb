class WorldRecipes::CLI

#  def call
#    WorldRecipes::Scraper.new.make_cuisines
#    @input = []
#    start
#  end

  def run
    make_cuisines
    add_food_categories_to_cuisines
    add_recipes_to_food_categories
    add_attributes_to_recipes
    @input = []
    start
  end

  def start
    cuisine
    category
    recipe
    options
  end

  def make_cuisines
    cuisines_array ||= WorldRecipes::Scraper.scrape_cuisines
    WorldRecipes::Cuisine.new_from_collection(cuisines_array)
  end

  def add_food_categories_to_cuisines
    WorldRecipes::Cuisine.all.each do |cuisine|
      food_categories ||= WorldRecipes::Scraper.scrape_food_categories(cuisine.url)
      cuisine.add_food_categories(food_categories)
    end
  end

  def add_recipes_to_food_categories
    WorldRecipes::FoodCategory.all.each do |food_category|
      recipes ||= WorldRecipes::Scraper.scrape_recipes(food_category.url)
      food_category.add_recipes(recipes)
    end
  end

  def add_attributes_to_recipes
    WorldRecipes::Recipe.all.shift
    WorldRecipes::Recipe.all.each do |recipe|
      attributes = WorldRecipes::Scraper.scrape_recipe_page(recipe.url)
      recipe.add_recipe_attributes(attributes)
    end
  end


  def list_cuisines
     puts "Top World Recipes"
     @cuisines = WorldRecipes::Cuisine.all
     @cuisines.each.with_index(1) do |cuisine, i|
       puts "#{i}. #{cuisine.name}"
    end
  end

  def cuisine
    list_cuisines
    puts ""
    puts "Enter the number of the cuisine you'd like more food categories on or type exit:"
    @input << gets.strip.downcase
    if @input.last.to_i > 0 && @input.last.to_i <= @cuisines.length.to_i
      @cuisines[@input.last.to_i-1].list_categories
    elsif @input.last == "exit"
      goodbye
      exit
    else
      puts ""
      puts "Not sure what you want."
      puts ""
      cuisine
    end
  end

  def category
    puts ""
    puts "Enter the number of the food category you'd like to see recipes on,
         type back to see cuisine list again or type exit:"
    @input << gets.strip.downcase
    i = @input[(@input.length) - 2]
    food_categories = @cuisines[i.to_i-1].food_categories
  #  binding.pry
    if @input.last.to_i > 0 && @input.last.to_i <= food_categories.length.to_i
      food_categories[@input.last.to_i-1].list_recipes
    elsif @input.last == "back"
      start
    elsif @input.last == "exit"
      goodbye
      exit
    else
      puts ""
      puts "Not sure what you want."
      puts ""
      @input.pop
      @cuisines[@input.last.to_i-1].list_categories
      category
    end
  end

    def recipe
      puts ""
      puts "Enter the number of the recipe you'd like to see, cuisines to see cuisine list again, back to return to category list or type exit:"
      @input << gets.strip.downcase
      c = @input[(@input.length)-3]
      food_categories = @cuisines[c.to_i-1].food_categories
      fc = @input[@input.length - 2]
      recipes = food_categories[fc.to_i-1].recipes
#      binding.pry
      if @input.last.to_i > 0 && @input.last.to_i <= recipes.length.to_i
        recipes[@input.last.to_i-1].display_recipe
        options
      elsif @input.last == "cuisines"
        start
      elsif @input.last == "back"
        food_categories.each.with_index(1) do |c, i|
          puts "#{i}. #{c.name}"
        end
        @input.pop
        @input.pop
        category
        recipe
      elsif @input.last == "exit"
        goodbye
        exit
      else
        puts ""
        puts "Not sure what you want."
        puts ""
        @input.pop
        food_categories[@input.last.to_i-1].list_recipes
        recipe
      end
    end

  def options
    puts ""
    puts "Would you like to see more recipes? Type Y or N."
    input = gets.strip
    if input == "Y" || input == "y"
      start
    elsif input == "N" || input == "n"
      goodbye
      exit
    else
      puts ""
      puts "Not sure what you want."
      puts ""
      options
    end
  end

  def goodbye
    puts "See you later for more recipes!!"
  end
end
