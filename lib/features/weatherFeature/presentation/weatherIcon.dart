import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/controller/dio_service.dart';
import 'package:weatherapp/features/weatherFeature/presentation/weatherDetails.dart';
import 'package:weatherapp/features/weatherFeature/presentation/weatherShow.dart';
import 'package:weatherapp/model/weather_model.dart';

class WeatherIcon extends StatelessWidget {
  const WeatherIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<DioState>((context), listen: true);
    return FutureBuilder<WeatherModel>(
      future: state.getData(),
      builder: ((context, snapshot)
       {
      final icon = snapshot.data!.weather!.first.icon;
        if (snapshot.hasData) {
          return Center(
            child: Container(
              child: SizedBox(         
                child: Image.network(    
                  "http://openweathermap.org/img/wn/$icon@2x.png",
                  width: 250,
                  height:250,
                ),
              ),
            )
            );
        } else {
          return Container(
            child: Text("wait"),
          );
        }
      }),
    );
  }
}
