import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:weatherapp/model/weather_model.dart';

class DioState extends ChangeNotifier {
  String cityname = 'karachi';
  static String APIkey = 'f6e4be2c13c9d4bbff903b2c5a24d8cb';
  final TextEditingController searchBar = TextEditingController();

  Future<WeatherModel> getData() async {
    Response response;
    var dio = Dio();
    response = await dio.get(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityname&appid=$APIkey');
    print(response.data.toString());

    if (response.statusCode == 200) {
      WeatherModel weatherResult = WeatherModel.fromJson(response.data);
      return weatherResult;
    } else {
      return WeatherModel();
    }
    notifyListeners();
  }

  SearchCity(String CityName) {
    cityname = CityName;
    getData();
    notifyListeners();
  }
}
