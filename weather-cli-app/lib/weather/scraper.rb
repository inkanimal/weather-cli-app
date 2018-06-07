require 'nokogiri'
require 'open-uri'

require_relative './weather_main.rb'


class Scraper

 def self.scrape_weather(zip)
    #need to put #{get_zip} into the url
     web_content = open("https://weather.com/weather/today/l/#{zip}:4:US")
     content = web_content.read
     doc = Nokogiri::HTML(content)
     weather_content = doc.css('.today_nowcard')
     weather = WeatherMain.new
     weather.temp = weather_content.css('.today_nowcard-temp').first.inner_text
     weather.condition = weather_content.css('.today_nowcard-phrase').first.inner_html
     weather.feels_temp = weather_content.css('.today_nowcard-feels').first.inner_text
     condition_num  = weather_content.css('.today_nowcard-sidecar').css('tr').css('td').collect do |item| item.text
    end
     weather.wind = condition_num[0]
     weather.humidity = condition_num[1]
     weather.dew_point = condition_num[2]
     weather.pressure = condition_num[3]
     weather.visibility = condition_num[4]
     weather
 end
end
      # WeatherMain.all <<
     # temp = data.css('.today_nowcard-temp').first.inner_text
       # condition = data.css('.today_nowcard-phrase').first.inner_html
       # feels_temp = data.css('.today_nowcard-feels').first.inner_text


  # def self.scrape_weather_two(weather_object)
  #      # condition_text = data.css('.today_nowcard-sidecar').css('tr').css('th').collect do |item| item.text
  #    condition_num  = data.css('.today_nowcard-sidecar').css('tr').css('td').collect do |item| item.text
  #      #weather_object.wind = condition_num[0]
  #      # ....
  #      # WeatherMain.all.push(condition_num)
  #    end
  # end


    # wind = []
    #   wind.push(condition_num[0])
    # humidity = []
    #   humidity.push(condition_num[1])
    # dew_point = []
    #   dew_point.push(condition_num[2])
    # pressure
    #   pressure.push(condition_num[3])
    # visibility
    #   visibility.push(condition_num[4])

  # new_content.css('.today_nowcard').css('.today_nowcard-temp').first.inner_text
  # new_content.css('.today_nowcard').css('.today_nowcard-phrase').first.inner_html
  # new_content.css('.today_nowcard').css('.today_nowcard-feels').first.inner_text
  # hilo and uv index = new_content.css('.today_nowcard').css('.today_nowcard-hilo').first.inner_text
  # contains humidity, dew point, pressure, visibility may need to iterate over this and separate and put back together
  # new_content.css('.today_nowcard').css('.today_nowcard-sidecar').first.inner_text
  # new_content.css('.today_nowcard').css('.today_nowcard-sidecar').css('tr').first.text
  # (winds 7 mph)
  # new_content.css('.today_nowcard').css('.today_nowcard-sidecar').css('tr').collect do |item| item.text
  # gives me -  ["WindS 7 mph ", "Humidity73%", "Dew Point56°", "Pressure30.05 in ", "Visibility10.0 mi"]
  # .split(/(?<=\d)(?=[A-Za-z])/)
  # new_content.css('.today_nowcard').css('.today_nowcard-sidecar').css('tr').css('th').collect do |item| item.text
  # new_content.css('.today_nowcard').css('.today_nowcard-sidecar').css('tr').css('td').collect do |item| item.text
