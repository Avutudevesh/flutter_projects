import 'package:geolocator/geolocator.dart';
import 'location.dart';
import 'networking.dart';

class WeatherModel {
  static const String OPEN_WEATHER_API_KEY = "00b74452d77dc6f0a35173b5535c8438";

  Future<dynamic> getWeatherData() async {
    Location location = Location();
    Position position = await location.getLocation();
    var lat = position.latitude;
    var lon = position.longitude;
    NetworkData data = NetworkData();
    var responseData = await data.getData(
        "http://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$OPEN_WEATHER_API_KEY&units=metric");
    return responseData;
  }

  Future<dynamic> getWeatherDataByCity(String city) async {
    NetworkData data = NetworkData();
    var responseData = await data.getData(
        "http://api.openweathermap.org/data/2.5/weather?q=$city&appid=$OPEN_WEATHER_API_KEY&units=metric");
    return responseData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
