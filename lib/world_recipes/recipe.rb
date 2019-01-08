class WorldRecipes::Recipe
  attr_accessor :name, :picture_url, :number_servings, :cooking_time, :ingredients, :instructions

  def initialize
  end

  def self.all
    recipe_1 = self.new
    recipe_1.name = "Arroz con leche"
    recipe_1.picture_url = "http://allrecipes.com/arrozconleche"
    recipe_1.number_servings = "10 servings"
    recipe_1.cooking_time = "1 hour"
    recipe_1.ingredients = "
    1 cup milk
    1 stick cinnamon
    1 cup rice
    1/4 cup condensed milk
    "
    recipe_1.instructions = "
    1.  Bring the rice, butter, and water to a boil in a large saucepan over high heat.
        Reduce heat to medium-low, cover, and simmer until the rice is tender, and the liquid has been absorbed, 20 to 25 minutes.
    2.  Whisk together 2 cups of milk, flour, sugar, egg, and vanilla extract in a bowl, and pour the milk mixture over the cooked rice.
        Stir to combine, and simmer over low heat for 15 minutes.
        Stir in 1 cup whole milk, the cream, raisins, and cinnamon until thoroughly mixed, and allow to cool for a few minutes.
        Serve warm or cold."
        recipe_2 = self.new
        recipe_2.name = "Abuelita Chocolate"
        recipe_2.picture_url = "https://www.allrecipes.com/recipe/232450/mexican-style-hot-chocolate/photos/3954853/"
        recipe_2.number_servings = "12 servings"
        recipe_2.cooking_time = "15 min"
        recipe_2.ingredients = "
        1 1/2 cups cold water
        1/2 cup white sugar
        1/4 cup unsweetened cocoa powder
        2 tablespoons all-purpose flour
        1 teaspoon ground cinnamon
        1/4 teaspoon ground cloves
        1/4 teaspoon salt
        6 cups whole milk
        1 tablespoon vanilla extract
      "
        recipe_2.instructions = "
        1.  Whisk cold water, sugar, cocoa powder, flour, cinnamon, cloves, and salt in a saucepan until smooth.
            Place over low heat; bring to a simmer, whisking constantly, until mixture is thickened and hot, about 4 minutes.
            Stir in milk; heat until hot chocolate just forms bubbles around the edge. Mix vanilla extract into hot chocolate.
            Blend until smooth with an immersion blender to make the drink slightly frothy."
    [recipe_1, recipe_2]
  end

  def self.display_recipe(num)
    i = num - 1
    puts <<-DOC.gsub /^\s*/, ''
      #{self.all[i].name}
      Link for Picture: #{self.all[i].picture_url}
      _____________________
      #{self.all[i].number_servings}|#{self.all[i].cooking_time}
      _____________________

      #{self.all[i].ingredients}

      Instructions
       #{self.all[i].instructions}
     DOC
  end
end