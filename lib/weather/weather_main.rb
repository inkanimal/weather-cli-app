class WeatherMain

  attr_accessor :temp, :condition, :feels_temp, :wind, :humidity, :dew_point, :pressure, :visibility

  def get_temp
    temp
  end

  def get_condition
    condition
  end

  def get_feels
    feels_temp
  end

  def get_wind
    wind
  end

  def get_hum
    humidity
  end

  def get_dew
    dew_point
  end

  def get_pressure
    pressure
  end

  def get_vis
    visibility
  end

  def weather_summary
    return "The current weather in your area is #{get_temp} and #{get_condition}. Although, it #{get_feels}. The wind is #{get_wind.strip} and the current humidity is #{get_hum}. The dew point temp is #{get_dew}. #{get_vis} is the distance you can see today and the pressure is #{get_pressure.strip}."
  end
end

# @@all = []

  # def initialize
    # @temp = temp
  #   @condition = condition
  #   @feels_temp = temp
  #   @wind = wind
  #   @humidity = humidity
  #   @dew_point = dew_point
  #   @pressure = pressure
  #   @visibility = visibility
  #   save
  # end

  # def self.all
  #   @@all
  # end
  #
  # def save
  #   @@all << self
  # end

  # def initialize(input = "")
  #   @input = input
  # end
  #
  # def zip_code(input)
  #   input = gets.strip
  #   zip = input.to_i
  # end
  #
  # def zip_valid?(zip_code)
  #   if zip_code.between?(00704,99950) == false
  #     puts "That is not a valid zip code. Please enter another zip code."
  #   else
  #     zip_code
  #   end
  # end
