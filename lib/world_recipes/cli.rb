require 'open-uri'
require 'pry'

class WorldRecipes::CLI

  def call
    WorldRecipes::Scraper.new.make_cuisines
    @input = []
    start
  end

  def start
    cuisine
    category
    recipe
    options
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
    puts "Enter the number of the cuisine you'd like more food categories on or type exit:"
    @input << gets.strip.downcase
    if @input.last.to_i > 0 && @input.last.to_i <= @cuisines.length.to_i
      @cuisines[@input.last.to_i-1].list_categories
    elsif @input.last == "exit"
      goodbye
      exit
    else
      puts "Not sure what you want, type list, cuisine number or exit."
    end
  end

  def category
    puts "Enter the number of the food category you'd like to see recipes on,
         type back to see cuisine list again or type exit:"
    @input << gets.strip.downcase
    i = @input[(@input.length) - 2]
    @food_categories = @cuisines[i.to_i-1].food_categories
    if @input.last.to_i > 0 && @input.last.to_i <= @food_categories.length.to_i
      @food_categories[@input.last.to_i-1].list_recipes
    elsif @input.last == "back"
      start
    elsif @input.last == "exit"
      goodbye
      exit
    else
      puts "Not sure what you want, type list, cuisine number or exit."
    end
  end

    def recipe
      puts "Enter the number of the recipe you'd like to see, cuisines to see cuisine list again, back to return to category list or type exit:"
      @input << gets.strip.downcase
      i = @input[@input.length - 2]
      @recipes = @food_categories[i.to_i-1].recipes
      if @input.last.to_i > 0 && @input.last.to_i <= @recipes.length.to_i
        @recipes[@input.last.to_i-1].display_recipe
        options
      elsif @input.last == "cuisines"
        start
      elsif @input.last == "back"
        @food_categories
        category
      elsif @input.last == "exit"
        goodbye
        exit
      else
        puts "Not sure what you want, type list, cuisine number or exit."
      end
    end

  def options
    puts "Would you like to see more recipes? Type Y or N."
    input = gets.strip
    if input == "Y" || input == "y"
      start
    elsif input == "N" || input == "n"
      goodbye
      exit
    else
      puts "Not sure waht you want."
      options
    end
  end

  def goodbye
    puts "See you later for more recipes!!"
  end
end
