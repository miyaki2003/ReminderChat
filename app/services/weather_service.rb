require 'net/http'
require 'uri'
require 'json'

class WeatherService
  API_URL = 'https://api.openweathermap.org/data/3.0/onecall'.freeze

  def self.get_weather_info(latitude, longitude)
    api_key = ENV['OPENWEATHERMAP_API_KEY']

    uri = URI(API_URL)
    uri.query = URI.encode_www_form({
                                      lat: latitude,
                                      lon: longitude,
                                      appid: api_key,
                                      units: 'metric',
                                      lang: 'ja',
                                      exclude: 'minutely,daily'
                                    })

    response = Net::HTTP.get(uri)
    data = JSON.parse(response)
      
    if data['current'] && data['hourly']
      current_weather = {
        weather: data['current']['weather'][0]['description'],
        temperature: data['current']['temp'],
        precipitation_probability: data['hourly'][0]['pop'] * 100,
        rainfall: data['current'].dig('rain', '1h') || 0,
        wind_speed: data['current']['wind_speed'],
        humidity: data['current']['humidity']
      }

      forecasts = (1..4).map do |i|
        forecast_index = i * 3
        {
          weather: data['hourly'][forecast_index]['weather'][0]['description'],
          temperature: data['hourly'][forecast_index]['temp'],
          precipitation_probability: data['hourly'][forecast_index]['pop'] * 100,
          rainfall: data['hourly'][forecast_index].dig('rain', '3h') || 0,
          wind_speed: data['hourly'][forecast_index]['wind_speed'],
          humidity: data['hourly'][forecast_index]['humidity']
        }
      end

      {
        current: current_weather,
        forecasts:
      }
    else
      { error: 'データを取得できませんでした' }
    end
  end
end
