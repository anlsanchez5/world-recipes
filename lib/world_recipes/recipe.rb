class WorldRecipes::Recipe
  attr_accessor :name, :picture_url, :number_servings, :cooking_time, :ingredients, :instructions, :food_category


  def self.new_from_index_page
    recipe_1 = self.new("Arroz con leche","http://allrecipes.com/arrozconleche", "10 servings", "1 hour","
    1 cup milk
    1 stick cinnamon
    1 cup rice
    1/4 cup condensed milk
    ", "
    1.  Bring the rice, butter, and water to a boil in a large saucepan over high heat.
        Reduce heat to medium-low, cover, and simmer until the rice is tender, and the liquid has been absorbed, 20 to 25 minutes.
    2.  Whisk together 2 cups of milk, flour, sugar, egg, and vanilla extract in a bowl, and pour the milk mixture over the cooked rice.
        Stir to combine, and simmer over low heat for 15 minutes.
        Stir in 1 cup whole milk, the cream, raisins, and cinnamon until thoroughly mixed, and allow to cool for a few minutes.
        Serve warm or cold." )
    recipe_2 = self.new("Abuelita Chocolate", "https://www.allrecipes.com/recipe/232450/mexican-style-hot-chocolate/photos/3954853/", "12 servings", "15 min", "
    1 1/2 cups cold water
    1/2 cup white sugar
    1/4 cup unsweetened cocoa powder
    2 tablespoons all-purpose flour
    1 teaspoon ground cinnamon
    1/4 teaspoon ground cloves
    1/4 teaspoon salt
    6 cups whole milk
    1 tablespoon vanilla extract
  ", "
  1.  Whisk cold water, sugar, cocoa powder, flour, cinnamon, cloves, and salt in a saucepan until smooth.
      Place over low heat; bring to a simmer, whisking constantly, until mixture is thickened and hot, about 4 minutes.
      Stir in milk; heat until hot chocolate just forms bubbles around the edge. Mix vanilla extract into hot chocolate.
      Blend until smooth with an immersion blender to make the drink slightly frothy.")
    [recipe_1, recipe_2]
  end
  def initialize(name, picture_url=nil, number_servings=nil, cooking_time=nil, ingredients, instructions)
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
