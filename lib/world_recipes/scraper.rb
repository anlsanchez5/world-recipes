class WorldRecipes::Scraper

  def get_page
    Nokogiri::HTML(open(""))
  end

end
