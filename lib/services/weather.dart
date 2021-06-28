import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = '52a4ac154fbf8d2bb64f1fb9eeac0909';
const openWeatherMapURL = 'api.openweathermap.org';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var url = new Uri.https(openWeatherMapURL, "/data/2.5/weather",
        {"q": "$cityName", "appid": "$apiKey", "units": "metric"});
    NetworkHelper networkHelper = NetworkHelper(url);

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();

    //Await could only be used on Futures. Wait for the values and then use them
    await location.getCurrentLocation();

    final url = new Uri.https(
      openWeatherMapURL,
      "/data/2.5/weather",
      {
        "lat": "${location.latitude}",
        "lon": "${location.longitude}",
        "appid": "$apiKey",
        "units": "metric"
      },
    );

    NetworkHelper networkHelper = NetworkHelper(url);

    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
