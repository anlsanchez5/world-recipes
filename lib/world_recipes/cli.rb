require 'pry'
class WorldRecipes::CLI

  def call
    list_cuisines
    category_menu
    recipe_menu
    recipe
    goodbye
  end

  def list_cuisines
    puts "Top World Recipes"
    @cuisines = WorldRecipes::Cuisine.all
    @cuisines.each.with_index(1) do |cuisine, i|
      puts "#{i}. #{cuisine.name}"
    end
  end

  def category_menu
    @input = []
    while @input.last != "exit"
      puts "Enter the number of the cuisine you'd like more food categories on,
      type list to see the cusines again or type exit:"
      @input << gets.strip.downcase
      if @input.last.to_i > 0 && @input.last.to_i < @cuisines.length.to_i
        @cuisines[@input.last.to_i-1].list_category
        @input << "exit"
      elsif @input.last == "list"
        list_cuisines
      else
        puts "Not sure what you want, type list, cuisine number or exit."
      end
    end
  end

  def recipe_menu
    while @input.last != "exit"
      puts "Enter the number of the food category you'd like to see recipes on,
      type list to see the categories again or tye exit:"
      @input << gets.strip.downcase
      @food_categories = WorldRecipes::FoodCategory.all
      if @input.last.to_i > 0 && @input.last.to_i < @food_categories.length.to_i
        @food_categories[@input.last.to_i-1].list_recipes
        @input <<"exit"
      elsif @input.last == "list"
        i = @input.length - 1
        @cuisines[@input[i].to_i-1].list_category
      else
        puts "Not sure what you want, type list, cuisine number or exit."
      end
    end
  end

  def recipe
    while @input.last != "exit"
      puts "Enter the number of the recipe you'd like to see,list to see the recipe list again or tye exit:"
      @input << gets.strip.downcase
      @recipe = WorldRecipes::Recipe.all
      if @input.last.to_i > 0 && @input.last.to_i < @recipe.length.to_i
        WorldRecipes::Recipe.display_recipe(@input.last.to_i)
        @input << "exit"
      elsif @input.last == "list"
        @food_categories[@input.last.to_i-1].list_recipes
      else
        puts "Not sure what you want, type list, cuisine number or exit."
      end
    end
  end

  def goodbye
    puts "See you later for more recipes!!"
  end

end
