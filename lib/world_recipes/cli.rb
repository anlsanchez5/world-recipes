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
    input = nil
    while input != "exit"
      puts "Enter the number of the cuisine you'd like more food categories on,
      type list to see the cusines again or type exit:"
      input = gets.strip.downcase
      if input.to_i > 0
        @cuisines[input.to_i-1].list_category
        input = "exit"
      elsif input == "list"
        call
      else
        puts "Not sure what you want, type list, cuisine number or exit."
      end
    end
  end

  def recipe_menu
    input = []
    while input != "exit"
      puts "Enter the number of the food category you'd like to see recipes on,
      type list to go back to the cuisines or type category list to see
      the food categories again, or tye exit:"
      input << gets.strip.downcase
      if input.last.to_i > 0
        @food_categories = WorldRecipes::FoodCategory.all
        @food_categories[input.last.to_i-1].list_recipes
        input = "exit"
      elsif input == "list"
        call
      elsif input == "category list"
        i = input.length - 2
        @cuisines[input[i].to_i].list_category
      else
        puts "Not sure what you want, type list, cuisine number or exit."
      end
    end
  end

  def recipe
    input = []
    while input != "exit"
      puts "Enter the number of the recipe you'd like to see, type recipe list
      to see the recipes again, cuisine list to go back to the cuisines or type
      category list to see the food categories again, or tye exit:"
      input << gets.strip.downcase
      if input.to_i > 0
        @recipes = WorldRecipes::Recipe.display_recipe(input.to_i)
        input = "exit"
      elsif input == "list"
        call
      elsif input == "category list"
        i = input.length - 2
        @cuisines[input[i].to_i].list_category
        category_menu
      elsif input == "recipes"
        recipe_menu
      else
        puts "Not sure what you want, type list, cuisine number or exit."
      end
    end
  end

  def goodbye
    puts "See you later for more recipes!!"
  end

end
