class WorldRecipes::CLI

  def call

    list_cuisines
    menu
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
    puts "Enter the number of the cuisine you'd like more food categories on:"
    input = gets.strip
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
    end
  end
  
end
