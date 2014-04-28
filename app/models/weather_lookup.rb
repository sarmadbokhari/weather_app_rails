class WeatherLookup
  attr_accessor :temperature, :icon

  def fetch_weather
    HTTParty.get("http://api.wunderground.com/api/7ca492154b75d353/hourly/q/92882.xml")
  end

  def initialize
    weather_hash = fetch_weather
    assign_values(weather_hash)
  end

  def assign_values(weather_hash)
    hourly_forecast_response = weather_hash.parsed_response['response']['hourly_forecast']['forecast'].first
    self.temperature = hourly_forecast_response['temp']['english']
    self.icon = hourly_forecast_response['icon-url']
  end

end
