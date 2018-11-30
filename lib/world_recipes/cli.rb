class WorldRecipes::CLI

  def call
    list_cuisines
    menu
    goodbye
  end

  def list_cuisines
    puts "Top World Recipes"
    puts <<-DOC.gsub /^\s*/, ''
      1. Mexican
      2. Indian
      3. Korean
      4. American
      5. Japanese
    DOC
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the cuisine you'd like more food categories on or or type list to see the cusines again or type exit:"
      input = gets.strip.downcase
      case input
      when "1"
        puts "List of mexican food categories"
      when "2"
        puts "List of Indian food categoires"
      when "3"
        puts "List of Korean food categories"
      when "4"
        puts "List of American food categories"
      when "5"
        puts "List of Japanese food categories"
      when "list"
        list_cuisines
      else
        puts "Not sure what you want, type list or exit."
      end
    end
  end

  def goodbye
    puts "See you later for more recipes!!"
  end

end
