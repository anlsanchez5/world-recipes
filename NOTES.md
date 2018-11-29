How to Build a CLI Gem

1. Plan your gem, imagine your interface
2. Start with the project structure - google
3. Start with the entry point - the file run
4. force that to build the CLI interface
5. stub out the interface
6. start making things real
7. discover objects.
8. program
______________________________________________________________________________________________________
Plan Before Project Idea Approval Meeting
An overall summary of the application. What is your application going to do?
  Pull up a list of world cuisines, types of food and recipe details

Try to create skeleton app and repository on github
  Halfway done

Here is a video showing how to do so: https://instruction.learn.co/student/video_lectures#/319

Complete these questions to the best of your ability:

What website will you be scraping?
  allrecipes

What will you need to do with the data you return from scraping?
  create a world-cuisine class with attritubes of name and food-categories, food-category class with attribute of name and recipes and recipe class with attributes of name, serving size, cooking time, picture link, ingredients and instructions

What classes will you be using?
  World_Cuisine
  Food_Category
  Recipe

What will be the flow of displaying data for your application. ex How will your CLI portion work.
  Refer to section below

How will you display data one level deep to the user?
  Specific Recipe details

What will need to be in your README file?
  Basic Description, installation instructions, usage, licence, contributing, development, code of conduct

________________________________________________________________________________________________________

-A command line interface for top recipes by culture and food category based on al recipes website

user types in world-recipes

Show a list of World cuisines

1. Mexican
2. Indian
3. Korean
4. American
5. Japanese

Which world culture do you want to see recipes for?

1

List of Mexican types of foods

1.Desserts
2.Appetizers
3.Main Dish
4.Side Dish

Which type of food do you want to see recipes for?

2

Show list of top mexican desert recipes

1. Abuelita chocolate
2. Arroz con leche
3. Champurado
4. tamales dulces

Which rceipe would you like to see?

2

Show recipe name, serving size, cooking time, ingredients, instructions

Arroz Con leche
Link for Picture: https://www.allrecipes.com/recipe/214083/sweet-rice/photos/4479695/
_________________
10 servings|1 hour
_________________

1 cup milk
1 stick cinnamon
1 cup rice
1/4 cup condensed milk

Instructions
1. Bring the rice, butter, and water to a boil in a large saucepan over high heat. Reduce heat to medium-low, cover, and simmer until the rice is tender, and the liquid has been absorbed, 20 to 25 minutes.
2.Whisk together 2 cups of milk, flour, sugar, egg, and vanilla extract in a bowl, and pour the milk mixture over the cooked rice. Stir to combine, and simmer over low heat for 15 minutes. Stir in 1 cup whole milk, the cream, raisins, and cinnamon until thoroughly mixed, and allow to cool for a few minutes. Serve warm or cold.

If you would like to see more recipes select from the following options, otherwise enter exit.
  1. Mexican Desserts
  2. Mexican cuisine
  3. World cuisines
