class ExampleCliProject::Cli

  def start
    ExampleCliProject::Scraper.scrape
    menu
  end

  def menu
    puts "type 'list' to list out all regions, exit to exit program"
    user_input = gets.strip.downcase

    if user_input == "list"
      list_regions
      menu
    elsif user_input == "exit"
      puts "Goodbye!!"
      exit
    else
      puts "invalid command"
      menu
    end
  end

  def list_regions
    ExampleCliProject::Region.all.each.with_index(1) do |region, index|
      puts "#{index}. #{region.name}"
    end

    region_submenu
  end

  def region_submenu
    puts "type the corrosponding number next to the region you'd like to view, or type exit to exit program, or menu for main menu"

    user_input = gets.strip

    if user_input.downcase == "menu"
      menu
    elsif user_input.downcase == "exit"
      puts "Goodbye!"
      exit
    elsif user_input.to_i.between?(1, ExampleCliProject::Region.all.length)
      region = ExampleCliProject::Region.all[user_input.to_i - 1]
      puts region.description
    else
      
    end
  end

end