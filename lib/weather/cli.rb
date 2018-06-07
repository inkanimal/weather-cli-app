require_relative './scraper.rb'

class Cli

  # def initialize
  #  self.start
  # end

  def start
    zip = get_zip
    weather_data = Scraper.scrape_weather(zip)
    weather_list(weather_data)
  end

  def get_zip
    puts ""
    puts "              | Welcome to Weather |                 "
    puts ""
    # needs to get the users zip code and pass that to the scraper. needs to check is zip code is valid.
    input = ""
    retreived_value_zip = false
    while retreived_value_zip == false
     puts "Please enter your zip code to see the weather in your area."
     input = gets.strip
     zip = input.to_i  #(00704,99950)
     if zip.between?(00704,99950) == false
       puts "That is not a valid zip code. Please try again."
     else
       retreived_value_zip = true
     end
   end
   zip
  end

  def weather_list(weather_data)
    input = ""
    while true
      puts ""
      puts "      Please type in the number that corresponds to the weather condition that you would like to view.
      To return to the beginning, please type 10.
      To exit, please type 11."
      puts ""
      puts "            1. Temperature
            2. Current conditions
            3. Feels like Temperature
            4. Wind
            5. Humidity
            6. Dew Point
            7. Pressure
            8. Visibility
            9. Weather Summary
           10. Return to the Start
           11. Exit"

      input = gets.strip
      if input.to_i.between?(1,11) == false
        puts "That is an invalid entry. Please choose again."
      else
       case input
# instance
      when "1"
        puts "The current temperature is #{weather_data.get_temp}."
      when "2"
        puts "The current weather condition is #{weather_data.get_condition}."
      when "3"
        puts "The temperature #{weather_data.get_feels}."
      when "4"
        puts "The current wind direction and speed are #{weather_data.get_wind.strip}."
      when "5"
        puts "The humidity is #{weather_data.get_hum}."
      when "6"
        puts "The dew point is #{weather_data.get_dew}."
      when "7"
        puts "The current pressure is #{weather_data.get_pressure.strip}."
      when "8"
        puts "#{weather_data.get_vis} is the current visibility in your area."
      when "9"
        puts weather_data.weather_summary
      when "10"
        puts "Okay, going to get a new zip code"
        return true
      else "11"
        puts "Thank you for using Weather. Goodbye."
        return false
      end
    end
  end
end

# exited = false
# while exited == false
#   exited = mycli.start
# end

weather_cli = Cli.new
 should_run = true
 while should_run == true
   should_run = weather_cli.start
 end
end
