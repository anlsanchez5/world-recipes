require 'open-uri'
require 'pry'

class WorldRecipes::CLI

  def call
    WorldRecipes::Scraper.new.make_cuisines
    list_cuisines
    cuisine_menu
    category_menu
    recipe_menu
    goodbye
  end

  def list_cuisines
    puts "Top World Recipes"
    @cuisines = WorldRecipes::Cuisine.all
    @cuisines.each.with_index(1) do |cuisine, i|
      puts "#{i}. #{cuisine.name}"
    end
  end

  def cuisine_menu
    @input = []
    while @input.last != "exit"
      puts "Enter the number of the cuisine you'd like more food categories on,
      type list to see the cusines again or type exit:"
      @input << gets.strip.downcase
      if @input.last.to_i > 0 && @input.last.to_i <= @cuisines.length.to_i
        @cuisines[@input.last.to_i-1].list_categories
        @input << "exit"
      elsif @input.last == "list"
        list_cuisines
      else
        puts "Not sure what you want, type list, cuisine number or exit."
      end
    end
  end

  def category_menu
    @input.pop
    while @input.last != "exit"
      puts "Enter the number of the food category you'd like to see recipes on,
      type list to see the categories again or type exit:"
      @input << gets.strip.downcase
      i = @input[(@input.length) - 2]
      @food_categories = @cuisines[i.to_i-1].food_categories
  #  binding.pry
      if @input.last.to_i > 0 && @input.last.to_i <= @food_categories.length.to_i
        @food_categories[@input.last.to_i-1].list_recipes
        @input <<"exit"
      elsif @input.last == "list"
        @cuisines[@input[i].to_i-1].list_categories
        @input.pop
      else
        puts "Not sure what you want, type list, cuisine number or exit."
      end
    end
  end

  def recipe_menu
    @input.pop
    while @input.last != "exit"
      puts "Enter the number of the recipe you'd like to see,list to see the recipe list again or tye exit:"
      @input << gets.strip.downcase
      i = @input[@input.length - 2]
      @recipes = @food_categories[i.to_i-1].recipes
      if @input.last.to_i > 0 && @input.last.to_i <= @recipes.length.to_i
        @recipes[@input.last.to_i-1].display_recipe
        @input << "exit"
      elsif @input.last == "list"
        @food_categories[i.to_i-1].list_recipes
        @input.pop
      else
        puts "Not sure what you want, type list, cuisine number or exit."
      end
    end
  end

  def goodbye
    puts "See you later for more recipes!!"
  end
end
