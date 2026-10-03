import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:pimpalgaonthote/model/weathermodel.dart';

Future <WeatherModel>getcurrentWether() async {
    try {
      final res = await(http.get(
          Uri.parse(
             'https://api.openweathermap.org/data/2.5/weather?q=jalna&APPID=22e3e91a02fb8fd7dec5c7b0c4fe61c3&units=metric'))
      );

      final dataa = jsonDecode(res.body);

      if (dataa['cod'] != 200) {
        throw dataa['message'];
      }

      return WeatherModel.fromJson(dataa);



    }

    catch (e) {

      rethrow;
    }
  }
